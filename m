Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PupKl-00052S-6x
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 17:55:32 +0100
Received: from source ([209.85.214.182]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW52KrOFp46mpnTvEhd4Tzy0CX72TErF@postini.com;
	Wed, 02 Mar 2011 08:54:06 PST
Received: by mail-iw0-f182.google.com with SMTP id 33so181494iwn.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 08:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=qGW8JMd5mgPoSUrhBRaxyLQmXrPPAWACe0f30npSxcE=;
	b=qQhT1i4OkLH/JDt9XyowiqTIdMX1AlVNtsl6+jHWVn6/PCWdgIqPQ5gdyDhi1Kqdem
	lZ14VaUqPsQ6pM6y9mXxsqOvV0qDcu32W/JiPKWSWdBWQcD9nhz9O567HAuHbgmQaTd8
	QMs9yaHJ7lQnXTsFqZ1q+9rJi68t08JCHvWhM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XPmrUF9ZLWOLM2X+pIl8m/8wexDv8hSTy5nqeGyGZCDgwwP6JvItAsILHeazmItNUz
	UeUg55+zlMe2xMWP7OTlNElOtg0Utxf+dKsSJTG8ThdxbS2s2g6aH0TWIaZze3LfQDyg
	iA1sI+o7KNFYaoxmLBgYcmc0ky88iQl4oaq1w=
Received: by 10.231.35.195 with SMTP id q3mr7378834ibd.186.1299078322100;
	Wed, 02 Mar 2011 07:05:22 -0800 (PST)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id z4sm17934ibg.19.2011.03.02.07.05.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 07:05:21 -0800 (PST)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Date: Wed,  2 Mar 2011 10:05:14 -0500
Message-Id: <9a9ee76e6057e7dfe38af1d77b4ed7ffc9ff3775.1299076392.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1299076392.git.bengardiner@nanometrics.ca>
References: <cover.1299076392.git.bengardiner@nanometrics.ca>
Cc: Andrea Galbusera <gizero@gmail.com>, Koen Kooi <koen@openembedded.org>
Subject: [PATCH v2 2/2] external-toolchain-csl: allow linux-libc-headers
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
X-List-Received-Date: Wed, 02 Mar 2011 16:55:32 -0000

If PREFERRED_PROVIDER_linux-libc-headers is defined as anything
other than external-toolchain-csl then don't PROVIDE, install or
stage the linux headers packaged with the CSL toolchain.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Tested-by: Andrea Galbusera <gizero@gmail.com>

---

Changes since v1:
 * rebased to 3dc72c4ca0a9ce677f6c3a56517626984b5eaaa0 of
   git://git.openembedded.org/openembedded#master
 * added Tested-by: Andrea Galbusera <gizero@gmail.com>

---
 conf/local.conf.sample                 |    4 ++++
 recipes/meta/external-toolchain-csl.bb |   15 ++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index ff3da96..51d0449 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -90,6 +90,10 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 # Stay away from unversioned distros unless you really know what you are doing
 # DISTRO = "angstrom-2008.1"
 
+#Uncomment this if you want to use linux-headers from the linux-lib-headers
+#recipe as opposed to those bundled with the CSL toolchain
+#PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
+
 # So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
 # to generate binary locale packages at build time using qemu-native and
 # thereby guarantee i18n support on all devices. If your build breaks on 
diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
index 2e109c8..48c23eb 100644
--- a/recipes/meta/external-toolchain-csl.bb
+++ b/recipes/meta/external-toolchain-csl.bb
@@ -1,4 +1,4 @@
-PR = "r7"
+PR = "r8"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -21,9 +21,10 @@ PROVIDES = "\
 	virtual/libintl \
 	virtual/libiconv \
 	glibc-thread-db \
-	linux-libc-headers \
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
 "
 
+DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
 RPROVIDES_glibc-dev += "libc-dev libc6-dev virtual-libc-dev"
 PACKAGES_DYNAMIC += "glibc-gconv-*"
 PACKAGES_DYNAMIC += "glibc-locale-*"
@@ -35,7 +36,7 @@ PACKAGES = "\
 	libgcc-dev \
 	libstdc++ \
 	libstdc++-dev \
-	linux-libc-headers \
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
 	glibc-dbg \
 	glibc \
 	catchsegv \
@@ -200,6 +201,8 @@ LICENSE_libstdc++ = "${CSL_LIC_RLE}"
 LICENSE_libstdc++-dev = "${CSL_LIC_RLE}"
 
 do_install() {
+	RSYNC_OPTS="${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', '--exclude=/include/linux', d)}"
+
 	install -d ${D}${sysconfdir}
 	install -d ${D}${bindir}
 	install -d ${D}${sbindir}
@@ -213,7 +216,7 @@ do_install() {
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/etc/* ${D}${sysconfdir}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/sbin/* ${D}${base_sbindir} \
 		|| true
-	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
+	rsync -a ${RSYNC_OPTS} ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
 
 	rm -rf ${D}${bindir}/gdbserver
@@ -222,11 +225,13 @@ do_install() {
 }
 
 do_stage() {
+	RSYNC_OPTS="${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', '--exclude=/linux', d)}"
+
 	install -d ${STAGING_INCDIR}
 	install -d ${STAGING_LIBDIR}
 	install -d ${STAGING_DIR_TARGET}${base_libdir}
 
-	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}
+	rsync -a ${RSYNC_OPTS} ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/lib/* ${STAGING_LIBDIR}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/lib/* ${STAGING_DIR_TARGET}${base_libdir}
-- 
1.7.1



