Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E113C83F26
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 10:10:02 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.37001.1753092593750652371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 03:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YQhCFubH;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so7935831a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1753092592; x=1753697392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYQRpZFvYOuU2D/X5bWYDp+gdld+c9/duFFlo8Li4m0=;
        b=YQhCFubH4sm64ypv5VuCcLx2tCQD8UFCuw/38fMr3/cntFgJxGePgfY6U3URPSVyVU
         5FoQm6vbzMLXqcKcQ3hIc5kMq+8OdYEtu3oE6FBwv6SRFTmoFq9eR/2O7OpOBquuo/Zf
         mGErozragJxOBBFWzd0SV/5/faRTTXfNGcPig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092592; x=1753697392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYQRpZFvYOuU2D/X5bWYDp+gdld+c9/duFFlo8Li4m0=;
        b=h3crPhNYSvtmZE7Wcbulvnl9ocSeFmG4DuEf3JwdgFlyVM0ZdM7zb8KzeT0B3+YNyR
         eF3Jkh97+z3MgHGJHzE6pLj0df4kqsEv6AePHna8CtdL5/dxQ1WIT5uxNX/aWy1uF45t
         febZRMo5vBUwXyfAA0cjJidBIkW+WMJFKbMk7Wq+tUpVF6hjK0/jT6DgQVxmzZ4f7FMJ
         WGE7f9QwOWeAkwPAoJTuysgpR5qQkht+6XiTFwb91OJYmSVdy6DH3r4nkMs9Y89cxGn6
         qnx7ryuSgidxkt4rzcRQ68xc6p96068j+6mSeHknC7JpYMt/ZWriK/0Nh9+V9ie53uEP
         MAnQ==
X-Gm-Message-State: AOJu0YwlIazkcOpIZO+TJs2djzYlvDkq4ES4CDaK0AH/o/87pbiTpB/d
	gK4fR0GRz8xtKMZWD85cU6XcJwPy90c6gAXi51Bwfgtq8MiOVOVPjHp7CQCgXT3XfVhhNEDDEFv
	MMadI
X-Gm-Gg: ASbGncuva8DCal24WA66LU6FcB60bDm3yJXN7qlv07bkhClyQ4Cevv0lAgbeQu8Bbw5
	H81L7tpQ8Zc0Ipv+m7ZrrfXDROv+Mu6qeyTSzpR602AV9ak7oM7vsG09grTcKJ34mjVACb62Ghd
	ITQx/Vcns4X3+cQkKUoEkI/ED5+Qwd7oTpP3SwZDK9blneFytygmvodNnwO+KQJgOrJ+gaUkTr+
	cap6I6qqzUuQZxBjCsnLMmefCiW9m4ofdmcCAzV37jLYGKtmDwcTqDxhQwlCEsHLhcmJbIAu5VG
	LKUjoVoVw3xRzMCtbXGw1luW70PwBIs/LI8Lcfp/sQJUu+ZMJwOcbQEcf8KPESRggJcas/EV36A
	+1gfKJeFU37xBT6Kwq91/AZKIBlD+nKuyU9uN5g8KJBNJIkA=
X-Google-Smtp-Source: AGHT+IFglYBT0humTcam1ogOxWbD13l1/6nse2yHLOCZrVAP1GhJpZ+8iA3+XwVZL4PctRwpKPgw2A==
X-Received: by 2002:a05:6402:34d6:b0:608:6754:ec67 with SMTP id 4fb4d7f45d1cf-61285bf3730mr19041945a12.30.1753092591664;
        Mon, 21 Jul 2025 03:09:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c903fbecsm5238184a12.42.2025.07.21.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:09:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-starlette: Upgrade 0.47.1 -> 0.47.2
Date: Mon, 21 Jul 2025 13:09:47 +0300
Message-Id: <20250721100947.1181063-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721100947.1181063-1-leon.anavi@konsulko.com>
References: <20250721100947.1181063-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 10:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118658

Upgrade to release 0.47.2:

- Make UploadFile check for future rollover

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-starlette_0.47.1.bb => python3-starlette_0.47.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.47.1.bb => python3-starlette_0.47.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.47.1.bb b/meta-python/recipes-devtools/python/python3-starlette_0.47.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.47.1.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.47.2.bb
index 6fdc4e6da8..98108a5369 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.47.1.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.47.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "aef012dd2b6be325ffa16698f9dc533614fb1cebd593a906b90dc1025529a79b"
+SRC_URI[sha256sum] = "6ae9aa5db235e4846decc1e7b79c4f346adf41e9777aebeb49dfd09bbd7023d8"
 
 inherit pypi python_hatchling ptest
 
-- 
2.39.5


