Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0650CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 06:35:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.9546.1760510148330767874
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 23:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EbOlNqcI;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-28832ad6f64so69651555ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760510147; x=1761114947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkiAcW8ICvJ0AJQuIW9Ae78rLK4/kaYkxrdeLu0xPbc=;
        b=EbOlNqcIEDvYzJbUYWdM7GoLYGXp2uZgiitdXbAMNT8A3kJro+2v9ehlkTlXkibwO8
         NS1IsH+/taiMpRFHXRIujwo8oWIw5L0YFg4c9sUH6Od1nkEXNbLgRnUrkrsdD3HTwvJ+
         HP6l4cTZPmSekcWRwTXadLcQAlYBHI8c4tXN8ire5TWg2OsYHiAUuIhT+HHUdFuv4dXG
         F8bqOWc7y7rMhHbdqNSRLWYB0D3fstrHhJ0PJacsvWsr7h3LT3V1nBZWXZYmwWAeiVAH
         m6jtszamd6F3vhbZ4pL6ripuRCL+DaNRIfscPrw9NRTZLusS0sU52jinGrDhGLRKP4mt
         /chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760510147; x=1761114947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkiAcW8ICvJ0AJQuIW9Ae78rLK4/kaYkxrdeLu0xPbc=;
        b=ao22BVz5fgHpGTs7laQhUn+T1fGAK30PPM5x/SLEtvhlMLLSK8AQnXHUM1SBEkkBoz
         5RrSeW9d0LYcCfXi+2zBIAyzb+hEAmrIVwBSkEwvkbkDhy5nOotmfdUKqWFzYa83q7/J
         P8zLvtUoBImvfuJUFkgFT9v3J5UhG53NOXHYbFMgUKT/tAtbpTnsQ2OVigtDoMhLKhxA
         NEKpuC5p+UuB6Z8F0zoyuS23qzPSYJL7UBxKqlL24v8hzAjl7JrQQLYi4idskZPNARFd
         H1xNnkbyZMbqhtPOkM6HZh4RO/yi8yeiHkK3HDej6fmqyrBxiOVqh0c73YR/a8wEI7Dg
         GXyg==
X-Gm-Message-State: AOJu0YzNgMW0bCwZIO4F5fJVFoK3QinwSoZzRmqRt8UNfKsLHQsn1+sw
	7yhbDUUyrNPR41Vx0Kp/B+aBwX8nHmA4qP2sa7XkQeO9+hHCiq7HL2i6xPqCqg==
X-Gm-Gg: ASbGncuWhqenouL4sLu/wmuVsoAGrKDbTYUcJ1SbR0liZm4rfSYQPYZHfyEdoahurmz
	wYtMo0O0eqRwxXii/GUZp86e02FRlTmbaIU5GIOY65YMDVBHW/AUuHsfVULjj0r+pP4rS+sFJdj
	o+IxiWborIXiLqTyHKLQaxQk4qBAtot67NyL3YMT4JkjNBFUO0dC+cIr5Dxhr9kl8HR05a8Z+uP
	6c3ERnDL06XuMk8BWagyZyxu71T9QvE/UN3N/crGgQrakhNxhyiq/sbvK2xM3qCPC+32pvtFG4F
	vDdDXH/28Z/MKUywPxqPtw5puEdLzlta1qtfvgo+M4WnNsq7hKAQ2svpeTwLg2OvktewjhgM+Q1
	gOAKO9qLmFrpJmFX0HDdpH+GmQnkmgAJ8aauWGBV4iFuwDe4Hy/1npMWPceOzZWKbtkpAgd0rD6
	koYqSUFaxARHh9GA==
X-Google-Smtp-Source: AGHT+IGF4GdMCBBQBX0ZHYKpZwIHZbmHHdPflv10naI0r/YzA3WTcC4TEWCOTww2i9TKckX7PP9+8w==
X-Received: by 2002:a17:902:ef09:b0:27f:1c1a:ee43 with SMTP id d9443c01a7336-290272c2564mr354672295ad.29.1760510147460;
        Tue, 14 Oct 2025 23:35:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6fd3sm186191205ad.25.2025.10.14.23.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 23:35:47 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/4] neatvnc: upgrade to 0.8.1 release
Date: Wed, 15 Oct 2025 19:35:30 +1300
Message-ID: <20251015063531.1573191-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120692

This release fixes CVE-2024-42458
https://github.com/any1/neatvnc/compare/v0.8.0...v0.8.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb}          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb} (81%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
similarity index 81%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
index c9c4a6c27a..572134b47c 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
+SRC_URI = "git://github.com/any1/neatvnc;branch=v0.8;protocol=https"
 
-SRCREV = "46432ce8cade0b54a38d4bb42eb07f96c8ff49fd"
+SRCREV = "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
 
 S = "${WORKDIR}/git"
 
@@ -36,3 +36,5 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2024-42458] = "fixed-version: No action required. The current version (0.8.1) is not affected by the CVE."

