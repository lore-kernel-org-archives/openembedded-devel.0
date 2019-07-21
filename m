Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7328A7EEBE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:33 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id m30so16209080pff.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=okFvScxrjcARuf2SKlQ3mpkKkonqJybUhKdb1VzbDeY=;
	b=XKdcvRQjg/+7wG/WumxsrKvVozzFkj7Kt23A4vymcpIzdqDOUNDZsFVRfO56iDus/A
	eG38ORkKTWTCISwHDUSX07zlNsk1iF5QGM82kJYoYT5fbZD+01EZNZXZNKO34S49HWPU
	kg2u60vwAgTN/oyloUkAwk/3hqvsElfd9VPv87FtQSXgHvRsQRwX4GcPttp7SlxW57NA
	GdqKeRmyC1b12IxlNb9mNUWMlqmbbbROnwyK7OMpt7qC2C9tDOjFKhlilIGHO7akKoJl
	IZEj+eRYSphlGQnBqA48t4EjhCc3ba8/EKDOlCmIbgCcb1oPtyrpb0u9V47yec6IP8tT
	BV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=okFvScxrjcARuf2SKlQ3mpkKkonqJybUhKdb1VzbDeY=;
	b=ER19moxGogQJXZpNqB1pDXWsw1Q4GNzdXyq1vktzfrNzzAv569UG6oKwqQeeHNINz7
	9M6PtS6JS7RwDlRD68gEAv/+2fsd/veO5I592IGYMugIIU918TLK86nPzbJ4EhfHd9tI
	IgLn1nROc4W+OZatPB3YLGP5aVH4J/uRZHPgRArnOFZ+OoopIY568dPXW+lVHXL5UGtV
	9rpFGxnG/ucjyIoH4HjyfCVOcD0f/PUZSBGIJbhBjgXO4iXpUYM8sP4NoGlpugZA+v+D
	pkhZOXPU9EEacCAJXUzI7vowOOWbDJpnnSTq3VstZwtr3twgq+rxwIJA+Xp9szVLxzzR
	Foow==
X-Gm-Message-State: APjAAAVNl3ZIxZPJZS9QkAT3xK3h9sfICHXG35u64p5eXTVxaxegvdXM
	8DeRsPv4qmecdPn1sDZRfBB56E6D75k=
X-Google-Smtp-Source: APXvYqxNwjHz+GKGem5jORvfYluzir+E1/W5JTjt1gIz3M31F9tJLTCqiOmypvu+tAyORCkjVGbT4A==
X-Received: by 2002:a65:6846:: with SMTP id q6mr28388155pgt.150.1563727174155; 
	Sun, 21 Jul 2019 09:39:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:12 -0700
Message-Id: <20190721163919.32659-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/14] mpv: Switch to using git fetcher
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:33 -0000
Content-Transfer-Encoding: 8bit

github tarballs are unreliable, fixes

SRC_URI uses unstable GitHub archives [src-uri-bad]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index 6586e352ea..d334956a8f 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -14,15 +14,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
 # While this item does not require it, it depends on ffmpeg which does
 LICENSE_FLAGS = "commercial"
 
+SRCREV_mpv = "4db82f04502cbcd20d9a975df9dfde91d8c389e3"
 SRC_URI = " \
-    https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
-    http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;downloadfilename=waf;subdir=${BPN}-${PV} \
+    git://github.com/mpv-player/mpv;name=mpv \
+    http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;downloadfilename=waf;subdir=git \
 "
-SRC_URI[mpv.md5sum] = "038d0b660de07ff645ad6a741704ecab"
-SRC_URI[mpv.sha256sum] = "daf3ef358d5f260f2269f7caabce27f446c291457ec330077152127133b71b46"
 SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
 SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
 
+S = "${WORKDIR}/git"
+
 inherit waf pkgconfig pythonnative distro_features_check
 
 LUA ?= "lua"
-- 
2.22.0


