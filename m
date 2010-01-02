Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NQyWx-00027n-Q4
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 08:36:14 +0100
Received: by pzk30 with SMTP id 30so9709685pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2010 23:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=v9Bo1I5hbw9zmoTt5BefiCmGDGJT3OrU+CA8Lnu3BiI=;
	b=r7XvqwNxjPsh5ndanq665EQIlgLnctttlqHOzvzHbGqAw5ZQxnRdEs3UIluzfJwhFw
	0VVnnyH9NLAOcraDT9JQ6nl/ga6YO5j15nxpKwYmjC+ys/rvRmMn3gnKv04L0xMHKpTU
	yF0vUdsvYJONdDyey//0fL30uRY2ThrQvBfLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Cw5z1absxV75r8sYON9XxhaWRPtvjESZgRF2Zh09yc7vEONV93Atguf2nJSaWeo8ne
	J4nS4DCygmkgl3BGGl5jrm4L5AtErH+uAgHPxe0/1hoSQC4yok9yCot/BnKyUPWPb8zL
	nFFrUzVlAXwP3S+Xhf2588fOmz7fhJdycAgmc=
Received: by 10.114.105.15 with SMTP id d15mr7352329wac.18.1262417650169;
	Fri, 01 Jan 2010 23:34:10 -0800 (PST)
Received: from localhost ([123.54.101.56])
	by mx.google.com with ESMTPS id 20sm15950713pzk.1.2010.01.01.23.34.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 01 Jan 2010 23:34:09 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2010 15:33:58 +0800
Message-Id: <1262417638-26595-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add --disable-decimal-float option to gcc-cross-intermediate/gcc-cross_4.4.2.bb
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
X-List-Received-Date: Sat, 02 Jan 2010 07:36:15 -0000

1. Add --disable-decimal-float option to gcc-cross-intermediate_4.4.2.bb when LIBC == uclibc and TARGET_ARCH == i[3|4|5|6]86, without it, the compilation will failed due to lack of fenv.h.
---
 recipes/gcc/gcc-cross-intermediate_4.4.2.bb |    7 +++++++
 recipes/gcc/gcc-cross_4.4.2.bb              |    7 ++++++-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-cross-intermediate_4.4.2.bb b/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
index 3ca59aa..4bb1004 100644
--- a/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
+++ b/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
@@ -1,9 +1,16 @@
 require gcc-cross_${PV}.bb
 require gcc-cross-intermediate.inc
 
+PR = "${INC_PR}.2"
+
 DEPENDS += "gmp-native mpfr-native"
 
 EXTRA_OECONF += " --disable-libmudflap \
 		  --disable-libgomp \
 		  --disable-libssp \
 		"
+
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i386', '--disable-decimal-float', '',d)}"
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i486', '--disable-decimal-float', '',d)}"
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i586', '--disable-decimal-float', '',d)}"
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i686', '--disable-decimal-float', '',d)}"
diff --git a/recipes/gcc/gcc-cross_4.4.2.bb b/recipes/gcc/gcc-cross_4.4.2.bb
index 11eb29d..3e5b15a 100644
--- a/recipes/gcc/gcc-cross_4.4.2.bb
+++ b/recipes/gcc/gcc-cross_4.4.2.bb
@@ -2,10 +2,15 @@ require gcc-${PV}.inc
 require gcc-cross4.inc
 require gcc-configure-cross.inc
 require gcc-package-cross.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i386', '--disable-decimal-float', '',d)}"
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i486', '--disable-decimal-float', '',d)}"
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i586', '--disable-decimal-float', '',d)}"
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i686', '--disable-decimal-float', '',d)}"
-- 
1.5.4.3



