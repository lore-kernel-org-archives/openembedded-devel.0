Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC69AD690FA
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 10:39:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.91646.1732790344336906147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 02:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IMz5GxgC;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa543c4db92so91911366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 02:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732790342; x=1733395142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6cHIVjuhlgzriaQN2NG/2q3cINdKB2n9QhfQSsX0Ts=;
        b=IMz5GxgC9CrU5hjzngeoDl0z8L2ZSwc/rA1UTC/5WWefqrlIb+G12Qf0+Gt94O2Hx7
         rs2eBCCpuDsqRBbQtJmrghaEITirHnwqSd2aU8Ry/haz+J6LH36XhUKw/iNSRGdc+0+E
         b29D50Wci0EkAxJLlpoEbdWQZPT/8CA+ngW4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790342; x=1733395142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6cHIVjuhlgzriaQN2NG/2q3cINdKB2n9QhfQSsX0Ts=;
        b=HzkRIwa6pRWNq3YThG3oTHQseMud1NlPh8cMtuep30LGu7gdaRw4i8CggJBpPDRd5+
         ucJci5Yh6ukobd+M6nDtYVOsvlqnYE64x9j4ZjOUQikt/e3Zp8eKcz5FmpGeaO32QWRJ
         ZpNIzFn5fex1xvBql+BC41lJqFIhZFkC4q1IafxiPG2KjtakSGkwF0JenKWLOplJeGMh
         eVe1EcCgdMCKW0lNWlaXbXW98xOrp7K9veyZQORRLCe6MaRYBKe33nEzUjOixlwBOKVs
         4FVN15DAocFmLqCgPRvpymhocNKrSTUThltlCCN31xUwueS6YZHN4v2jQZ+5cSOUJHZr
         b3bQ==
X-Gm-Message-State: AOJu0YyqP2O5gxhcC6Qc8TmbEVJdK1PP0owkH7wbFYIvd1tXnlEdJhEF
	4OE06b5FBXlLvmN6qdk87jA9DoQuFYlFYI/HRiVtUZu3t4Wgdus75BDBhZyM5TZHLi0Rg7zgTXX
	+
X-Gm-Gg: ASbGncvQNOv+A3/HtqqJFhVGma13kDn/wsQA4QcmiYItMo1qA94Q4IQCYYYFIBZbVeP
	79KRCp6kvaRV6BiQ812Zkr8ESs8IXhRBJWxy4J9rtwkWLngV7tuFHxe1IdhPTjqT5LqPOnwKBtQ
	tENCjshHcOyJ+macQzK5/2rcMSuLyEoHcVxZlkl/h7cY0wPCE+NAGqEjM0HOzbxQLQBKDaHbquT
	lASnlSDF6OzcLFIHHNosD7mrn5d4ZfeVwWVX/35pBf14RwtXSOlyXsC6HVS7BgH
X-Google-Smtp-Source: AGHT+IFms3t9w6HL7Gtc+rOh7lDXl+QVub2P2ByaDgNm67xp/QBKhkYG/7ZcF0VzXx87h3U9jUU2DA==
X-Received: by 2002:a17:906:2182:b0:aa5:3853:5535 with SMTP id a640c23a62f3a-aa581028f7dmr546134266b.38.1732790342375;
        Thu, 28 Nov 2024 02:39:02 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c11fcsm52227666b.39.2024.11.28.02.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:39:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-bandit: Upgrade 1.7.10 -> 1.8.0
Date: Thu, 28 Nov 2024 12:38:56 +0200
Message-Id: <20241128103858.4052195-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128103858.4052195-1-leon.anavi@konsulko.com>
References: <20241128103858.4052195-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 10:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114106

Upgrade to release 1.8.0:

- Bump docker/build-push-action from 6.7.0 to 6.9.0
- Rename doc file to match proper bandit ID
- Removal of Python 3.8 support
- Add more insecure cryptography cipher algorithms
- Bump docker/setup-buildx-action from 3.6.1 to 3.7.1
- Bump sigstore/cosign-installer from 3.6.0 to 3.7.0
- [pre-commit.ci] pre-commit autoupdate
- No need to check httpx client without timeout defined
- [pre-commit.ci] pre-commit autoupdate
- Mark Python 3.13 as officially supported
- Update project urls with added links
- [pre-commit.ci] pre-commit autoupdate
- Add a JSON to seek funding from the FLOSS/fund
- Remove Sentry as a sponsor
- Remove more leftover OpenStack references

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bandit_1.7.10.bb => python3-bandit_1.8.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.10.bb => python3-bandit_1.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.10.bb b/meta-python/recipes-devtools/python/python3-bandit_1.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.10.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.8.0.bb
index 8e88d8c7c9..147689309b 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.10.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.8.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "59ed5caf5d92b6ada4bf65bc6437feea4a9da1093384445fed4d472acc6cff7b"
+SRC_URI[sha256sum] = "b5bfe55a095abd9fe20099178a7c6c060f844bfd4fe4c76d28e35e4c52b9d31e"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.39.5


