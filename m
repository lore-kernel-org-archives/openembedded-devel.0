Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E1DCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:54 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5093.1791839507052031355
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lfIffWs/;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so2640049a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839506; x=1792444306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/cfPalfImY/FRNSoYtj5GA3iNFtN5UZ6V6zpCr3S8Y=;
        b=lfIffWs/+VqYzjyxjib5N7i7B/KyF+BchKFRao2jDhVZi954P3T/zVuF5YimksSuRs
         M67/7/3Z24mN3yNA8DS+QQLAFum3GnEuH2X6Y4BmK4782bz6HSnMLuK09Jb4nnqBfpyU
         WSDoz8z2nfppYFAUa1goJZ6pfVyIzsZ+W9FKZ95DvSYcwNJMF191hNj9cQ2tqTara0NP
         XwIknf/Be+Ux3RzjaHEHqOwktEApwnEAwP5qiaFGgp9otStQFT/6ebUfTYZ4y7l0UYDH
         pzEzGb09TZMlan4OGDlqg13Ua/GRHmn13HjOlqVxnaAZfkBJzUNVdzSppMhvZu8ap1yf
         7gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839506; x=1792444306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/cfPalfImY/FRNSoYtj5GA3iNFtN5UZ6V6zpCr3S8Y=;
        b=uL3qxoohodb/FDertMzCIPV1FDessqeeiqsJLa5A2f7WzlpsvAe24xV7VTafr6b8Tc
         iRl1TQZK/iTI30v3gILBT4zl+lxtcoeCpjM7Ge+sAWVmwxfyd4N5DZtRXQxGrCDkZeTT
         n3+6vIrjIjOPwSJCTNYhTtRKtLcA2rZUe1q+D1Wzvndul8rsJ6jb+LAYxV6TrMMOFiWB
         jvdVls73/s/Qo429PvLvMgsdVatdLP9tvl0/Ju1CDdtOcKUZMtPQS08BIgDfzJq9nDTz
         OgKMl8qH1Zs0dpoh9oTanwU7RBsMZDq5tHQ/1x7x9kwRewioK0o/VEg3uq85vYiwsdZL
         Kcug==
X-Gm-Message-State: AFq9FYKNbtanE33DILWZWFPSm7pO1zqIgbZbSY7VLKdDqoExE+LNm8b3
	eUz357Wdpv0Tfm1MffENUM/CEz9Q0MKBartgEoLMgWuVgrpZXU8AeIk/PMAPKD1w
X-Gm-Gg: AYBFou3FJPci1kg8YraAxTGhVL6W7oOxQFcpx+O72oTXLzo3qBDjIItLqlBjL2/EPzD
	2reC+fVcFO3db8TJ8wSrYh1AuPc5N3t9ARetUZBJVT6jkvfh+oGbLuHQQDq7D6N8JfAUI7UAmbF
	rF3d7iqGUuvBRqljlqNBMIXX3522eLJ7EmviMN3jv6TzjgKRHvcvDfVJYC+leS2DWyyS0WXvJTX
	omm1dYvbQR1/wMVIqrhXv4Ghf+KFRlr+14O0eUxR2T/p1nTd/MBiOwxsvc5UDR0JCWF5lYdKRZJ
	YaG7f+iXKOgyuN9pB3xgPZ5e6UZTcPz6LLmtKX4P63ARnVt+UB1wdWaoL4MwrkXF9szc2leMB9s
	iZgPls2mMHVtvRcVhJ6TyY8OCO/CPTDWr3WApjaBGuRJR+gI9ZN94PHwcf6KspP9S3+Z4E1OTm9
	rJ17TFXZB5TI7O3gzXY5e7sJbpUKcksLOuWTmKDu2QKkaIUPE7Ogtv2ty3OF4kL6qxPYZEaT8st
	BOw71TFeFdwviIHEEgeH+EmwAuJM5k1wyJCWdg=
X-Received: by 2002:a17:90b:5343:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3ab3a956d33mr9275993a91.11.1791839506312;
        Mon, 12 Oct 2026 14:11:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 35/43] pgpool2: upgrade 4.7.2 -> 4.7.3
Date: Tue, 13 Oct 2026 10:09:59 +1300
Message-ID: <20261012211009.3352822-35-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130805

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.pgpool.net/docs/latest/en/html/release-4-7-3.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 192d012d9a1f40061901ad4302a4d90fc08769aa)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pgpool2/{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
index c6b6a22c64a..2648cc1f9f3 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.pgpool.net/source/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "e72b9d0ff3620f7da7e33a58dda44b77919d056752dc9bd86b2985c4988d1938"
+SRC_URI[sha256sum] = "4bf9df3e13feb8e64bee486b4ea54c9076296c2d9406165b0b68d32086fce250"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 

