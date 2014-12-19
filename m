Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id DC1A772AB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 20:25:58 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBJKPwum015334 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 14:25:58 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121914255853-1320579 ;
	Fri, 19 Dec 2014 14:25:58 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Dec 2014 14:25:55 -0600
Message-Id: <1419020755-7491-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.2.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:25:58 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/19/2014 02:25:58 PM,
	Serialize complete at 12/19/2014 02:25:58 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-19_05:2014-12-19, 2014-12-19,
	1970-01-01 signatures=0
Subject: [PATCH] terminal: use bash for do_terminal script execution
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Dec 2014 20:26:07 -0000

Users may set certain environment variables such as SHELLOPTS and
BASHOPTS that the shell will mark as read-only and exported on startup.
Under `bitbake -c devshell`, these eventually make their way into
do_terminal through BB_ORIGENV. POSIX-compliant shells (including bash
when run as /bin/sh, at least as of bash 4.3) must exit immediately when
trying to set these variables, which breaks devshell.

To work around this, force execution of do_terminal with bash. The
SHELL itself called by pseudo is unchanged.

The reproducing case for this was `env BASHOPTS=checkhash bitbake ...`.
Setting BASHOPTS=checkhash protects against underspecified package
DEPENDS against packages which may get temporarily purged from the
sysroot; otherwise, if bash cached a command at a sysroot path that got
deleted, calling the command again will fail.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/classes/terminal.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index e577c6d..86d4220 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -23,7 +23,11 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
-        script.write('#!/bin/sh -e\n')
+        # bash is strongly recommended, because the current implementation of
+        # oe_terminal() may attempt to set readonly variables. Under bash, this
+        # is a warning; under dash and other POSIX shells (including bash in
+        # POSIX mode, ie when run as /bin/sh), the shell is required to exit.
+        script.write('#!/usr/bin/env bash -e\n')
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
         script.write("\n")
-- 
2.2.1


