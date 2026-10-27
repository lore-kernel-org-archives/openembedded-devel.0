Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14864.1793092892506221650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ICvtaunL;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso40324625e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092891; x=1793697691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PB1aAFtTiy3SXFbyJHrzSbfPahb+qsCNlI8hMQhEovA=;
        b=ICvtaunL1+UUYbPg3yQcQg2T4G6V4zgYyXYr5JXCCvWtA9JySyFEaJ4Wvl1tBh5etU
         5OElF/xmZwhNPb8MrQg/zzETK2iFYdKbp3C16fuNw1Yz8aH9NEikLWHL4wS/276GWqPs
         3No3GiUnRihBVV06pfEppPN4ZgeZDySd+Ub0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092891; x=1793697691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PB1aAFtTiy3SXFbyJHrzSbfPahb+qsCNlI8hMQhEovA=;
        b=eWH4YNYMAwqYklBSQxAYWcGElrkl5g48LyLYTpjfw5OQF/zsg6SdFDFrGhh8S36bU7
         5SLUS++3c6yC826OT9yT59Pp1+HbMalBFiATw9JDmOH5sfZ2BrORgbs1KkDF4o3Aou4D
         Zl375M73v3jzAZSXjPjrbQH9ynq2teTN4ohfGEcxSFHnch7gnuI6xtUQMhXod02IhKEp
         zMSfQO/70XV0FQsQsYb8jBbnSETsTTpYyySj1rkkUl+PMdO/+vaz/Sqp3MUfUCrqlodf
         7CV2YTycsMho6xZhyug/XgqXWmXaxQOpnEqJEaWrz0Kmid0WVYjGoQ7fvYZ1mHFAi6pN
         YOtg==
X-Gm-Message-State: AFq9FYLPUVBoHoJG1AR1Oxl6pHj29slw06JgDY5EF9Qk2Sok+FnvUsrg
	hNe2ZeXSrJncXkw/ZBxycWCjU98CrW06QkwrkFI1L13Ts3xKxv4/Bo7QJz2fL201GpEw1wKFZ8Y
	Ym39o
X-Gm-Gg: AYBFou3LYAwdUKFZdwb6Z7skKfH2zLuN3Ch6wC8vgi720EpZSmnoEPxw8ycyQtZDxwA
	UxSFfGnG4SKV/bP5Fygi5hzJfPPyCYj/R8yI0OhKAsQ4Ngkr41cEoP16tGUw97OFHnpOZQ3wc0b
	TzyaJde0UQ1nmIdvOuzxsYYmDLXO5VyjfwsTjR8jwqUTiZW4I5HV81vbz9SmbCR1HQ8YN6jdW3Y
	9TDhG0/AFua4aJhFsgoKWfTEV7TGAifpONKO/lrQN1uFQnu/Vw5m8WvnWNUglCQWmBO8cYZoMYD
	h+wIHRYrBdk/yauYq6V2LivvhUEbXLfOmy6SBu40mWAMLc2atp8ttltOUBLbaOKmayfj4D8zTv/
	CNkv73YFsCzTmNyjOLB4EHmeUJKKWhnB4tUqsoZeA1Ka3mBNmQTCmMuwzmg5x64PxerMXjAgFxL
	fcgoKlJFrcCTr42J0E0DQRHhvv+l1yQlQrBqxfqPf7NY1EGtiH+R5pa6ekpYGpuFV2I1Jl1McOu
	STeacXQgGC/vGABBImTm85IUmI/lqLCIXN5FFuSYdj39WrgcBx4AP4BGtbgORUHuyqkUUjP+jTx
	lh30LJ/rGBeYsr5eNyiLBsga48R16ynE6osmDRwU54552jtyikuEClIuIoAoBNEFz0sSte4ORQ3
	6m328
X-Received: by 2002:a05:600c:c049:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4a76bc7f796mr45308095e9.30.1793092890847;
        Tue, 27 Oct 2026 02:21:30 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 50/61] python3-tqdm: Upgrade 4.69.1 -> 4.70.1
Date: Tue, 27 Oct 2026 11:20:17 +0200
Message-ID: <20261027092028.782979-50-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131514
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.70.1:

- contrib.concurrent: fix no-len iterables
- tests: major overhaul
- update AI policy in PR template
- misc lint & tidy
- CI: bump workflow actions & pre-commit hooks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.69.1.bb => python3-tqdm_4.70.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.69.1.bb => python3-tqdm_4.70.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.69.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.70.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.69.1.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.70.1.bb
index ed2b0b5d0c..1f1cb72850 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.69.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.70.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"
 
-SRC_URI[sha256sum] = "2be21080a0ce17e902c2f1baeb6a74bf551b67bbdfa4bc0109fad471d0b4cb0d"
+SRC_URI[sha256sum] = "cefd0eca11b2a37a3aee776544d4f4ae913f02688135b5556b8788dfa474afc4"
 
 CVE_PRODUCT = "tqdm"
 
-- 
2.47.3

