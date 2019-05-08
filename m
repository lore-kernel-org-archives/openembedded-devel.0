Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 040B67D69D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 06:32:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id b203so500861wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=u3ZFLFM+XztqhYmuA7lpOjbJxf3uU9zfYiy0Ynn7URU=;
	b=nrEJn2xuNrpv2Ceqp5ufYnG1bdw5Ppp2rCZciOi7rYLRaQvBEuKqtU0ZGsZmQvwMCy
	N4TmJU2+ewFZXRIytUia3RjQJeLjFyKDlsNo5bBCFVHqgu++GuSx/mTBmrekoEmqqHIv
	F5qBRP4Ctzg0dkyn0QKL8SQd2lW12Z9u3/5u1ZACjTBVJul5bCqIyAOPmcdElJoIpZ8N
	Z5lk1ZaXi0td4ll/k3xMwT/Z0VisOOIGTlBGFt3HRizUekMFBI+Aid+WOqZ01FAu8Ri0
	CsdfSAGLXOx/Af09ABRiZgornpAnLnk5ZobWkMKPrGWHnCyOnHU62BZgHz3B14nOousx
	kv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u3ZFLFM+XztqhYmuA7lpOjbJxf3uU9zfYiy0Ynn7URU=;
	b=YL7+h/24kKaQxajud340ui7lhM5VlIETax4xgUpphAyMpDdGEH7R1hDWmcNepUXrH4
	8l3Palq94q5VuRzf6p8g9tMximhCuHkaFVxlgZU58Ku7sj4D2LL5hNZIUOVZ4BxEFpKS
	ZN71ri1o9rTjYHzv2ZN+0K/BVIacD/nDLTVG5InPZMmlHgsdpLmemCQota1i7Uof20GM
	h623RiAP0XrHxQi5XqQN9QZLJqmZwQEbSYiJsEmiw+rRmVXwm5mvnDrrTwdN2Pii75bS
	o5w0V2xDniVxj9/e6bo5P+RSqDxd42Otkf6m8TAfvxs/7mpXWmZhaE5a9r6/NQgJrP9r
	ez9Q==
X-Gm-Message-State: APjAAAX7pZUveJGoOkK1xWueXF9a5CEQN1oPUQS2arSPmiIdUZ+Ku90j
	U8LyWrQta0+a7O+c8dUmtUkdtqOXUGw=
X-Google-Smtp-Source: APXvYqzsDaQsVmJITt5cX5fH4dSyeJcbaI/pXpCIYSsKw+7DAr6+QwGJ06QDiHruUmx9oSwv43nj0A==
X-Received: by 2002:a1c:7507:: with SMTP id o7mr1708365wmc.87.1557297124577;
	Tue, 07 May 2019 23:32:04 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0B31751CB5D2150A46C45C.dip0.t-ipconnect.de.
	[2003:f0:7f0b:3175:1cb5:d215:a46:c45c])
	by smtp.gmail.com with ESMTPSA id
	k206sm5637499wmk.16.2019.05.07.23.32.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 23:32:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 08:31:53 +0200
Message-Id: <20190508063154.10299-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508063154.10299-1-schnitzeltony@gmail.com>
References: <20190508063154.10299-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libxfce4ui: Add PACKAGECONFIG 'gladeui2' for glade (gtk3) support
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
X-List-Received-Date: Wed, 08 May 2019 06:32:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is necessary to open glade files shipped by xfce packages already ported
to GTK3.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
index 8a385baeb..df4b25c52 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
@@ -18,6 +18,7 @@ EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
+PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
 PACKAGES =+ "${PN}-gtk2 ${PN}-gtk3"
@@ -25,8 +26,12 @@ FILES_${PN}-gtk2 += "${libdir}/libxfce4ui-1.so.* ${libdir}/libxfce4kbd-private-2
 FILES_${PN}-gtk3 += "${libdir}/libxfce4ui-2.so.* ${libdir}/libxfce4kbd-private-3.so.*"
 
 PACKAGES += "${PN}-glade"
-FILES_${PN}-glade = "${libdir}/glade3 \
-                     ${datadir}/glade3"
+FILES_${PN}-glade = " \
+    ${libdir}/glade \
+    ${libdir}/glade3 \
+    ${datadir}/glade \
+    ${datadir}/glade3 \
+"
 
 RDEPENDS_${PN}-gtk2 = "${PN}"
 RDEPENDS_${PN}-gtk3 = "${PN}"
-- 
2.20.1


