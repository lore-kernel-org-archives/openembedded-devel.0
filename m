Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E11761219
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:51:20 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id p18so1873180wre.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 22:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0iyI8lzCWiEZCaaHpNjkeaCoKLFjvOlsogyUVpmJOoE=;
	b=SjioOZ8VTXwL7VyiM0Uc58fmIXNQseKINk50t1MnT3HxRKgVh45Y1kZFa6pMv9kImk
	iWXAvNJ5BiTZ5+r2hYL3TEBH9v7eChST/CNxhg7T566HCFKG2VAD0RECn8+uVxoB9KG2
	ySDfG20IM9rFthR+FLNjpNnfOgknRJO07GxIReMln5Ng7oRdPVPDBY5QE2rHVmmZ0Ey1
	6E3yE3NwzeYxiUORkfnVgGYAiTbwAVq32G3MzmMoalguWRexb+JfFiqdEWhG+KHRpf75
	VzgpwpF8g/MHXsv2MG+6WVDbBUb7/8ehFNu2kYKE96EGufPJ+YiJm9RNN8Sn+SlfLADg
	0Y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0iyI8lzCWiEZCaaHpNjkeaCoKLFjvOlsogyUVpmJOoE=;
	b=GElG2gbEmMUap7jX/8TzI6xAuoU14+J6gwRij+L6gzNmaUm/3ggy7IiIxJMT5+b+px
	WZLTNKDw1bIyNwkY8E/YfB9yh4Z6+ORtvazDGpdXPbrfiUKK0VABp7XGhR3Fx/BcKwSQ
	joLC7OeuMW2GQYgZQssS/tEIroFWCdKTZgNSVQPTzvPkdRSjPsKekqbcV2bP3BqIuNSK
	TuT2GEkR7yIKgojh6Bx5Z767r0E5FaCWdSAKy2JSc7uy3Oi/O+FHBzXn0gFzOiuTSLvy
	/8TOQ5ljUHrIEt25xC13wjy6phQ33fr6MCLANyLYO8/etSqzv9bd0ZI401fP0TEiZDag
	KUag==
X-Gm-Message-State: APjAAAXZA/ELC9Ol1+lRNPoqekvDimkUQIehBQaD66qrV/Oh1ry3ZMmP
	fKfcJakM+KWTu864yfZTgzdd3dX8
X-Google-Smtp-Source: APXvYqx9U9RKys805FAY9iMsFV/kvLxDVZzDHBRKqgAnrMnvsZkGDyvDaCEOK5OxkXzLsVgwg1of3g==
X-Received: by 2002:a5d:678f:: with SMTP id v15mr3071351wru.27.1582786281211; 
	Wed, 26 Feb 2020 22:51:21 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id u8sm6470066wmm.15.2020.02.26.22.51.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 22:51:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 07:51:04 +0100
Message-Id: <20200227065105.29865-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227065105.29865-1-schnitzeltony@gmail.com>
References: <20200227065105.29865-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gegl: upgrade 0.4.20 -> 0.4.22
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
X-List-Received-Date: Thu, 27 Feb 2020 06:51:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/gegl/{gegl_0.4.20.bb => gegl_0.4.22.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.20.bb => gegl_0.4.22.bb} (93%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.22.bb
similarity index 93%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.22.bb
index 5e7a1bb84..ca73e66f3 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.22.bb
@@ -26,8 +26,8 @@ SRC_URI = " \
     https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
     file://0001-meson.build-Give-note-if-sdl2-was-found.patch \
 "
-SRC_URI[md5sum] = "37433eb00f8a4b0d1ae9e975aaedfa26"
-SRC_URI[sha256sum] = "23bd8bb42b20de7c2a8c314eeb5301dc20141feda20a4b1ed455020b69b73dff"
+SRC_URI[md5sum] = "1776ac26792de0de3c3d680872e94b72"
+SRC_URI[sha256sum] = "1888ec41dfd19fe28273795c2209efc1a542be742691561816683990dc642c61"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
-- 
2.21.0


