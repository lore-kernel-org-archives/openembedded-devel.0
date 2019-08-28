Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 82D3B7F2AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:54:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y135so691281wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LFnwUs0XXCM16j//TimroJUfPkXHqRicXgydoC3qg9M=;
	b=BskKhDOdkEmqpmaWlve50n8qeOR7u+hYTv7gtgtl5qWc79y6QZgUQe/bKCnlfZP6QT
	/+0eBEsoMlaaOlKrWHRhN4Q7G2pZHDceALfJTWzbIh/vDxhRq76lO88fGqVMphYGjZhK
	gJYc/CZTVTsUolOBxRZNo2QTwyRk5mhk+mF1x80XX55aYnZ9jjX4TmL2QLStG5DsW8lj
	ZC6ydsN7kw6IqqbzQWzkA5+G+F1eGqP287vdS0TBFkkZnImi4FTOF+QaTJQYF7z5xUUZ
	s2ZPDIHnkEaNDLLSB6I8Fsul1QwiqlLEO3U0SDNUfGGy8j8pH2yAkhjUC3PrVe2HsR3Z
	BROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LFnwUs0XXCM16j//TimroJUfPkXHqRicXgydoC3qg9M=;
	b=QmKiE3TWXExmyQVcilteZVN9ATwVDGa8pcU5iRzNFyA8z2CwoCBd9a4l4wsllAiUsX
	QNgQy0u3ap+FtWlQdmnhDvAMXBjhAQD/0itItKTJVVWB/ofTg9Au8GzxOTnpb1Alz9MY
	YDL4C3b8+t7x0cPC/PbPdxj6GTXB2xmpoa8CXbYT5QxLasymRMircF4e+11TZUNpHkt+
	EETUHp+AWc/zRZPKT2bXCh7Av9QwfedQNciceGlHyBhJYQJWoJuwyJZB7W//jB6gUi/3
	eMPTB3btmNWSLOYG+meBY0DnqHUku9n0IJwiqfTMHIGkqiQe0Gyw+wmRmdh/a/66GkuH
	qP9g==
X-Gm-Message-State: APjAAAVju8GDQwBOLYUvYZpZ51aFG7sT0JpPN6rpBKCBk2xo+EPu7XAy
	zYmAA5axVWQARSrHFIaPpUpSVBNk
X-Google-Smtp-Source: APXvYqz33DVbSNmBEMQbce7tFJq2eCit5Y8rTlNOuI6uB2sqCUnjZsCfnHaH4jZSB4rYeKeuWCEPMQ==
X-Received: by 2002:a1c:9855:: with SMTP id a82mr6957266wme.134.1567032879785; 
	Wed, 28 Aug 2019 15:54:39 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F43161224192BDF21814B6B.dip0.t-ipconnect.de.
	[2003:f0:7f43:1612:2419:2bdf:2181:4b6b])
	by smtp.gmail.com with ESMTPSA id a7sm1095886wra.43.2019.08.28.15.54.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 15:54:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 00:54:26 +0200
Message-Id: <20190828225428.15322-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/3] libsigc++-2.0: upgrade 2.10.1 -> 2.10.2
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
X-List-Received-Date: Wed, 28 Aug 2019 22:54:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove unneeded EXTRA_AUTORECONF

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libsigc++-2.0_2.10.1.bb => libsigc++-2.0_2.10.2.bb}    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.1.bb => libsigc++-2.0_2.10.2.bb} (72%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.1.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.2.bb
similarity index 72%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.1.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.2.bb
index 62054a116..0e5b9ceeb 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.1.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.2.bb
@@ -6,15 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.10/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "549cffbdb72fa105b782756f2713ffc7"
-SRC_URI[sha256sum] = "c9a25f26178c6cbb147f9904d8c533b5a5c5111a41ac2eb781eb734eea446003"
+SRC_URI[md5sum] = "1b067bfae0b502e6a5127336cb09d2dd"
+SRC_URI[sha256sum] = "b1ca0253379596f9c19f070c83d362b12dfd39c0a3ea1dd813e8e21c1a097a98"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
 inherit autotools
 
-EXTRA_AUTORECONF = "--exclude=autoheader"
-
 FILES_${PN}-dev += "${libdir}/sigc++-*/"
 FILES_${PN}-doc += "${datadir}/devhelp"
 
-- 
2.21.0


