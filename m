Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E265C7EE2C
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.122289.1683008400998615192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rV1NWtZe;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so3903047b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008403; x=1685600403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEWRQhmlO5NKRjui1+3D3/Gm9mT0UJD+VSPzvJj8LK4=;
        b=rV1NWtZe5uNzB6fT7/DmbeYIFxoxEiuslbG8wGfrgqQSAkg5tdZUHxpqObhWui66Qp
         C/Ujd0CCsGj7LoXD8d8IpRZWzfZzXG3FzeJNdY+NH8NROoi24R3MYiv1iR0PwuDdfyTB
         5mz/e2Qj7rkno4kMUgqypCYWMiTqSuGMdpMfQ0MNV58UWHC6IJWHSq+hc5EORn7pJlQT
         3mDl8rL9Motg33Oq7TY7VQxAISjyNo1m6r/kfpLNUAFu2a/WR4oSzHaCaouGipEaw263
         dkDY4vBjYaJ73iz4rGYfHA0JBdMYnU66JhbQalf9wH8FaGdRRkGLy+NUJhwv/UZhiTJ2
         646A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008403; x=1685600403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEWRQhmlO5NKRjui1+3D3/Gm9mT0UJD+VSPzvJj8LK4=;
        b=d6YXOhTSbV3J79owEWY1wv3ISW2O/2hc1Xcf/XrmERo0NAv5p0LWRfRUGJrfqkO8xu
         1Gjs/0a995cNROKxs2E1KavrXDQ+afTyenMU/2WY7pHDBt/zvzyJ/S5cvDYfV6WK4vNc
         ExNqhL0ZhtJ40dQVPDpgqF6qcF047WDtCM63hxaUl98ceug6vl5refs1T+44rxldIpeL
         TfJOR95TgiTLzeALfOh6pXKLhQS262wvv9tbcjpj2e+X2GK0FTOBIJDHhHGd9kqRP2Th
         Rhjzcx/AAL5ENHByAHp2/ZlGGvbid89ennOAClcw7aIgN7QKNk5ZlzSyb6OXRD+sSySV
         WPqw==
X-Gm-Message-State: AC+VfDyH5Chopm+WQqtbY7HG5kV0bpEwA4sxpmcXbRHUvK4MzquJPpXu
	p1gN+uSgxpPfjzhtnP4oufQ1OXWQtqg46Q==
X-Google-Smtp-Source: ACHHUZ6UCtaHmz1JqYecyJ0mZBVkNBUc+hXPZsioJ73oFWuoTFxjlUXR8VI0/ahKeEnYtD+50UnMDQ==
X-Received: by 2002:a05:6a20:e185:b0:f2:895c:ccc9 with SMTP id ks5-20020a056a20e18500b000f2895cccc9mr17688353pzb.45.1683008402685;
        Mon, 01 May 2023 23:20:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:20:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/11] ttf-gentium: Switch to debian archive mirror for SRC_URI
Date: Mon,  1 May 2023 23:19:53 -0700
Message-Id: <20230502061954.3782607-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102256

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 5e355eefa7..eb13b47b56 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://OFL;md5=33a5bf7b98a9c0ae87430760ba762295 \
 "
 PR = "r8"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
+SRC_URI = "https://archive.debian.org/debian/pool/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
 
 S = "${WORKDIR}/ttf-sil-gentium-${PV}"
 
-- 
2.40.1


