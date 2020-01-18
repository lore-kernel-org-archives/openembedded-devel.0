Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 39DD77FC81
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:16 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z7so24996536wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oG0QMtL6/O75kTbHQ2Csoa3DmDLE2VDmqQqsJJA7XWs=;
	b=RUmQ4wvHfo17QSeaj/LQGnJI+Antcz9lAqkdLuZBSq5z7RNnOZyEZBTq15jmz933Fy
	nWJzQ53OHoIjCFzzH7ajUsmSIQG9U+P2y0pJ/QbAFERaq1xKx5ShLVVrytUmbpemyTLn
	j+c2J/MSLmzpNM1Jzf/8OFOLpFnp4Tys5SDOIR+DAT9y6tR3YxqWJQiOw4B0iiE52jEe
	9mxjGulIX1MUaMPl4TvDMMI74umT+Cih4bgINFEFisfwjexdHTU+vEQBKRB/3n5gAyuP
	DiYA4lXlKCl8khSs6fusFzYz+zI/fJRfIJLA+Iv9n4natWju5SpmDqPN/Mru+2QU2l1Z
	GUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oG0QMtL6/O75kTbHQ2Csoa3DmDLE2VDmqQqsJJA7XWs=;
	b=C7dIhNaU/lSBFLeJuvywhcr0pSZ9mTy0U0eihHI8tFHtJ0gB65EaRO8NiaVCKE2oEK
	rtkCqGilet8hhzF3xT2HqW9n9XhmeEb4NOTQrlGLbRELZtzug1vNgKbEKdkBNyPiwXu5
	VkuKIuVk/0grs3IJ98UCOBBpnCwmx6L3uBySH/EXAbQcTm1x6+si87tga0Z5ynAibBqz
	NsGrMSmV7HMULHJn7tzzItAWJur0Y/f1fMqczR8bg5FlY9KtwiHnfDeqGP1+Lq1TwADQ
	UZs4M35R3b4BmbA79zEZurTNH7oam4gwtZ9ra52rgFO2yBLlIpojalUbSoOgxv4tS/0u
	vHhQ==
X-Gm-Message-State: APjAAAV61QW7v3CZiI3xfvzislJ0SgZYR6jMK99DyUZ0HF4rwekbKW72
	GH2m3Y79xK0bRF2iQcJuQQ8BkUsLU/4=
X-Google-Smtp-Source: APXvYqxILlaV3iexLGXAqi25RHlY0KaEg39ivncWRnnXsLV0XkewGGGAo9r3hudT/BW5X3ddWO5sdA==
X-Received: by 2002:adf:f850:: with SMTP id d16mr7857398wrq.161.1579346896725; 
	Sat, 18 Jan 2020 03:28:16 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:46 +0100
Message-Id: <20200118112757.5287-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/23] exo: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.12.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
index 4c16689d3..4a5a7720e 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native intltool-native"
 
-inherit xfce perlnative gtk-doc features_check
+inherit xfce perlnative gtk-doc features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native = ""
-- 
2.21.0


