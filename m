Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1AA61892
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:12:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id x7so759695wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=x5a/7DrJgaMEPzOS1OPHxX/pLrwMBI8XnKTdmrY54hU=;
	b=ts2/AP+g2JQ6/FC5vM4MjahvleOZSYnmLklS+qoVkUt368tX/3iKgi9U08h8CDzOTk
	+UcMM9S8Zn/a02LBaMNdjILzvzH4jSK9SxHPlK6YAHfoaVHS78zyU26DUb4lN0lqY4xE
	WTxOlEu2sRz9FDJw+5bpQZpiilmNUqR8KPnAzV8hGnSxA+/IJvo2Pew0K4qanuT/RSS3
	3YTaDIfdsMEdTVab7OGMYmW3poUI7wX2w1nNWdKb+e6w0s0gNawY5P7mXLh24A0Rso/a
	K0jMuCy7VJf+zQI7c2CDD70TxR1AUNQTEtVco5uIfurKbBU3OrGCzSZkbDLPOLvo3Y3I
	6Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x5a/7DrJgaMEPzOS1OPHxX/pLrwMBI8XnKTdmrY54hU=;
	b=UrdHPlRbE2iDWSv8/zbQ6uBewXynJgMB3oPnM8YI3vsbJXxXj2d4VUOV3xhSPsCwz9
	hNtoHqUiyMrtBOXzEf/TkzOzSqXa0CSV9yRJcq4sxhh4abFNP1E2TBf7f99gvOMRBheL
	IrCNjVtxhE8O7VoNI+ggwcw2UpYKoC0ne7DAB4GpiF2rxVQdHGn9o6s5L31L1zmfbOaa
	Q9rpv5O2i+jwEBW34Y5PMa/h41yVHYY8B+A0E5l1nym0V0wg+a2Uhum1V5gB/hrEFZqX
	XsTm3+IktxvIrr0xMdF9/YVgbGST/YpGsX546S5w7cx7Z4cCGde7z10Y3jYYMcZuN6qc
	k0cQ==
X-Gm-Message-State: APjAAAXkbQPr7u6U9RO8Q88plvunN3C2nYe77FBmQ/xjfliSJH+pol0n
	cm6QHaVamKc2QVN/dwIMJrO1zFvy
X-Google-Smtp-Source: APXvYqzr2XhH89GtBwJBHdM0lSaKkN71iWTR9qFHTVRoM1daiDAFLAFkxO4zwor6GStnXOJegeXRsQ==
X-Received: by 2002:adf:fe89:: with SMTP id l9mr918963wrr.373.1582841579822;
	Thu, 27 Feb 2020 14:12:59 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.12.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:12:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:41 +0100
Message-Id: <20200227221245.22944-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227221245.22944-1-schnitzeltony@gmail.com>
References: <20200227221245.22944-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] gnome-control-center: upgrade 3.34.2 -> 3.34.4
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
X-List-Received-Date: Thu, 27 Feb 2020 22:12:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ontrol-center_3.34.2.bb => gnome-control-center_3.34.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.34.2.bb => gnome-control-center_3.34.4.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
index 9e6e92aec..c4ba833a1 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
@@ -30,8 +30,8 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
-SRC_URI[archive.md5sum] = "a960a7d3e9f1c4f341bae42da7fbf23a"
-SRC_URI[archive.sha256sum] = "a85ffaf5885a8c70c019013d73792bf4cc75f643e97f6e8b52f7fbba9f7a9114"
+SRC_URI[archive.md5sum] = "4a783c45d6775185a683f143a14d460e"
+SRC_URI[archive.sha256sum] = "17ea6db4b9cee75e99e77f0161a0e5209a3b86444ae775c2068ec192aba6272e"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-- 
2.21.0


