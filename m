Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvFEc-0002mB-74
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 22:02:40 +0200
Received: by qwa26 with SMTP id 26so3291241qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=t5tENlDBUxmBDiAcQOFbqDI11w1Wlz0xRZMDaMIYq4M=;
	b=C6tHOOiN6owI6WWWxBracNetatJyI4zMEsC3zVvwW5IYN7SpfpJyrgnzSnBXzfNN9m
	ULa1LYdcnxI207p1/on5VDOL94F2X/6akpaAiKZ3UUJy6yc5ey4S7gy4eBbGMK5cDyfZ
	3dVgXbOhTPbDAfv8ULWEXHKClOabUyUQQK0Qs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=phD9lNVhWPWUdl8Ykboqh23HTVEKQmWhyH2gXa4lOh/XNzIZOhcvGRyzrFpGZ6TukK
	070q0NnVN+LjZotEoqpzqdDUyRnNtIbjcSToVL4AQEiPDslxnDGRdgH7mNuobGObl0i4
	xW6zloz+DNliqZnGnP/Akojxyxsuwo2MAaTj8=
Received: by 10.229.181.73 with SMTP id bx9mr3658240qcb.98.1284408109790;
	Mon, 13 Sep 2010 13:01:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t4sm6806979qcs.16.2010.09.13.13.01.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Sep 2010 13:01:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 13:01:43 -0700
Message-Id: <1284408103-21857-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc: Do not specify ports multiple time to --enable-addons
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
X-List-Received-Date: Mon, 13 Sep 2010 20:02:40 -0000

* While building for mips64 I noticed a problem where eglibc
  configure did not get the mips sub arch correct during configure
  the reason was we had ports twice in configure commandline which
  ran a ports configure twice and appended machines multiple times
  to paths which then were wrong and it failed to select correct
  ABI to compile eglibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc_2.10.bb |    2 +-
 recipes/eglibc/eglibc_2.11.bb |    2 +-
 recipes/eglibc/eglibc_2.12.bb |    2 +-
 recipes/eglibc/eglibc_2.9.bb  |    2 +-
 recipes/eglibc/eglibc_svn.bb  |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index c2ed435..c10db7d 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -48,7 +48,7 @@ python __anonymous () {
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --enable-add-ons=${GLIBC_ADDONS} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 ${GLIBC_EXTRA_OECONF}"
diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index 5d9b8e2..bece90f 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -48,7 +48,7 @@ python __anonymous () {
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --enable-add-ons=${GLIBC_ADDONS} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 ${GLIBC_EXTRA_OECONF}"
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index c6b0131..0d08c56 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -48,7 +48,7 @@ python __anonymous () {
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --enable-add-ons=${GLIBC_ADDONS} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 ${GLIBC_EXTRA_OECONF}"
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index a7d9aed..f83861e 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -48,7 +48,7 @@ python __anonymous () {
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --enable-add-ons=${GLIBC_ADDONS} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 ${GLIBC_EXTRA_OECONF}"
diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
index 0621279..3b7fb84 100644
--- a/recipes/eglibc/eglibc_svn.bb
+++ b/recipes/eglibc/eglibc_svn.bb
@@ -46,7 +46,7 @@ python __anonymous () {
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --enable-add-ons=${GLIBC_ADDONS} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 ${GLIBC_EXTRA_OECONF}"
-- 
1.7.1



