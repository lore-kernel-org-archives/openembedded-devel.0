Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033C7CA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:56 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5093.1791839445641262879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K2qjtCIF;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c9879395so671370a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839445; x=1792444245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjhCXHBxUjyK6lESQo2PAi2aWndh8PCz+Tl0U6po3z4=;
        b=K2qjtCIFxsO1xaPcb8nCdRWyc4Xh3bnNgELV4hGLgcGTtWUTFZozfflemgDMWXBUvo
         Uj9BQkX9iD1o8PJ7BmOV/q3J0cab4THcGysLNqVVJGupDTB5xE4fcbma0h7oz5bdWKlW
         EHQglnlQc1naXh9FeCSU6h5CQMgBK0spDyXvzKWBCm76Sw0paS9tVSuU3bLQUJHEZECD
         5AUs6qgIjqR44uDHzy7o9T2xJYyH/IJr6kJa/ZF0fOCmcyGHGHQ3pooj3cDAR44WwPz4
         kH7Ut+Jxika3B1VNKwrRj0AYKWfVQxjStNexMwFeotGMEJthSDpMLucNvf7YxpRclirp
         x0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839445; x=1792444245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjhCXHBxUjyK6lESQo2PAi2aWndh8PCz+Tl0U6po3z4=;
        b=CFMZynQdQ4jPmVri6ymzbd6O4RgEgoz/QutXHrxKUjaP5yU6SHYuMjMRxkLBYOnj2K
         YKgMdCuqWPo5+8Kf+I24+Wha6ep3Q1oM3fXXHQI0vk/1OCBzd+DtE6DWStFwjWfe8coG
         xGfWt5UhjFpTF08XaX8l2x7ljwvRRAVAwJvvPPE5xJdsnsdh6GZlQABexZJSSRtstnCJ
         kB1A05Ef7gxIPNjuJbhmJwgZu0rMuAROg2mFqRF9I/0AFJRduy/eIzaBQi0HKagm9NNQ
         EgMoW3M53guX07MHo0nFNRrRvxN3M5jhh+1nuLqhR2Mxn/XRTRz6zvLC0rEBKZSrdjJA
         Zelw==
X-Gm-Message-State: AFq9FYJ7XjBer3x5UPukJYueBLyi2D3B+JcOJ2oz6iulHTCuoX1ypomD
	sQwtN5JLtwcZg/A9iQQLcdtLZy2En0bivxg1s+wTtAwVOzSxeKXDFr8mdMxYc0cw
X-Gm-Gg: AYBFou3ZXbHDI2+QaxsLTEjztB/sAf9gCPo3rTcn6I342ETUvTlS0n94AkE4szb1ihz
	c66lezoddjthTHqLcGDe8TQ0eedmHSug1Kg5Qd48jXfNjdrGDcL8f01xBjZuMemGX4MXSKVm7I0
	Hzfn4VFCpWN1Kvzy8PbDYvPVb0cK6hGkouz1c6cU/AVkzcy4Syx5aWIIpxVdi010dVnOISXK78K
	9VGcxWpCPOlpy0lY6Z4NVo4Xp50czPzW+6yHoWoaFvUrKUFYXqplaLPnO5swW3GRHIMdh2Sl6xp
	T/51qK/Xrjlbg/1gV+9SkfC7hifLlX6CyZD9lfZrwI86NDh96zWqfJhLWylnWJe0/rpfHxlbm/3
	DLZmZfnosdFX5RdCrt6fchDZVfzjJ8zTBo5l+SCcjaHe1dLvfGwr5Em5UgE0VJfePnTwoh/YHzt
	UhVuNfF67A2hxtb/YkShQeOo8EMtGHrNmsLedIrYQD0xWHor7HRb7odhAX+HEaISq/JVf2tZAkp
	hQAxQ1pASZvZsLShBdKdJkfNr2zTJkkExPHQvo=
X-Received: by 2002:a17:90b:3c07:b0:3ab:1a24:56e4 with SMTP id 98e67ed59e1d1-3ab3aca1257mr7721742a91.30.1791839444962;
        Mon, 12 Oct 2026 14:10:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 11/43] gerbera: ignore CVE-2025-23386
Date: Tue, 13 Oct 2026 10:09:35 +1300
Message-ID: <20261012211009.3352822-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130781

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-23386

This vulnerability is due to openSUSE specific packaging issue.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 369d9629673fd4282cc88fc9b7435de5d1a0ceeb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
index 3d28273f30a..ca54cf2315e 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
@@ -29,3 +29,5 @@ PACKAGECONFIG[js] = "-DWITH_JS=TRUE,-DWITH_JS=FALSE,duktape"
 PACKAGECONFIG[zip] = "-DWITH_ZIP=TRUE,-DWITH_ZIP=FALSE,libzippp libzip"
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+
+CVE_STATUS[CVE-2025-23386] = "not-applicable-platform: The vulnerability is openSUSE specific"

