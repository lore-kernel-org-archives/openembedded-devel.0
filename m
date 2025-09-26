Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D450CCA471
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.18552.1758896377190767679
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hxvqf8Nh;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso3363915a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896375; x=1759501175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+OCmkJQgCkSFtPsFWUvaVqugFHDABVXbiBGkzLkcdc=;
        b=Hxvqf8Nh4hNM6gR8M8O+2EZGwUjljKn0r03voU+adzj4H29VoVQ7XcTnZbNgRpPo5L
         IKM7Civ02SxwHzVp+CWlwWEFb/UWMaVb9IgJeavLVNEBK8jc6cgy6YcYWk8LZhYDsRWH
         wF5ouhKcnJ8mOMsmWaRwWt8E3H3ODJh6T07O+nxIEN4uqZEvfSqvDFiWH59JMt2V6rxs
         E3gmt0a7/gfE+w8K+TV3pWavc/A8R6lulJpqRRUsgTDJhitGTFunNb/SqaGg71EW2BCd
         raAfXumdf0tKz4VCUmwGsWQZL4wH5lb5tQ3qClilmU/UM8V+2NfmSc4YM9tyu1p+/Gu/
         N/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896375; x=1759501175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+OCmkJQgCkSFtPsFWUvaVqugFHDABVXbiBGkzLkcdc=;
        b=gBejIabZJugZrtMCqV+TDp8A6fysLbO+/gQFs1XtrKcdWOaSca9XnOM3N47RCRCp7z
         LGxkwR9CD+QD/kutJA2Yb4Rx3FVDMKIAqPLG8dAHO3jr77VGTqrBRlpOIRRiz0X8scfp
         pPd9T6bN6zDJ5eHGriyOx8lYyIqt41zjZJU8ykMaMSDimgaUUPfReuia86EG2MbGou8/
         gco6PVeewKsIZDDNaSnl7Pf8OFj7cQOlKsioVA1irA4RdrlUL3GHXSvxhv0lSb+r7Ypw
         thwKen4T7n9yLRcqPJ21xjTOVrrZyDfncotiqah0qG9McFf0S4V0qoK+QU35+wloFbq+
         pMKw==
X-Gm-Message-State: AOJu0YwPYTGTfYT2koCj9EouhiY11JfiyjPQ1BV/1jQ62Y+4m/ICy6Pq
	Aro5aevFNj3QrdYzEKdeaKkHRG+yE+Yv3ooE2tY+aoY9nmTrR35EGfpfM9rezw==
X-Gm-Gg: ASbGncsFPIK1xGw13Fl/M3+inWOKDOFpZQitnjPqau6KleY8V8/6e4i9T8p/ElzgQbJ
	4fq3SgIb0cHYbXq+XVioiVzCVaToZwgMgBVlaPdWl3nLAYn6kA2yh10XF+1HDSpeIo9EnJC9WxJ
	GOcU6sSbzk/8VlPi/z4HKPvt2L1zQ74yh+BX9x7PAxPIvRZ0XGN9bWcbZXj6eBog/WIBNbyuIC9
	gI+n/bbYHohH/vcB20n2UZXIovNIElJvxs3qdrakNShPK1dAhm5OrAy64lGH4enZGBhuBMQtIww
	EgQBLGxggH7ZhrZZQhEwsEBF+6/qTg2X6lYmqzUVabuMamO6awCNTZcV8UMzybjn6FvKxQPuZR0
	1y5Q2LlGBRLkFBaHY8G01BTv8zM+zH1A=
X-Google-Smtp-Source: AGHT+IE4AApJHKELKgSV0WNYuwgQFVFDHE9AeT0ONvLKv3gHwR6ENc7Js2MnbKtJdYZEwvbIgSHBSA==
X-Received: by 2002:a05:6402:40ca:b0:634:c005:c862 with SMTP id 4fb4d7f45d1cf-634c005cademr1967025a12.29.1758896375278;
        Fri, 26 Sep 2025 07:19:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 15/20] freediameter: fix typo and old overide syntax
Date: Fri, 26 Sep 2025 16:19:14 +0200
Message-ID: <20250926141919.2010846-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119924

From: "Bergin, Peter" <peter.bergin@windriver.com>

A typo that probably caused a left over from override syntax conversion.

    INITSCRIPT_PARAMS$_${PN} --> INITSCRIPT_PARAMS:${PN}

Signed-off-by: Peter Bergin <peter.bergin@windriver.com>
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 77f031776ec9c9edb18e7323b17b697f5c52d5f5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-protocols/freediameter/freediameter_1.4.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
index aceb379ee7..8c4b419361 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
@@ -127,7 +127,7 @@ RDEPENDS:${PN}-ptest = "cmake"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "${BPN}"
-INITSCRIPT_PARAMS$_${PN} = "start 30 . stop 70 0 1 2 3 4 5 6 ."
+INITSCRIPT_PARAMS:${PN} = "start 30 . stop 70 0 1 2 3 4 5 6 ."
 
 SYSTEMD_SERVICE:${PN} = "freediameter.service"
 SYSTEMD_AUTO_ENABLE = "disable"

