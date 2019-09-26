Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2C27F26C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 22:32:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q17so495260wrx.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9BpaCsHYVh/qnG0hrinf1T6J2xhY+s2LpT0Ohqc/U4c=;
	b=WbxKKr3a5TZFYdMsBL8jFxseoAKXPykGw2XHUFidLxu40sjT1r74/VblEesb0RoKV7
	SVuGqYWIye9q6zEuvHq2Z5DNbAtZHymbwehiWIxdd+H1ipxZcmUzb1wtS97Sry35C1ke
	azMNIW/lz23+Wrd/ljtoR6n7Ol0Np6VWICF8F37Ix4jFKYuMkuPQvHZYhznaacmv/Ee6
	4yYHHAdjokud+wiRTxAUYAdwk2UJBDHPwnNpspEuSEjui8Q/PESSbhV3Xx4p0C6maCRT
	N72KQwJlc++4/XlL0oHjLlVDDzwtvvFDuJ86NcBixgSzpe5uCK0o4HIPdVTgEveAgAz3
	4EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9BpaCsHYVh/qnG0hrinf1T6J2xhY+s2LpT0Ohqc/U4c=;
	b=Ks76S+wr0hcqAeWk0R294ljdLL4dl6zgZ9meLkUgpuWJ6eQFXQmCredka6c9XPkA+0
	kKLCQY7tiShHJZ9px0DYb5/MNQe7+MErcKDnnO5B+8v0oCm5HNCtGDwSdV9hdlExsdtT
	GT4GLEIRfNHoOe47XIky8I4gsv1r31fd6BGjj2vrW7E8QALGKzutuWnIT54l12br4eX2
	b9R+gJeOUtMIqPzC+3OTReXglM5yAGY1jYoZbB1BR/43vdUf2D54PEYkCG2Xk2wGjOYI
	K2mTJHGFmED/cdsBnfZqFO6pyGo8ozXkAKA/ZtdBBT/8GIpkmQUjdBs+nxpCvCH2P/cU
	H/MQ==
X-Gm-Message-State: APjAAAXVfBEmTYx8+UpMh3vRvqOYRc818lpl1jyoa5Bp7iDwX44Q62Et
	7gEOiqzhLf2CUvcyEs5EKRJuRNyy
X-Google-Smtp-Source: APXvYqyN09WNmP3VEV4HvUzkjWfTxU30edbpHLxLJD2vkmemBK4fw6YI0GN1I8NlvwDNFygodkn8kQ==
X-Received: by 2002:a5d:5183:: with SMTP id k3mr460477wrv.55.1569537139542;
	Thu, 26 Sep 2019 15:32:19 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05552433B9EECE553F1384.dip0.t-ipconnect.de.
	[2003:f0:7f05:5524:33b9:eece:553f:1384])
	by smtp.gmail.com with ESMTPSA id
	c18sm1205023wrv.10.2019.09.26.15.32.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 15:32:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Fri, 27 Sep 2019 00:32:06 +0200
Message-Id: <20190926223206.26850-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926223206.26850-1-schnitzeltony@gmail.com>
References: <20190926223206.26850-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH v2 2/2] xfce4-panel: upgrade 4.14.0 -> 4.14.1
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
X-List-Received-Date: Thu, 26 Sep 2019 22:32:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* important bugfix release: systray draws icons properly when compositing is
  disabled
* while at it renumber patches

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...dm-tool.patch => 0002-use-lxdm-to-replace-dm-tool.patch} | 0
 .../{xfce4-panel_4.14.0.bb => xfce4-panel_4.14.1.bb}        | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/files/{0001-use-lxdm-to-replace-dm-tool.patch => 0002-use-lxdm-to-replace-dm-tool.patch} (100%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.14.0.bb => xfce4-panel_4.14.1.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-dm-tool.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch
rename to meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-dm-tool.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
index 749c3fea4..a1b571e68 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
@@ -8,11 +8,11 @@ inherit xfce gtk-doc gobject-introspection distro_features_check remove-libtool
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "940e8b430e28093a2e56e390055bcd51"
-SRC_URI[sha256sum] = "d5f8f3bd7e142139987e5e62cda26135a424baabb5e47aa0c23b4169d0a66ef4"
+SRC_URI[md5sum] = "3323588f1c18f04891e013243da1e355"
+SRC_URI[sha256sum] = "9c3c78b49ddfac7d42a804e6a6ad9d22ad64ec60bbe17d8724bc52d3e3f6d114"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
-    file://0001-use-lxdm-to-replace-dm-tool.patch \
+    file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
 
 python populate_packages_prepend() {
-- 
2.21.0


