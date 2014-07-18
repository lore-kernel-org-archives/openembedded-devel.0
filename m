Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 80AF5706B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fn030280; Fri, 18 Jul 2014 09:43:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id njrmdZQo2CbM; Fri, 18 Jul 2014 09:43:09 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8h0fm030265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:01 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kl-0006kJ-09; Fri, 18 Jul 2014 09:42:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:46 +0100
Message-Id: <1405672966-25729-27-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 27/27] libotr: Fix B!=S build failures
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:11 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-support/pidgin/libotr/sepbuild.patch | 16 ++++++++++++++++
 meta-oe/recipes-support/pidgin/libotr_4.0.0.bb       |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/libotr/sepbuild.patch

diff --git a/meta-oe/recipes-support/pidgin/libotr/sepbuild.patch b/meta-oe/recipes-support/pidgin/libotr/sepbuild.patch
new file mode 100644
index 0000000..f66e528
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/libotr/sepbuild.patch
@@ -0,0 +1,16 @@
+Fix builds with ${B} != ${S}
+
+Upstream-Status: Pending
+
+RP 2014/7/17
+
+Index: libotr-4.0.0/toolkit/Makefile.am
+===================================================================
+--- libotr-4.0.0.orig/toolkit/Makefile.am	2014-07-16 18:09:59.777858022 +0000
++++ libotr-4.0.0/toolkit/Makefile.am	2014-07-17 06:28:51.359066155 +0000
+@@ -1,4 +1,4 @@
+-INCLUDES = -I../src @LIBGCRYPT_CFLAGS@
++INCLUDES = -I$(top_srcdir)/src @LIBGCRYPT_CFLAGS@
+ 
+ noinst_HEADERS = aes.h ctrmode.h parse.h sesskeys.h readotr.h sha1hmac.h
+ 
diff --git a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
index a312841..dd9eeab 100644
--- a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
@@ -6,6 +6,7 @@ DEPENDS = "libgcrypt libgpg-error"
 
 SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://fix_qa-issue_include.patch \
+           file://sepbuild.patch \
 "
 
 SRC_URI[md5sum] = "00979dca82d70383fcd1b01f3974363c"
-- 
2.0.2


