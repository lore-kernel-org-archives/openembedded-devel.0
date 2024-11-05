Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B92D33A5A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.27832.1730831897553066167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h6dUnTsm;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e377e4aea3so48137647b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831896; x=1731436696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN3BfmRmM/mVEjNmMMYKv0apheq3LsmrNV/4/Rzx8hs=;
        b=h6dUnTsm/lF2FaM/hylbYX6Xh2gev26vXNFmDtdS2Cdzp1dnpmy6IgNYE4b5KyJVEx
         nAI7OD4MduiGKB6HVQQbhnDH9wicI4NjGvyyRP4Kx2/Saf3iLRitaxRW/eO0HrNIdguf
         OlGW+nXvbTeYIvfLxA0Cpwi07rtgC3HCYDmI25ct/F0ThGFc1KjzlzblX8FFTLrMM58s
         kDRFoWSFrbgm2eMqRnFKg56EeegGr4vmh8t+LMtdht5SJm5nhWTQ7QVtb+iDSCjjv0mY
         mAXmJf4Vc3xmfbixfGb50BblFiuyelvLzEt/cxqz33alung8WOtby03Jk7BpWi671Liy
         zy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831896; x=1731436696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mN3BfmRmM/mVEjNmMMYKv0apheq3LsmrNV/4/Rzx8hs=;
        b=UnpFCN06XxhLTx2DehQoaJu55KK3YKZ0Db9vD63zsM/QSixp/7nIRwToc25rt0sNYQ
         lMs6ayoWbidAJTCdnzNEKPhcI8SclnTBxuS0uHbesPmlOmfWrqXtnycfVOyh1nSLRd5w
         k5dq3pvcLYhJHL73ECCYDzxE2VgXrA8AuFfxhetxQogyAes5Sk/CFmD8w3BkoQa51zlW
         GuPQqzu2LaivT0IAXldbADFUuwRTf6+L9nMJS/ovNOHj7ZjbeBikLViXtwellXeF17yI
         83NB+wEGRZPFbRi8ZIjAkZpICiaESpVJBpegKj6wSK88EVajLUmai9LpY4CdSiQQA3Es
         34YQ==
X-Gm-Message-State: AOJu0YxXoEfSIcULyqAzlrfNgRSVKlpiRMV8qwaX3AFRhph5/Flk7hyo
	oVv+GrgKyhV7PZrugoe7txlHXKYLypnJqAotzQA+XROIKntBVulGyG3Jo48P
X-Google-Smtp-Source: AGHT+IGtp2JpH+u2getO+y/U8Tp5s4BX7S/4jERnYpF3Yz1lkkogtTNpF6F5v4/X/Eu0IqyuvO44Nw==
X-Received: by 2002:a05:690c:6413:b0:6e2:1b8c:ad28 with SMTP id 00721157ae682-6ea64b3742amr191461847b3.24.1730831896223;
        Tue, 05 Nov 2024 10:38:16 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:16 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 025/161] libmcrypt: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:01 -0500
Message-ID: <20241105183658.34982-27-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113540

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index cfa056d71..a04fafba5 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -6,7 +6,6 @@ DEPENDS = "libtool"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcrypt-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0821830d930a86a5c69110837c55b7da"
 SRC_URI[sha256sum] = "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mcrypt/files/Libmcrypt/"
-- 
2.43.0


