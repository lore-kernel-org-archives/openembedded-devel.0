Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.956.1632338557486336657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V8/hOQFU;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e7so3809408pgk.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2aygg3h04lq8qdqz6ha4uOeGIpAHDGraKpYqbccA1B4=;
        b=V8/hOQFUuM6yh6h+Z/PF+jnDQC0nBzsZ+rS0srigvnvPXDefHORTSZH5YoaPngnoDl
         9+MZVncFiwCjbYQrEpLCmPj5HlnpXa6HSuFAbFnjCy5CFnl+CXcKXxoOwIyTTHICxjn2
         iN8AFyGqwOkU1juHqNK/GxQ2gtqBLrz0UbHvlAkqquFnOk0pZdO+NcnQi1b9PRUYGGYI
         zvk11xeR//UZGfh5n/h41Q7RImdvScTQziT8/+vyzDsXeGiy0yW0M34MvjRiSQpLZu4+
         fWlZwFb7TjeArR9eMbsbbIkTPpG8ATfuAgrR43c9sQPgMNL94IfzAMP3cxWqH1e0qPPp
         iyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2aygg3h04lq8qdqz6ha4uOeGIpAHDGraKpYqbccA1B4=;
        b=bs7B8luLOzGg/0GoViYuHFxVRzgh326B13u2P08neoE8O5T1WBfMTotHiTXOpuz710
         Gmmzg2fDde6IPwWA5U4ZQ37LPPhrB+q5WqUpbP6z5yUvsiZhF9qzP106AylNFkSrNdyw
         EJflMQXEp4wgq66OW6prquX81RPUMFEzgnSrv7M4R9GqUNakLP0xDcsaiQMwqYVI8hQ8
         BumnKI+ex9ZI8pfV8bAExbW3Nsunx5HSol3oAP3i18FGepBDTXjO/y4oaQOO6tBAKWX7
         DF9NodN2FeJ8Jg0ZRDipuXzbvq6r4HiQNbYYmn6TyrEtaqZ1hiTutm412jup7twaM83P
         EXLw==
X-Gm-Message-State: AOAM533VfnrhyF+F0YlmHu0Tga6T5wNOSst5EHu39sR9GhJ/BMDXj7A2
	Ri78JYbRE4L7DHLmiy9YnbQtBvoADnJsXQ==
X-Google-Smtp-Source: ABdhPJwP9Fqvy6B07pHOJPzIsjdTbRcTXznjVf+vfNc0mYwEqvsaqxS3yFxFcCTzUdfPpKSk2db1Vg==
X-Received: by 2002:a65:4147:: with SMTP id x7mr478790pgp.23.1632338556799;
        Wed, 22 Sep 2021 12:22:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 24/39] mpc: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:58 -0700
Message-Id: <20210922192213.3062719-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
Did not find pkg-config by name 'pkg-config'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
index dcfc3df0bf..32ec15defe 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE = "https://www.musicpd.org/clients/mpc/"
 
-inherit meson
+inherit meson pkgconfig
 
 DEPENDS += "libmpdclient"
 
-- 
2.33.0

