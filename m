Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA1B578917
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:35:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id h21so10600915wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 02:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4WZiv4CaUo6RWpE3409hc/4C5HsGPW3D/FEb4IoRZDI=;
	b=QbIAMI27FHJdlfw9aivNuh9IqmNO+Sgv3nZTDO1+JPZNPBUUTGsS/Iw9LAwGrOk64k
	kgYqWo0FrYtZ6J2iycS0/W10czeSf1BwSgmJvIJN+fOHb/gRxWHz96XjmmxAspLkqKdu
	l/EcpQ/6EXOc1ozg/k9GLUWLWNP2jQXyNN8O/IDuapxV8JniHnte9jUFUYb6cJzQd3m7
	SzQrZYLrozuDO2HKpHKUoQVywfHs2Jn3woozen4WY2PcOAUA4WB5EpU4IoPqFfGZ/vrS
	0XDi9Q3Cq7Z9hxF2ucm/RzgKdKK+tjooLoZ5wC02QpS31AkG9f1ijIyUskUGQTqpuCVO
	kzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4WZiv4CaUo6RWpE3409hc/4C5HsGPW3D/FEb4IoRZDI=;
	b=YJJORXbjcFuHiXEY3YPY2CD/eDTmXRJQV5P4AY6p7zugjCjUMxTNpclZQQcoI168X0
	tEuW67eicLCYL2i5MtyDgY9WBBkVvf8KiaYbK0SYGmGuepv0yGz147gnE9yCUPcz4Y16
	ZgsC45tZjO14ADs82jXZB41rq6qJkk766djgYIsIWhLseIxakLa/naLbQj/KJma9BIqj
	Pjz7FBygrOyCpzB84R8XPhKaO26503utKGLQi20W0H+WDZS00FKQnOLG8pb3vXn+m+0V
	BvHM6D/Noav5TyobP8WviQ0Uy/oUGeMKcz5yfK8jLLWssc0oubmL+Vwg9NFB/AUnezAy
	2yng==
X-Gm-Message-State: APf1xPCB9zdpWC/6xwQ0CvSUzEh525649UHKX969sXoFSQ9TRdEQ1rfF
	oln5hmMGLkxfomdGnxpyBQHWdw==
X-Google-Smtp-Source: AG47ELu5KNgkKTdawKNNnkhT0AZM4To+lpAAZaXbKOBlpUfHWMRbe6b6Tp9PnTveIxXyNIBnRXilCQ==
X-Received: by 10.28.22.208 with SMTP id 199mr1441630wmw.79.1519900525056;
	Thu, 01 Mar 2018 02:35:25 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p60sm4196300wrc.88.2018.03.01.02.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 02:35:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 10:35:17 +0000
Message-Id: <20180301103517.7653-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301103517.7653-1-Martin.Jansa@gmail.com>
References: <20180301103517.7653-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] uim: add glibc-utils glibc-gconv-euc-jp only for libc-glibc
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
X-List-Received-Date: Thu, 01 Mar 2018 10:35:24 -0000

* musl doesn't provide these
* I'm not using uim, but this is breaking signatures test in world builds
  for many months and nobody seems to care

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 271718e5e4..6bf0bb7ce1 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -17,7 +17,8 @@ DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
 DEPENDS_append_class-target = " intltool-native gtk+ gtk+3 uim-native takao-fonts"
 
 RDEPENDS_uim = "libuim0 libedit"
-RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0 glibc-utils glibc-gconv-euc-jp"
+RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
+RDEPENDS_uim-anthy_append_libc-glibc = " glibc-utils glibc-gconv-euc-jp"
 
 LEAD_SONAME = "libuim.so.1"
 
-- 
2.15.1


