Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id ACFF571A9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:22 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 64so6492712pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NgJUBpceGaeiLVncdWIHkMWQdrQkztWNqVa8Gy2issM=;
	b=Kka7nE7BFmQZZiUYvMFrFUt4uEmGWwVmo1/RtJY+j7TqJPSPcJ32VRmB2SDC/RQlJy
	DvDah+tcSg40+rB0H+nfRPpz8JnCJA5XyatKGdEPD7uaTJ7Zc2TghPcLaBVSonbW+fLg
	VYFQLonsO25JpNOIZ0zAvWgQtUpJHGJ4Wfqal3qf6fiuyrhWxfeSHFfyymn8EA7/sKPo
	sTwzi5lU0GTqYFIkyi3qrKz4lbdOWNWOA39Okgsv3cALuaEjgRHIgmeTPELfh7o5+i/B
	YlNUfYm2c5OeVYebDoM5eb3vk12asWVxttKAK3FExctyjI+BlvA7tIaGbETEWeTQpBUM
	FPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NgJUBpceGaeiLVncdWIHkMWQdrQkztWNqVa8Gy2issM=;
	b=E4zlg/tkjfuSht1wVp/JR6d9oheUdxBMYqh8uEXJ2h/NdGpwbSf9jYXGnJU+36XXgA
	9Xu4LF1NPN1ZnlNuVbq9k0+4eRLbh1f5A7eOG9Ctun3ceur5e6mkzFErrM1gkb6bKx4n
	5o6tXJEDEacPxia/X1KUDLWyHFsejEIqj11kgYyuJ9HIveboPpZiMrMSlvw6JeAskBPG
	LwYosv1lQmDzP5ySNZj+HsRUs2Z3dHOGct5tikJQrv6aUvh1fPnUwCA1ovaERjArzTS7
	mOwndntm9l7UjfwFJuo3bfvJM9ICjexYi4Q69PESpoBrsZO2f5XAymikOQBKqj193xhU
	C+rg==
X-Gm-Message-State: AN3rC/44OciqoSssOgEj+gEEMlid6I/D9k8NiGEC9+QD+nZYiLqH9x5B
	T2Jf2ZtrTTWtdg==
X-Received: by 10.84.218.71 with SMTP id f7mr65571106plm.135.1494316643770;
	Tue, 09 May 2017 00:57:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:05 -0700
Message-Id: <20170509075711.1575-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/9] gupnp-tools: Update to 0.8.13
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
X-List-Received-Date: Tue, 09 May 2017 07:57:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gupnp/{gupnp-tools_0.8.10.bb => gupnp-tools_0.8.13.bb}       | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.8.10.bb => gupnp-tools_0.8.13.bb} (53%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
similarity index 53%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
index ba7f8257f..9360d65b5 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
@@ -6,9 +6,6 @@ DEPENDS = "gupnp gupnp-av gtk+3 intltool-native"
 RRECOMMENDS_${PN} = "adwaita-icon-theme"
 
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "ad8423d036e98bc6f877528d6b846f6a"
-SRC_URI[sha256sum] = "592c53289ff1cd70e676405c56ca87b28d2da37a385d34a3bb9b944ba9108d17"
-
-inherit autotools pkgconfig
-
-PNBLACKLIST[gupnp-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130670/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+SRC_URI[md5sum] = "212d85ebce89b32468b59e1164050d40"
+SRC_URI[sha256sum] = "aa3decb9d532c0e2e505adc592f431fd81c0231ded2981129e87da13712479ed"
+inherit autotools pkgconfig gettext
-- 
2.12.2


