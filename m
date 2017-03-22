Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD9FF72F7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:42:24 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Wed, 22 Mar 2017 13:42:22 +0000
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Mar 2017 13:42:15 +0000
Message-ID: <20170322134215.43371-1-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [meta-oe][morty][PATCH] gitver: fix try/except syntax for python3 support
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
X-List-Received-Date: Wed, 22 Mar 2017 13:42:25 -0000
Content-Type: text/plain

backported from master's b17bbbe2245f72144e3d036aa273c1b67434fa1c

https://www.python.org/dev/peps/pep-3110/

It's backward compatible with 2.6+

Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
---
 meta-oe/classes/gitver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
index e7b5155ee..b677996ea 100644
--- a/meta-oe/classes/gitver.bbclass
+++ b/meta-oe/classes/gitver.bbclass
@@ -27,13 +27,13 @@ def get_git_pv(path, d, tagadjust=None):
     gitdir = os.path.abspath(os.path.join(d.getVar("S", True), ".git"))
     try:
         ver = gitrev_run("git describe --tags", gitdir)
-    except Exception, exc:
+    except Exception as exc:
         bb.fatal(str(exc))
 
     if not ver:
         try:
             ver = gitrev_run("git rev-parse --short HEAD", gitdir)
-        except Exception, exc:
+        except Exception as exc:
             bb.fatal(str(exc))
 
         if ver:
-- 
2.11.0


