Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1774.1792434900320000060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QNERiHYS;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso951899a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434900; x=1793039700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIM12gUPztq7faTWaT8PUrrWmE44wqu7qL3OqTZQ2h0=;
        b=QNERiHYSe4HD5aXnLL3PMLohnyWEigRYHfu1Q5RUazgHuVVgIDJzS6qXBBdAEHdFyR
         W2qnMkofYp8sMabVMeOi2p2jErGnM3P88UYIoZhTgYZfr0K11ONDJ0kXpihVFTYxg20i
         QlGB1Zfe42cYRnK7yjpNoNLlqt73dv/NxcuNKs3zDwBUecN/+BMU4e3hAg36aSd89S7t
         D5Zl32Vt+huzWjFCCbMOzkVCvRJjTjByb4zcBUqwsz4Li/mNbS1paVatn1+x3STsZfvj
         hKYmdkE/rL79F5TdSUnVA+DJdbeA4tVWU/7J8jgCLoytUyfpfc448n9yW+30Y8qYkNFT
         rQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434900; x=1793039700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIM12gUPztq7faTWaT8PUrrWmE44wqu7qL3OqTZQ2h0=;
        b=zkLPys827m5B9STrwoynjHnAwpsTOouu0jW+CNujn3Iprqz2K6nRdV6ZLqij93hTTX
         EBWJD6SBMjJuqw2PpHptu/I+heVyYb7tVbCJFeWNsZMGgL9npgBnGTGDwxMAKvnxvE6v
         sf4pSrSiRj8kxpqPVnGWsAi1ierFnu4QVc/sf9BXmT5n2EWo5ofP6A/v8NpNUpkV3WHY
         3BP3DNxaTAqMmdCl/JtBGxHE3eRqXCRzasLIrKuHe5EZTQ8vQkTo3RcskSxSULj1Vvjx
         Y8W37nddttFDhtT2+FjojgsjCekWdQNDyFVi738kYUCw6dpEm9dy5m7Yp3Lj8gDT64DW
         f17w==
X-Gm-Message-State: AFq9FYJbt4CoMctVcmnwnA5j4EFPPHdg+2UM3F+7DVRn08x30HfB1PdD
	YhD0eiJQYCgvh/NzEgX6RDCVX390wn4nML7bIUKXgILmYHxnI1FWQjJLgfgAvA==
X-Gm-Gg: AYBFou1pLIHLQh7VA/lfv/Eeo/a6IGucnL27xTuQ/zbhxHFUcX5gR3Dg0eue09XglNk
	zskX6sUaZw7EaXJ/7WrKwSlqwsJ/Uzzr1NdaZk5d0dncRAVuC/L3BR+c/rLT6lMp75EYw8kXK4H
	ssk+32BpdKQ3o5iQ8+UL0xVVaB37lsUO0aqdxdUlFeY5lzKvkxLz6i/6rPB1NZvbdaKz9GpCcFt
	Tye1KSRditA3jsb9p56yG++3NlUUO0jMJmQWCFN2vjHHv88ZK3ivOUuOSa/oYRC5Xir9NXXE1EK
	bwOPofmd7iaCMUWSCS+HM3NjlkMFozeNY7nYQXWFMvC2gWLKmqLLeWDKXII5Z94aTTr/FNgiT36
	51zXRxbYlt2Zh5MFUigtpZIwLCpB+yD+VyimZ3AhT8XEqzorsKV46VdDGDxdvn6jrmucRwNsFQz
	Cz0JtAYFgmKC5kFu+5nzRmvAV+FwOVG9TXw4P0Jq71o/oM0amgb43L5JC+m48PpWMKl9Z7dQgF4
	1Ygc9Caw3BBH0kdu4H3o171znuuaGMZzlkuVeQ=
X-Received: by 2002:a05:6a20:4311:b0:3de:5c73:701 with SMTP id adf61e73a8af0-3e225d6dc82mr6919732637.5.1792434899543;
        Mon, 19 Oct 2026 11:34:59 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 19/20] imagemagick: upgrade 7.1.2-33 -> 7.1.2-34
Date: Tue, 20 Oct 2026 07:34:05 +1300
Message-ID: <20261019183407.1037972-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131145
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-33.bb => imagemagick_7.1.2-34.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-33.bb => imagemagick_7.1.2-34.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-33.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-34.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-33.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-34.bb
index 694741704a..7c09525d9a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-33.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-34.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "211e5b975a0019a88dcef5f84c1193f46738d815"
+SRCREV = "a0c4bf729a26a5c2feb28b0365b47a8db736078a"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
