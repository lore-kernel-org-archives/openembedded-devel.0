Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21C0E7719C
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 23:29:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.7156.1736465392027500010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 15:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0+vGAHX;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21619108a6bso24495055ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 15:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736465391; x=1737070191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPODMQoOd8afuJn6Efv8ZEdW79+XW3zLMzfA8t2U+so=;
        b=l0+vGAHXDrZstJ5GMckRxCLGXAXSNiaANsTnl0lILt2zPz/edCoMwRXf3t8ob7zi1C
         5GJNTNPnWsYtDzkbDskX5qitGzvUQtRPuxDWrWuEZjyJuLv9KXzbVaIms3L944a1m5kG
         h5TaoUlIbB0PlgwB9C+CppzsAN0qin/tP+bbgHCFE5nmaydTW1zU5+FovIsWBFYhPJR7
         2DlOi2H8YCF/lJsy5ySoVessfcOSEiBYgIqOOY2YMa2nf/uTRiqC8BRxaY249NyAvMo8
         UMKUhnAHmm1rOzJ6n9Vynh58zqkFg3xlchv6Zw4aam3xfTM88t/1klSFy2rfWXjxQ1JI
         vBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465391; x=1737070191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPODMQoOd8afuJn6Efv8ZEdW79+XW3zLMzfA8t2U+so=;
        b=B/sVc4QwDybHbO+ldlZ9v8Q1QRdB2rAttfJutd80CE7/8+Y+PC7UYqgAjgTMcQjnkP
         xxUUra4U2CNod8xL7eUoow7pEoDCTngSe/QkDa35g5nPLcDi0QeeClgrzyh7B2yI8kJp
         Y8N/qXG0O4n+pDhdlHCCN9BP2ymFnC5gKv8c4UvOrJzyrockdBMImTvIN2AHiWJnE4r1
         Yu8Pi4Jcr0ErzT4QTBOsuvYfFz0ETIkNS6mhmPyoegbK1tLOmPsLy3KWoGNWxpTxZFMy
         4LUMPrABJJOogjMPbxrA5AlUj1syDIM4S9tPejRIuW/c7NK/R7Ev5FaSKPT1oHGZVtDa
         QZSA==
X-Gm-Message-State: AOJu0Yw9Bj/oY7FWnVKSoFe0KJUmGn+Kj7kL/Dfoq95vQOJ+AHHRoFVr
	5+BQz6i/grjYq5Lpxv40kiBx9bRppBqR2Kw6B6SUS8gRQHJXio/1hOt86uwV
X-Gm-Gg: ASbGncug+nSZuK87+o80gI0bPtPUbV/mCI1zGZuI9aZWZxcr4qDyLzCwuc+iLLPfI1w
	lArkqOq38gcA1totPPdQjGWNcoy6T6umBB9Cdt2PzDVoiFDpbb6jQXrmvn64ZJoJzwDvi0Knvkg
	O38D1vA4kLb3XpXA4YlpVLox/sEQwtkMG39sALScN3vQyodDJS5RvS/3IMdLJ8RfInteCbtH0Dg
	y0KgEr9POXV5Pql7B8Fgx6Y6p1+yk0qmKhg60/EZ8BvZnfs
X-Google-Smtp-Source: AGHT+IE1MiZoWqP5Qsb5HUl2SOBYFOhr0CEgep1aSu50dRdcplUm6pfMAF1WwPSGsIYBI85GeAnZ9Q==
X-Received: by 2002:a05:6a21:7905:b0:1e8:a14a:7b67 with SMTP id adf61e73a8af0-1e8a14a7e5dmr5785613637.26.1736465391097;
        Thu, 09 Jan 2025 15:29:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::1344])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d6a0b140sm1804500a12.60.2025.01.09.15.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:29:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/6] mpd: Use meson wrap for fmt
Date: Thu,  9 Jan 2025 15:29:43 -0800
Message-ID: <20250109232946.1556083-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109232946.1556083-1-raj.khem@gmail.com>
References: <20250109232946.1556083-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 23:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114759

mpd still depends on fmt 11.0.x and oe-core has moved to 11.1.x
until mpd is ported to use it, lets fall back to what mpd works with
instead of using system provided fmt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
index 4d854d6fc5..51c459cffd 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
@@ -15,14 +15,18 @@ DEPENDS += " \
     icu \
     dbus \
     expat \
-    fmt \
 "
 
 PV .= "+git"
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
+           https://github.com/mesonbuild/wrapdb/releases/download/fmt_11.0.2-1/fmt-11.0.2.tar.gz;name=fmt;subdir=git/subprojects \
+           https://wrapdb.mesonbuild.com/v2/fmt_11.0.2-1/get_patch;downloadfilename=fmt_11.0.2-1_patch.zip;name=fmt-meson;subdir=git/subprojects \
            file://mpd.conf.in \
            "
 SRCREV = "b5bd294e5c88c062b1a9c0c4c60397fbf7f3f1c5"
+SRC_URI[fmt.sha256sum] = "6cb1e6d37bdcb756dbbe59be438790db409cdb4868c66e888d5df9f13f7c027f"
+SRC_URI[fmt-meson.sha256sum] = "90c9e3b8e8f29713d40ca949f6f93ad115d78d7fb921064112bc6179e6427c5e"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \

