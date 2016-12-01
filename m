Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8524671A62
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 05:47:52 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so11291846pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sQTrxUBvwxpoLs4t9gES0rHKeVyK2zi9T1SEAuBLCac=;
	b=YDteIUs8D3UuE/abOw6vYtLeaoRkWEIiRugmj1H+iAc6xxzPitf02IGT+Zl5HhLvAM
	GO9r55DgpEMIkxfumVGTp8E62yG08SyNQikwO+XxxE8Nei7NoJJgGQVo8O4CuhzB+C8T
	Ri8GXjP/lSJ/XNuKftgptUFPcewr+ntm3WZhiMnMcDmRa1xnQO++WRqPr3VaYHZE1H5G
	7hB/qiz/0YI4mF0we44X28KWynHVCGd3JZOozj57BT+lKbEhGJvX33LIbUJUbmxycqcA
	qkwiRWl8Di9FtgwdEUzEN+GPjKf4r0yRz/hdVO4qDkwIzRICt0AYEOC5g1TGPYf0AQY+
	LtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sQTrxUBvwxpoLs4t9gES0rHKeVyK2zi9T1SEAuBLCac=;
	b=jVU4i2Tm9mQTv+gQuoR15qkBY4I/SOxnuIYmlPyxDE9rq/rWrNoxV2H7BxoOiRMSvH
	yJAqbrzR+/eD9+1gSc7XJw9FIHOAqAw1ABICBtkXivNtN7lAxdEsywUzNcoefbBN114C
	QTN7nZiqWYkEw23YjjLp6pButjmL6cBw9qxGinLorNP/eWFJPnr0Khvtddto2UAne0nN
	TB47tYBSeZpOj5bK/xJUvaZGVi8umwaOINmEUa3XFallPbFPnT1yCYxjZmvqHYB7FHIL
	y7b+buXqbWMzzvCuWmUXLvgozCfR3dyOdE72BXeKLb6v9PBQ1aUq0G41WNBamc0Slpx2
	3r3g==
X-Gm-Message-State: AKaTC00dT/jm6LBecFo7/sWqBwpXHfHmBWuM3h2NhKngf8DaQO/fe2MvSpEyKNogLvRzoQ==
X-Received: by 10.84.214.1 with SMTP id h1mr81920878pli.47.1480571273455;
	Wed, 30 Nov 2016 21:47:53 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	d15sm106870900pfl.46.2016.11.30.21.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 21:47:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 21:47:44 -0800
Message-Id: <20161201054744.4776-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161201054744.4776-1-raj.khem@gmail.com>
References: <20161201054744.4776-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mpv: Add PACKAGECONFIG for vaapi
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
X-List-Received-Date: Thu, 01 Dec 2016 05:47:52 -0000

Now that we have libva its important to enable/disable vaapi
explicitly

Fixes

WARNING: mpv-0.15.0-r0 do_package_qa: QA Issue: mpv rdepends on libva-x11, but it isn't a build dependency, missing libva in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: mpv-0.15.0-r0 do_package_qa: QA Issue: mpv rdepends on libva, but it isn't a build dependency, missing libva in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
index c49811c..f51df77 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
 PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
+PACKAGECONFIG[vaapi] = "--enable-vaapi, --disable-vaapi,libva"
 
 SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
 EXTRA_OECONF = " \
-- 
2.10.2


