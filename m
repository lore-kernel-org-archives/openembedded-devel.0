Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id B3B0661C42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:21:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t13so157365wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+rQqW0O/aceJ9c6GwauVEaOgunu7oszWI35vZ8FZ6to=;
	b=R6aenKFRI4Ji6+4disAUzRgUkMCL4WIFkeycBJK0quoj0h4gv9k2/iErH6p3l5pT6g
	K7V2IZ0935actHRc7HkYlD4QdFo8ChbFQ1z2IyFtRnGM/ny21V9psrx/+h+3ozrx+Fjr
	vBQ56MvF0GjNBmet/ScZS/mkIKilPGhHs37efufh63SH0INSkKm2ShV6ciNyPdYBD+qp
	sTVaRnd2cvW7lqp/qNyoStXoLHZcRlypq5zZhrBR4CFGgJxEJ49lU8DQBFB0pVDNydEn
	fPrZzrzpDVvP7Riyl69QCF7Od8IQbEXlZTkCh4QoAi8+eYKe7sLmUgNniFsDQ3xPQD5n
	2lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+rQqW0O/aceJ9c6GwauVEaOgunu7oszWI35vZ8FZ6to=;
	b=TNG7oAmFUqq9orqMDkuDlB4/l56tc/DG4ogIkGOZQg8r7NR03FXEQ/E+MdZPwSxpC4
	aa1MzKhsi08+ggIrgiFLah6AdlBmeMRToYLjfjZIitzOtxBPfjjIQzd8oP8BjW7LQ/9N
	Q8zd4hxaPYqmoGmsYuL0JGBMVSkrNp+HOGWxxq7Laf06LBV7SKoF/oNh0sOSYdRKobcD
	soLuHMyJMi9kcXme8Ul156H8iHCNM2GsdyD7ybhAXFd9QjAwtgE69ayzn0dahbjR1GsB
	mjCSNifYkbg/yTc3JalLJvv80D/wWaD5UeqDea6qlkU0tZe3NvgNtmc+uIi5BV4L8H4D
	HGxg==
X-Gm-Message-State: ANhLgQ1tEdN8umQDGwZFP6iIETH6m++kAYI35dnWMH/zSt4MPaGR/iUy
	xItPQTtEqczB05yrNKFv3tAiSNjU
X-Google-Smtp-Source: ADFU+vvQ8Ng+B2kbKkRBHCAw13FTfCV4jz5vW4LMIpFs00x5IaOEqukyszKIQK1Y8ea0TN5PNaoo6A==
X-Received: by 2002:a1c:6285:: with SMTP id w127mr5344493wmb.133.1584022909859;
	Thu, 12 Mar 2020 07:21:49 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F067F32CE0B3214CDB29793.dip0.t-ipconnect.de.
	[2003:f0:7f06:7f32:ce0b:3214:cdb2:9793])
	by smtp.gmail.com with ESMTPSA id
	r12sm20974339wrx.26.2020.03.12.07.21.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 07:21:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2020 15:21:39 +0100
Message-Id: <20200312142140.5926-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200312142140.5926-1-schnitzeltony@gmail.com>
References: <20200312142140.5926-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 2/3] xfce4-whiskermenu-plugin: upgrade 2.4.2 -> 2.4.3
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
X-List-Received-Date: Thu, 12 Mar 2020 14:21:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.4.3
=======================
- Fix loading incorrect icons for some applications. (bug #16461)
- Translation updates: Bulgarian, Finnish, Greek, Icelandic,
  Interlingue, Nepali, Norwegian Bokmal, Russian, Slovak.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.4.2.bb => xfce4-whiskermenu-plugin_2.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.2.bb => xfce4-whiskermenu-plugin_2.4.3.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.3.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.3.bb
index 25fc72d97..3da631bb2 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "f553d3be2ffebd8d9fa5b6415647e4ff"
-SRC_URI[sha256sum] = "fb2e1d44744d851c5339900e7af9068397028efa9ee5235a66ab273e95740dee"
+SRC_URI[md5sum] = "7b66438996127b759ad634f6579e003c"
+SRC_URI[sha256sum] = "39faeee91ceb3cb727f9de09dbf20a8c73e524851a2c3b76a4b19a0732de5ff0"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.21.1


