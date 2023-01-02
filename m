Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B8FC3DA7C
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 05:13:11 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.29597.1672636390572367068
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Jan 2023 21:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ocicxt3O;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso17725604pjc.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 21:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y4y9fvdgaWvjKy66YcKOMdMwzW0xSScPPL6Lk5Ah/8=;
        b=Ocicxt3OleRy0Esyy1o4NWiOY2WvIeLrODF7pXxchRzwdiWRuoFlmxNVTB63KqEcDS
         p+Zt42DAwxoiK7qrzeCzv5E5dWAFV34lqdi1VqFUkpgArI4AGWHCzj1u6RYrL7+NEs9L
         hzCURMERHpsolSpFOe8g6oXMM7qKvflaV8S/vOHWy4WmKfBpRD5W4rI+or1Ht57IBlqG
         cItzWLCJ0KmsvQM1U3pum5jiGF86km+EXjZLakxIfUDH5uHifkwdBfKow17ypeoRH95v
         pbnyloAll0K8ZNdBbBJRY9NkjJT8+oBic+f2nP/oE2p81xnlLkVK4ASaulNeplQqTx8m
         FZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3y4y9fvdgaWvjKy66YcKOMdMwzW0xSScPPL6Lk5Ah/8=;
        b=wEFGoBmbkIHoAAsyCfmXsJJ9Go+D6bM55XIEZ3rA19+geNC0Gbpd93ThE1rdeZLVmm
         SvHlYU2hwcMJ8qwloJhDUbeqEwEr1Lu5Fza69bG9kfdphs3Mg4MnKPgB1vRUFwAghjb/
         D74wAv4yQ/8pEUCydBELY86D3A8/iU74rS9BLLUQEWfFx0NmGS1ReTTkuDnS1xXWaCKi
         Rp963ElRLfuT4mtZ93UC/OilIVnYl6+G2Ca+d3AV/gQIEHKzvgdVDQikeXsnuisbCXha
         2D1JV3IjnkYJOl029bklnbyIzhylQbQD7us7JMx0A88Zoc8t178QoN2q7YgAZ9uY/7MG
         xl2A==
X-Gm-Message-State: AFqh2kq0gTBY4E85W/GhTVKIek5DHxOgYrruS82K44dzIeIRwgLqnDUC
	r+q/vBre0v23pZsVzaRg7BQIYu7Us+Y=
X-Google-Smtp-Source: AMrXdXsW0B74Cyw0tul57AZbCInCpHP2VxDGnsfPS46UnXfsC3nzEzKU3Q1xsjHsUbS4sRcxWo04yA==
X-Received: by 2002:a17:903:1091:b0:185:441e:222a with SMTP id u17-20020a170903109100b00185441e222amr37928410pld.37.1672636389783;
        Sun, 01 Jan 2023 21:13:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c16-20020a170903235000b0016d773aae60sm18994659plh.19.2023.01.01.21.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 21:13:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] v4l-utils: Diable 64bit time_t on glibc targets
Date: Sun,  1 Jan 2023 21:13:05 -0800
Message-Id: <20230102051305.836940-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102051305.836940-1-raj.khem@gmail.com>
References: <20230102051305.836940-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 05:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100338

it overrides some of LFS64 functions in peculiar ways that it has to
undefine _FILE_OFFSET_BITS to silence the funtion definitions from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
index 5bc63058f6..383be4a543 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
@@ -13,6 +13,10 @@ DEPENDS = "jpeg \
 DEPENDS:append:libc-musl = " argp-standalone"
 DEPENDS:append:class-target = " udev"
 LDFLAGS:append = " -pthread"
+# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
+# both 32 and 64 bit file APIs.  But it does not handle the time side?
+# Needs further investigation
+GLIBC_64BIT_TIME_FLAGS = ""
 
 inherit autotools gettext pkgconfig
 
-- 
2.39.0


