Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R52cr-0001fo-CI
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Sep 2011 23:40:42 +0200
Received: by fxi1 with SMTP id 1so3106590fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2011 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/yC2HJPeIJcLfiPuc5qez8oleWTdSp1zLgBoVaKGHNE=;
	b=aiO+qGVkMpjm8gWCtZaQ6acUcSiW48T1yPk1q3uma3+89u+hCYJ/JXBLS0Cnx9I28v
	q2EHpb0f+M5zYcoR97GWorQjZzMXCGk+fPACw99OAvWEbux5VEMx1lOy1s52gvuy7VvX
	qAe1OvIYqiU/72QQJjNpiZsobkQR4UVjqzZQI=
Received: by 10.223.30.27 with SMTP id s27mr1842099fac.129.1316295326948;
	Sat, 17 Sep 2011 14:35:26 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id b10sm15961192fam.1.2011.09.17.14.35.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Sep 2011 14:35:26 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 01:35:15 +0400
Message-Id: <1316295315-7410-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe][V2] openssl: fixup the openssl-fix-link patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Sep 2011 21:40:42 -0000

Include more dependencies into openssl-fix-link.patch patch.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   22 +++++++++++--------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
index b319c62..6522d83 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
+++ b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
@@ -8,15 +8,19 @@ Index: openssl-1.0.0d/Makefile.org
 ===================================================================
 --- openssl-1.0.0d.orig/Makefile.org	2011-09-01 17:03:59.000000000 +0400
 +++ openssl-1.0.0d/Makefile.org	2011-09-01 17:12:24.000000000 +0400
-@@ -246,9 +246,9 @@
-	@dir=crypto; target=all; $(BUILD_ONE_CMD)
- build_ssl:
-	@dir=ssl; target=all; $(BUILD_ONE_CMD)
+@@ -244,13 +244,13 @@
+ 	@dir=crypto; target=all; $(BUILD_ONE_CMD)
+-build_ssl:
++build_ssl: build_crypto
+ 	@dir=ssl; target=all; $(BUILD_ONE_CMD)
 -build_engines:
 +build_engines: build_crypto
-	@dir=engines; target=all; $(BUILD_ONE_CMD)
+ 	@dir=engines; target=all; $(BUILD_ONE_CMD)
 -build_apps:
-+build_apps: build_crypto
-	@dir=apps; target=all; $(BUILD_ONE_CMD)
- build_tests:
-	@dir=test; target=all; $(BUILD_ONE_CMD)
++build_apps: build_crypto build_ssl
+ 	@dir=apps; target=all; $(BUILD_ONE_CMD)
+-build_tests:
++build_tests: build_crypto build_ssl
+ 	@dir=test; target=all; $(BUILD_ONE_CMD)
+ build_tools:
+ 	@dir=tools; target=all; $(BUILD_ONE_CMD)
-- 
1.7.2.5



