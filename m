Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F6DCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:12:04 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5100.1791839514720072754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=USRyQiRE;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so992321a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839514; x=1792444314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BnSSjKFO0PMtJD0fnqhAXCYbYW7l7yAaTyeqqUClDc=;
        b=USRyQiREYWtqU53WjACMAGdIkI/sSI+lf24Jc5Ja68bf/fAE/BCdHUXALA/Z6sR3zj
         72BbDsMsokLWpNNibHYb1Y/SwX6RArzukOSNGOifIjdpK9AiPGu+c8+/De/ukBDcbwHB
         OEQfSwfXVhPiVc3KFAGu9PFNuSU21+i96q1xEV2wPHkITi9MK/Rxsk6yxXxsXIGq/R0F
         iY29oZVaaKfiFeYk9ZPLuhpamoZtlWoBHUX5CQw2pO4EWWEBbgX0DZWh7nLz2/QiUF1c
         cLlBJtZNzhz2Fb2wROj69vAt7P+x0vB1D5MM0zOyVO2jpnzxIO7YNyOPg9rZZVekuRI6
         GWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839514; x=1792444314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8BnSSjKFO0PMtJD0fnqhAXCYbYW7l7yAaTyeqqUClDc=;
        b=RDGUxgR7MP0WjkevCPZnwawylHW3+4EfMSyNMshkfsCccRI/K/hn/2yGB0CeYxmBIk
         JB1ZeXmqwWy93+p6xV5xwGOEaK2RgA4AhsJHk8mLcdSiWvcYzpjO8QtnFmYNzKtmxnmL
         YdWPUfkaB1mQoVYY9cPHoQ9DRQ1OxjEzmM2EX5pt5n00rOZ/5JXdfPp4QHdctwBrWX9K
         5lQmqT3GSjQ0+kFOljf1QbEXHLuWT64dtVUPA2MJVDDejUbDzZjJp7bG376irjSKrOzM
         4XeFRnjUGeB8r/BdmZzq6KqmaGZUijM+yAjYwmtB/5EahYVMQLhw90U5HPydywvMgP8G
         xfBg==
X-Gm-Message-State: AFq9FYKtBt8reMRpUbgtFxlftb4E+FosevQA66JHBdKH3pqEgS39H366
	LVRQW0eRYEZifYxAho3H1XtdKfWJkCMA0UPYf6ZfEL107PnbMhyvmVEJ2ZAF0OIb
X-Gm-Gg: AYBFou2cIDSrymCv1Y5QNZtz7RYOl2teCew0Lpr8rUJtevNlESULVLaATUO+/bscBgF
	GTJIe5yJlhSgGTZ8OnKL5Z3BeulpLMovn1wAxARZo4WChKKSskmlxhR1AcEsR19wukUVtw2r2G2
	DcEj2EGiA2PyukpKU1lIupp/sM6wV5zvjG8a7mwQrhbzNHm/cvMJgge4efeSG8URjKg4WKM2P51
	leNV3V3mDhDd5tPxzuvVDcterF13YVBoxljpZBSPjog2rhpETcmoUg2WIOCC6cWzwRYdJFc1mxI
	0S78RFa+hc3ha5ssKRFinUTT361FFYKARTNEor0fVinmyGu3izHyk67EfSnnZOKAu/ZG5rAUFR4
	KXnyNv31/2bsoPFLppyRHY0JQf+OfJTMxs8LqOZok8hL5OQDHj833J2NAhCoNwM9N87AQoH75jT
	8VsF7DREPKJ3HyRxl+ft6qRrTWE8RjRGGuQgigoG8HjJuLKA+4vShuzQ2bUboRTaMnFOEU9j2qg
	92vFYV5mbOdDwBeAEj8H7LfT3OiNIkHxDrz420=
X-Received: by 2002:a17:90b:2d06:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ab3a32d491mr8092885a91.9.1791839514093;
        Mon, 12 Oct 2026 14:11:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][blacksail][PATCH 38/43] python3-django: upgrade 6.0.8 -> 6.0.9
Date: Tue, 13 Oct 2026 10:10:02 +1300
Message-ID: <20261012211009.3352822-38-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130808

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/6.0.9/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c39562d398bdde11ba32c9144a8189f87ef922d7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.8.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.9.bb
index 0c7fb2197d5..acdd2c21d06 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cb0bd962d27fc866f3c514b20aae6a7df56ec80b488f9899da46d675cd051526"
+SRC_URI[sha256sum] = "8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

