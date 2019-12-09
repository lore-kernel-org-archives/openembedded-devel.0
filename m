Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF4B7F691
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z7so15058757wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lG+HzPiGtPAJi8A9RIWaD1988EHdlwRnRmOLQ1ugYqQ=;
	b=BoP9r8LXBdV6dWK/x61u+Kjf2GtDas9waX0NbFqC/tem1YT7LteGfS9r6gh1osUoWk
	f+JeHNpCdNVIvPO4EPyqGyXchr6M79bWo+uHwqqW77bsK3yUTuDCDDIQzbVeV2dGMKLc
	gxiUEqTekAenZ1xPIZSv9brm64/+zoT2VkH91JMM4XMCG0YfrrJP5K0wMEFvFm/B09za
	IEHeJpsZmGoJ7YjUrxjHbH93YZYGJFJbcr9iLoXR12qB1+NGMVfEOLnRG2KEnb9TFRIC
	JyoO39yfAQpTtebYnXK/DiB5InGCyKt9VoYJ9+BrOOToEbqWPXUnKMP0OfdFv/z8ZqO8
	4Hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lG+HzPiGtPAJi8A9RIWaD1988EHdlwRnRmOLQ1ugYqQ=;
	b=nwL7A2dsPCc91koIZQKInGdsFISK0GuhoTuIKwoZAZiHDVL31x3NTsZk0JaQZ6ywA/
	rlq5wQ3MtfuzgH/KBvUzmCHP4a5wCykud92Tt3RmoHSbkuzMRFlU4fzB3jcStvUFp/Hs
	L4arwooAOdheGNdhyheI2nfcMsQt4G/82tobCsK7xTpH3N4FwYSUKNWpm99GpzMonLcD
	bV5ll+rZquZc9mpBCtEOgJCitj2CGOF/0nclpSIQhF2V6v6i/FiBmrb94HQeBwyQTf/M
	N0p2ZrtLz8fZFVZigy9tRW/jgJeRyeO3EbDMnQWtT/jCaKkBOBpRftMFwZaJn/pTGOcP
	LsFA==
X-Gm-Message-State: APjAAAXO4fINukxefkrGSrN4WjShoV5JY6EFbt7FicgnRqG5QkXCjMR1
	U89F88lA1KTl/SP1mgmGAm/nXeIu
X-Google-Smtp-Source: APXvYqzokdzCT3p++LIUMXsfojoIxjBPo1JRHmOO426zRBJ6gCu5TXTBRqSLUrJjAek00Hun/ETrSQ==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr739584wrw.246.1575880586065; 
	Mon, 09 Dec 2019 00:36:26 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:56 +0100
Message-Id: <20191209083612.23922-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 04/20] gnome-shell-extensions: initial add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-shell-extensions_3.34.1.bb          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
new file mode 100644
index 000000000..8625a7b32
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "GNOME Shell Extensions"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gettext gsettings features_check upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
+
+SRC_URI[archive.md5sum] = "09e64640bbf0e978171d581e2086a0c6"
+SRC_URI[archive.sha256sum] = "b0ad51143b1bf40def4a10f8fd0ab0ffb47218304800794e62cadd29d0acc75b"
+
+DEPENDS += " \
+    sassc-native \
+"
+
+EXTRA_OEMESON += " \
+    -Dextension_set=all \
+    -Dclassic_mode=true \
+"
+
+RDEPENDS_${PN} += "gnome-shell"
+
+FILES_${PN} += " \
+    ${datadir}/gnome-shell \
+    ${datadir}/gnome-session \
+    ${datadir}/xsessions \
+"
-- 
2.21.0


