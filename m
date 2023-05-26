Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC45C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:19:32 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.2449.1685081970519516369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K+L3LBSj;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d3e5e5980so713450b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081970; x=1687673970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K9Y3UZeAIJXkEbOSnm9W+UZtBRGq9XNUYQTsaaB0pI=;
        b=K+L3LBSjBfmkDT9Nx3+mqxEAfua64GOLeHNpeXidy4XI0MVRkGUaroMsq2hcYOCZRP
         WkzTJT7kJB1cgzfycdrB7be7XA9jkle78Iq8F52f/P1wRZstEzGkZTqx/Y7foVTUgGOB
         UDjmWus1nYDDR9QBAbH/0A6H0+Ra0KYe4cz5rN6VW1Sn/11nbI4K7OlyI3MzUY+9eyN8
         IFl7WI8ef/ITH6aEBLcoK0CDyAXt+aPrSWQZOrH2qIOwGgUJEMuf/UR55UmWa1+v5iGw
         ydNSQHIDx2wEjdyebmwK5GoWgZVjwgO7vLyZRaDgdGSHVDACuJMB2tiCvhebWpC3Rvpc
         u6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081970; x=1687673970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K9Y3UZeAIJXkEbOSnm9W+UZtBRGq9XNUYQTsaaB0pI=;
        b=GoNA1VsDrJJy8b/5B7dK+5FjNSqi8wGJ9pVSikav3LisOxrCIKqTyhtHQlVYPwVtvR
         P1zUHb3TOwBRO5ZKUKreBM+Jln4O5f/74p8P4B3Uk1xDkQQwVK/0L7ZbcnO/eITBg9c0
         SGIeOpMedrOYSwAiLRwHsDsclINnuxRYzxgtI4ZvbAPhBR01ioWVV72o+fzitJ/DgecF
         RZDa95bEa1eojRgCpmzABMuIpacg8mPku0VN6ahxmSuaDJE3v8RBx5sq4dutrvLhP4v8
         FlMui10PuYTiW34hoEwnZp1UVyXLJTKC12B3uh0DwYZmxw2fiJFV3Q4fAKjaFkeFNqr0
         FUig==
X-Gm-Message-State: AC+VfDwInJ/+kc7myr2YagGevWseXM+JypLxz1k8raMH8GCDzmXWyKPW
	0mWwmN3IeRHPBHCRZJEVj9PO7+L/8hQ=
X-Google-Smtp-Source: ACHHUZ4be3ycJytHLAL99f5gj3Dvv4sG804UMqO9JS9U+W1jplv+D/XQVIyjn1ZEIm7BWxu1+ivoZA==
X-Received: by 2002:a05:6a00:2e22:b0:643:9ca:3c7d with SMTP id fc34-20020a056a002e2200b0064309ca3c7dmr2479212pfb.4.1685081969588;
        Thu, 25 May 2023 23:19:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id k6-20020a63ba06000000b0050f85ef50d1sm1885427pgf.26.2023.05.25.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:19:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] sgpio: Pass CFLAGS to make
Date: Thu, 25 May 2023 23:19:22 -0700
Message-Id: <20230526061925.420351-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526061925.420351-1-raj.khem@gmail.com>
References: <20230526061925.420351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102866

Ensures all compiler options are passed to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
index fe2ebe4ff7..9b25745ed6 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/${BPN}"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE_GPL;md5=393a5ca445f6965873eca0259a17f833"
 
+EXTRA_OEMAKE = "CFLAGS='${CFLAGS}'"
 do_compile:prepend() {
     oe_runmake clean
 }
-- 
2.40.1


