Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F76271D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so2953647wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eKlewiEmyo3BGXctqFnchQuCMdIAJU1/MNUQEVAN8UE=;
	b=Y9W4q2te7JpU3gkA9NMGJn/zyJ2iCPSkXgRUyeW2Vx9jI7E1UBIp+gcfvzAJxywirV
	WjHhuKC8W9bU6X6Sx2LrnXKhGjOy5+Gd1yfcKgnF0MUgyc54KzNkfSOMpfaxu2berR/X
	oR6B4TozWA/NvTgMz/cz4wUwSRAYnYThlJjYwHZ2AhZ8yx/a5hD4Q81eu+Al0PsgBjkL
	4viWyzPKZX/l0Y0k0LD0UMLgL7WA4FkvJzii2MNFP8UDEvzQEA+KbXkU7g7IStJuWl3Y
	mCgjE6kesm1N0Lyd97dQM9mDJhfEP30AVwWIKPg9FZw8XA9+2qRUVf9T1RI+kb8g91Ct
	q6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eKlewiEmyo3BGXctqFnchQuCMdIAJU1/MNUQEVAN8UE=;
	b=Hn56vIV8LSJl6UOnE7wVQWrC7Hq7xY+jc1AiBqmgwCDznRE0jrY6LRxPjuLZJhGK4X
	PzncwfYTQ3fccv/U3UgCZjA4Ac5fU0o+Uxs6kQeIqiGkiceYDVSmekiq38U0cRNpVP70
	BecGgts4H4xCPTHHuKEX7WssOMrWjjE+G4C5MUYh9r29MHc/RgNZtY+aKHT7Jt47RdXg
	nLKDi/Zh2M+JYg2sssvxW2ucv9UDiMPVpZXjflG2TtaGapUhlv8RLu1xbdMYGJ0yx42i
	YW7+cMXWIue/ox8ZkskRdqBm6yw19rOfn4Msao4X3ovMXGwifnSWbuko85kObT3arcgb
	Qy1A==
X-Gm-Message-State: AMke39mf5+Fm3nsWd5DJssAFtRu4k4krvgHhli4gHxozUCmqRt3XaTv2a1ZP2A+jAp9rvQ==
X-Received: by 10.28.107.84 with SMTP id g81mr714899wmc.123.1487804585904;
	Wed, 22 Feb 2017 15:03:05 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:41 +0100
Message-Id: <20170222230250.30288-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] libsdl2-mixer: add pkgconfig to inherit and unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
index 3080d59..8276b44 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e5
 
 S = "${WORKDIR}/SDL2_mixer-${PV}"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 EXTRA_AUTORECONF += "--include=acinclude"
 EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
@@ -25,5 +25,3 @@ do_configure_prepend () {
         rm -f acinclude/$i
     done
 }
-
-PNBLACKLIST[libsdl2-mixer] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130659/"
-- 
2.9.3


