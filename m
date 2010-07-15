Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZUr0-0001yO-2n
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 22:16:25 +0200
Received: by ewy7 with SMTP id 7so409286ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=RzCVeiMEKetrXLqf1irLrWMwKfGY/ziVPSqPmUl7l8Q=;
	b=LOzJNQ+SOpsiLBNO4a4A7PD5T3dOj7OEXrw1y3ce36jFC44w6ai85DqG95ICijXFGr
	wbrhK/6rYJ7Wg1IEq+pNkNoTlYLwF3H2z8tTcqw16Mcsb9ZEa1kqm0l/nPcRLmI2DoHa
	V+sfcjQ6hdF1ZJ0Wg6C+LuF2diWYu8WhwjC7Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PEjRj6F7KKsNo1MXeaM7yNKkSn+yt2RfACnY6MceuMXiBgULJonWzYwwcdrV+7fxn7
	rRqRjMYkh/bCYEOIeaKBPrAjhLS6NyQoaMkV03GO2rRVO8nu+jkLYUbYoHHT8WYlDc+G
	Q2NZ2JbTJTie8CdiDNLExDd0mvFTMPihfPCm8=
Received: by 10.213.20.142 with SMTP id f14mr217628ebb.30.1279224978444;
	Thu, 15 Jul 2010 13:16:18 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm11041321eei.6.2010.07.15.13.16.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 13:16:17 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 22:16:11 +0200
Message-Id: <1279224971-3797-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,PLING_QUERY,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-libc-headers: added COMPATIBLE_TARGET_SYS = "(?!nios2)"
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
X-List-Received-Date: Thu, 15 Jul 2010 20:16:25 -0000

added COMPATIBLE_TARGET_SYS = "(?!nios2)" to all versions
that do not support nios2.
nios2 has an unistd.h with an extra system call, which makes
that compiling glibc for it fails if the wrong version
is installed.

As there is no functional change this does not need a PR bump.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

currently only 2.6.34 is supported.
given the low response on recent patches, and the fact that this
is pretty harmless, I'm planning to commit this after a few days 
if I get no nacks. Of course I am hoping for some acks though.

Frans

 .../linux-libc-headers_2.6.11.1.bb                 |    2 ++
 .../linux-libc-headers_2.6.15.99.bb                |    2 ++
 .../linux-libc-headers_2.6.18+2.6.19-rc1.bb        |    2 ++
 .../linux-libc-headers_2.6.18.bb                   |    2 ++
 .../linux-libc-headers_2.6.20.bb                   |    2 ++
 .../linux-libc-headers_2.6.22.bb                   |    2 ++
 .../linux-libc-headers_2.6.23.bb                   |    2 ++
 .../linux-libc-headers_2.6.24.bb                   |    2 ++
 .../linux-libc-headers_2.6.25.bb                   |    2 ++
 .../linux-libc-headers_2.6.29.bb                   |    2 ++
 .../linux-libc-headers_2.6.30.bb                   |    2 ++
 .../linux-libc-headers_2.6.31.bb                   |    2 ++
 .../linux-libc-headers_2.6.32.bb                   |    2 ++
 .../linux-libc-headers_2.6.7.0.bb                  |    2 ++
 .../linux-libc-headers_2.6.8.1.bb                  |    2 ++
 15 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
index 95143c9..15cc32c 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
@@ -9,6 +9,8 @@ HOMEPAGE = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
 INHIBIT_DEFAULT_DEPS = "1"
 PR = "r5"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-headers-${PV}.tar.bz2 \
 	file://keyboard.patch"
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
index c5a6c4f..b6738b9 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
@@ -15,6 +15,8 @@ DEFAULT_PREFERENCE = "-1"
 INHIBIT_DEFAULT_DEPS = "1"
 PR = "r7"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "http://ewi546.ewi.utwente.nl/OE/eabi/linux-libc-headers-${PV}.tar.bz2 \
 	file://keyboard.patch \
 	file://asm-arch-irqs.patch \
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
index 17d2091..bd25de6 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
@@ -4,6 +4,8 @@ DEFAULT_PREFERENCE = "-1"
 INHIBIT_DEFAULT_DEPS = "1"
 PR = "r2"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = " \
 	${KERNELORG_MIRROR}/pub/linux/kernel/people/dwmw2/kernel-headers/snapshot/linux-kernel-headers-2.6.19-rc1.tar.bz2 \
 	file://arm-procinfo-hwcap.patch \
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
index 80806ff..213e201 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r5"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.18.tar.bz2 \
            file://arm-syscall-define.patch"
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
index 32ce044..89ff997 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r12"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
            file://unifdef.patch \
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
index 12845e0..8bc119a 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r4"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h"
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
index 474b96c..70cedeb 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r7"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
            file://unifdef.patch \
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
index b90c478..1a7f9ff 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r5"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
            file://unifdef.patch"
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
index 084fea6..2c94686 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r5"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	   file://reinstate-a.out.h.patch \
 	   file://fix-kernel-conditionalize-a.out.h.patch \
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
index d59fb4d..d133ac9 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r2"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	  "
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
index c64e59c..ad1832c 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r2"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	   file://uio-header.patch \
 	  "
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
index c31d482..de97a76 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r5"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
index b12100c..8898292 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
@@ -4,6 +4,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r5"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
index 8141fac..c4fa80e 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
@@ -6,6 +6,8 @@ PR = "r5"
 # NOTE: no need to package these headers, since the c library includes them.
 PACKAGES = ""
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-headers-${PV}.tar.bz2 \
 	   file://sh-missing.patch \
 	   file://keyboard.patch"
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
index 15c4e6d..571ed3d 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
@@ -10,6 +10,8 @@ HOMEPAGE = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
 INHIBIT_DEFAULT_DEPS = "1"
 PR = "r9"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 # NOTE: no need to package these headers, since the c library includes them.
 PACKAGES = ""
 
-- 
1.6.4.2



