Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA7C55181
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13742.1785620753301054592
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SjlW544T;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1291119a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620753; x=1786225553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNBrku9AZgqOokEaZA0chzuH+J4gN6d0A8uD6jYWuIE=;
        b=SjlW544TgP2ShZ/zRocoLMG+kddiaLZamkgFOn2COQPKrUpJWMzmKVjVdyiz3juSDz
         2W4uqSED9NZl800LFpYwP1U2JRxQI7j9spGkBqPziC+GOc5QZJuzDVibFbG8aFlf4rh+
         WeUVon99xoN+9Xq/LsOUmM2oCjkCutHzqIHU8p8q456s31NIZ4ovUUEyna5qtAPZ73OJ
         oXy9zX3hUQGZKfLDiTwsIIXQyrnZrvEYis+fVH0GIe1KP2nXsmwmPl2AUM0C6z4XODq+
         syYp3TFCHOm+jvgEMV8DNvCBW+Id/Db08FzJI9DRfIp+P4g78jDo0MAMLSYLVRACQCDN
         rhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620753; x=1786225553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNBrku9AZgqOokEaZA0chzuH+J4gN6d0A8uD6jYWuIE=;
        b=Gst9umHDmCnoxunUkCGgKYwplq0VRbBIiD1jQCdkffp2c8UAHWdlUwlaLBAzo70cUY
         AeeTEtrNTV/x0H2G/QFEwULRYNkxl/mTvNtpDDBJzZGI87oGrfCqk8XaO58jt7y0G6uP
         lewrxiy7A99Dx7BSla1J9lhNQLNgAVVucZ6m8QqfnISCAVY5ebDnTdkjisOkfy3bTuBA
         1FIFqzu+tl5RB0eSUFFrjL7DPuM5ntLwcLeS0cLkv7aHeK5hbmTYG7a1HjTbt2vlsofD
         5/EkqyQ7FR16UkcxnIfG5d23R6g6h8k7P5oC2OJE4+k9rH+YcjR+jljjj9HkxZqr2lkx
         /Mhg==
X-Gm-Message-State: AOJu0YyOWj50BJe6AjwpK0bK7y1gtptXJLgueknH3E+N1RyX3/r4ixL3
	REQgWU1osSfkktJp6t1ZMZxYgM7VBV+urQVGxKgsEtHVi+3REkq7Gk6GhpjUoeo1
X-Gm-Gg: AR+sD13mcB20BI4XzrqIwsNnW0A4qPNBHHsGOfN9kO4E2W80h13KyEx263c+Mr2eGZ6
	IB8HHw4qBAqJqwkjpJGVrJX4HQZ9DcwFw7b/8jqMEyIj9dX2Ed58/5hBVZ9Ef5uCEZ80fUrJjt7
	2KNpQG/Uay2X+/25cmqEbP5PziP9w2FEjV4OI3PboaYSAgSboJK303UMjvQx4pzqxlticcq/bR9
	zCcL+F2WBDBkDh1V5PUd16FibgZ01vwsh8bKkDKW4RDtPp1Mhg1HH7N8dYQcjTaeJIRyJEnVH/L
	i4WMnDG/KCruIAUeqWp+Ui5kLAdkRQpQ4yrPouqTGL0lNA9VGT6v4L7V/SVv2S6vHJ8HfABh6kf
	eHyINzlHB2odRVg3uKHTht5eIaMKRQ3XjiIgNpe2j6An2NjCY0hWAd3iZ511YjCiWvCFpBY8YUR
	L8or2zHlKPeiMzATxDxPII9huJiTCAkmKf6NsJ7BI+bw+Ffj+QOho/9L8+tpVjhojhoNo+K2iiM
	gzVxAcBpu7xw/OnQGHs2DNeAlEjOw8cCedSz77RSfNtyRVMqaAMpDh10w/pGdC0mcJtnL9J8r8d
	N3sgPYBVY9wQtLnB6A+Wd4XRTs4ka77ZPVLVDkMw6DO+U98x7ramGmy16X44Y4qWyZEvEVYhkeW
	vMg==
X-Received: by 2002:a05:6a21:6e46:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c91a972ec7mr7055786637.26.1785620752622;
        Sat, 01 Aug 2026 14:45:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 24/31] gerbera: upgrade 3.0.0 -> 3.2.1
Date: Sat,  1 Aug 2026 14:45:19 -0700
Message-ID: <20260801214526.788343-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128641

Upstream changes (release notes):
 * 3.1.0/3.1.1: assorted fixes and code improvements (docker startup
   under the default user, dependency maximum-version bumps).
 * 3.2.0: resolve a long-standing transcoding/error-return issue with
   libpupnp after dropping the old MediaTomb UPnP hack; allow splitting
   config.xml at any section; export/reimport web-UI entries around a
   database clear; many new import/runtime configuration entries.
 * 3.2.1: fix MySQL/PostgreSQL database migration and init with
   ffmpegthumbnailer disabled; raise supported pupnp (1.18.3) and
   jsoncpp (1.9.7) maximums.

New build dependencies in 3.2.x:
 * cxxopts is now required (find_package(cxxopts 3.2.0 REQUIRED)); add it
   to DEPENDS (provided by meta-oe).
 * A new WITH_ZIP option (default ON) pulls in libzippp and libzip for
   "package download". Neither is packaged here, so add a PACKAGECONFIG
   [zip] knob left disabled by default (-DWITH_ZIP=FALSE), matching 3.0.0
   behaviour.

The two local build patches (fmt 12 include fix, <cstring> include) still
apply and are retained.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gerbera/{gerbera_3.0.0.bb => gerbera_3.2.1.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_3.0.0.bb => gerbera_3.2.1.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.2.1.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_3.2.1.bb
index a08c31d0c2..8ae899d3ec 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.2.1.bb
@@ -7,10 +7,10 @@ SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master;tag
            file://0001-fix-build-against-fmt-12-include-fmt-format.h.patch \
            file://0002-include-cstring-for-std-strerror-std-memcpy.patch \
            "
-SRCREV = "7846f3dd5d0f848a60d0c3146c3b7290881a8992"
+SRCREV = "a6a2bb2991d197a52755a488fc943566d654d3bd"
 
 
-DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2 icu jsoncpp"
+DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2 icu jsoncpp cxxopts"
 
 SYSTEMD_SERVICE:${PN} = "gerbera.service"
 
@@ -28,5 +28,6 @@ PACKAGECONFIG[exiv2] = "-DWITH_EXIV2=TRUE,-DWITH_EXIV2=FALSE,exiv2"
 PACKAGECONFIG[matroska] = "-DWITH_MATROSKA=TRUE,-DWITH_MATROSKA=FALSE,libebml libmatroska"
 PACKAGECONFIG[magic] = "-DWITH_MAGIC=TRUE,-DWITH_MAGIC=FALSE,file"
 PACKAGECONFIG[js] = "-DWITH_JS=TRUE,-DWITH_JS=FALSE,duktape"
+PACKAGECONFIG[zip] = "-DWITH_ZIP=TRUE,-DWITH_ZIP=FALSE,libzippp libzip"
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"

