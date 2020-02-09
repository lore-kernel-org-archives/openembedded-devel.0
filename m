Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id B293E60EA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 15:11:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a6so1085789wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=w0IfyUcKI8M+s+n1TuKU+C2hJnsC2x/uNwQgbPvPsCg=;
	b=c1XDjxe+6IwYCha9KnTG/mpvqt9eccxnwqNk2Wpjl4wP/1AnyS3F711ex8qXvRgu6O
	ZPzh/nB/bqooOAELN2N2Lo4B3F/osfMLZgrCDHlzl9pE3NErv4Q1C4yocpAXaj3TzpGx
	SVTeNOS7z0066hCtr5TGTxBi02Rij7tQ5SPSceti0y14YioLJCHZThQ0If9f5e6BqbuP
	F32UUUfs0c9A9IZNiECUohlR9BR4wofhGh1GBr3etB0Ssw7hygArtEBvZIL0TJ4Xe0ON
	BdWVdZ7lsbd6hrN/vMHA0GPQ7CXJKhC68e/W79qqBro0aRKQ6PGH9/bq8a+4zoN96/Nv
	tZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w0IfyUcKI8M+s+n1TuKU+C2hJnsC2x/uNwQgbPvPsCg=;
	b=AeDndZCvoteGOQjeL3slShyjcEqfW5DJJoN2DEGmDYypmSm5IO7FJbvSH09Jh5zsK4
	d0UF/Zf3/5w4fExXZpn7VmT/NKgW6OctyjaVP1IaLN9Q1dkOERtFkxshTmp9EMpyv2+T
	b0pLRYp7MGiSOG5JlkuFnpAMXxlppUVfvQMPU4SU32q+rTOMyzB0B/TfmfQx72O4ZxkD
	rLEz8SsLNZVdb1MQFrFH8htEYcrYxorWF6lwOn3Z5z49m6Tos57djNmGtRRAQlHQm6yZ
	IZHkr8gJppjINIHW2b2MzLmhqXt8C8BCGNzeG7Wzgas7bkkjaK9AGEg1+DkMYuBTbivn
	z+cA==
X-Gm-Message-State: APjAAAU7AqxNRzlq27FfZPx8YCQc+kckG+qbSXRu20+T/tAKF6ZvnYTo
	zr/jVkJVBKzjcX/pRzC2dqz6BSHG
X-Google-Smtp-Source: APXvYqwD8HG/0iVPU8zbGqKLnIjeOz+7hYE+P5hWRm73qikwsRu/SgtONyiY4BBI2n3WDUeFs+Qa+A==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr9992099wmc.119.1581261068152; 
	Sun, 09 Feb 2020 07:11:08 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	q10sm11429093wme.16.2020.02.09.07.11.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 07:11:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 16:10:53 +0100
Message-Id: <20200209151053.4277-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209151053.4277-1-schnitzeltony@gmail.com>
References: <20200209151053.4277-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 6/6] packagegroup-meta-oe: remove babl/gegl/gimp they moved to meta-gnome
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
X-List-Received-Date: Sun, 09 Feb 2020 15:11:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d5789a758..07f71c8a5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -172,8 +172,8 @@ RDEPENDS_packagegroup-meta-oe-gnome ="\
     "
 
 RDEPENDS_packagegroup-meta-oe-graphics ="\
-    babl cairomm dietsplash directfb directfb-examples dnfdragora \
-    fbgrab fbida fontforge fvwm gegl gimp glm gphoto2 libgphoto2 \
+    cairomm dietsplash directfb directfb-examples dnfdragora \
+    fbgrab fbida fontforge fvwm glm gphoto2 libgphoto2 \
     gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer libsdl2-net \
     libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
     libvncserver libyui libyui-ncurses lxdm numlockx openbox openjpeg \
-- 
2.21.0


