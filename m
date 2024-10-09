Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE89CEDD91
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 12:30:20 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.15102.1728477016151315605
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 05:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lEspv0SZ;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c882864d3aso7510954a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 05:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728477014; x=1729081814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euKu7+IePdHmtJCeOBjTiHzUNLq5Mh0WS7WGAPAVpE4=;
        b=lEspv0SZMTMHxfqcY8HYF8wIHeYgl1HnjfCEm6krQ3yF4d5Kk0G+TWEpoFTcejFEwU
         /DjjRlZI4UXir8bnEJT5KUDkp8tcyU3E8srUMpTErA8wniLX6MNr4bxt0qb4PJH5NI75
         Jg7SWkTbAdiuMVkudkWy5FH66tJ4exsKK6dEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477014; x=1729081814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euKu7+IePdHmtJCeOBjTiHzUNLq5Mh0WS7WGAPAVpE4=;
        b=v5+PLC0lInvV4ubQYoImbGwydLoVWC0sFabDIEBvdzpWsc7tCEQV6yk6lpRQ6CO1yS
         SsJqLyXZI3RmmvWfjSN66z+VWrkFFT+mlhdQ0KvL9JdkIHKsBDxCJnSWogDqozYGa6Hy
         WfHAyGhlfS06A2gtM6qcSBEQVklIFbso9ddt+V2Z+rQ/NljTugP/7UgRrdKkaET4W37l
         mxdYfjRmU7wlMO6HldKeFDPXmRYIyBSg46lZL16TkABEuJAaCpytCvR05YFwyBrdmjEW
         bqBA7fbjJ8YVaEkvvSfWvlkJQooJjVb0fEQRlcN0usPYR8iIEu020IbRgpvrJlWbjFAc
         HERw==
X-Gm-Message-State: AOJu0Yzxf8l4pF2tCz+TkJT6lRtmANAyiNsov/yUIOagBZ/z0F03t5yF
	0VpLDhyUlBEQaemP1IHf/y9nP3xYnQGv9yZ74cnQ71jY+69jrVXrB1Uw0olddNUh2/kV5m9FXmV
	n
X-Google-Smtp-Source: AGHT+IGWQ5jIlpcSNt2UvBmTeeEdltYt3hI1QV53J/93W2Fm8p5NGLLhw+pi3mwbMTstHBt8ugRM1g==
X-Received: by 2002:a17:907:7fab:b0:a99:4b56:cf76 with SMTP id a640c23a62f3a-a998d327bcamr166446666b.47.1728477014093;
        Wed, 09 Oct 2024 05:30:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9944c6d6basm543582266b.145.2024.10.09.05.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:30:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-astroid: Upgrade 3.3.4 -> 3.3.5
Date: Wed,  9 Oct 2024 15:30:04 +0300
Message-Id: <20241009123007.1023153-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241009123007.1023153-1-leon.anavi@konsulko.com>
References: <20241009123007.1023153-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112728

Upgrade to release 3.3.5:

- Control setting local nodes outside of the supposed local's
  constructor
- Fix Python 3.13 compatibility re: collections.abc

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_3.3.4.bb => python3-astroid_3.3.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.4.bb => python3-astroid_3.3.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.4.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.4.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.5.bb
index 3ba9f7aa6..cfa58e7ee 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "e73d0b62dd680a7c07cb2cd0ce3c22570b044dd01bd994bc3a2dd16c6cbba162"
+SRC_URI[sha256sum] = "5cfc40ae9f68311075d27ef68a4841bdc5cc7f6cf86671b49f00607d30188e2d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


