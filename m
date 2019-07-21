Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 912AA7EEB5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:32 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y15so16204657pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rDHUXPJBFIrO3Fwl5UTbMZUmbzksy+u2jWHK1VkxWjw=;
	b=CCJ/FUyQ9udT2f1ZwXX2tQHQgrrf7GF+EBp4KegINmvE9aR02oeVZF8kdlVGg5GwkW
	KpemengdvIFmV56A2ugvw16dDS45SUvKnxFVF5EpDdh4cLBkW/7cSxRQSXbfFXEZnLeA
	N0CFef8GfwkUwvwL6EgNsvSaZATkIyFADEerxZx0KY1hSKGqQfxkWAF8SZ0GywWXxYNP
	Hu3eBBCixIGbq4WW4XDAP803gU9h/j0KuTFIlynEWrTMt9iSSxDdzZUWRmcb30cwBxzf
	OIKsBJrIrRJQdwFtmaxhiB7sxalovrP5iGRIVapVTyebG4EzjfQ94Vpx2Xl5jCZsT5gl
	33pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rDHUXPJBFIrO3Fwl5UTbMZUmbzksy+u2jWHK1VkxWjw=;
	b=n34aIclTiB6KinL7miwNqC3Y4Fc8ajAwCyy/bAUKeAJsQ+tI2+5knBppID5n/tnsh5
	5J/avr/qeRtMy+B9VTkwUD+KfT7dM+0VpEyCBrUJitzVAgGLbG+MiZlhToHA7LSDWND2
	P8As764uDnxVniyBs5iQOzZ68hIWIBFy6enGY6KZfb6RDR726nGM34afXswFCLrqOo8G
	87+zug4+N9WMwkY10XX3o8sGzLDaAQNSywUULqzO0Fk3YHuA/LeHh3bzOVFhGBGrKKx2
	9LGZS5rM1rVwcMTO0m02ompNVhfmaS/n/ljDvxboV7vaHeY+QKQnOAdfTF+vv7dVCeOF
	IiMw==
X-Gm-Message-State: APjAAAWL19/Ia8G7qu84C9wtUNMDo3FL9zRkBAJiGoBkk/8+uCcemihI
	yl3Grk5fnwB0HE08v13h07aa25XyKrE=
X-Google-Smtp-Source: APXvYqwwSAg49fhy6hOGbmfaMj8Y0VPkhLcldYlN4pgBNaSghqeLX0Dpue01wW1N4A4Gvpy7cxp7/Q==
X-Received: by 2002:a63:d23:: with SMTP id c35mr66802965pgl.376.1563727173170; 
	Sun, 21 Jul 2019 09:39:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:11 -0700
Message-Id: <20190721163919.32659-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 06/14] python-matplotlib: Use git src_uri
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:32 -0000
Content-Transfer-Encoding: 8bit

Fixes
python-matplotlib-2.0.2: SRC_URI uses unstable GitHub archives [src-uri-bad]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-matplotlib_2.0.2.bb    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
index 5b1c3f05b9..e586ee4dac 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
 DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
 RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
 
-SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz \
+SRCREV = "e175a41cb81880dbc553d9140e6ae5717457afa8"
+SRC_URI = "git://github.com/matplotlib/matplotlib \
            file://fix_setupext.patch \
 "
-SRC_URI[md5sum] = "89717c1ef3c6fdcd6fb1f3b597a4858c"
-SRC_URI[sha256sum] = "aebed23921562792b68b8ca355de5abc176af4424f1987e2fa95f65e5c5e7e89"
-S = "${WORKDIR}/matplotlib-${PV}"
+S = "${WORKDIR}/git"
+
 EXTRA_OECONF = "--disable-docs"
 
 inherit setuptools pkgconfig
-- 
2.22.0


