Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15774.1792642771713356152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 21:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dtepd0ck;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0dba37a7fso11886387b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792642771; x=1793247571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwhxJPvzpr6C+EfT8qEshENlQ+lwA7NUUZ5VsgxDxZo=;
        b=dtepd0ckdNsr/TJ2O++wtPGFkhWM4tmswHHDg8pMGNJEHY+TAcaCCRecYapFqGUsKK
         vEup8EaUns7iR0RBAcw2Tdx6Ctfa3tk8sJI8aGiDYObsP02et+JvdbYYZnXpPtWZ8mPZ
         M5kgVRc5Oju2mjhgGYnR1xykIqvyQR6rbyQsNbgPSjkkW+5TOQgJ+r5HWkQyoovF+Pjm
         +YTjYO5MOwYnqpep5StRAY2BVFFeF5dZ+QNoUdPDTSD4sy1J1tWGBqnhWUpajYDDnXiB
         9FvZh9elsgFy1rqdGVi7CpFLDpOZDwnXNhpSWpHIMK8prpYmTt9hg9aLVnQat3muPzt4
         Gj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792642771; x=1793247571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwhxJPvzpr6C+EfT8qEshENlQ+lwA7NUUZ5VsgxDxZo=;
        b=JakXLPQHMJ1+FmbScpJIXb+j9KPNqA6cZ+522PSzIF1c57BmHxUr6SAuNcAWg8cSWv
         /r3D7laC5+DQdnaNnVjBcE+GXL3wLx495rAqmmK3Qr/1guDq7SsWaX3dm7meoVvFnrsz
         KmB30czQHmaTUW0xTOr1B+hdH+qhnOiw6Kqbys2tWOVvFewVCsIlX7abdAllvNGydWJJ
         QBylO7vaQffl4uryeOFTBTucOcrqo4AwjM7pSvNf/HCGQDmGqrV0XBkdeCCgVZdtt6ir
         Avcb5bML2B9EXiTWpP6TMzO9i3wxfg67Vq2K75sfTw1iFFMuWF574l8zQrc7TTW24rHP
         ukpw==
X-Gm-Message-State: AFq9FYLAI/lDeUVUhatIalWcopPWxCy8x2xczru5KEllBtjIfgo2zpTa
	Ue5pS1/rRAwzvEijQsHyeeYtjvA4Cm9cr7gwqx1tolgC9hG32Oh0HluZEgWw5+3/
X-Gm-Gg: AYBFou19P2VuzBVYHs7b/ueblIX+zPSp3jZw+mm/QLbyKGVA3geW89BlUWri3LzXQ3h
	7feQmrL9EUwDGu4/E2bfWD3R7VpbwdwZ8xOn0VVtQdEWdWHXrZV3ge5z11jf6mJxvXEqsa6GaTj
	AfjduzN8H+FV5ljj4hNtElm1DCzIP1f3J10axKK3KWahe80FcofrKFIfXbE0rgZI8+wk+xD8F4W
	GynpooU9JgLqeb3Wg0ctYMP09vOoh3YJD0kkCmQLJ1v0L+z++ugtsHRLEpYEUsOAANKiAsOLFDK
	v5z0HiYM8dY/bAdYnOSThpf8mrgkEUNb8h+l9kj1f0ms9vdfw5FjujIS21TMx9Sc7c3WM6Ezdwy
	NmU6I22W7HSKHL06KP3i8lRuDEHaAWWZW4i2iR6z+lVBmRnb+fLQY9asCGSo6PRmOtu62Zxz/+I
	5x2stvrXDh+WXUtBJVPzYT/LSb7hkkmOHDlev0DcRklK/G4S+qQnD5gXCRTgAlgU5ylN50O3Z2v
	rcUsmvvZ17Ofc4kasFjLC7wUanXQxt1TbHMtvBtkzO6T7EICNq8N5Hldcshi5Zgz1wWtNBehn3M
	P9ckcRcGVqlm99bFhncoylyi6FkaaKmCurBSi0Rq91BoGcV6iOrbu2lKhDBfSNCsLslDXTr9+F3
	6kFw=
X-Received: by 2002:a05:690c:e1d1:20b0:8af:4ecb:b712 with SMTP id 00721157ae682-8b134013a97mr17974287b3.36.1792642770616;
        Wed, 21 Oct 2026 21:19:30 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300715cfsm21285077b3.14.2026.10.21.21.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:19:29 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] brotli: upgrade 1.2.0 -> 1.2.1
Date: Thu, 22 Oct 2026 00:18:50 -0400
Message-ID: <20261022041850.97712-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 04:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131306
Content-Type: text/plain; charset="utf-8"

This is a security release

CVE-2026-111497: out-of-bounds write permits remote code execution

Changelog: https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb} (83%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
similarity index 83%
rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index 84495a3236..2db266c2fe 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV = "028fb5a23661f123017c060daa546b55cf4bde29"
+SRC_URI = "git://github.com/google/brotli.git;branch=v1.2;protocol=https"
+SRCREV = "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
 
 
 inherit cmake lib_package
-- 
2.43.0

