Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D230AD3B989
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:36:03 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12116.1765298159172334588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 08:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hTZSAqgM;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2e2eccd2so3806397f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765298157; x=1765902957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C8FuVw/bSUpVmCSFijVPwMTSi9P6CZZ3TGvwwqOuH4=;
        b=hTZSAqgM2kEHd6bsqvKtOmEWPGP5xNErJACE3cMInEVYNQR45i5kpmetF4qBe39cU+
         TSniL8RYt5fNhr8hnYjLQ7awh60+cuB+ySrLefTh9MagIOmVzLGC+mHcXYLfztveccT0
         knXKBRo3aXxewwEolQ3PDfW5ZLdgBi+VJzOrwEISqUwY261HJbNlu4G6gjPzEPJnls4I
         vH74PV4NkFa0ORsfb9NruaM+XAoWpAzLH69hLeiVU2tOQyLMMUcoWxPHPtD+zZQz1qUV
         7+jbhAjwndmDNXshPa5gPxNywzkmRGGMoyJQMP7TRTqjbKGXv1AbMMsDuG+6QSgm8fgi
         Ss8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765298157; x=1765902957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+C8FuVw/bSUpVmCSFijVPwMTSi9P6CZZ3TGvwwqOuH4=;
        b=UrZeI0isn5MCN1MMq+FORUsDesKzYLkFMklnrlYVjLvvXigh7tG9ISQJl5Z2AAXaNC
         hbGANr0ZoYVTbzPsexcJaZTtwwu/NUzH3yUZB8vR492qk327DIO0DTxjDsMOzV2e+fTe
         2faoBwrirSCZzl2gj05dybX90HvsIAF0Fq7QdJX/46Rzxtms3aFoWzT2LYwhWIn3OzZo
         BMHQ4PlalDQ8+sR5q0YOv7UsNnnzWDLKEmOtvalYmq0Ce1uthaDHlNgLiUo/emmJfSly
         gQz5NkmQeKkYgankMTiaJ8yyZN6DfS6GeH71soppeKjJEtBB0D/OOx6n8VTAInB9fTCY
         zRcQ==
X-Gm-Message-State: AOJu0Yxwwilb4+onDb45qFMk+VgU7Ha0jdXexHv6ODap/RrL74YER0Dc
	rtEBo8A0jLbSeDoipi4Mjxj7T0i+Vz4tTd6sXsHfENNxJnNoUl+ZDiLW0aPX3g==
X-Gm-Gg: AY/fxX6X3vmmzPpETzNCNOaoqgGl6YHsmNs2Okyc295bSKG64Y/nzFOvfl2hOCZqJ3a
	8uRV4Kv2ugeCAHrLppAjOBULVE3Gwn2+cJw8S2drU9DabRv/9O/lBDZpXolY1aNZGLX0QH34mdo
	On2qKQkeLJdMhAJfc9d2zzzPxrYvcSX4ijfPZdN0q5vVib6C0NGjtjBFh1W1veXOkNxWtPn++Oo
	n99SvwK0nXFtGzleb/2p4HM139h8jxUlHquQO7TNG/jPgPY1X7cgUtCz8Mo6LKUrL30AvuccY62
	npFMJB8W+1kgBF+vBQ5JONBQDpOWyHrK5VkQ3IMwuQ/kwe8hvczWIA3HuUPQRGVHx5wKUYIBzVX
	HhGvAM3dx8iR0gCpH7/zD6xAbSTCHmC3jxEcnKITdC1hiLcTlvomRab4sp53peZDOp77U9qCywN
	ln4TDFqrTH
X-Google-Smtp-Source: AGHT+IHGKspTof6NAGf7O/imK9+689vp8feKJWvc8Nz9KIMUkB6tjvxL4NuRHv0t6bIs4ReqBwDE0A==
X-Received: by 2002:a5d:5d03:0:b0:3e8:9e32:38f8 with SMTP id ffacd0b85a97d-42f89f28575mr11539541f8f.14.1765298157454;
        Tue, 09 Dec 2025 08:35:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff352sm33030154f8f.17.2025.12.09.08.35.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:35:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 4/4] dleyna-server: drop recipe
Date: Tue,  9 Dec 2025 17:35:52 +0100
Message-ID: <20251209163552.1419590-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209163552.1419590-1-skandigraun@gmail.com>
References: <20251209163552.1419590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 16:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122470

The recipe has been disabled for over two years, due to the application
being an abandonware, and it fails to compile with new versions of its dependencies.

There are no signs from upstream that it would be revived (repository
has been archived 4 years ago).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dleyna/dleyna-server_0.6.0.bb             | 23 -------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
deleted file mode 100644
index d60abd2082..0000000000
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "DLNA server libraries"
-DESCRIPTION = "dleyna-server is a library for implementing services that \
-allow clients to discover, browse and manipulate Digital Media Servers. \
-An implementation of such a service for linux is also included."
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://libdleyna/server/server.c;endline=22;md5=437455d8aeff69ebd0996a76c67397bb"
-
-DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 libxml2 dleyna-core"
-RDEPENDS:${PN} = "dleyna-connector-dbus"
-
-PV .= "+git"
-SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
-SRCREV = "eb895ae82715e9889a948ffa810c0f828b4f4c76"
-
-inherit autotools pkgconfig
-
-FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
-
-SKIP_RECIPE[dleyna-server] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"

