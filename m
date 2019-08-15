Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0891C7F318
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i63so2459002wmg.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dK5aVf3dTyyFAK3LzX+GaxQmXgH2iSGexBLKLij2/eo=;
	b=JyAKMIfQ0DKlauBGbkyhJwHDHDIgrhdNacgswPAwpSoX7xJgRzGfQa/8+H5gmDDpVh
	7myvFRGYbKGMsvY9uCgjHjJrVwjZL8STDx2YcStp0aQRwc40bHq6J3kHY3gpC1I5yMeF
	fqHsg6xIG+OmK7dCKv43xdM+vlWFIECFsWotg0Dm6gPCjVrP7hQty5v/LVQiriDpjxX7
	oLVqow+WbRjDJsWo246ycKomexDTbVC1TGM0Pz8WfhCTEYm8BuVBwFiy0C71EGLI4n91
	G9pYLV5AmII5yvTVgkYHkXbe8Of2tOC3JPjcjVnHVFOg9lh4ViE0ahU/SpS9yKNqyToM
	MqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dK5aVf3dTyyFAK3LzX+GaxQmXgH2iSGexBLKLij2/eo=;
	b=STuQfrD+Pt0El+88arYbO78aGca7ZYmW+GXIs9LdB3Jho4aYRc/WV0hpLyQk09XQuv
	ZuHtxR7meu+F9R/gUGwopGVJuiyyB15CoohshqJLZlcsCA/uBtPZbQrJGFYl8Lqqi3ot
	8RlGPfuASVrwNFqoMMN1msV/o78qY7+MwHcVSWnRZmGUVyrTePCOpZVv9g5mjOWsLU76
	EfhwWSWxwPO6iJ2VLDxm2gWx2QRcFOH7Mk5y8GdT7eW0hj7erolJE+BxfOhUsNgRui2z
	B6f13BnQfdrLZAWczLy29aw4LzUSVdWGQVCwCtAIHHwU1tKTyo35tTE/qaooCse74tUR
	bAew==
X-Gm-Message-State: APjAAAVlPGDk6VJCgrDNEnNI3d78l1puvTEl6nlenBV01wj8Jy8Sob+8
	dt+o3Bbq0EG3ToSm4QiKOse2yRz/
X-Google-Smtp-Source: APXvYqzifPotzVTAG8I5sEq+/WAPnJGGwudGBjprDLhqYL3dOb79O3KlSvwknujnHZThmROV4mGMrg==
X-Received: by 2002:a1c:1ac2:: with SMTP id a185mr4461354wma.96.1565906185548; 
	Thu, 15 Aug 2019 14:56:25 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:56:03 +0200
Message-Id: <20190815215605.19600-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] xfce4-datetime-plugin: upgrade 0.7.1 -> 0.8.0
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Port to GTK3 / bugfixes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...etime-plugin_0.7.1.bb => xfce4-datetime-plugin_0.8.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.7.1.bb => xfce4-datetime-plugin_0.8.0.bb} (47%)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.1.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb
similarity index 47%
rename from meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.1.bb
rename to meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb
index 97aa184b0..a1fc139bb 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Panel plugin displaying date and time and a calendar when left-clicked"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "c42149ec71836fe83085511429e638dc"
-SRC_URI[sha256sum] = "e0c7321346ded2539c4688c593f650696ed0ddca0a5f9d4e404d0e7fc42ae256"
+SRC_URI[md5sum] = "b88e47af4e9e156e43dc993f18218bd3"
+SRC_URI[sha256sum] = "cd358bc2ff0707b8ef1504396a19b0a27f802c2ec7bceb5cebe2c7baf6adebd4"
-- 
2.21.0


