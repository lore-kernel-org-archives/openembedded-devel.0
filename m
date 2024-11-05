Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E4BD2B945
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.19507.1730817408385698372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Js9LZZ/T;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso5912170276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817407; x=1731422207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q52cfZtR/NOZd+yxa1Oagm49nQ6l0xwG8eg0XYZWVfw=;
        b=Js9LZZ/Ti8Kwc9wa7+SS0edlt0z+vpdMUS437r/9jmG01rnPmoc4J7lXiYRqCbu/SB
         JCf3sNpY4dvPJvkZt+XRe5VsnEv76Yr85g5a6kCwjROgWB1gjnSMDIbmoroVg4sUucdN
         zNVGwi5oZ1EEYNGH27f+49bWtU/60Kp9F8xJGQFFjffLffwWqkIFHfkLLo0wKegS0lee
         UoLo1CT8ztML37cpuEwz2ieQStqPY+7dPu9X7p6PhoJu24911AdkM68IdRvBwDzPLJZq
         /uLDPxGtWp0IiN0eBtN3ED43XffaemEWYQpBBdsmixl4neFUZuRjHegLxA3yGJUQFyV5
         yJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817407; x=1731422207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q52cfZtR/NOZd+yxa1Oagm49nQ6l0xwG8eg0XYZWVfw=;
        b=ri5fWLxuGzhS3AY5JjjFZ88afOID8YRKwxJFIdCH4mWuaTM6Sslnb/ZEjSUcvK/636
         vxCquio0A4bXWmHjXHbcPH381TbzTOLF5pw/PgFUhSLR6AYKZn9f8dJiriMdOJn2/oWR
         BIYdJwuYRqhqm5pq/GQJ3+FChWBnlw2p8KqaV52IC/+rRXdoz2CBa3OvCCExZI/IoYC+
         DxoRREDTdE3qc6rq4fyGRrds8p0co418qMmVodSOf6bQa1mlQDvY+Rb7u4fysMngUkUv
         a+aHr7NpvtFPtiF/mAoiWss+T73VRJxBsv4RKsasGJ/wZucbKURWQsujEdIBBspIJvQK
         mhDQ==
X-Gm-Message-State: AOJu0YxXmOLwo6SdwhXHOT7Znv1yQOvE6T++KMfv7fFihSdTnvGl0OvP
	fn7YffJcIMMhmiS7H83TZyCQhV1w01eQt+x/jtLeCMI1q/jsHCTnf063kA==
X-Google-Smtp-Source: AGHT+IG7jCUaqHdSolhuPwRkXPPjb+i/BryXDXgnjteWVZeChm6UHrRXGC6rHyNLTxs/tF3yZ4SulA==
X-Received: by 2002:a05:690c:700f:b0:6e2:11e4:2f58 with SMTP id 00721157ae682-6ea64a8d48emr175491657b3.7.1730817407453;
        Tue, 05 Nov 2024 06:36:47 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 18/90] python3-pyproject-api: upgrade 1.7.1 -> 1.7.2
Date: Tue,  5 Nov 2024 09:34:43 -0500
Message-ID: <20241105143638.2301245-19-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113436

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Improve the CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...n3-pyproject-api_1.7.1.bb => python3-pyproject-api_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.7.1.bb => python3-pyproject-api_1.7.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
index fd9bea4801..ee8949add7 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "7ebc6cd10710f89f4cf2a2731710a98abce37ebff19427116ff2174c9236a827"
+SRC_URI[sha256sum] = "dc5b0e0f6e291a4f22b46e182c9c6d4915c62b1f089b8de1b73f2d06ae453593"
 
 PYPI_PACKAGE = "pyproject_api"
 
-- 
2.43.0


