Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcWUX-0006mT-Ua
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 07:42:14 +0200
Received: by iym10 with SMTP id 10so2785402iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KDu9iyjpdkTAhlu7pfoy6d6r+9Q4BWZsemDMbc8zoxQ=;
	b=knWE5195ygfFFVTam2q8CYRCgpxx3gxVwRpaRRd5CdMYV1IUu6r3B3wsItEO50KMih
	+Fy2SaUuPTFWfGibGFfH3gs7B3esq0NAchcQ0iJOzWYR2IrSYdVkshsmo/wkeSWcjkhR
	pfT2CjqYify0wLmLUH9wRsg1v7NHansRMWMag=
Received: by 10.231.39.74 with SMTP id f10mr2493997ibe.199.1309498708785;
	Thu, 30 Jun 2011 22:38:28 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q15sm1652751ibb.65.2011.06.30.22.38.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 22:38:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jun 2011 22:38:18 -0700
Message-Id: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
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
X-List-Received-Date: Fri, 01 Jul 2011 05:42:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/paper-over-mkostemp.patch      |   19 +++++++++++++++++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
new file mode 100644
index 0000000..ca10440
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
@@ -0,0 +1,19 @@
+uclibc does not have mkostemp() so we redefine it to use mkstemp()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/src/macro.h
+===================================================================
+--- git.orig/src/macro.h	2011-06-30 10:33:53.000000000 -0700
++++ git/src/macro.h	2011-06-30 15:07:28.285270006 -0700
+@@ -27,6 +27,10 @@
+ #include <sys/uio.h>
+ #include <inttypes.h>
+ 
++#ifdef __UCLIBC__
++/* uclibc does not implement mkostemp GNU extention */
++#define mkostemp(x,y) mkstemp(x)
++#endif
+ #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
+ #define _sentinel_ __attribute__ ((sentinel))
+ #define _noreturn_ __attribute__((noreturn))
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 2a313e0..c750b2f 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -15,7 +15,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r3"
+PR = "r4"
 
 inherit autotools vala
 
@@ -23,6 +23,7 @@ SRCREV = "8585357a0e5e9f4d56e999d7cd1a73e77ae0eb80"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git \
            file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \
+           file://paper-over-mkostemp.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.4.1



