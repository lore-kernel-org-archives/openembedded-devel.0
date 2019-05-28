Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7D92B6025E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 19:23:42 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h19so13060ljj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YsGtkuBmuwT7a8IJA9nW9oULvhAJWH0POA60pr2gMA0=;
	b=DIhqBH65yfyzKbQRTTvuYQBMlmXDqnK5T8Tzf5pslK2yMtIOVrp8eZ2gLGnU9r9B6o
	iO5pSg0yLQyr2cIfLx3xX2uRr1Yxhr07zt2qQDsZSXca0ItdeU4b8w96x4lVd3Mn/k9u
	giBv9LRGxjm6VPFeSXzqqO0Zg1wknsvuRk9zb+QzQv5bVs+Pdqe8IuWTsgmB2WExtyTr
	H9f7Ar+bPeoxSyc+a4F7qqAk67qXkDFeLw0JpJR4j+b5lZtYAekyggk9JEsRNVW86KiE
	KeTcLGzXHH6l/JVtKrVhw0x9b3s82qmE1PuvZjhA7tGn7oSzDaJMpQOtrjeYKGED+6BR
	NQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YsGtkuBmuwT7a8IJA9nW9oULvhAJWH0POA60pr2gMA0=;
	b=A8TrxOxdbyzpbgROaxpRcIaMiJm9fDgavHmHzcNgxmo8VfHuv0PYmWkypJpSdLUh/7
	Y60LZpJEXnIxnacbLB1hW3RZZ4PjCZFFFINuD9CapiwS82k6zwCECA7j1kFe7GkUvH7i
	8XE3ubwCUGH1K4mcGaAhKN8FowysusQmLnBmLuAsG5xvLtcgOknsh/Ajrq4peKxcvF9r
	d/R6OTKY0kl+0IazmABeeNaRNBZMKj5R4QvrunugTLFwG+O2aKB7M3x5xMcstHxB0wnP
	xY6GB0H8De4wzAagcJkt54xDH1/7g05ABq504esFtkqTu7WOsXc4XA2Ln2XWEMVHw/1Y
	vEjw==
X-Gm-Message-State: APjAAAWy+gVtnTwW/ezSUKO9RQePnz1E3lRMNcQc68U8wkyFNxaXxlOS
	JofTcZOq6Vk0d+kpzIkRXHn09r7TsfI=
X-Google-Smtp-Source: APXvYqzwE9il0oJrRQDa5CiO+BaRa6TiMGmDQsiThhqedcvnzm1uPHvCy/O8yaWKd7tg6U2vqAy9Zg==
X-Received: by 2002:a2e:6c0b:: with SMTP id h11mr30431003ljc.15.1559071422445; 
	Tue, 28 May 2019 12:23:42 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x27sm3110743ljm.52.2019.05.28.12.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 12:23:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 21:23:39 +0200
Message-Id: <20190528192339.4699-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] libp11: update to 0.4.10
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
X-List-Received-Date: Tue, 28 May 2019 19:23:42 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb}             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb} (80%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
similarity index 80%
rename from meta-oe/recipes-support/libp11/libp11_0.4.7.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.10.bb
index 87d99c1a6..c72df6d5e 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
@@ -2,14 +2,15 @@ SUMMARY = "Library for using PKCS"
 DESCRIPTION = "\
 Libp11 is a library implementing a small layer on top of PKCS \
 make using PKCS"
-HOMEPAGE = "http://www.opensc-project.org/libp11"
+HOMEPAGE = "https://github.com/OpenSC/libp11"
+BUGTRACKER = "https://github.com/OpenSC/libp11/issues"
 SECTION = "Development/Libraries"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "64569a391897bd29c5060b19fa4613e619e59277"
+SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


