Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4184C55184
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13603.1785620748713666936
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=edsvq82l;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1615653a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620748; x=1786225548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJGvG9SpnKZ5IP28bxDpELyNbDqIAHeE6o4Ke4Jf2LA=;
        b=edsvq82lDPRjX6SPqyvFsx7FWorIUlaj1CzObatnSsHQqAuiqjzQFCHnhaLDuH03TR
         2GjA6D4a6UPV7jHdChZYPvSf2zBK5Nuxh8/J9IWGe/XnLw7Tqje3AXa8qqzRcpzJBBrG
         vc/5IBGm+5b7YYnxko/8TWNX7ZG8cVN7aOcLKUbqlIuto/qc4C3SlRtrPWGIv5GWuHzw
         kxb+qfbBovlGT4PvuBYklgdw+5ak0AUfEr+DurmaYCnwAf0sZJ/3t+hmz9yPfMtmqW/P
         TGwMSlzp637UDXs2brXbctFSHsdMflEO9F+S0/crmaYfIPflBXGePnJwG9WZUh/lG5aQ
         UYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620748; x=1786225548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJGvG9SpnKZ5IP28bxDpELyNbDqIAHeE6o4Ke4Jf2LA=;
        b=OyPMbHVJ7IXKbNcDOKiQj/bcuavXOsOGWjETBqgsnnzuPbTyssI9g9xIoN2cDmY+YT
         YPMltaGqjZ21IoVwMyVnL73wDby9El9MGjCwLx2xwJ6yHmzkr+jve7cTqllsrCQVnNxq
         eEgao9UEwkEyz22DEEZA7hH5Ck7WNpscDVNH4Y1O6tlNVTzEaKP0jWDRdc7tqKPKdbO6
         F4kNd3cSEfmYFU/U9w3tRaUlyVbIe49PJxDbqDM4ALmI54Eyw/bBW32IZUOX44BmfqE1
         YB1zDQ+I3/TxzQFqXHzVjdiBg0MNZTr53XSEquljyYHXNVmv82CLkZ1U980fTsbKd+9o
         JY8A==
X-Gm-Message-State: AOJu0YxeOA6fBJP2w+HUNSfN8TVi9favy2UuQWRAzIvHJ/jG25S41D+N
	UuqzRg6QkIC71xJXW0dsJikPfKkkH5qKBulOpDroGrJtKGSXu/MVCONww7vKe5xs
X-Gm-Gg: AR+sD10Dpx5V1eiYVgjWgAdJ8Q7E+frNNKqasImWEL70zEKhfiD7KG735XCpXUgjJBI
	tT65AuXwhtGqOYyR9Af95zK2IgAQIG0uhyVFmmXMrRkA7M4AIfOaDfWht+UgHvWblUuINzoS38g
	onwW8PSN01oid8NbtXOSUqUtm2qkZHK+XO/y32b7AcPSlQa+Slw2NCMOaKs7LwG183NmgsR+JpG
	zctZbX9Yqmdts5jar4GdbobCWzEeWIvcytG6g5HxfMkqUqM8iQUZ+9/7CsgcJcXPaqt0YxxJGJR
	emTY11ZQQfjuRRsyf2276+vEpSik0nEPNshQ0wN+mwkBGP1UqnCETIcIQcbU2rjeXrO8sdkVIqE
	z8oVP/12cSizQXFTCwPWwUgIOAeEJNn+worlMS5rmBlAgv4GYKvvnuYq0g5XMSOW0lAK7ZO27Sd
	+dFXVt0kgXKIfFtB3kZuW4hntFEwhsnhjVRhgjoB7z1RaNFHRlLGAQwlNjlXEb4X3xLzMbqwB9U
	Z1KLJklduavnISp+n1C5IYOcLdk3NFKvgJRyhkKg3qbpg6CsWRaHPDPf3jNPRE4IDur7I2WGkB4
	t1PPADvtua05fqhGe1jFb8mDHNvDY97Gz3xtm3vTp4ZBTxNM6CQcg9z3+5pawlBTZur9Dahtj27
	htw==
X-Received: by 2002:a05:6a20:431e:b0:3c3:8ce8:1fd with SMTP id adf61e73a8af0-3c92a8e2d9fmr4205275637.73.1785620747919;
        Sat, 01 Aug 2026 14:45:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 20/31] nv-codec-headers: upgrade 13.0.19.0 -> 13.1.15.0
Date: Sat,  1 Aug 2026 14:45:15 -0700
Message-ID: <20260801214526.788343-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128637

Upstream changes (git log):
 * Update headers for NVIDIA Video Codec SDK 13.1.
 * Add the full set of cuMemsetAsync-family functions and other missing
   CUDA functions for Video Codec SDK 13.1 interaction.
 * Load nvEncodeAPI.dll for native Windows ARM64.

Version-only bump (git tag n13.1.15.0); the local clean-target patch
still applies.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...codec-headers_13.0.19.0.bb => nv-codec-headers_13.1.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/nv-codec-headers/{nv-codec-headers_13.0.19.0.bb => nv-codec-headers_13.1.15.0.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_13.0.19.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_13.1.15.0.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_13.0.19.0.bb
rename to meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_13.1.15.0.bb
index ef9490a7c3..95f750177d 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_13.0.19.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_13.1.15.0.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     git://git.videolan.org/git/ffmpeg/nv-codec-headers.git;branch=master;protocol=https \
     file://0001-Makefile-add-clean-target.patch \
 "
-SRCREV = "e844e5b26f46bb77479f063029595293aa8f812d"
+SRCREV = "0a6fba9a2820628b8103464f4c8753ee05838baa"

 EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${baselib}"


