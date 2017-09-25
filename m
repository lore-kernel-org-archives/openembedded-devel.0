Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0010C77EA8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 04:56:58 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i130so4286256pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Sep 2017 21:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QCIKqm5v2QS+GucQw+UenSgJQ0woSVraUkCOUoO+Qqk=;
	b=Zoz4Zkl8OIG68dmEyeICpPH5GjoWkATev8Pg5pSk+/96drcRTwphDZgkynVYQFgRgg
	TiNtUNMzyxv9xhXJYeHjQ5xqg78eD5hWFqw3fRfiD0JjFKhFze3GmKAIuaLrqssP8CSJ
	K7Cc5pVUCouvCDieqb9cVnJd1UtbFienANEB7Ey7JCr83vL8xWrTSZHDrzEv2tV5Hagy
	p+34ncN2NVf7LnC2d5Wv0b5my8WiQrNIHp9IgRmPhIKy9GfUYmsvRnF9+ysZVxM6Wlm8
	vzujBUFvw529IKBN4d6t5yK3JYaLqHnPWLAOqrnAX7yRjlC0ZQMyqpcRmk9HEpqciRpa
	u9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QCIKqm5v2QS+GucQw+UenSgJQ0woSVraUkCOUoO+Qqk=;
	b=Icjaw+K6+dPalCB73FH5ubjjAsdD8vD+1VjJKGgeH4J1xr63zo7Ri6TotVr2NmJBsJ
	mKbXxd5mqnqN6dAKqNkOr+wfXwe9lX1Uy56LXAhdgoJDDBPoTrpI2sHNhpsga2bWwWTL
	SehFoYQI8g+NLE2nBpUZaWwNhRfG+Cfc35dZK+e6pJE/dPbCybdRy7EnCdXxJYlsJM7j
	pC/0q97arCKI9grBkBexrFzmu15jZARMsmcl+bkHpaWP0KATliNgoETiystUQjcQn1Dt
	8jdu60TUH5+w09vgaHOOlTjQw0N6YH2Pad71NqNwY3dFBfSIei5kVwOsacR9p0b6Qylu
	0NFQ==
X-Gm-Message-State: AHPjjUg7nSY+5E4W4IFdgV9UM6d9w7U/H5z1T8qCkN/oKaP5tUygFi0T
	rta8w/EcyRVCmV0pOhTqFMq2Vw==
X-Google-Smtp-Source: AOwi7QAdAhIq8FD2/JhGy7FFv3l38eoutTBZ5S5wbjcm7HcXMDdsUAlVoQMUZZcPvBmaHxOhlOg4rQ==
X-Received: by 10.98.245.8 with SMTP id n8mr6470543pfh.108.1506315419797;
	Sun, 24 Sep 2017 21:56:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::b736])
	by smtp.gmail.com with ESMTPSA id
	p127sm8863496pfp.168.2017.09.24.21.56.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Sep 2017 21:56:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Sep 2017 21:56:49 -0700
Message-Id: <20170925045651.32107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/3] protobuf: Upgrade to 3.4.1
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
X-List-Received-Date: Mon, 25 Sep 2017 04:56:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../protobuf/{protobuf_3.4.0.bb => protobuf_3.4.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.4.0.bb => protobuf_3.4.1.bb} (92%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
similarity index 92%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
index 39108ddd2..fae7c18a1 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
@@ -14,9 +14,9 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
-SRCREV = "80a37e0782d2d702d52234b62dd4b9ec74fd2c95"
+SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
 
-PV = "3.4.0+git${SRCPV}"
+PV = "3.4.1+git${SRCPV}"
 
 SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
 
-- 
2.14.1


