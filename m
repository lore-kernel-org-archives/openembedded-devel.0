Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC9F77811
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 21:37:58 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o8so10175866wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=i7v702ICekCPsGsEXMIypWVK9vib5CmLdZtmOnkUrTc=;
	b=IBr5E0ikywAreGuJef4zvdXWncH+nHWwNNA7QdFCVwxfd6PeyUKc/IAP0vZ69/skpU
	9BJ9ZiN4aAjtVhw+4UASHQxlWBrje9mrESLCTWoKtx9XNkRpbIenK/kshy7cQDGZvYw/
	FWmWUkFPwd/2U21JlQAP0l669SlHNrhEGi9zR4W1GgNOXtNTCRf4OLEBSGDOPLVk0j1l
	5rWLejEJTZ7rJV2GCAjjWdT0zbCgrAZCNLv7C3Et3JHybzOXxkGmrR4CAv0YlDBbky1i
	/pb1wypKyce3mrosMaNVBrHeH6Y6tGOXMgsSakpdPvKBKtXR+1C+4o+CyOgc2aMyoIr9
	9IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i7v702ICekCPsGsEXMIypWVK9vib5CmLdZtmOnkUrTc=;
	b=Hplrggnti5QQyz/6t6+GiSnJonj1T0DZ9/LpEgliqEi4YhRa1TNay6zdVK67N5b9XI
	XXdbz5x4bnr9YAQQqdZOCU6zaxKDXW3MOBexRukReZWffRrEPUZrklb5MF31PMgfpjWT
	Nz99R0bBlmh/lg5UMmxs/gebPMFDKlCSqZwKFcL6M2BfCQFXpDBMXDdl4ex6wBhz6+0J
	G4vAbnVDQkjuCpcMN1SarPnl35UKPmos6XSnmOMXIRplLI8HLfXWElbgLrC6RMXUktGX
	XzxUovvB1m3v8FMrswIQtRoZkgysoLj8Qo/3Xo6UA62XqKzn5TjGryL5K10UNQmM+i4o
	l1qg==
X-Gm-Message-State: AElRT7HbSCDY2aTu7C+Yv4s7gERIUfrtcVhZx6jvy6L4vWtAL52ni+2l
	J4s+HqNTIjAcGsonLy9x2ZBAdQ==
X-Google-Smtp-Source: AG47ELt3qJpJ7ZTJuWwyMbfyXKPIRcIaJHMlanAwsTe7Bb7oSUzWkj9sSJ9ZUC7ijR6NRM919VXPJg==
X-Received: by 10.223.225.2 with SMTP id d2mr12685370wri.56.1521754678831;
	Thu, 22 Mar 2018 14:37:58 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111611E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1161:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id m7sm7558897wrb.86.2018.03.22.14.37.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Mar 2018 14:37:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 22:37:40 +0100
Message-Id: <20180322213741.29876-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180322213741.29876-1-schnitzeltony@gmail.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] network-manager-applet: update 1.4.4 -> 1.8.10
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
X-List-Received-Date: Thu, 22 Mar 2018 21:37:58 -0000
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


