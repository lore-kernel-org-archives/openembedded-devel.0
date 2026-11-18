Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2570.1794961612274861613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nMZrE1ET;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so873841eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961612; x=1795566412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAdUY3UHxmJDVb9pdZW+2ZyOxBgM2lG1Zt0SOLrg564=;
        b=nMZrE1ETebU6uswgYoy4S8Ue1567B3GrIFRkTnj31lYVCbBGKjdLvRCBV5GoobncGX
         3iOpOwklKSxdV3pxk+Hyl4LNjkvcsKCgPUVeapuwbJZ7HMMC3tsFzv0Xr05U0wvhwq7r
         9nAJbvj6u61DNvC1ZV2MGmK0+nI8Dj0ypbyANDcO0iq5nxVD/KhD5HXQVAn0WNbYmUQ/
         xEt4VnH2wc7yoV/W9Cv7LEA6rGL5wW6zqk/0SXCHK1FzaXkynk75gGjTHS9yFmdc0Zrg
         ScQGt8uqitGtS3akff9bfiOOUAlTyMOemP/kPy3UfTxlkWyCYN4Ce5uFmEZ1/uczP/pX
         SoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961612; x=1795566412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAdUY3UHxmJDVb9pdZW+2ZyOxBgM2lG1Zt0SOLrg564=;
        b=IOjs/XsSicIOGPeGNa0E0Fv5cp+do+guJzELUVvFgO2r1roftFcEggP3sgLyk7ynj2
         2VwegrjqQx2azlOGRKW/Kf12xHtmUCZSEJCGzoOwHDrf4kMW8hD816M8S8KpCcvy+AFO
         hbBtrpTujQ1/RBkJo/E1lqj+dnn1sUAl8gGhl/Y0QwnX9P5oiHtag0Mi48kaVVYnu3D9
         VvEaA+g8cGcy5pukmZU3vKpRGYfbMaIZU7S2BSiaFUauN6xiDhqL9ggTG/2RovOmDzv+
         Vp86nUaqieWxX7aFpX0JeekSIAR2z91dqPI9uregCFE8qCpOiuiHbqIRrWl0S/N7QElX
         tKew==
X-Gm-Message-State: APuU4Z8Mq7Ae4907ifxBUML2Ehl9kr4rTdFDbwpnK5TRVDSUJeaAhkrn
	DOXjV5SaLmxXf+zo/4ZlEGm9aiYjIDF5jAfwLESNof5PjjqvPiPVDEYFRBcrc8Gi
X-Gm-Gg: AZFdTZdSXbkSnu4O3H4+BikdU/xIuLiJ+0RwKP/pz+Wek8KXVw/PfYmgVTx8AMQ7/Po
	vhw8Zcay7ZJ0bQnMLm3z2FXUhNo4Am/AHP+Lue8i1O6QiqmW82N3GsfR94ZO+tUJprNgUdiTKU4
	2TDb0fY7ozguzGxarSXNjsaoPcZyuQhf+7FumdVj/4yjBTYI6V6h+gznKPF6emIVp0HaXKfxTxv
	ZQHfVz1fQjjMzJR6ZOs8XrO95AhIUqgpNd0LmSq36K2u339QeV/C3AdfblzFMrodys77cXzgFM7
	M8o+vr0z0xeqQ3paPpABsMWYP9WP6pvcz2mj2lRvv50SEIvaIdogT7mXrH445Yzm3mZ5/W9VGKZ
	gyIoxw5B5DUJoaXHGGBe3MEElUbWKJPoUyI+2Fk//XhqD8+7faynDv/PlUxOs4fPfni3w6jY86L
	mZ5qqkHkdJEWN6JR4fKDspAwUKCohjvC8Tzc/7ijj6WvTMsdQxvjo7jf7mBhiXrARdfz9tHKVVo
	OBB142tda11jPZaeQ6fila4Kh+dwYeRA5b6ga0KOpIrO29aRi511F1+PuJE8s6FW250Sir7IN9G
	bth6elt1wQnFl/FN9Aw8t5+piEGs2fI5WKzjb9FD54F5WejGCExrHNhhz2jFoXDu1/r/B5kG+K9
	Udx8zfVhIANQAYS/HsEGv0JTsNe5rumGSuqcDXaniFufg37872EpJwegyvqOjvNmZAcI8zK9BF1
	RohZjBDmkZNobwX/IuomOBSXFflio0nYAaEyFsdcwk6/hfVMbIEVWZQlBxjAR8d/kZ0LJJ9IuFQ
	jfFUs0pdwFJGFa2aiM2ty+KA5Tkv47OcztdOAlF06FarmM0SVws9+JtmOFaaz9EtOGPoR6TzrYG
	ZgDl1Q==
X-Received: by 2002:a05:7301:92a:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-38280f2290amr887798eec.28.1794961611334;
        Tue, 17 Nov 2026 16:26:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/14] audiofile: Fix LICENSE
Date: Tue, 17 Nov 2026 16:26:33 -0800
Message-ID: <20261118002643.29829-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132606
Content-Type: text/plain; charset="utf-8"

libaudiofile headers are LGPL-2.1-or-later (COPYING is the LGPL-2.1
text) and sfcommands are GPL-2.0-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 4cc4eebe6b..bdebaad217 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -4,7 +4,7 @@ WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
 Research, Amiga IFF/8SVX, and NIST SPHERE."
 HOMEPAGE = "http://www.68k.org/~michael/audiofile/"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
