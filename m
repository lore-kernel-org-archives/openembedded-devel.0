Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id A8DDF79291
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:12 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n11-v6so5176093wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8pKC3ze6gA8PW5Tj5D2peazwEKjseL+UOGir84tDpcw=;
	b=dNQbZ9nObh/+tnaMymiU+WyOtzIJKXwYlYejMcPLM6fS2jAQvqiK9AfpEFXQfsEFLI
	y3bGFNy8sDQoMrl6QqLdIxzzBm9Om+0ompjxfOfk1RA2y4kia7e/5CdtHZ4RWLQ/WSv0
	LEsUpoIhVYeCV6rMhNxRJeXN0eTeQDLhdBrtpccTeaRvAyrXz+/I/CYpxVIZY9wJubkh
	64CfpKAVmLTnNxc5ogaBsZ1/nywmsk/yKEQgMhQvjHva/nHvuH08PhNV6sLRNl3cg2Ke
	x62p3R71okTMFL5tyESaCKBi6Q1KHQygn5oPT/e9U0hAvELLkW1HHegf2UazvjdioRog
	n3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8pKC3ze6gA8PW5Tj5D2peazwEKjseL+UOGir84tDpcw=;
	b=eV7X+iaxmvwf64PbFE7TJ0+hNnwTaAP3Y2G2Qxft7jdEuvns5OSyedQ7G1lN9DAW1k
	Th8Ibml3TnObZWh8KZ445rAGneulsbdbuZv6YtgAgMSAZY+I/vlq5dmlfmRAK3AyHsLy
	lVs30XzECk4P4fM9WUY2vWk+cXMG2GoFPwALr3a/1yEtzCtA82TodJ4Po6RonlTG6RRX
	+QjGOlcYJYUGkwSthr8zqLbtLrBPbl757g4yIa0xmn/p5oosIDENph0afULSkjZQxdKJ
	RYKo3S9qEJVhlGMigb9sbZMEOlTLcSPBcd4kOjVpas6GoA2foILjlKw3k29SBYP+iWI2
	KSAA==
X-Gm-Message-State: AOUpUlFDbXVw84ZDpa+hKNwRAuF22VqAKYHExtikZmVgNhtz05bDMGQ5
	NeAuzyH7tGnhlVboRYhaSZ+LJq2s
X-Google-Smtp-Source: AA+uWPxleDCXepXdSnT5ld6nutiCZESD3gV1PqVf2+rRlH9hjUb16OHb3F2GGT/7r+CjBHbWCi58ZA==
X-Received: by 2002:a1c:ee15:: with SMTP id
	m21-v6mr16959426wmh.112.1534444093145; 
	Thu, 16 Aug 2018 11:28:13 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:48 +0200
Message-Id: <20180816182748.2400-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/16] libsdl2-image: upgrade 2.0.1 -> 2.0.3
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Licensse checksum was changed by update of copyright year

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libsdl/{libsdl2-image_2.0.1.bb => libsdl2-image_2.0.3.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.0.1.bb => libsdl2-image_2.0.3.bb} (80%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.3.bb
similarity index 80%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.1.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.3.bb
index 1f9c794c7..6deb352e6 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.3.bb
@@ -2,13 +2,13 @@ SUMMARY = "Simple DirectMedia Layer image library v2"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ec65b9778f5584a0bd8dfc17d6340ba0"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=a855a9eb5507fc556e672080c4b428ca"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[md5sum] = "d94b94555ba022fa249a53a021dc3606"
-SRC_URI[sha256sum] = "3a3eafbceea5125c04be585373bfd8b3a18f259bd7eae3efc4e6d8e60e0d7f64"
+SRC_URI[md5sum] = "c6baf6dfa80fa8a66853661a36a6034e"
+SRC_URI[sha256sum] = "3510c25da735ffcd8ce3b65073150ff4f7f9493b866e85b83738083b556d2368"
 
 S = "${WORKDIR}/SDL2_image-${PV}"
 
-- 
2.14.4


