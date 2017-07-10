Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 071D46FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:35:19 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id x23so26456998wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dH5tKCxa+coIq8cIpYKoYeNpzegVMR+Wea6eytJKDkg=;
	b=XrYtR/bzpC2U/d69Y6sfJYGHIJxb3bjDxK8bcNMKU/TTFqp7fJPLLXbzeq/9OEIoah
	rJBNdMglbb3Bs/JzkUQ+EF+9+25mq9h8DMF3a+i8Q73aoHaGgcuSMlJIR6ldcTOgSAU7
	ASIW0xmP3Ol9pCUE5SFv7ALrxaIS6iJXimkq4oIaG7JZk/QmH094Zl3GwVTVkN/1uqhj
	bkQrppRqIQm44WMZDKm9M/PGDxIbJr3STSU6W9i4MJ8i/WBnzPzjO5dm6ABe0mr3TzsH
	hlRv/rO71WlXqKjMatZ6loDn0a6bEH6o5cK4+z0cRoW4QRCu1VsJaO/juMGyKkUk3QE4
	ervw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dH5tKCxa+coIq8cIpYKoYeNpzegVMR+Wea6eytJKDkg=;
	b=fxmbKKAXT3V3qJR4JQdIw8GcN1fUSPrTNUVvroKht8u7iVqgtOn0hmdS7Kco+oScHk
	N+7YSXJ5j9ED4kfqv7idGXXL5oU2Q0ZOt2KljWetzwkFM3tqstzk7obL4hbqA93ySVu7
	aRfJBikS4HuukKaCF3i5TZSzZvuR+Hit9Mj7WdFwIZ56zqfuu8qyTeMPedC1Xje85hdM
	XZj7E9yGh0teukjnpfMIENTwd2u6vn+I1OTovKYVyrFbE9Tq7zcaqY0dNTLRVDmUk9qD
	lW2ACzDzw2tfxKQKr00F+NmBMuSge/4iJskrteYikUU1OZZm23iZ9ElxCfz+vaQy/G/3
	2I2w==
X-Gm-Message-State: AIVw112VLVPko5yC8xltJJBObZzAMVU2zX0Dj6lFzufioNd+7wqq4MXB
	dEm8DYAq4j2+BQWp
X-Received: by 10.223.142.80 with SMTP id n74mr8869446wrb.131.1499708120330;
	Mon, 10 Jul 2017 10:35:20 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E9066A861E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e906:6a86:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	z195sm11980102wmz.28.2017.07.10.10.35.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:35:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 19:35:04 +0200
Message-Id: <20170710173507.3843-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170710173507.3843-1-schnitzeltony@googlemail.com>
References: <20170710173507.3843-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] garcon: update 0.4.0 -> 0.6.1
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
X-List-Received-Date: Mon, 10 Jul 2017 17:35:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/garcon/{garcon_0.4.0.bb => garcon_0.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.4.0.bb => garcon_0.6.1.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.6.1.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.6.1.bb
index 8a3260a..06e2369 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.6.1.bb
@@ -9,8 +9,8 @@ inherit xfce gtk-doc distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[md5sum] = "aba62b80787aac295083bf7afd419ffb"
-SRC_URI[sha256sum] = "787dc859713b6518992d760d4b858fb02e8a30705e6f6e871d7a14cc97bca972"
+SRC_URI[md5sum] = "174690ad19243f7ef9529cb0c24b9080"
+SRC_URI[sha256sum] = "41c31ba0498c2cc39de4a8e0c2367510adbf4bc2104c17feee358e51e6acf603"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.9.4


