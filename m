Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id E09587821C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 12:13:16 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Tue, 20 Jun 2017 13:13:16 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Jun 2017 13:13:04 +0100
Message-ID: <20170620121304.25402-1-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [meta-oe][PATCH] gitver: skip packages instead of panic()ing if ${GITVER} fails to expand
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
X-List-Received-Date: Tue, 20 Jun 2017 12:13:17 -0000
Content-Type: text/plain

`inherit externalsrc gitver` is a very useful combo to get development trees
in your workspace having a ${PN}_git.bb with PV=${GITVER} coexisting with a regular
${PN}_${PV}.bb

but not everyone wants to checkout all developments sources and managinging different
layers for each options is quite troublesome.

making `gitver` skip the .bb instead of panic()ing every time EXTERNALSRC is missing
allows people to have a single development layer where packages get enabled if
the right sources are present or falling back to the last release if not

Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
---
 meta-oe/classes/gitver.bbclass | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
index a09c99749..380374ab2 100644
--- a/meta-oe/classes/gitver.bbclass
+++ b/meta-oe/classes/gitver.bbclass
@@ -27,23 +27,20 @@ def get_git_pv(d, tagadjust=None):
     gitdir = os.path.abspath(os.path.join(srcdir, ".git"))
     try:
         ver = gitrev_run("git describe --tags", gitdir)
-    except Exception as exc:
-        bb.fatal(str(exc))
-
-    if not ver:
+    except:
         try:
             ver = gitrev_run("git rev-parse --short HEAD", gitdir)
+            if ver:
+                return "0.0+%s" % ver
+            else:
+                return "0.0"
+
         except Exception as exc:
-            bb.fatal(str(exc))
+            raise bb.parse.SkipPackage(str(exc))
 
-        if ver:
-            return "0.0+%s" % ver
-        else:
-            return "0.0"
-    else:
-        if tagadjust:
-            ver = tagadjust(ver)
-        return ver
+    if ver and tagadjust:
+        ver = tagadjust(ver)
+    return ver
 
 def get_git_hash(d):
     import os
-- 
2.13.0


