Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id A426865E4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 23:44:10 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id to1so3242857ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 16:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4uyxoaWF8ZmXa1RbA8fqyMH0F3EfmW5BG5mjpxT3hJ0=;
	b=SjV+cOfSUr1JIxLy00Nxgbhd3i6ctSDY1BGN5D4noiq/T7oHopyxP8XF290DK9GhZd
	w+FT6jQuDG5C45CS8uA0yKSoS5N/BCZ8aU4kikHyz9Diwn7YqjONMQmynjCqxQiBy4/v
	Z5rdWgupPoIoeOLPuvxV4ISrA7riAkFimWtjRamAl2fvSrI++GfZYW0SDOh9eqV0bAen
	hYJBrDTZr4kzs//qJNI6Ghgnpqdns7fs1puMs1NNO5hVQ0AVRMD41HQENVOTm/oR0IHR
	McU4G9Uuy0BejaEx+PfmksyQwSHd2XxTQVc1xxRDbWreiIIJroFgZhz30DOItNS826Wy
	Hv4w==
X-Gm-Message-State: ALoCoQkDeh8qOO/Gy9IbHYpjJm9q0RqqyCCC71dAuu30iF2TpOSn2tXzIZSlcsIEx17PFhKfDHjj
X-Received: by 10.50.47.12 with SMTP id z12mr7288434igm.37.1397087050982;
	Wed, 09 Apr 2014 16:44:10 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	nh12sm8733105igb.12.2014.04.09.16.44.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 16:44:10 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 19:43:59 -0400
Message-Id: <1397087039-21114-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1397087039-21114-1-git-send-email-trevor.woerner@linaro.org>
References: <1397087039-21114-1-git-send-email-trevor.woerner@linaro.org>
Cc: Joe MacDonald <joe.macdonald@windriver.com>, patches@linaro.org
Subject: [meta-networking][PATCH] sethdlc: remove
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
X-List-Received-Date: Wed, 09 Apr 2014 23:44:10 -0000

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 .../recipes-connectivity/sethdlc/sethdlc.bb        | 30 ----------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb

diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
deleted file mode 100644
index 3a9692f..0000000
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
-HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
-LICENSE = "GPLv2 & GPLv2+ "
-LIC_FILES_CHKSUM = "file://Makefile;md5=19aada31930b2be84bf7138420d77263"
-
-
-SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \
-"
-SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
-SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
-
-
-S = "${WORKDIR}/${BPN}-1.18"
-
-DEPENDS="virtual/kernel"
-
-EXTRA_OEMAKE="CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}' \
-              KERNEL_DIR=${STAGING_KERNEL_DIR} "
-
-do_compile_prepend () {
-    oe_runmake clean
-}
-
-
-do_install() {
-    install -d ${D}/${bindir}
-    install sethdlc ${D}/${bindir}/
-}
-
-FILES_${PN} += "${bindir}/sethdlc"
-- 
1.9.0


