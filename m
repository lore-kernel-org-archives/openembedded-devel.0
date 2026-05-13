Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4133CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:05:58 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.731.1778648702951761476
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CiYGpYHY;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-366070f71adso5686931a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648702; x=1779253502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLOAbUYCdBuC5KnFxYUSBXf3lqa4QTQLDkn4mkK7pzU=;
        b=CiYGpYHY3GjoS2W+rVgoVm9M7WiQOhinT3+vOvOjPA0rJwk6Q5th/QIYKQGftawH3S
         0AFofM5PtWpGY9wgwk3evc6I5liKfKJjJ1yqs4yZrlluqaVbX1xIDebM9OBjsg3IACtB
         ACyPQ9X9LPnyWXdKcP03k+j4PYEsCzWKKKn1a89Sq2PPPOlQlH2tD+1OUEgeKBevzZkC
         l/gPhuTdxOZN/ckyIvwzCejWLTyNasr3/CapM0uh7pQOJVJqgEXuzqmKZWDp/qhTYvsZ
         +gwlvc6sCkg8SVJHXcbp95herycUBdjngaYEXFA6uTg3v/nQfedegIU086K85uindP2G
         cr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648702; x=1779253502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLOAbUYCdBuC5KnFxYUSBXf3lqa4QTQLDkn4mkK7pzU=;
        b=copJDaBO/23ZmSrvUQ2nQnxPrDRe/TTcO0+aXywv8GvKBQDioIoUHR4axatTZy1+nA
         zuvDC/qwaUzf+FVK1X00GYmnsYtCoRipeVHGT5gcHqmHGS3lgJHFLEMjnK7v/wvhCxGB
         AEMkg4WMQFKtND96gFDcWBSxo+32qFvPRfBuP6fKHs0llEfWtPVwqL8YcO6llviEuOWC
         ZnY+pbJ6dIiIn9s5I4Umc1g5J4w1Opl6/Savxep8NyFAySwCFXOguYc2cM7HE2isZvI+
         +VsFk9B1NPH88BaS9sCczHnuYtvn7pT8JunqaQygdUz8x9FwX7o+L4emG7p8cmVY+Sxi
         HFDw==
X-Gm-Message-State: AOJu0YwW+jCEgTSczHPrGp/sHDyYJduqMBfc8U4G5Q6IHu2ii9Dcx8Lh
	jpulMKbPrVLsJs3Ma7/2p6ya5nkKC/9Zftr8zjZl5OfcUQ4/8DBCj0FoMaHFAyFC
X-Gm-Gg: Acq92OHe0x2bR9ejYmAtoQkSaAIxBg4z/+jxvSoGR27X6/J2D4sf9lu0rZkOhgtKmj6
	QllxLEnm7MViWnOKMlNxT+FSwlQE+Lc6g4mUd01wqnliRifBfEJOdVirAdxRlUEReDazfyXVUtj
	LLcpfm9GNeL/Rezwt713eOUbXsqp2Rt+7t8sH+wYW20eZwf8y03en+AXwjCEVm7jbwMopbf6M8z
	TBXc+ufP7WXjmVv7SdiSlCuMZHdXJAHn/Kwb4xLN5AMgaBHBZakpeyDoLZkVNJrl6mHvXVwbWBR
	OtVsrER25+bFCp5AgugEX/Xbp6nwXUiQJYt/GXthJHjiQMTBUKLKlRfYQIIr122mr0Lu1CVk6ha
	e+yp1sGdfeM89sHgJlzT0zDnRUzdXb1iQIt9p6NqpX9cySGDEy2CATScHaaiIJ2sHVbus+TNBwb
	6dTzrhXp5QiS7OJOZwTlE7mMgb5xRtbxK9ZClr
X-Received: by 2002:a17:90b:5345:b0:366:479c:59e7 with SMTP id 98e67ed59e1d1-368f77f08demr1542641a91.4.1778648702110;
        Tue, 12 May 2026 22:05:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:05:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/8] firewalld: upgrade 1.3.2 -> 1.3.4
Date: Wed, 13 May 2026 17:04:44 +1200
Message-ID: <20260513050450.3515182-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
References: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126946

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/firewalld/firewalld/releases/tag/v1.3.3
https://github.com/firewalld/firewalld/releases/tag/v1.3.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../firewalld/{firewalld_1.3.2.bb => firewalld_1.3.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/{firewalld_1.3.2.bb => firewalld_1.3.4.bb} (99%)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.2.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.4.bb
similarity index 99%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.2.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.4.bb
index 52157cf9a8..bc61a4ad32 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.2.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     file://firewalld.init \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "aba0d8ce9617b906ea4866bf0bdfb2c2d5312f53b8e9e8e9e4d49bf330da5b5e"
+SRC_URI[sha256sum] = "d33ddcc3b78fb66aea23c880deaa85a2352ae4b54af9ef796a9cd16ddc1771e5"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native nftables"

