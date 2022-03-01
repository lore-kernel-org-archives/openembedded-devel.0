Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7B8C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.2273.1646166855582150798
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J8Xftamj;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id p17so14405087plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2YR9UxhuXhC2PVjwT+SGxdk2B/Nd3fbwgYjBh33CQs=;
        b=J8XftamjikxRioGP7TFlB9anNxzOdpHF0BdKyXnuJdfS6UgXeYri62C0qQfiQAEAis
         4db/i3L6UJepylq1W6TDumGbEch0wudL/t9Yxl9Pe4iGeQtfw9YJO1cJQ9f9IGI4t8Nx
         P+L6NFmMCL2o6PORkN2wB3TjkSAK6xwCUdWibuAgK20pkSCJCWuTPY8LsqCgy6UVmfWs
         yjp2vNrPAWGQXBxFlvT2wjFgAwMhuzh00Oarh+HELcjZhxkI4C1hC2H0aYfyAorb0ixy
         ZbIVIQHGgiGopkOA4sJpEfQWIw5NlJ/XzaW8q0gWgm9FZ4eh77HZ/X/y7GrmdRxwz0hx
         pJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2YR9UxhuXhC2PVjwT+SGxdk2B/Nd3fbwgYjBh33CQs=;
        b=lzM52TMZP9glHm+2T78ZlNJPK5rlJEVm8CTCg2y2DfhtCOfWD3n8+KE0fTt91h3Tb4
         PEaa+m4RuF8PECNSz7Ftij+NRWxlhgS+jEr4tJWVgs8N87ticEfvbT1G1bYmSqabdb7m
         LN0b+YamV6QeHR3K48J8cCxffE1IpvBDPZQR7Xn/WtiwsR0TMQZ7EIDN0g767Yg/wo4b
         8R3KJB2uamKb83UffZwWrvM1slmXxbLY7AeZQYqEQwbIG/jKpIuVdP9C4UfmrUnTxwX8
         cWBX5tgvsszg3hQNI6Zd0iXmvb4I1mAcf54lq6ygu0ZYU/yyQUR9hBDhGhNBxDmJZ+Xi
         IFQQ==
X-Gm-Message-State: AOAM532TlRkUAymNLxZt8VJpirfrSWWR9PtNm7Yl+96cur7mt6rIPUT3
	LAF0wfURiyZ1EFS4+vrsTh/6f7WGRlo=
X-Google-Smtp-Source: 
 ABdhPJyzflxzFSPoUF5Tlxz4XrfCnlI2WcfEbqHDvqlq3ijjQr931IUwXiry0P3rfBplWRYTNECwVg==
X-Received: by 2002:a17:90a:d494:b0:1bc:54d7:9e80 with SMTP id
 s20-20020a17090ad49400b001bc54d79e80mr23658422pju.4.1646166854740;
        Tue, 01 Mar 2022 12:34:14 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 9/9] python3-aiofiles: inherit poetry_core
Date: Tue,  1 Mar 2022 12:33:54 -0800
Message-Id: <20220301203354.3839755-9-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95656

Use PEP-517 build-backend instead of setuptools3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
index f7a75ec1ef..d3bca2c213 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a
 
 PYPI_PACKAGE = "aiofiles"
 
-inherit pypi setuptools3
+inherit pypi poetry_core
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-asyncio \
-- 
2.30.2


