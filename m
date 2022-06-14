Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F99BC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 08:51:14 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.3927.1655196664557288973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PkWQGQTk;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id bg6so15916440ejb.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sfu7LJn4QqEhRXaRaSMeaxr7dsYUj7pOuMDTPIZeOus=;
        b=PkWQGQTk9lMAt/TUi/1m4CdiBBxRACBZEeNU37/eQDxnhGPxy02F7Prw4azraFX4IJ
         UKjg231lVRw0XJFRkDUuix1UD0kELtLRNxZqqaCJKDFXfZY6KR3WKyXcVfx3RECzJSaq
         vqAFEvk9ZmSv7D+I3ePssn7y/Bw3E9/JxHVSBMcKcVv+1GlvH9j4I0EsNiM3a+bR7ca2
         aawj2AtkABUjR2vqX5t7diSSNHW3e3E1FjAkiNK+DMK43DSBn0dcpE/4FLR1NcnZONid
         +AQRV9YHeNw9offt8R/u59qidIO4p1prgLv/8NtcU4MPz4p/eN3t5Hp0qdcKydgTfkpz
         1AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sfu7LJn4QqEhRXaRaSMeaxr7dsYUj7pOuMDTPIZeOus=;
        b=HTzm2kz699p0xPK3ZlVBMJ3HkRp5eeBqe3evhq1anMC1w8l1zMXTc1PiECbx1YfAX2
         IdPwvyWKTQbIEWgCK7XRCu6Hi/dAm5i5w/bOVvJo+AYQMqA2cFg0Z7d7f6f97KfOsC63
         cJcuHNj8duYpWhIz3OSzvAdwz/1pExO9vL9W76X6yboK1fDphYWNT2IqsZF7MLksubFQ
         ayVfoGfcR2Tm5nenKAj3CIxN3dvaO0PJIiOP0RhlkuEawI39+yi7a7HUVbHBIzPVphp2
         gF08iCt7TNeGog8KmWMPDbUJ24SQRNi8VFFZ144Y3SvlXY+ho1ChuL4SE44rE9lstLr8
         ByHg==
X-Gm-Message-State: AOAM5303voSKiF4VQDD/OQXiW2xKDKZ8DoELjCwFzqT+QKHGUgJz7cdy
	KK27MbWeM6KLPw1CJqxW0agTiQ1cxGM=
X-Google-Smtp-Source: 
 AGRyM1uC83ISgByPq1DYCVd7hsDeRVo+RfwT/esZlm5N8711AkBKGD5EDhhlqKDfHEOud8qVWArA8w==
X-Received: by 2002:a17:907:7f8d:b0:711:d8db:2714 with SMTP id
 qk13-20020a1709077f8d00b00711d8db2714mr3249146ejc.63.1655196662855;
        Tue, 14 Jun 2022 01:51:02 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 ge9-20020a170907908900b00711e60256cesm4743603ejb.196.2022.06.14.01.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 01:51:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] grpc: switch from master branch to main for
 upb
Date: Tue, 14 Jun 2022 10:50:56 +0200
Message-Id: <20220614085056.2521246-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 08:51:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97511

* hardknott and newer branches don't need this as upb repo was removed in:
  commit 15cff67fd6cdb34e3621368fe9ce94a98356f27a
  Author: Anatol Belski <anbelski@linux.microsoft.com>
  Date:   Fri Feb 19 12:39:55 2021 +0000

    grpc: Upgrade 1.24.3 -> 1.35.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
index fa4cbd0b47..fa20941dfc 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -15,7 +15,7 @@ SRCREV_grpc = "2de2e8dd8921e1f7d043e01faf7fe8a291fbb072"
 SRCREV_upb = "9effcbcb27f0a665f9f345030188c0b291e32482"
 BRANCH = "v1.24.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
-           git://github.com/protocolbuffers/upb;name=upb;destsuffix=git/third_party/upb;branch=master;protocol=https \
+           git://github.com/protocolbuffers/upb;name=upb;destsuffix=git/third_party/upb;branch=main;protocol=https \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            "
 SRCREV_FORMAT = "grpc_upb"
-- 
2.35.1


