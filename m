Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02182D2B947
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.19590.1730817408887301495
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmhEXf39;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e9f8dec3daso42862667b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817408; x=1731422208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4krDkDtW3+2FHDZqAEnNMqk7Pq07yt3samlVwLAuGI=;
        b=mmhEXf39Bfv/XHMqJnZ2kyI71EnwZS/ZOCK5R0wbjZkzcmxCqxBk2VNOub9oJlQpCh
         k2Q5lFya/qg2JulG7xebIKWd6Zs52V95868yQi275Cumv527C6YPvtiVLmsCRvFRkuWv
         vcgnj8Fw2Y9vDZ0f7tfwp6q/fayZvICAvbqFzKk/ZrQijNaz/QZKVuz0304YGRzqLQl9
         P0IWg890wFSqULltyL1MOY2tYanTeVne5/QbdAEiMmUxA/ZO0OjIjPHAm1hXjXCXW9I6
         CUBSJnBpsG5ZWdx0HgRKXWVAPl9hi6tWpLx7yTlmF1dh+wkFbI6KmwZN2J2sqWZcNBpI
         VeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817408; x=1731422208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4krDkDtW3+2FHDZqAEnNMqk7Pq07yt3samlVwLAuGI=;
        b=p4BvN+Uu42a4J4yLyYSUzeZONs4tX5TyGNBEV4ze0H2ljAKCJ/BYgl/BzHO6TGo8Nw
         4Af+Lg4xfHn8UN05zYtp8dU4k6BIqVLay7sbNRUrbIovwYkkcqwGhGBApqixCo79Rzg2
         AcLjVHWLbwprXrSWjXcvBqotxnnX1RTbXfZUC72YOt6mf+fzGwFsFNwUFJu4An94vkCP
         zvFllLuiayTz8MkYlZbkVgN4EXN7zgKz9kVB3E4x8vWpVaS1sbqkS16iDSif3l1PBC24
         XkgSPlqsPLhBYMed6taPgcJ8MKO+eXDYO98Y1003VZ2Ja4kyxK4o3jPeh3Gp1Htzz/7K
         a2/w==
X-Gm-Message-State: AOJu0YyOcwqjXD+PEjxbt9alEf0F8WxSiWhcQeek4w8oDC3+ZNUEkP3s
	dB24EBX7qDIgjH/t/JJBxmLBRXTIu0f4+N9lJ2m8I8BF9UsQfa4xHoIAAQ==
X-Google-Smtp-Source: AGHT+IGByHNzkLWuVfTfLcXBNk3Bl8q61M9rvyRNKtjY3UCuhzGgQE8KVCKoXWyZ8zWl5tlDpPOWag==
X-Received: by 2002:a05:690c:6e01:b0:6e3:a7b:49b3 with SMTP id 00721157ae682-6e9d8ad571bmr389825907b3.41.1730817407997;
        Tue, 05 Nov 2024 06:36:47 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 19/90] python3-pyunormalize: upgrade 15.1.0 -> 16.0.0
Date: Tue,  5 Nov 2024 09:34:44 -0500
Message-ID: <20241105143638.2301245-20-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113437

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
 Updated to Unicode 16.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-pyunormalize_15.1.0.bb => python3-pyunormalize_16.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyunormalize_15.1.0.bb => python3-pyunormalize_16.0.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb b/meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
index 6992ca24cc..19463bc224 100644
--- a/meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Unicode normalization forms (NFC, NFKC, NFD, NFKD). A library independent from the Python core Unicode database."
 HOMEPAGE = "https://github.com/mlodewijck/pyunormalize"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc15b678c3bac1f5b2c873591a330eae"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c2ee871081d4e4c24f32e37c413c73"
 
-SRC_URI[sha256sum] = "cf4a87451a0f1cb76911aa97f432f4579e1f564a2f0c84ce488c73a73901b6c1"
+SRC_URI[sha256sum] = "2e1dfbb4a118154ae26f70710426a52a364b926c9191f764601f5a8cb12761f7"
 
 inherit pypi setuptools3
-- 
2.43.0


