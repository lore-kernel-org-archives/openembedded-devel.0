Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC50781F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 20:24:11 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Fri, 23 Jun 2017 21:24:11 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 21:23:21 +0100
Message-ID: <20170623202324.69194-4-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170623202324.69194-1-amery@hanoverdisplays.com>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [meta-oe][morty][PATCH 3/6] gitver: fix try/except syntax for python3 support
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
X-List-Received-Date: Fri, 23 Jun 2017 20:24:11 -0000
Content-Type: text/plain

https://www.python.org/dev/peps/pep-3110/

It's backward compatible with 2.6+

Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.13.0


