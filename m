Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C49D2C127
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.19631.1730817428992352931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9dJTBfd;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e330b7752cso43326987b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817428; x=1731422228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeiSht3kIr9iRNUxW92HMV21eaXVbPWZQW91o/ieXn0=;
        b=g9dJTBfdlyigP/gGdAYxSW3O6aFbFfM+OtrB+LH616MiohePb9Zjba1RqmohqKCFrS
         WPGPk4bDMbzhR38Pe933QnZpJ79QLz2xCTsFhuJKpT5e+YoZ9AUdn2H0yiRE/v2t7rbL
         Vi7ZYlRlNFAC8RzguDI+jALts07lcAIC1z3JwPj5HUmDQjPMhVULsxPCKe9UE1L6ttGg
         pAGWzuaK5c9ESE6/r8kkSSM4n9mH8Rra5Vp+OWE/9TEueB5SzecaE5d0EOXY3F9qorfX
         YDC38EIAF7fmvuixjmJCVpDQ91VztvacxHkS4sZnKI5KrTwQolCWdfUngAXogajgKiur
         +GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817428; x=1731422228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeiSht3kIr9iRNUxW92HMV21eaXVbPWZQW91o/ieXn0=;
        b=fSokBFnY2YvLioXfCeSEjP05JG2xCBSZvG/zC1NrhG2yqOIfUbTbU0D0XF0+uv1Zj2
         ZDhJdPsJHxKMm7MnqvInFYdRxb1NSg0VECSG987K1uv2IASLuhIhPSmzgx5JKxGQ3UWH
         xo4HID21cty90ChlQkEPJRZIK7LG3gXjhTC9khPLRtPlN9r2pWjx/ou+SluB1IC8gDqQ
         9N1Xvg+5/zYffXZNj1BM0LCtg/vcvcRKOVaRRdxekXVmzdo41QqHMl9t4mQhCZzwIcuK
         dvb5n8l1Sns9LTNokKy5wIBqJfTkiLBDCHXoiXDEhcc6KZ9CdWlMoZYQy3zYKu8epY2n
         5ZtA==
X-Gm-Message-State: AOJu0Yz1bpGx6eZwzW/hNBpZ9NEK1Zlqhu/qOcGQv2dYXVbn0TFU/2kh
	CEELSfFq+B5t+VwKjLRjp9OiaYC8LfRaWCc6NM8SdfMbGhSMM7h1XBKTnQ==
X-Google-Smtp-Source: AGHT+IGR0S170WrXv3iG/IyyPvC2Pceki6g3gyV3G5WOyqQmp1YNu0KPaMQLAb4hXGPcq3pBFrv+Hw==
X-Received: by 2002:a05:690c:7482:b0:6dd:f81a:80fb with SMTP id 00721157ae682-6ea557df57amr164578127b3.1.1730817428057;
        Tue, 05 Nov 2024 06:37:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 62/90] python3-spidev: switch to PEP-517 build backend
Date: Tue,  5 Nov 2024 09:35:27 -0500
Message-ID: <20241105143638.2301245-63-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113480

From: alperak <alperyasinak1@gmail.com>

Fix:

WARNING: python3-spidev-3.6-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dd22a1cdc78fdc45a369dcbe7d763e4d697029d0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-spidev_3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
index e3fdc435ac..807ee5b783 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
@@ -12,4 +12,4 @@ SRCNAME = "spidev"
 
 SRC_URI[sha256sum] = "14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.43.0


