Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14639.1793092835897247271
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FjklNRkt;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso26002855e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092834; x=1793697634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKblTu8S0aa97AoSxOG8kRSINVSAfREFsEb6E7PYvFY=;
        b=FjklNRkt86Pg3TQpxJigfaUdqYE/E2fcab/gEWuwW/1cjhaPITDkrc7KhtDe/90Lq7
         aNt4h+eujaenxr9S2xBacu2wS+jU5AwUMTo+8KPTz8xq8AhDKLevOUiv5FmaEyTORao7
         3bwP1O3qV9jVjti/UtTUi6K9xGep37s24R/N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092834; x=1793697634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKblTu8S0aa97AoSxOG8kRSINVSAfREFsEb6E7PYvFY=;
        b=b/lRp2SkEm7JxaBg+WqsLwCXvC1hNmM0HrT3MC37nNSPqbrh70WgP/nl0Gq5PBw9A/
         j9ikLVycV1yLDbfMJOFwdB2jg35hTQJas9iEU/b5H5J/z0xyc0eJPsdrUGHcrWM5kQqD
         0174h3RrKQck1rr4AiBPXXo2uAi2xovoe95cqMP+NOpyicBNdqqhlwuYJwoZ1p64ErQp
         6M7lviL1iRb0cHYS3GO9holbVV6eecMjt+SBgIoQ4NRD6+9GYCn9q+ZkWQNo+SLX/evZ
         JlMigGEzIzbfco1ttGm5hkQfv9xWAoxfxllANSnG0UqXsab8T94QNcllnXkF9hlPjCsE
         JcxQ==
X-Gm-Message-State: AFq9FYIlP0LWmDWasiQmn0Fbn86rQ7Omoac9za42jx3+bpqg6QgfGfxU
	LM8JFvmVPBekeiCsEbqQ+U9/s+7kCnMo6gBAfQ/x8mxJ41sghW6hRSVnGk+Igl1j3cSbAPtC3Q+
	VJ4bI
X-Gm-Gg: AYBFou1aShQJ5my5FKB9Qe0+9OStENwf6Zs2cIWMHeJZtJFnAmlJQ3ePk1Gb5PC3xmF
	7NmZfJbosSsvWIbmm1boLV05uIloCbEsX12yPbpYFroerddxqN8qhkIPC9dsVzC3iktBR5yPLSB
	pX73Jnn9hM39kRF4rgl5nwPLhj6CPMPGRaY5pF3L5maCjo9A/Ry7J9mSzgl/jiOG32nF96Eb7p7
	jCVV3PVcxodF87N1GqIXuI0JnNUmuGLxoLq7EY91GYrQAWST+89gADfadut3v9VgOWiXxqjFGBf
	Hqt+H3e+WR7YbUqzVfiXoXv1Rqra0U3WguJaxkB4aIfI95sR1tlJ3uMMTotMyM9KyZfueCwFGFs
	ckDg3CIoFKMcyIzdc8kMt08HkzyYWh/ea9PPWMbyG5Qm//ZsFciv15jJSHQrcquwVpoW+B1CU8q
	3J1yHkUppmxBiou31jTxcg9ezYcTLn++Nspm3jR7Vj1MeA8jdZ/fwy1xkkaq6sZL6XXu8SWvZem
	efMWmj70/fF3B8YDjP7dHNxHQWey73N90CPt15xK2HdUInz6eBDuBClTvcbS20wGmS7vKO6Th0P
	rZshd76Cpw2zAqPIGxA8TtXs/Ka8pw/6x+n7qqbJGVa0HLzIyQ7ZF5zkemmlu6pf/iMzEa2WeG8
	P6fyY
X-Received: by 2002:a05:600c:c173:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4a35ac8bbd5mr171856715e9.11.1793092833711;
        Tue, 27 Oct 2026 02:20:33 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/61] python3-asgiref: Upgrade 3.12.1 -> 3.13.0
Date: Tue, 27 Oct 2026 11:19:28 +0200
Message-ID: <20261027092028.782979-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131465
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.13.0:

- It is now possible to nest ThreadSensitiveContext by providing an
  explicit executor for thread-sensitive tasks. This enables moving
  a block of such work away from the parent context's shared worker.

  The provided executor must run  work sequentially and on a single
  thread, as per ThreadPoolExecutor(max_workers=1), and the calling
  code is responsible for managing the executor's lifecycle.

- Local attribute access is now 2-3x faster. Local(...) now uses one
  of two internal specialisations, selected by thread_critical,
  instead of checking the mode on every access.

  As a result Local is now marked @final and raises TypeError if
  subclassed. Subclassing was never supported, and could not have
  worked correctly with the specialised implementations.

- asgiref.timeout.timeout is deprecated, and will be removed in a
  future release. Move to use asyncio.timeout() instead.

- Added support for Python 3.15.

- Dropped support for EOL Python 3.10.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-asgiref_3.12.1.bb => python3-asgiref_3.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.12.1.bb => python3-asgiref_3.13.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.12.1.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.13.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.12.1.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.13.0.bb
index 01c5568dd4..bbc2a1739d 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.13.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[sha256sum] = "59dcb51c272ad209d59bed5708a64a333083e86017d7fcdd67498eeab7784340"
+SRC_URI[sha256sum] = "034cc8cbf72d00553b4be256703ac545120b4e50af13b49dec99da899aeeecb4"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.47.3

