Return-Path: <ghislain.mange@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E093CCF6D26
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:30:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.7342.1727875814269135135
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n2qFX7wP;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: ghislain.mange@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso53099085e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727875813; x=1728480613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdOG4vCE9aa/dM7vLv9sNVT/karAs0/WTGxI/s3joew=;
        b=n2qFX7wPZPuGxbmrE1a6NeRSVu+dQzHAN0enRJ6EtQ4WcHFtvMHw3MbkxAVlC8AOPm
         /SfEVu8rgaUKcI8kNo5Y50fRCm0Ub4zhfY8s5/zMk9W7PHbbE8zbTNkVoisnmkeI5YLI
         mcXlPDwM0wB1peQOF14znwHE++f7o/RL0He0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875813; x=1728480613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdOG4vCE9aa/dM7vLv9sNVT/karAs0/WTGxI/s3joew=;
        b=ZZZPrB0/II62j6WCPqh9qkdrv2WHZqhZkVssB+9NAJPgl0LT0VC+LeE901iJEIoKgO
         1/q0q9MjFsSfgJOOPakloOwluLJIPOL+Gn+WZuYF7aDVkGIUZzXJ2ygkC/uFeCvRx2tk
         mqWgHv6XltN68cwxeNQ4m8cMuPFAPN9dHUk1FdXirlz1RFZ6IMOwsstnYpXNdYB1lsWS
         wrOVNftwtSIx6c8j7MrOJIUZqbFlV77Ky02pDK1lbEgtccVNzg6a7G9buwdx9mqBwSDU
         2ynPbKdJT/+n5VV6CE6lp4J154AXwpOjC8oX1860bFTvYEvR5nY8LLM2ZRll2R6cbTPm
         UkTA==
X-Gm-Message-State: AOJu0YxKg4zeIlDYNju0DCewrYu92DvtG16Wo5bvZUOxcCdhbeCdVkpe
	vvhaisrroxBOgJrRnlRrPZsA3ET1uxONoy4UfL5z9QrB6+ey3o0JoumF6roBGzRj8mT0xoZQnfz
	kZcFNTQ==
X-Google-Smtp-Source: AGHT+IGTAztFevDcNM/Ct3/k3SCdEapRrUWnmGhj51G6N1NJYriAXdPbn7BsqtO1dF6SM2DNNH3tXA==
X-Received: by 2002:a05:600c:3ca5:b0:42c:bd27:4c12 with SMTP id 5b1f17b1804b1-42f777b7888mr21269295e9.10.1727875812606;
        Wed, 02 Oct 2024 06:30:12 -0700 (PDT)
Received: from FRSMI24-FULL.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f771c1401sm15424805e9.0.2024.10.02.06.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:30:12 -0700 (PDT)
From: ghislain.mange@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Ludovic Jozeau <ludovic.jozeau@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] wireshark: fix typo in PACKAGECONFIG[zstd]
Date: Wed,  2 Oct 2024 15:29:46 +0200
Message-Id: <20241002132946.1834515-1-ghislain.mange@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 13:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112641

From: Ghislain Mangé <ghislain.mange@smile.fr>

ENABLE_STTD is a typo, correct option is ENABLE_ZSTD.

This patches the following CMake warning in do_configure:
  Manually-specified variables were not used by the project: ENABLE_STTD
After, do_configure does not show the warning.

Github issue: https://github.com/openembedded/meta-openembedded/issues/845
Reported-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index b80710683..3fa293d0c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[sbc] = "-DENABLE_SBC=ON,-DENABLE_SBC=OFF, sbc"
 PACKAGECONFIG[libssh] = "-DENABLE_LIBSSH=ON,-DENABLE_LIBSSH=OFF, libssh2"
 PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
-PACKAGECONFIG[zstd] = "-DENABLE_STTD=ON,-DENABLE_ZSTD=OFF, zstd"
+PACKAGECONFIG[zstd] = "-DENABLE_ZSTD=ON,-DENABLE_ZSTD=OFF, zstd"
 PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 
 # these next two options require addional layers
-- 
2.34.1


