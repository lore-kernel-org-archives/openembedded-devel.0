Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC7AC6FA89
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.11499.1662276908594545638
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WfIOk2fD;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso989200pjd.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pB8pWyTgyL7zeiL+gQPMPWcSJGWXP1Sd9WV/nQeg5No=;
        b=WfIOk2fDMlxB0AuG6YIpqKNr63tdln2cZTJkuVT6uJu9q4PjtM8rR2JS86+jKgOBKk
         ZF9vCYBfBc3B+dAlIUqkzkL2h6c9fkLH5b8nOhgcYs/+oIoW/hPUGiV43N8+jWYVfaFB
         KnWruSx6RxGCK4F1zcqopOFbyuP3GLoWmorF+byDBfmbrdQ5P50wRngsB933YvXjAR8g
         8syizDRanfGkeLJKHn6RvDpW2hYpU8xzCNK8GqU4RAzSJcHWo2mCxlPuK+ZCWs6rjWei
         6fDnCbrLlSsmAtrdLR8HjgTLoi0U3b/XRrvgvNbNpdeafbwLl+XKRbzSPXd7si1zJIeP
         TiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pB8pWyTgyL7zeiL+gQPMPWcSJGWXP1Sd9WV/nQeg5No=;
        b=wnfhldo+XuQeiy7XfeLqFb7ESnjqUczl/lyVUh4vXshf62QAgYJ0pSkWWr8oYr/Zc/
         /5xUu5ArChvDh0GSLDSs75DiyYonjYMzjtCZqMTjvbQ8PE0gY9NV0rquNmFSI33rCO57
         WkssxNjNrqsc7WRr7zSHu0ZSn91dIAUROoUtGzr0EwZ10/62PigIBAk3LB7x+GHpMg6j
         YG7Psy7x700RDVKVqcFP9SQsoKY3nKXvu2IJ8F6NqDQ5YgRRTylLSNX3TB/diFxtrHx0
         txJQ59LGp1gQ97wKjI0wzVGLVyDgaf7/RRKCNhsANiZDFPmAOX5Po0MnBiwvYYw2V1JU
         o0xw==
X-Gm-Message-State: ACgBeo36qkMSRdfuWsoxb4l+5TmClTAjBA+0XSNtKSofYTtzMPWuGCWw
	yWW/YF0FF90xDpkg1KufCphijXK4wyBjhw==
X-Google-Smtp-Source: 
 AA6agR6uH+AL5UNwSb88gt7hReb2E3hbXfcGb2CO8+1R0AQEmMuGXHIH4hv//V4knGC1RBThi7rFLA==
X-Received: by 2002:a17:902:6b84:b0:172:f7cc:175 with SMTP id
 p4-20020a1709026b8400b00172f7cc0175mr42333782plk.158.1662276907674;
        Sun, 04 Sep 2022 00:35:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 46/63] libmcrypt: Suppress implicit-int warnings as
 errors
Date: Sun,  4 Sep 2022 00:34:00 -0700
Message-Id: <20220904073417.3251865-46-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98640

This is needed for clang-15+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index 50cdf229e6..a3d09c7cbd 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -14,6 +14,8 @@ UPSTREAM_CHECK_REGEX = "Libmcrypt/(?P<pver>\d+(\.\d+)+)/"
 
 inherit autotools-brokensep gettext binconfig
 
+CFLAGS += "-Wno-error=implicit-int"
+
 do_configure() {
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-- 
2.37.3


