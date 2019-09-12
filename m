Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 551267E5F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:48:45 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id a4so25182769ljk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=oySq+XvIij1pV306TxORhQZjauXzOuMzKd1jCMNUJ6M=;
	b=O0ePYegXesA75Jxc8nQEjJpy1Rb0EKsflmHTDurVvD3JJ7Llt+woG/794p0O0Cyb1p
	Rgj/CR7EGoy5ajakf7yOnHx5lR5az0iW06VBzC5IQNwMKAH+tTJNEaW+xsukgW3RMOLR
	9RLYoirS0tpIxjWZ1j/hFwmF9ubkd++4LbjmLvW84pCM9lgNdMOnoZ5+9uDPiEmnl8PI
	D5sUDe1OL5Kmrwj+20pSUe3iQV2z2Nf6fAb6a72TqzFGnCwCp4HbGv0xojAHj3B0slmk
	i5jFduKr/xjzEO7kJaared7ifTqkB9B0yEcbwmSsG+OQ/lpGY5aiJKHDNmVsdb11HRZs
	JneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oySq+XvIij1pV306TxORhQZjauXzOuMzKd1jCMNUJ6M=;
	b=XW9c1zVM8ZakRkAJAwfG0IlMJ8rhDYG4+wdz9oeqVG6UhXrWcB5M3pIa97mUe5zU/O
	ULlIAClCUWBXCBFzcX19k/ny9twtAR1On9q+pIblJF8wN1X+6o/BFgw4Beyo5MUAtw7h
	qjyirdVR6AEiA7V0t672EQ3PQYMscy33E55YDoouvwSieMpGF2xjz+uhDl/SkPEGEe1J
	eTkW3MqbufVz4tSyrmDgyR12RYX7RNyGO0l7wHtkaMh925+Z1srRcRrKXkt5klLRkidV
	9o2nBHmCCiuMwIwvkvgrsOqUPSdRTBhVpwdHG52L09x5LtAf5AzZ9WkwSA42CPaBQyAw
	VxiQ==
X-Gm-Message-State: APjAAAVJEA3KQr5xJL+m3gnJbj+4BOEANUs2BTV0PF9jYDh0sh2pZfYS
	6qQj4dQWh4Pr6lC4jwxuxashmXZi7dY=
X-Google-Smtp-Source: APXvYqx0dGY7n13AfjDKLYXhD+VnYfxRNnFcirfd5kTZjr2jW5vnRGwSe5fVzJznF4Fu7+ORQRUh0A==
X-Received: by 2002:a2e:8649:: with SMTP id i9mr5845732ljj.97.1568328525681;
	Thu, 12 Sep 2019 15:48:45 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	d12sm6584144lfn.93.2019.09.12.15.48.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:48:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:48:41 +0200
Message-Id: <20190912224841.12756-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] xcursorgen: update to 1.0.7
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
X-List-Received-Date: Thu, 12 Sep 2019 22:48:45 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xcursorgen/{xcursorgen_1.0.5.bb => xcursorgen_1.0.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xcursorgen/{xcursorgen_1.0.5.bb => xcursorgen_1.0.7.bb} (69%)

diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
similarity index 69%
rename from meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
rename to meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
index a21dc42a9..3f4bfaaf1 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd1fb9ee90eead85f7b171807b3ab4f2"
 DEPENDS = "libpng libxcursor"
 
 SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "09f56978a62854534deacc8aa8ff3031"
-SRC_URI[sha256sum] = "bc7171a0fa212da866fca2301241630e2009aea8c4ddb75f21b51a31c2e4c581"
+SRC_URI[md5sum] = "25cc7ca1ce5dcbb61c2b471c55e686b5"
+SRC_URI[sha256sum] = "35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d"
 
 inherit distro_features_check autotools pkgconfig
 
-- 
2.17.1


