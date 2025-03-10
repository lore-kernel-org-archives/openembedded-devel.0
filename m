Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B027C28B30
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 10:38:26 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.34359.1741603101623721620
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 03:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RYE4KGQX;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913cf69784so1884104f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741603100; x=1742207900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLXZX3do3X6CQXoT3qkAGKrtP7dG8w3f4RouzDBhqpo=;
        b=RYE4KGQX9prl3xKjfJHSAh76gBuEv04DYRBMlo9YINjvaF+o6IEhjS1emf1cjZutEW
         0Hvstc/sIl4beeWejMf/fVOYhW1EX+3dokd62bsIczjQW+wKKu/lxzBiwDbpmZUbtWpx
         c0udSxLcBk9s4knpQUzSdAswV1arWua71Wjn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603100; x=1742207900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLXZX3do3X6CQXoT3qkAGKrtP7dG8w3f4RouzDBhqpo=;
        b=Jifs0uusihBxjkPMJD5Yym0ab1IFkMP+sRPrlAadLWh6gGW4Sg62AM2tYrhcgLfxdB
         mRIPkYx5JcFWhJOHfwErlw04EsNX5lFduTuEwnayfGVn1CqxS3J2tMLWV29kS817vTOq
         EZURCohpf+UYjMkI8VwueI6g0OElMsEWSpX6wgWQI72lU0jYv5aMjhX5nyweb/T4a+0V
         lYxZHOhm4h9Ng2vIJT+BUQDr1Bw33fYeHs7Bn4Xu00ZRhrOLxjmOuj6xvIVmxDFblg+/
         Gbw12DNviXEKBagtEJkEIwNESL4cZCK/wqTEmxATemDE5WtcBziILPHXCUEjDSdXHQms
         RAHA==
X-Gm-Message-State: AOJu0YxKxbu7tYrOgu9UH0uLjtUYeYvueOMuwSL/0MLSKCiITSMFcwox
	8HuBndrQopVY5R1lUugZPGRZCgUZ8lVbcx2UMg6JD+ks5HnIZGGg4Y76HQ5Pil9CiRibsfjbW1p
	R
X-Gm-Gg: ASbGncuXqxaYH9gBfpjT0aY4tDrHY0R/eUL1g6R8yzDihehn/UT7PlDMP9t9RnEUYj1
	82k0H+OkKc/RTRbGbgu9o8uFxICe99rCsFn/DV9NoeTPWSCpYT+rgfCTxYqO89t9TgwC/00HLew
	+vj5rQFUpSfi3LbU9M+bKRCQO7Am8Huh7sih4czl+eU5hwz8qHClaUo+PiSMvw2GoQuYxRrkumZ
	ksVT49P7wAxD3fFxbdzrqZFz0cuiekHMxZg1LuYD/jzfGOjGAEOefrLPsTjT2DPYrKz671LRI3j
	m2mmtmrza0GV/0B0aAHq5ox36AX6rUJEGnyEGEac9vmfibw5d2zy/+eTW1Q=
X-Google-Smtp-Source: AGHT+IFMvPYlrvWl14HpKYYA1rRehse8NdNV3MoU04RMIicrlBVZ3s49zNMPBdEtMcrFj2Xe4Lnhsg==
X-Received: by 2002:a05:6000:1a86:b0:391:4f9:a048 with SMTP id ffacd0b85a97d-39132d095e2mr8655603f8f.4.1741603099598;
        Mon, 10 Mar 2025 03:38:19 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac28cf931d0sm277087566b.95.2025.03.10.03.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:38:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-zeroconf: Upgrade 0.145.1 -> 0.146.1
Date: Mon, 10 Mar 2025 12:38:16 +0200
Message-Id: <20250310103817.3281571-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 10:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115827

Upgrade to release 0.146.1:

- Use trusted publishing for uploading wheels
- Reduce size of wheels

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.145.1.bb => python3-zeroconf_0.146.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.145.1.bb => python3-zeroconf_0.146.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.145.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.146.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.145.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.146.1.bb
index 08f53ab8ff..724e279c22 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.145.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.146.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "3acb6146595597cfe6e314f8a4d530e659fcd9f9028cc9603a00518c98e57dd2"
+SRC_URI[sha256sum] = "c53c07d6df3698bd19dcc832a897181872ec47e98e7cd70cff6c1bb0aff0bbfd"
 
 inherit pypi python_poetry_core cython
 
-- 
2.39.5


