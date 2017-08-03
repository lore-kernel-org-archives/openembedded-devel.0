Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3474271DD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Aug 2017 13:05:39 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Thu, 3 Aug 2017 14:05:39 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Thu, 3 Aug 2017 14:05:16 +0100
Message-ID: <20170803130518.6351-2-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170803130518.6351-1-amery@hanoverdisplays.com>
References: <20170803130518.6351-1-amery@hanoverdisplays.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [meta-oe][pyro][PATCH 1/3] gitver: extend class to use EXTERNALSRC if set
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
X-List-Received-Date: Thu, 03 Aug 2017 13:05:39 -0000
Content-Type: text/plain

Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/gitver.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
index a16429aa8..73521d538 100644
--- a/meta-oe/classes/gitver.bbclass
+++ b/meta-oe/classes/gitver.bbclass
@@ -24,7 +24,8 @@ def get_git_pv(path, d, tagadjust=None):
     import os
     import bb.process
 
-    gitdir = os.path.abspath(os.path.join(d.getVar("S"), ".git"))
+    srcdir = d.getVar("EXTERNALSRC") or d.getVar("S")
+    gitdir = os.path.abspath(os.path.join(srcdir, ".git"))
     try:
         ver = gitrev_run("git describe --tags", gitdir)
     except Exception as exc:
@@ -71,5 +72,6 @@ def mark_recipe_dependencies(path, d):
         mark_dependency(d, tagdir)
 
 python () {
-    mark_recipe_dependencies(d.getVar("S"), d)
+    srcdir = d.getVar("EXTERNALSRC") or d.getVar("S")
+    mark_recipe_dependencies(srcdir, d)
 }
-- 
2.13.0


