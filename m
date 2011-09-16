Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R4abG-0007GR-0u
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 17:45:10 +0200
Received: by bke11 with SMTP id 11so6200574bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6B4ijCz2AT7OyhK/bnapOrImYgCiAPaOmqSXD3mzkzc=;
	b=L0wiH7v4P2bSDU0pRolgpeUTl0f1aZXYgNncCrmGdsu77Z2oQlgWN89rjMjMXaeeOj
	6+1tDlp8q99XV4PACu+VTAD6QzAtKMU0qs14Pv0uadwF75ncxC5TZOPCmJEXBwJ2lFKa
	ihOtnXV+UIruxAs+7xdodrXWlsebgKyWCGXVM=
Received: by 10.204.157.4 with SMTP id z4mr14045bkw.36.1316187596749;
	Fri, 16 Sep 2011 08:39:56 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t18sm6736288bkb.9.2011.09.16.08.39.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 08:39:55 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 19:39:44 +0400
Message-Id: <1316187584-1972-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Fri, 16 Sep 2011 15:45:10 -0000

Include more dependencies into openssl-fix-link.patch patch.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
index b319c62..15762a7 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
+++ b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
@@ -8,15 +8,19 @@ Index: openssl-1.0.0d/Makefile.org
 ===================================================================
 --- openssl-1.0.0d.orig/Makefile.org	2011-09-01 17:03:59.000000000 +0400
 +++ openssl-1.0.0d/Makefile.org	2011-09-01 17:12:24.000000000 +0400
-@@ -246,9 +246,9 @@
+@@ -244,13 +244,13 @@
 	@dir=crypto; target=all; $(BUILD_ONE_CMD)
- build_ssl:
+-build_ssl:
++build_ssl: build_crypto
 	@dir=ssl; target=all; $(BUILD_ONE_CMD)
 -build_engines:
 +build_engines: build_crypto
 	@dir=engines; target=all; $(BUILD_ONE_CMD)
 -build_apps:
-+build_apps: build_crypto
++build_apps: build_crypto build_ssl
 	@dir=apps; target=all; $(BUILD_ONE_CMD)
- build_tests:
-	@dir=test; target=all; $(BUILD_ONE_CMD)
+-build_tests:
++build_tests: build_crypto build_ssl
+ 	@dir=test; target=all; $(BUILD_ONE_CMD)
+ build_tools:
+ 	@dir=tools; target=all; $(BUILD_ONE_CMD)
-- 
1.7.2.5



