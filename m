Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id B826672F18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:21 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id 21so38318151pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rfV11L8IF8s2I/yC2icuhQSvyXUH592CjWs4PPAOpVM=;
	b=ds1GJVhNBENzV4AwsC1/BU3yY5RvvThwFRuSWEsWzbCYoIumyfgVws6IFXPJnppbRf
	EihR61QSxU75nu2BguErvxOhrsWRFAQbxffVaYSqCRnjNM0nC7rgxBfY9hXBs0PPVaFg
	xVWtXMw1pOFeb3jAZG8zT5rTPcUrpa16BJjsYpMrKEv+p12enYQ3Rei6Ry+buEzKadx4
	kjnNHijVnBFZXPfDj6Y6/239V2J4nHOThIWRHgqvUKnuDFC2dLuaVLxUEd6NWmEODsiI
	zCV5H3B+9NpT7U0Wvl2tgukWFhiXDeh2jZMTva0peEE8+CGRiglhokjdZD7jH3P97Qy8
	/Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rfV11L8IF8s2I/yC2icuhQSvyXUH592CjWs4PPAOpVM=;
	b=b8uQdvw9gO+nCu+LuhfH61lsVWVOd40YUekiM2uSy4mOOfHqDEiazT2KgpCa11IWjw
	yU7NhypcVmA9U3KT0Zx5DiQaDtv6rrB8pLyANHpR9qIEg1CGPhOL7kY7q4R7ZLw8qyjB
	DR9xa1uekGkmFVh7NUtLjwlfdfeTaCN7JzSlLj0sOula0a9KanfP57zEt7rzmZPILEHh
	Rn7ir/Z/n4SG5B+OpDHDK99E1GA73uGcrx0eVVXGnyLQmXW3UDaVpZdVwaImoyLUkIdB
	RnZ1keJbBoHz3YzhjvSPb4AJfWii8iIWUSSYSq/ILyS8uEiTn5NNmiADeoQ/NOAyHfLe
	01kg==
X-Gm-Message-State: AFeK/H1mn2mtQ1dTZf16mpq0+pT9bpntZxWu0l8C+t3NVC1wf/adGFp6N1g3Ua72wPR+4Q==
X-Received: by 10.84.204.8 with SMTP id a8mr7801485ple.4.1489987942380;
	Sun, 19 Mar 2017 22:32:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:48 -0700
Message-Id: <20170320053152.29352-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/16] picocom: Upgrade to 2.2
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:22 -0000

Package has moved to github
License file got some cosmetic changes see
https://github.com/npat-efault/picocom/commit/13fd331d410c2e8c39fa041bd54c3b0a93df64e1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb | 22 ++++++++++++++++++++++
 meta-oe/recipes-support/picocom/picocom_1.7.bb    | 19 -------------------
 meta-oe/recipes-support/picocom/picocom_git.bb    | 23 +++++++++++++++++++++++
 3 files changed, 45 insertions(+), 19 deletions(-)
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb
 delete mode 100644 meta-oe/recipes-support/picocom/picocom_1.7.bb
 create mode 100644 meta-oe/recipes-support/picocom/picocom_git.bb

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb
new file mode 100644
index 000000000..96fbd350b
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb
@@ -0,0 +1,22 @@
+require lcdproc5.inc
+SRC_URI[md5sum] = "2f8e064233ef1d03e98c0b426595750d"
+SRC_URI[sha256sum] = "843007d377adc856529ed0c7c42c9a7563043f06b1b73add0372bba3a3029804"
+
+PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render,"
+PACKAGECONFIG[hid] = "--enable-libhid,--disable-libhid,libhid"
+PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
+
+LCD_DRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'g15', '', ',!g15', d)}"
+
+do_install_append () {
+    # binaries
+    install -D -m 0755 clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc
+
+    # configuration files
+    install -D -m 0644 ${S}/clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/lcdvc.conf
+}
+
+PACKAGES =+ "lcdvc"
+CONFFILES_lcdvc = "${sysconfdir}/lcdvc.conf"
+FILES_lcdvc = "${sysconfdir}/lcdvc.conf ${sbindir}/lcdvc"
+
diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb b/meta-oe/recipes-support/picocom/picocom_1.7.bb
deleted file mode 100644
index d2a76c0a9..000000000
--- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
-SECTION = "console/utils"
-LICENSE = "GPLv2+"
-HOMEPAGE = "http://code.google.com/p/picocom/"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=393a5ca445f6965873eca0259a17f833"
-
-SRC_URI = "http://picocom.googlecode.com/files/picocom-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
-SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9a2348c89e02a84935517002b3bc2c1129e"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'VERSION=${PV}' \
-		'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 0755 ${BPN} pcasc pcxm pcym pczm ${D}${bindir}/
-}
-
diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_git.bb
new file mode 100644
index 000000000..e091094cf
--- /dev/null
+++ b/meta-oe/recipes-support/picocom/picocom_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+HOMEPAGE = "http://code.google.com/p/picocom/"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
+
+BASEPV = "2.2"
+PV = "${BASEPV}+git${SRCPV}"
+
+SRCREV = "deffd18c24145bd6f965f44e735a50b65810ccdc"
+
+SRC_URI = "git://github.com/npat-efault/picocom"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'LD=${CC}' 'VERSION=${BASEPV}' \
+		'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${BPN} pcasc pcxm pcym pczm ${D}${bindir}/
+}
+
-- 
2.12.0


