Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB64CCA475
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.18551.1758896374160263667
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ry7pmrcm;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso3999956a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896372; x=1759501172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Z0HXt+kNYvMpFFU0GJ0+pWfaTESo/UBw3SW5zvELNM=;
        b=Ry7pmrcm80a4xIz0tlinbwmzMCe+kHnvl/B5c7be+XdjJPOiW5SUbikoFVhl7oeP3R
         YdDkOzYyZThDAu7K4iappy4z87Blv2RUkhZGmcBb/ShhHauqBAzPqG06dA6WX26oAMMv
         oOzpEKJlCUUsRBmUzOhuaE5zas5TyN0hL1UQo6NqoOmNcbC+fUid/XHR/DKbxeTciZkz
         WPSlBl5Tyv0Uxe7OU1Pcy73uFp8TksojHvpPK7sz4FuNRbC2LwlZwyEYp/MQh3f5g8xh
         fkvwP8c6bUIMBEDz75btJpOBXrdYq3TTAgTB4t0D1Bt7p7XdvEFYzI20wuba0at4pHPI
         uCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896372; x=1759501172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Z0HXt+kNYvMpFFU0GJ0+pWfaTESo/UBw3SW5zvELNM=;
        b=CY/v/+3juWscksSAjSksqgRtPpBmX//86ZZA1pEm5jXI57xn7XQwwY2TLIp9OQieGI
         U8AHfHRO0lkKbQSxs/djzYGpWBY7YJizUsbtTsSJk81VCxu+XlHt+6syDgbzdxrv5CBp
         hlSmyTp6KGpLqLwL6EmBHOpljr8h5qPdpgKE/9x+MpeNcji65UsOAMUWiEr7HHtSm3ZN
         DPgDGiDzA8Hj1w1NzGO+87oRUAPJmUy59mv9RbbAsz5AKohNj2HKvWi0mlUn7UcDD2Hn
         tlBHKFfgvfvDsotwNcbWj7LDYhdAGSpsnJtXXTJmeHuhzGGZlE3EaUy44U+QgNeQeTsG
         Te0A==
X-Gm-Message-State: AOJu0YznQsNWh6C/ujEgAMeybYkHiYeYTzxtnLQMFJQ+ZY/wuc3jtaun
	SBF0bXi7Qk/HGU4MnP5mgH3EXcw+eW7AIR9Dj8Qgga7uG1tnoaLlJyRlWBvJZw==
X-Gm-Gg: ASbGnct9DLEvpKHP36xnUZD5y3lwN5nNuar/UiU7uX8/uzENs//xUEzGelKROul0FkH
	OfSLtUf/2QOzP3tEsybq5cmJGnqZLLYnlQFSEpVbuyv1NeJh5731z+jGoH/AyLGMObCSgzxyzGY
	YnmiH7jz49obb4hpCEIeqF7IGTGXrhZxHgRr+cAfHBcWVobJG3m7avdwRk96eFLf7ArgK60/QnV
	CUZBkOVCXJldpeqhb/ePmfVZ141XMo3df9kjEhceAdU9iNVAsTDmLsiZltGnyPB+lj77A6tKVTE
	m+vBelpvEHbHHdFPotHfjCQUrbrqsmKo2VRnaNKr3M33c0XnqEvvBS+uq/6N9uzI3AjUXrxJ0Nh
	DB1XNPYfrKFkAYf0yWvhzfnRs7xdY1rs=
X-Google-Smtp-Source: AGHT+IFXeo3mekw491MSJe62lgFoJ9uXFLHAxRndd3jyCvxRMyQQANfzkvYe7q+zrLAxFMv+7I4d7g==
X-Received: by 2002:a05:6402:8c2:b0:634:5db4:8fab with SMTP id 4fb4d7f45d1cf-6349f9cc0eamr5080120a12.6.1758896372330;
        Fri, 26 Sep 2025 07:19:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 12/20] libnftnl: upgrade 1.2.5 -> 1.2.6
Date: Fri, 26 Sep 2025 16:19:11 +0200
Message-ID: <20250926141919.2010846-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119921

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
tests: nft-rule-test: Add test cases to improve code coverage
tests: nft-table-test: fix typo	shixuantong
expr: meta: introduce broute meta expression

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d35850759791685892b02a5794cfe16cb8e920f7)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libnftnl/{libnftnl_1.2.5.bb => libnftnl_1.2.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.5.bb => libnftnl_1.2.6.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
index 380a33064b..841a7267b8 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "c62bef65fef638452b4ed1893c2451fc253ca7ca"
+SRCREV = "83dd4dc316b4189d16ead54cd30bfc89e5160cfd"
 
 S = "${WORKDIR}/git"
 

