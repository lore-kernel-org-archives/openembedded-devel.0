Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1298474713
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:19 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u11so8040410wri.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=i7v702ICekCPsGsEXMIypWVK9vib5CmLdZtmOnkUrTc=;
	b=XJ3Y2wN/LnyoB8/5f9zjodM57Rm2JUjdvXiS7oxJ6+GtyruN1VMqdy0zZArfa3/z+v
	EbIYsn8xNQnVYoH+Ky7FiaxcpBGPUqY5SGH8V76yfpxND8xMbQRR+6FeHXDYTtUkkoFF
	Esgswu5Ci+NfF05NATqLYypYawWn6JrK9JHiUTDJJB8ekfkJNvumvj3pNRwuzNCWpZ36
	USeoZxcH7OAPSXaVe4UWp6VBtahcTBZ/Hso/1bNBCuHS/EIXe0DBp8pQtCoTA8e71yAg
	QlLrA9lNuGdMyvhab0VUNeJ9F4+BKh9tl3FP1UXZfcISI80JRpvNAr8nTsfS7d/KXOr6
	myPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i7v702ICekCPsGsEXMIypWVK9vib5CmLdZtmOnkUrTc=;
	b=DYQYJt+/YcnCiI07yQBvw5a6FRAsZeCbyDg9New7NYj/1dVZHAATF9shqiNQ/qSZ/0
	sIknHIbIVSp82MvEu4IcDmXTEj0COikfX8/u9qb2Hk7MRp6C3e7MHg0W8WvG17dGdftH
	aG8mQhbY+d+wCYDPPuveXzX7F09DinBezSYq0P2CYVp0RSaQ+hbM//nH2jM6y2OMEiJu
	LTndsKln2ENKprZU/JhZaK1Vgcm7tExapWuc0rAcbZYmWQuHF57LT48by5qzgww+gVrt
	ZrqsENrM6wQPglJG2Sji441lZ1PsoeT6Pr9vSUXHC1rPpOcfgJw6sUacrbVK9lwXa/9J
	7wrg==
X-Gm-Message-State: AElRT7H4jJazp5LiDNJfgCoy+h/8B2+swsVhfsNLgpLG51ApuUA2kKJu
	agJp3sRnPDPQyMfUWOBlsWhU6A==
X-Google-Smtp-Source: AIpwx49IRnN99RCXSYxqIr7uH47vm/cL/TtxhDodFCFqpxQ8CMS5VgtvRZqol92jV6aaeKxHiqSoAA==
X-Received: by 10.223.225.76 with SMTP id f12mr1469658wri.128.1522416740467;
	Fri, 30 Mar 2018 06:32:20 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:27 +0200
Message-Id: <20180330133151.25882-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/39] network-manager-applet: update 1.4.4 -> 1.8.10
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...applet_1.4.4.bb => network-manager-applet_1.8.10.bb} | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.4.4.bb => network-manager-applet_1.8.10.bb} (73%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
similarity index 73%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
index d6e1db095..dc2b964be 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
@@ -11,15 +11,15 @@ inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introsp
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOME_COMPRESS_TYPE = "xz"
-
-SRC_URI[archive.md5sum] = "3f82cedc4703df0277c76d9feb5bf2c8"
-SRC_URI[archive.sha256sum] = "693846eeae0986e79eb1cedfbc499f132f27a9976ef189a0f16938ac59ec3226"
+SRC_URI[archive.md5sum] = "eae3be75e77ff1a7ea3174be25e62d03"
+SRC_URI[archive.sha256sum] = "0adc4bfae8b49f7a1d929c22ef20933bd41fb4a8b458280f44c65f9e45b4c9c3"
 
 PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
 PACKAGECONFIG ??= ""
 
-GI_DATA_ENABLED_libc-musl = "False"
+EXTRA_OECONF = " \
+    --without-selinux \
+"
 
 do_configure_append() {
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
@@ -28,6 +28,13 @@ do_configure_append() {
     done
 }
 
+# gobject-introspection related
+GI_DATA_ENABLED_libc-musl = "False"
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/src/libnma/.libs:${B}/src/libnm-gtk/.libs"
+}
+
 RDEPENDS_${PN} =+ "networkmanager"
 
 FILES_${PN} += " \
-- 
2.14.3


