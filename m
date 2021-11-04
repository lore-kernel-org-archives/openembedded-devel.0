Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4157C433FE
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 17:07:02 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.588.1636045622276202347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 10:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gEYD01E8;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id f5so5935112pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1f30HeLrPklkCMbQ2cexjwXnLJsTmB9QPCmDoLtQ2GU=;
        b=gEYD01E8zeUpSbNbQrz4VBjf9EICqYN+hX38pS9oFHoLaENY1sPXqex1Zzifiu7t9L
         bIJR1Wx/nYwzhR/e9SSy6+QoLfKzNXdBbDc6P6Wv4JlbWssU9d08/pxAIHBOqv+XqFZh
         1Dl4ZWE4zdgNTkQXpSrZVMaiFR/aIKFApE1XzrJDzjgr7gw132ff0GMxbvz8+ONLqX2B
         LQUSfPOh8KvRKqojfM+T7m9+B1qYrclSSK26q6TrTpWxEEL36aNbSv6D8RzrHWFSjTrl
         ovpD+G0f5tX+U7Q3NuaEKE0Glzf2GbWwXreaXat/dd0BUsNuQoDNre38WcubRXUOKBtp
         7QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1f30HeLrPklkCMbQ2cexjwXnLJsTmB9QPCmDoLtQ2GU=;
        b=qZrIEN+X6Tj7mChzCUQPRsI4TTubQAXm9X4vCh1vc6JDWidKTTnt+an3DnihD8TCJ7
         ONfHwFwmyBowh3YQP0hMNBTG9C/5DTwioYGuPqmY3A+shQ9H2DHVVofmN6Uk9FatgvYC
         RSGfF2NyMUWWYH8GcjPtpm9HfbCZcuC8HPgz7GOADvTVvu4f01/bt3iFn+fGXZ6T65IV
         zECEV3AGTmui7sDsSZr2xlulJmwPASR2M8DSCEyuOz1fQ0WApZ6Rma2BrQ3GYCE99Ot8
         gm9SR8Do99fifAiCXyRi0DtimwpjcCZLem7eElZXvGf0uV1UCLMFU+nNyjhF/AIjtGOU
         K6Pg==
X-Gm-Message-State: AOAM530mR2BhRF+xzhu/wYmHZnXUre4cxSghbPIqCCHD4kv6SgS3JDkG
	lpqCdxvtPbkaKDeVJBWNgkaaS9caQxA=
X-Google-Smtp-Source: 
 ABdhPJyQDLTwtIRtFk0KKuzYoOLKwVf0zTHekiFURHPU6VuU1WZHewKbOwmrW0KrUic4IH+vJW4ZRQ==
X-Received: by 2002:aa7:880a:0:b0:481:260f:d529 with SMTP id
 c10-20020aa7880a000000b00481260fd529mr20256423pfo.20.1636045621339;
        Thu, 04 Nov 2021 10:07:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 c9sm4271749pgq.58.2021.11.04.10.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 10:07:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] ntpsec: Disable seccomp on musl/rv32
Date: Thu,  4 Nov 2021 10:06:58 -0700
Message-Id: <20211104170659.4081709-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 17:07:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93822

seccomp on musl is not fully done yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
index 1e075b0971..a0d8871ccc 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
@@ -26,6 +26,9 @@ PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'seccomp systemd', d)} \
                  mssntp \
                  nts \
                  refclocks"
+
+PACKAGECONFIG:remove:riscv32:libc-musl = "seccomp"
+
 PACKAGECONFIG[cap] = ",,libcap"
 PACKAGECONFIG[leap-smear] = "--enable-leap-smear"
 PACKAGECONFIG[mdns] = ",,mdns"
-- 
2.33.1


