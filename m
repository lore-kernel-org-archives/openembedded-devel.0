Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9912E9DE55
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:12 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127051.1775718608055543459
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OFJ2GcaI;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82d029fd52eso412525b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718607; x=1776323407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MluIiMAFJnPiWV2piK28yOe5zeJIFIbdnF16261BZDk=;
        b=OFJ2GcaI/i/JzXaKb51x2/Lwo0ym0mDYFug9f9sjopwEiqudDW7e5B42vMS/gT5T8G
         iLaaZ2c/9MCo1FZMmOMjGz8Wz4g/MeysLSZrb79YB1JK9DbSJ8uAnZ73yAxWaXiajH6l
         O8pUKVty11iR5QLt8K+1cW1/Ryy0QQzOFEP4Ged6K/mziHcnnpIyJe5/UEloR/4h+bF7
         qYc2RDK2FwYuQvy8r7kglWSme2oDmLSEpVPyBTyjxXhQNuOHNQGoTbLyE9OTkRS+IriW
         FqkXoP7rrzRtH704WG2LMdkkK5jBAUJWoOSquNM0NS2KmBuyahxCJkXnSngWRsy/tZ0y
         D8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718607; x=1776323407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MluIiMAFJnPiWV2piK28yOe5zeJIFIbdnF16261BZDk=;
        b=q/4qVPYUo4h/AdeHXEMMgFoA5qc3EInbQ4b86nSOEHoy8/l/QeHRAznW1eq3zeekbf
         BDc/pzk1bm4vw3TzE7GblK78ElUkzrKOCQzHWDysJs9WEshX5gyOMOIBur2mD2HrTsGH
         9PwR+LwaeNnWeFNkpvpxjFyqnjcn8BV41DJiobRuelZeoZhPsnxRLyGqKfcDASiHLASG
         0nNtPCjQJd2PjwMvokTl/hdLrd3m34p960TfcR16H4afMRnovhUMC6KFcP5PQUnY6axk
         FFFwaZK7F72iSt15XlYzT74Oq8Iysua49zIxJb78TZmAwoHV/IkwmIvYbsH4sxYmgbWN
         QAUA==
X-Gm-Message-State: AOJu0YzLP5BKyyGbdmTwDjjK/Bh3CmORNCePUeWg6sSjYtpDD27hGqoG
	x45v7n5NSAUFNBr77XBfK+oLzkTjpmjtGIR7wcyo+Nu3slIdmuFkHyzY913QBg==
X-Gm-Gg: AeBDiet9tNu69HdxYEi0KfJyUiXM5v73Ir9VCJIk4FupuMImnSba9UbQUgFo2Enlu2X
	19jQrMhy+eaJr0kNF4lwd+EbdAxS1LOzpBWUfa52+6CuqcnZ2WBobhr5C4GCQ1hTVbNuxUWkr/v
	djD8vjH2NcWBDEEwPEVkqr6haJa1z6PnLARW0dEqV+NUDaL3eVQiQeThoz9FEypVBeR6NE5wTbh
	6vZdNW2IZWt9NZs7uzBgImeUA3UFpBO2cZKVV9/CatrPBNMIZ9BFpohuTUG84Ns1i73TjVnd5R+
	xaE2DoFrdFrh6JZto1R3EOWt1ZLAxhfd0PEU7OKFoJ7dhXZVlLoQZQV9dZDk39q2ZpDl36FM4bh
	vuCsLc7zfB9VqXuxWzawQUiNDB6bjKAnKvkIM1QrNrhO49l13ThKZnlxAiUT9yS2HAEsvha68He
	JMpcgz/wzD4zQFrlBDiVnAQv9zeEankdUvL/U=
X-Received: by 2002:a05:6a00:124e:b0:82a:7758:1416 with SMTP id d2e1a72fcca58-82d0da504d0mr24534538b3a.12.1775718607083;
        Thu, 09 Apr 2026 00:10:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 16/22] freerdp3: fix CVE-2026-29776
Date: Thu,  9 Apr 2026 19:09:13 +1200
Message-ID: <20260409070919.3968586-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126138

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-29776

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-29776.patch     | 30 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29776.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29776.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29776.patch
new file mode 100644
index 0000000000..0ab2114670
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29776.patch
@@ -0,0 +1,30 @@
+From 145c0c5f048894e4a7d09a4465eab7551f035bb0 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Tue, 3 Mar 2026 13:58:09 +0100
+Subject: [PATCH] [core,orders] improve input validation
+
+check length before subtracting. Might underflow and be cought by the
+next check, but lets be strict.
+
+(cherry picked from commit a9e0abf2eac8c2e370fa155bf1abb9d044c0ca8a)
+
+CVE: CVE-2026-29776
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/a9e0abf2eac8c2e370fa155bf1abb9d044c0ca8a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/core/orders.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libfreerdp/core/orders.c b/libfreerdp/core/orders.c
+index 855b700ac..a9d779418 100644
+--- a/libfreerdp/core/orders.c
++++ b/libfreerdp/core/orders.c
+@@ -2214,6 +2214,8 @@ static CACHE_BITMAP_ORDER* update_read_cache_bitmap_order(rdpUpdate* update, wSt
+ 				goto fail;
+ 
+ 			Stream_Read(s, bitmapComprHdr, 8); /* bitmapComprHdr (8 bytes) */
++			if (cache_bitmap->bitmapLength < 8)
++				goto fail;
+ 			cache_bitmap->bitmapLength -= 8;
+ 		}
+ 	}
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index e3d71ee854..74f80ee948 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24683.patch \
            file://CVE-2026-29774.patch \
            file://CVE-2026-29775.patch \
+           file://CVE-2026-29776.patch \
            "
 
 S = "${WORKDIR}/git"

