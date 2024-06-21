Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E832C2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 11:35:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.70784.1718969706542100462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 04:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U12QrlwB;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so1921586f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718969705; x=1719574505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9jpSYCsfStI+M71P/DwM+Hx3bQYXftoK0XcxH2V5po=;
        b=U12QrlwBaIT6vmuX4EmW6ATnmNYujeNTl3AyoaYeol7PXpXP0BYg40VaqQCVmzYubs
         y3e5e3HreY+KgY3b0FNG/QTXv2kwBueZhatxUR58UBji5gPAH6U2f7cl7Zc0ka+wW3NB
         7+HmSGiUs8JmLKkYMsUvEvcJZqMywljbvxcaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969705; x=1719574505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9jpSYCsfStI+M71P/DwM+Hx3bQYXftoK0XcxH2V5po=;
        b=aaLJfloPDO7x47s34hUc++TLH8VWZGJMDSTeKj0/OQO+HmV0jCKoNds1oJydCtlVi7
         FeW8Rf8tcujIWT0JFlOy1Gb7+4UV7mVB4DWUVDuIJISPMU15uH0JPNkcUb9r9K+WCKhl
         tEOo96QRctLC+AK9eZi2b/Gc6j9Z3UjZKgFFN0dzrTBgd96w3bh+xWTLu+DPvVdKEVpp
         VCJW2VO1YcrRH9HULMf3udrYJKQyLTGwuP+YRfmOQPJOY1ntwOPNMwJzGkImsw5AkcHQ
         ocSQxSamAXhdPgGgK/RZek1ZLsQNC6hBcKs6Z5qf2eN06ZdXvsDmojOvsREpe2W142A0
         cOqA==
X-Gm-Message-State: AOJu0YzD3nv322G0ciVVwow2gqGTv23HLYUIzTDh44FR7sBqsi3e6gQu
	vix18PkJtA+to6I0yDSjZl5NwHcl4H5TMFSrsJD4cJ+UAezP4U2/q4SkTCi51zCwrW3XBt3mAbD
	E
X-Google-Smtp-Source: AGHT+IHpI9FceaqL+SSrFy7gpmkeX7emiFxyTlkyN/FCtib8g3GfGh5WU+PHKUSdDvzhVROGsCjnwA==
X-Received: by 2002:adf:8b5a:0:b0:362:e10f:5d58 with SMTP id ffacd0b85a97d-362e11ea05emr7595612f8f.27.1718969704764;
        Fri, 21 Jun 2024 04:35:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6d02sm1470662f8f.85.2024.06.21.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:35:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-cbor2: Upgrade 5.6.3 -> 5.6.4
Date: Fri, 21 Jun 2024 14:34:58 +0300
Message-Id: <20240621113459.2188274-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621113459.2188274-1-leon.anavi@konsulko.com>
References: <20240621113459.2188274-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 11:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110991

Upgrade to release 5.6.4:

- Fixed compilation of C extension failing on GCC 14
- Fixed compiler warnings when building C extension

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cbor2_5.6.3.bb => python3-cbor2_5.6.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.3.bb => python3-cbor2_5.6.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
index c9c98b6fb..4033b985a 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
@@ -4,7 +4,7 @@ DEPENDS +="python3-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "e6f0ae2751c2d333a960e0807c0611494eb1245631a167965acbc100509455d3"
+SRC_URI[sha256sum] = "1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f5b108793f6983e"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.2


