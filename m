Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A65BD75BC3
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:25:31 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.5049.1732170321269668088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acYnQk75;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7f8b01bd40dso359864a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 22:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732170320; x=1732775120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0hkw8qx4HXGf2bwbaFEiU6U0TPdAzT3W2BE1lwTxf0=;
        b=acYnQk75iAln56/013sq7r1eksNvRnQt2iDw7ZxJGmFB0yt4aUL8vUP/gwMn5CnuxD
         RwPPqpQn74xC7DswtcBzjS/l0iXsoaAz6zgB/Cl29ob5yczTNHJbcETPxOt7imSHs5Wt
         qM1mI15QXKPQBDbr9coLmw0Svy8HKTML976f7PiRetuTRlKQ7iImzL9lLCfgsgMEX/LD
         oMhKozqnCVRjevAP9PPzWBBPkOzu/A1dyt06cjIlrPWg6I41Fe5SXuRplPW/SqXRtvRx
         o8igkTPuL2112ZAt6AiL1TS/jd5gJXrjrL5BJWDAgNod2MovmY7foYfOfaFhuC/cT0Zm
         48Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732170320; x=1732775120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0hkw8qx4HXGf2bwbaFEiU6U0TPdAzT3W2BE1lwTxf0=;
        b=IF4FXPhg2eETpfPUI3Fj8Z/2OYmYngl1LRYJ7qE/TItJIbSJfrp9WfEMp9Y4p2ezfZ
         WAs0Jw+Ijp7Z9gq8Fvs8NGrWr1yNeSVwM46ASo8npD+psIiEgCujJyhmn7CR9HfVL/jN
         W3b+01ukkHVIHWNW/BYxtE2WUv3xzNd/U+DwBuNJ13gjoIhfjdXTb2n4gdxcnRJflMOW
         OxqrqwX4Yjm/PdcWhoQCjaIsvTB9ZL/3nm4wPx1G+GKc2WPJCY0c0zQ9j2V5uyUJ7pxe
         UduLHPTAjR+2HkhnHQ59Wov3dq7uhJTqwphHIyD+8kgOk7B8xSAjZ1pLRXygzvDwWRIt
         FP3w==
X-Gm-Message-State: AOJu0YzoUwUtQK1WdaKUomxZJxSDU7EB9yE0Cb7ePrkd9gg2kAvN2W0B
	g+D4dOfMp13Ygan+NEQJ8DShIW0wWinqJtDZa08hVi5I4AhsKMoL0BRhdg==
X-Google-Smtp-Source: AGHT+IHxT0ue9izBowc9tPPJzeZGJfxHfFZBIWXXtqRG2p/ThYTyn9+E/u7HcKxRyquaEi+gW6nTDw==
X-Received: by 2002:a17:90b:4b12:b0:2ea:3d2c:24bb with SMTP id 98e67ed59e1d1-2eaebdd02b4mr3343113a91.17.1732170320071;
        Wed, 20 Nov 2024 22:25:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883fd550sm5814705ad.254.2024.11.20.22.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:25:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-rich: Add missing rdepends
Date: Wed, 20 Nov 2024 22:25:15 -0800
Message-ID: <20241121062518.3074722-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 06:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113952

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/python-rich/python3-rich_13.9.4.bb     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
index cac1ca9591..9755bacca1 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
@@ -12,4 +12,8 @@ SRC_URI[sha256sum] = "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2b
 
 inherit pypi python_poetry_core
 
-RDEPENDS:${PN} = "python3-pygments"
+RDEPENDS:${PN} = "python3-html \
+                  python3-image \
+                  python3-pygments \
+                  python3-unixadmin \
+                  "

