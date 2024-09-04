Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84C7CD4847
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 05:33:15 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.43313.1725427986398886395
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 22:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fb4oqCU3;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so4418378b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 22:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725427986; x=1726032786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiPB1H06IW8Ni46A278nBKwR/dezZKQezejITJcyujc=;
        b=Fb4oqCU3o507U2ak/mOKh3gul0595/kMPRtTQ8Mlsz2xN92ZFSJtnxEFkUMFh+WHsS
         idUZE53MY1OZbnfwhIXpIjPEU37T4yPsw4Q6xps7QjjgiwJI+EaFI9neHyHOcw6w2XSr
         VA3CjQBjCH6ZOQNo82X6UlCXed8bxVX/lStcpdsSFsg0n0BgmO0p5TrKT8QUapVHmRaD
         HpLBnejmyqbbxjplBAm/iSn++AzRqCUDNPGHd2aocQUq8KOnVqghpH5e68wK3ypbXofr
         iUlpDUezBv3RwFxkrJCG4MOvenFj6TwA1NAlhWlhhbbDf9zXinh8CrnJgHYptGcYFwB4
         5CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725427986; x=1726032786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiPB1H06IW8Ni46A278nBKwR/dezZKQezejITJcyujc=;
        b=s50NwAqpl89hzX+tJBD7smV3uFJevDRATaXSWYRBrFQ1jWcxDMrvI48F7WpBXH3pvg
         6INWfTmLNOnqcDrEFx68MmSCLlYmk7NYrkhQ53gBR7GIV7HPsr6pvX3kOuOIiEOyN1eQ
         v2ueQlwX3cHt2zRFsTqzoZkx4SOpP/5C3kDcpULevW6UHBdLUsIMcW/3Lqz0p/4oY8Sr
         QfuWBYG0/iQnZ0k9K925XP801RQbsAl/pQ0fGVe/IC0LfFeB5NTrS56NaBoCajlOIbDX
         ptp5wuWtyOEYjwmWYKNCZqMuXarlkX0ERuB/MukILz2KpU+QzWHyNs+gWCz6KXugN5E0
         GhLg==
X-Gm-Message-State: AOJu0YxQmOET8JL7XPmbJ/MMJOjIqt7HRqFdrKH3bqRkIgw+DqrxInmx
	m0PvCGH1lNx300kscxZsc//I1D9V5fMVr3DkGNlSistFM9G9MHv+wKASQxkR
X-Google-Smtp-Source: AGHT+IFxlr2m9s9ngqX4bKalTb56Hr6dlj3lqw2xRpZyd7qcPVuNQi/E5keHImjTPVF9EXWjq3yxGw==
X-Received: by 2002:a05:6a00:3c86:b0:710:4d08:e094 with SMTP id d2e1a72fcca58-715dfba79c7mr23747564b3a.2.1725427985518;
        Tue, 03 Sep 2024 22:33:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778589896sm776515b3a.128.2024.09.03.22.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:33:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-grpcio: Upgrade to 1.66.1 release
Date: Tue,  3 Sep 2024 22:32:59 -0700
Message-ID: <20240904053300.2085710-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904053300.2085710-1-raj.khem@gmail.com>
References: <20240904053300.2085710-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 05:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112087

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-grpcio_1.62.2.bb => python3-grpcio_1.66.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.62.2.bb => python3-grpcio_1.66.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.66.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.66.1.bb
index 59bfbf5538..fb91f345b0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.66.1.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            file://0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
            "
-SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
+SRC_URI[sha256sum] = "35334f9c9745add3e357e3372756fd32d925bd52c41da97f4dfdafbde0bf0ee2"
 
 RDEPENDS:${PN} = "python3-protobuf"
 

