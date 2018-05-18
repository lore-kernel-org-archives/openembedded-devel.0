Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD9737471A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:02 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id a22-v6so2930784pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7VLjsjn/i4NgMqXh7n9nfQMyxLVTAprL6s3VZHp7PIU=;
	b=B00PkwDYQW76tkc+EXx6lTy+jtuykZVN5rPSIBi6YVQTPUUNd6h7+4D55trDILfXoc
	srX4vYEfIObfaACXseYuNCaqfunLjCa1LYz4fC7yPIeHNt8A2CJE6Fl29aZqWeOlBOFB
	z5Iv3f59osChd0DL2KeeE2UtSyxOxLxqE4NwEAz1/JDQUyE6Qirzdh6UyRS+DrkG9CKm
	mOad5//PfIGDlgGtRIgf8fbNzR/Nwijq2twHoT+woRVUZ1/GvTqJo98GmKswFF38wC43
	Zkh6dhfCYgXizAPkvAUwOvj50HcwALjGKiy4R57cIOgiXkjyrXqCGd7VwnyMP4OL8oLi
	CS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7VLjsjn/i4NgMqXh7n9nfQMyxLVTAprL6s3VZHp7PIU=;
	b=iYzHrZ/5QXuNC/U08GobL5/ih5jV4og8/dI62k1bvSzLAn3YEM7Oewlu+tjFBjWPUo
	ZWb8iExnMxdr8KkwTY+TQbmvAVM41gcmktyJNPGaj571Nhym2eyJu3a0clULomeFm35w
	WBhWIBhwFDUGSSdxnJO9vNyvckZ51AFl8uaudAtWwyGwGekpDoW46OjaOQAk89VPfIM6
	lni4rLexIb3ohnpfca6M0TVdD9S4kopER5qgRHIzamSaOTMUR9BG67V1ZPeMNk34YYdK
	BMA99+qtE6tuk8d7CR3EzzwsAVn3GGZHk0fPcRlaU7z0DChoim9zg7mUL7fkoVEE+0FK
	l61g==
X-Gm-Message-State: ALKqPwccei8cr3QIHC83gJknWVyLPJMsO0FopJINn6SxphcZJc2HjFA/
	IysSR8o05pYQnCMX3YcHbBKFig==
X-Google-Smtp-Source: AB8JxZrFHNlmj89MqXtnVJ5gTXvxViL6CQGdxrWr3Zan/0OS9j14tgMHzLIwi6MQfs/2RZfufvjTWA==
X-Received: by 2002:a63:7e08:: with SMTP id
	z8-v6mr5791360pgc.383.1526607063409; 
	Thu, 17 May 2018 18:31:03 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:31 -0700
Message-Id: <1526607046-8081-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 02/17] openobex: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:03 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 2db48f3..f93c447 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -2,24 +2,24 @@ DESCRIPTION = "The Openobex project is an open source implementation of the \
 Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
-DEPENDS = "virtual/libusb0"
-DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
-
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
 
+DEPENDS = "virtual/libusb0"
+DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.gz \
 "
 
 SRC_URI[md5sum] = "f6e0b6cb7dcfd731460a7e9a91429a3a"
 SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d73dd4fc"
 
-inherit cmake pkgconfig
-
 S = "${WORKDIR}/${BP}-Source"
 
+inherit cmake pkgconfig
+
 EXTRA_OECONF = " -DCMAKE_SKIP_RPATH=ON "
 EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF"
 
@@ -32,7 +32,7 @@ do_install_append () {
 PACKAGES =+ "openobex-apps"
 FILES_${PN}-apps = "${bindir}/*"
 FILES_${PN} += "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/openobex-config ${libdir}/cmake"
+FILES_${PN}-dev += "${bindir}/openobex-config"
 DEBIAN_NOAUTONAME_${PN}-apps = "1"
 
 BBCLASSEXTEND = "native"
-- 
1.9.1


