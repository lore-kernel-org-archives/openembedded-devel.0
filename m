Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4D4C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24410.1786747653191594510
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U9xPVo4U;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1055373a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747652; x=1787352452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb1j0BSBFiQiXV41ummBy0qcWB63d1rwVn/VekIy4yw=;
        b=U9xPVo4UBrs7xCnlbgZKoQlPhLbUkA/ZBUjzZHIqaz+VS8uk3xUp7+2U8QyV4RjBTr
         zmRGVHONcbWHxeAv+1LJbj3Q8IcNTl87q67NLaTnOI/FZSvsxdmSFPNLGgZaf04ITjQq
         2/xZ1FOt2tTPyvTCkJs9oNiZM396YyCU8y3W/2y+8LuThemCgmQx6KMQZG6F5eTN7l6c
         9wYbrrSoyYWfk7G0eKKLhjN0bpXmeIRaAQUpumEyynMsn44OvSji07yH8HB6R59x/Op+
         AyGvSVa+xMdMGvai2RwV1ajCrojLhOUMD70LxbZiYxPYGLEdna7x6hCtM6u9sXCm+YWh
         gamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747652; x=1787352452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb1j0BSBFiQiXV41ummBy0qcWB63d1rwVn/VekIy4yw=;
        b=UodMOMOUEf+yjuOUm99RWRSdRAl16qJ/ytxltl0Ny/i1I2ThOsVrBvwLVwG/CXJIPv
         OFyJuYEcLxgivjEYuIw97nsLz+Ja6s9STnRiZIPnrIQaVErxm62vyjwqPyq25Ep9aqK7
         jo4a5dys7H9ICoZhEoYGnaZG1CezPlFWaMNg9QcX1L45wDn4gypDsALN1T7wGRPQrwyX
         /I65bdHNOaIZk5Gj8zpMzf4ttIRxOQlzPSSbVAaQi4IuEBNE1m+YZKBPYA1K+fw8oV44
         QBlvgKMZR5Ni85IgM91l3UGKcVKl49WtcYlgGZGXVlm0meTva1IqKDBCVq9xSU+JQSGv
         BeJg==
X-Gm-Message-State: AOJu0Ywg7RDXQklRhllzs31uEFCc7WzwSBVFteuqsmkGHvigiHpufarK
	QU2OzIgf7CHZjlF/88d+k66SsLcKwOI4lLOZE53IriRvpWBVuVi8gJftezDf6g==
X-Gm-Gg: AR+sD10MPTqCTr+H1pxHYsjWconbAAwwZjO8eaZ9fdSow3qEmst8p5vfFfUMsfig8pH
	kGIleL6ZnW77dtxHvHwOHKHZRqblFAfsO26jkIOu+DQqzZC7KwTPVSaU9ZuXzHeF8tqXbwr1j8x
	36AGKgwleLhDJ9yoCS9sIn1GuAyd99QROcjZB+a+1giwcv05IOlY60jUI7mHY0Mgs0Tav7SnZpG
	2bSRi8vAGG8T3LUVJVE5HOaqQDNhJ2Nq7vsw2DxV2AIpfCdngxwRu3p7S2/hpoj7FLieplZcYKO
	g2ZqX9omSee8vX874mnzgyrl7ivuNumznFjfXHUPqKo0F8MAu3Y+dUEFTFEuvgF2KAJRYMgiwde
	MrTNil4k7F+2UF84bLGf9wXTC8GPxhUeoLN9tggaPz3J+DXbAGznZooBoenjROtD/a8/TLKhv1o
	/XiwN6KVaUl6EB7aostMeJzm6W+dnuLVC7PGYs9rkI+CoShbQcW5e/OmT5bjRw/8J6yJB43cWnX
	mDJzSf/6zhJ90UvxyQMp3uqYHLyUb5DK8OSTW8mGu2mmeXGjvrxHx3Vn83pBINkqtKssPdnlIj9
	8RXvdpOMu1oFawadfNdG5EtYc3w9/pQY+yVDlthaKFPVc8B9o90vIbxve+9ISviPuvhlM6MQI91
	yFoP+nfO5G9Jf+Tbg7M0VpccpoCrrztnvj2GSz7szdad0EQ==
X-Received: by 2002:a05:6a20:d705:b0:3c3:7cfe:b32a with SMTP id adf61e73a8af0-3cc71de1afcmr11383930637.27.1786747652601;
        Fri, 14 Aug 2026 15:47:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 093/109] mbedtls: upgrade 3.6.6 -> 3.6.7
Date: Fri, 14 Aug 2026 15:45:19 -0700
Message-ID: <20260814224539.1523174-93-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129157

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mbedtls/{mbedtls_3.6.6.bb => mbedtls_3.6.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.6.bb => mbedtls_3.6.7.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
index 71d0a8d8a7..058710cbda 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
            file://run-ptest \
            "
 
-SRCREV = "0bebf8b8c7f07abe3571ded48a11aa907a1ffb20"
+SRCREV = "068ff080b369adfac81509f9b57b2afabaf82dc5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

