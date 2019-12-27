Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 748437C37F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y17so27289377wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VDRibYldAGvhYcbYkX8x8IWVw6F3b+NY5nj1VUkvZ7Y=;
	b=Td+VmD2B8qw7i6KLp2QXlYCyw/UKGv5lgkHBpcO7BxBMeuHzdIMLC8OSfuqalkhXqI
	eV6fUdf7q34gXhKYvRlu227GT014se5modme7NDhlnZL3Y4ylfaQpFh04rCjfrnxIkoy
	QGHoj8XVdphdtiCWbswgkFBPSz5a40gaK6A1DWlsX+XdHogHRM/drJRHj5/vvQQ5K/LA
	d2b4Lgv2otBufvv0yYy126df9uskXfi0o53BG/iviS1RGPt84MUpY+AyE3IhjFkflJgT
	LFGBaF6Xf4wKCp+ZeeAVt/qrO6s3gJ98EMHUCgDiV7X0g5xEScz906ld1JLpFWjmOOTS
	uctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VDRibYldAGvhYcbYkX8x8IWVw6F3b+NY5nj1VUkvZ7Y=;
	b=ooD+IPlrG8qzIsnlDzcE4i2chhLPg8vzt8uFiCzwIeIXNq0RPB8yvdRiAMSbpsJv65
	M3Bx4cE7yQughLRLkv6EAM2wDfyLwWhE3yLMfTYubBynuSF6/nkPO6T0ApKZQaXUHZUx
	80y7QCCMxgzkAd+wXDRjJGx+NplsRtphs9cchzzK7dVp6vk2oWBtNSevA+s9am2vCcCZ
	x6FKPlY+MQfmLoEodcN8fVL/j+2V0LLy8lP3OxD31Anx0JLrELRoNpraqJhMuIitD82P
	qdWPpDpjOyic0Vo5Kr+jrvvFGFnVwd4sbhvO9MTOQ02lQqtPyqy/ZFXrc7EZcMpt3NMO
	hMgA==
X-Gm-Message-State: APjAAAWi1YBhTHtfcyjDdqF7PBc17wBGBWc8SQwWM3VJFIGIhCXrp80p
	TyKzMipoH8lAj+0kWxbfANI6hU/O+Ds=
X-Google-Smtp-Source: APXvYqwydYxNI60W0BGXGAjfc9a+b9iIL6Hu90NoRijFm2E9QnVQ/HCzmyKBPiekdfc+GunZoiH0Ng==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr49998956wri.95.1577482295978; 
	Fri, 27 Dec 2019 13:31:35 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:08 +0100
Message-Id: <20191227213120.3930-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/23] gnome-autoar: upgrade 0.2.3 -> 0.2.4
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Read [1] and it seems that we can get rid of gnome-common-native dependency:

Major changes in 0.2.4:
 * Use autoreconf instead of deprecated gnome-common (Javier Jardon)

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-autoar/0.2/gnome-autoar-0.2.4.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-autoar_0.2.3.bb => gnome-autoar_0.2.4.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.2.3.bb => gnome-autoar_0.2.4.bb} (63%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb
similarity index 63%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb
index 16a9213cb..afeda3e93 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb
@@ -3,15 +3,14 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = " \
-    gnome-common-native \
     gtk+3 \
     libarchive \
 "
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.md5sum] = "39b13fb2fc7752fa3b80616244dc4ef8"
-SRC_URI[archive.sha256sum] = "5de9db0db028cd6cab7c2fec46ba90965474ecf9cd68cfd681a6488cf1fb240a"
+SRC_URI[archive.md5sum] = "36ab263f477eeee3c95c9381766eb3c2"
+SRC_URI[archive.sha256sum] = "0a34c377f8841abbf4c29bc848b301fbd8e4e20c03d7318c777c58432033657a"
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.21.0


