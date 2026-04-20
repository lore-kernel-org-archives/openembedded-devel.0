Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B49F5A8A6
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25838.1776706747023838118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 10:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AOJKZA9z;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2180099f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776706745; x=1777311545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz08fJN/3g5/deKJUdG0WVwJ0WdOy1HU7C0cXyQZS5g=;
        b=AOJKZA9zUYDAsal4Sdi0PwryiSwCMHnuoxC/EVTtm6dTyregwykmehqPHEHQCL/DNV
         dNnyO7Tv1TuWuHoiIRJzu1m/fVNbwVuqyUcbkxxQCXPWTIuvYG+zhtpp6loEn/NylVFW
         ziqcT00qWUYGmaFJwAlROQffBDzNtKTsikAFgzaWXVuABevZqBb4MgLMysQgO10qZ4oD
         ZU0h1ES1KtOnMMPfPnee3Iw1XSbkCsezWVvn0EFJT2+sgwDKO5qhSQLaj3oo/chyJj74
         xFyUYZkaQ3mwVwDDxCVHWiXoGtKYyNZvkKoHdhUuGxkpwn3wPcZs8SIV9OOTc4KoEEoR
         5jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706745; x=1777311545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dz08fJN/3g5/deKJUdG0WVwJ0WdOy1HU7C0cXyQZS5g=;
        b=jiW9ltD71MGUzZS6OgwBTc85k7YX90RXbWGSrvg8kuOHCpqCYkysoomJ+v59Iogt54
         chApVMk+Iwjxy9VQSv2ebXbHW1SxW/NvCy0LVvL4ydUo7fAFv/jXI3r+xJHaWPjj+7/m
         XS/VjXdeSzKOo2f61O36UuJVxvSOUl5wfy6IrG9lUCAyItwWbcu43gS+3n7lf0anqrNV
         absYxN96esbW1/trsPvfh4Q02Wk3hdqIcuXHLvJmlYv/Aib44OB04+th0Jk5jWva/nET
         F8iJStl+ZL/HSBD8YqedffBeJHFzGfRCFJgU59ldlk82KR5KfqhmeXJ0s/hmms2obG4H
         hiTg==
X-Gm-Message-State: AOJu0YwJ/Be5ZkQjGN+rmD5Iijl7DSdMWeuUIDEfzbGPG6BqrPskLiDj
	p+zhiprwjivDHo9JyPcStQADC3XbTEIG0HTnFYyvahUBPkJcI8S8N3oVWK4LBQ==
X-Gm-Gg: AeBDievtU/W8mq5g5+IQw9qytt55G/SKWbt1QqTvYnbLTrsgu4ZCIXe8qDERW9srvdL
	wsJi/t8JM1zPsGEiRtehUKmvfHvEubWpG5pDl3vxRnVtszFFLHTdSv82kQafBtwlarsYTwz+eM8
	1ybGwpercar9b2+9jAWBtYzBalX6cPEm3ZO+LqiaRa0zGh+l2bo18TERNCOWf4IZDSlbszh1RKz
	at+5QEiBl9YeCsXvcQaCG2MTkUfbf7bwuqIrC2Zi6w/5MsYm2x3wn7ZB7ylac28j3cvPtSRnyyj
	lXMopa2kRmosJyL41KlISS6gf4m1eWMza7eRPvMCBlAt6tIoofAdppiYIuhjZekvaO8LC7YR2Q/
	bRJtvqB7zKDajwBcoyvkyL40KtEBjuHIe7AyBKjkWhWG/Ag4VMDIUDj+HFpTywzb7cMT3b4CSIQ
	9Tbfu+q+qoQk1CiMOvSJ1QALu2tybf2eg=
X-Received: by 2002:a05:6000:2303:b0:43d:7275:c1eb with SMTP id ffacd0b85a97d-43fe3e0ad55mr23559109f8f.39.1776706745113;
        Mon, 20 Apr 2026 10:39:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm30198059f8f.35.2026.04.20.10.39.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:39:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/3] imagemagick: upgrade 7.1.2-17 -> 7.1.2-18
Date: Mon, 20 Apr 2026 19:39:02 +0200
Message-ID: <20260420173903.1007089-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420173903.1007089-1-skandigraun@gmail.com>
References: <20260420173903.1007089-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 17:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126518

Bug- and security-fix release. Shortlog:
ImageMagick/ImageMagick@7.1.2-17...7.1.2-18

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-17.bb => imagemagick_7.1.2-18.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-17.bb => imagemagick_7.1.2-18.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
index 989e87af3d..5ff22332b5 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "3f2f629405c62106d3569547c03634bc46fcd07d"
+SRCREV = "d4e4b2b35a573fb7d96bc64ff1a417415bbe0f4c"
 
 
 inherit autotools pkgconfig update-alternatives ptest

