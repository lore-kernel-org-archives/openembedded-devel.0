Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C35A57FBAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 05:18:31 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d13so3895471pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 21:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+t2I0MRfckF+w/zuKs5WJaUZn6NshR5GBHUdMw6h0+U=;
	b=BICVEboRLJ7r+NuFewmWYef0NB2tFtuhuGd3JRWoxigzLeGy+snjd5iyM6Jl8F4mox
	im0XZHmkC9XJb4aeR5FfP0EcNRJqNzr1Qb8MZKP7V/TNu2qyWJTLWTOFnOF24rSnKVrk
	5uGdnvQytuSsgdmZ0II/+Du/IqZEhJ26QSTrfPnEjw9IVqj3nkkyjeI+gIpMx2Vu19ej
	ZI6+OfTF0aKepT2mW4xxnCwsclUU2GZit/kKpMDSYoPAjE/tVto8aF9G8//IdFT3tzGu
	flIzZzZY3WOzQPBQ4uAoDnWe5NCCS3+h9yc05Vqr2Bd1HWk8+1y6XCFVYNoEVs4OVObK
	4Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+t2I0MRfckF+w/zuKs5WJaUZn6NshR5GBHUdMw6h0+U=;
	b=kiN9am+SPyZiUEh0MUK+W9dtxSfZN0yO07q30bVf2ORrzSu1usKo88LkXqhe80DAQ+
	7yz/6uTSh2J//Ow3j5yzIsun28R9YyYMwPCxw23WUBlOWS7r88CduTl7i3I2DIEjM5Wd
	VlknCAdPnlIwKOuTRBIpS3CaI8ULiOnoPreSU7r7ehHnWBk++Wv8eQIcAFGH40hTDEM5
	j1MTGI8ML0Lal3MJv7X324lF/9vfr98M7vXBbwPcC5dLNMEUqIX+HsC+LYdkgPhemjvB
	3PgEEdU5KCkif3zp77nu5vyFNcEr657LTpcscubg33cyAYeDZrAKI1XdAFb0fmajsKxv
	SFEw==
X-Gm-Message-State: APjAAAXvu9tE06Zc5s7lwel1K6F/TDmOjSuYBCfJIA9Xnh9LTA/cdUwt
	+G73fKeseam9KjsS2Kd3wBNLZU/0AX4=
X-Google-Smtp-Source: APXvYqxSaefvITv6YMR0B8cebQeLOrTLmVW5ibuxl53dzi9aSwo+D0RU98Yj7ZOYkO8PqRZ92eZkBQ==
X-Received: by 2002:a62:6458:: with SMTP id y85mr9346702pfb.133.1573190312311; 
	Thu, 07 Nov 2019 21:18:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	o15sm6723119pgn.49.2019.11.07.21.18.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 21:18:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:18:14 -0800
Message-Id: <20191108051814.4143267-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gtkwave: Upgrade to 3.3.102
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
X-List-Received-Date: Fri, 08 Nov 2019 05:18:32 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gtkwave/{gtkwave_3.3.98.bb => gtkwave_3.3.102.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.98.bb => gtkwave_3.3.102.bb} (85%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb
similarity index 85%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb
index 310c410674..a2f946398b 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
-SRC_URI[sha256sum] = "efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
+SRC_URI[md5sum] = "13da7d4235d4031fde52971830458850"
+SRC_URI[sha256sum] = "80bb7cb92db45872209f4ca48fc95a0460e0d89b0fe0c310c836d9b04c77fec7"
 
 inherit pkgconfig autotools gettext texinfo
 DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
-- 
2.24.0


