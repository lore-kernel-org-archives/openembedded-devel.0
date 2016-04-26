Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4F260761
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:08:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3QJ8hVJ020129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 26 Apr 2016 12:08:44 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Apr 2016 12:08:43 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Apr 2016 15:08:42 -0400
Message-ID: <1461697722-20378-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] mozjs: fix configure host contamination
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2016 19:08:51 -0000
Content-Type: text/plain

When building mozjs the following error was observed

| Traceback (most recent call last):
|   File "./config.status", line 9, in <module>
|     from ConfigStatus import config_status
|   File "/build/bitbake_build/tmp/work/corei7-64-wrs-linux/mozjs/17.0.0-r0/mozjs17.0.0/js/src/build/ConfigStatus.py", line 11, in <module>
|     import sys, re, os, posixpath, ntpath
|   File "/usr/lib/python2.7/ntpath.py", line 15, in <module>
|     from genericpath import _unicode
| ImportError: cannot import name _unicode
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /build//bitbake_build/tmp/work/corei7-64-wrs-linux/mozjs/17.0.0-r0/temp/do_configure/log.do_configure.1056

Note the host paths found in the error msg. Further this issue can be
explored using the host python, which will not error when attempting
the above import, and the python in the sysroot, which will fail when
we attempt the import.

By inheriting pythonnative we ensure the proper paths are set to avoid
this host contamination.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index be4b50b..1dc99ab 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "321e964fe9386785d3bf80870640f2fa1c683e32fe988eeb201b04471c
 
 S = "${WORKDIR}/${BPN}${PV}/js/src"
 
-inherit autotools pkgconfig perlnative
+inherit autotools pkgconfig perlnative pythonnative
 
 DEPENDS += "nspr zlib"
 
-- 
2.1.4


