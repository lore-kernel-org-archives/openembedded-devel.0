Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6EFC47077
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.1320.1705454005091762350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaC2KFbz;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5fc2e997804so40462517b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454004; x=1706058804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuhHaSfNDDHbLiW2B2aWQ5wKy0jwms3bhBST6Cs4n8U=;
        b=JaC2KFbzetVs1HRt9HiSkfE9D3hYJ6TGLhgUzfvU/jfpdqGGNh6LcyNa2OVA6z164N
         BfR+qzqCRgUrfAGvY4c47BLWG221GoPNsMF1aPGcpf1YyzONx//qRnr9KtZivKNNayfJ
         AABIji1JB0Y6LjrybuqVJmgNnwJUVQKoOQwJuOHeFZOyfLipzSOLauMLyvS35h/HY6m4
         hJkKOsP/sHR/aiCOpCOdGv62/08CPal8X8i15S6W81X9sRoqakjMohC+dhNSNHEM31kv
         bmYpUi8yh8+3uEbeyqavdfUiPUFLAvcCWfxqiUrWSrnw+4y3yUWRl08qyg1Mx0KTCb/A
         DIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454004; x=1706058804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuhHaSfNDDHbLiW2B2aWQ5wKy0jwms3bhBST6Cs4n8U=;
        b=BJIeF3xJFMxx9M80fN3qCs63oBpz/hH1s2YJtWajFmfk5KDnczzsGD6YEuBBfC5X/E
         m+ANqDskb3i+2wCm/pFFvcacjSNnDOEAzwRvxLf3t0NN0R7Z0XIIG0WMr/TXtemikIgs
         GOxf4IPsHT99MW8FsEYoDYUKCUs2DD/9v+XH9Gs4jQL5tK/52o0hO9pdZRfqjuFVZ2I0
         ilDpakfuna1lPFLm3Dg3OrYCwRrPvrOYQECxkXwqpQgScz2S9LLmJvM951++buojfqED
         AdND2wejmPTzeCO922saCRHVuaqMhBjhjCH1Z8EKnfxa5rbPIlqE8elQmxRiBb4VGFb1
         hleA==
X-Gm-Message-State: AOJu0YzMy3PYraq+1f517Oj+YrjvE3hC28eQo2zdG9O64EPVMtsDAmle
	2Ur7HhtbctKy8+5OIhPoiqv/i1wEwnIZDQ==
X-Google-Smtp-Source: AGHT+IF10BMceaAjTqm2BgoO9SAEVMJZWfacDpj9hstC+AqHI6brzKH1PnFw0SmF8vqZPtrSKf7JaQ==
X-Received: by 2002:a05:690c:38b:b0:5ff:51f2:9f41 with SMTP id bh11-20020a05690c038b00b005ff51f29f41mr1865806ywb.88.1705454004090;
        Tue, 16 Jan 2024 17:13:24 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 05/11] webkitgtk3: upgrade 2.42.1 -> 2.42.2
Date: Tue, 16 Jan 2024 20:13:14 -0500
Message-Id: <20240117011320.1856392-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108314

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Bump Safari version in user agent header.
- Fix CSP regression that broke Unity WebGL applications.
- Fix the build with GBM disabled.
- Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 700e3a36fbc70ef7ecd5fa2bc820f0922df5a528)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.42.1.bb => webkitgtk3_2.42.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.1.bb => webkitgtk3_2.42.2.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
index 9aabfb123c..ac75afb90e 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "6f41fac9989d3ee51c08c48de1d439cdeddecbc757e34b6180987d99b16d2499"
+SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


