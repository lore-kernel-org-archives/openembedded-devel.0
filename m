Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89148C4167D
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:27 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.23279.1668873504419410909
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IQJDUKHT;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id jr19so4948667qtb.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDlEtPT4wCzA77nbtIBakRThxVlCkQ0bCIU7r8cD28c=;
        b=IQJDUKHTVf48dnmuqs7iKFl3rfWXIU06prSyZ4q/0l9+Cy4m+UCg3cw12si8xPvLFG
         viJQDQC+VjtxZ8vZOe3hlcQp4Zv5D++CSJ0AMeqibuM9L1ef1Fj80OvvnV63UrnREYOt
         VQ36PFzevEQLcmrXbyHzDXovg3KtTk3MD4Av4X8Wggn7CnY1aFbNVcthzPEVdAuNjC4r
         KHTnKZIKbvqDl2W78HZMgnb3m/Dz1IFfoUkt5logiBuTu10m46T+AGnS5EnV6VUse48k
         xdmA+IfHjJtl3iDqY00YmBFWdQxmwx5IbrutaOR6tM/hq4Gy91c9YSiPLE40RxtA0WG5
         DOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDlEtPT4wCzA77nbtIBakRThxVlCkQ0bCIU7r8cD28c=;
        b=DWRXy90ID40ox1vQZ6+xlQVnJXKtF6p4CEfXS5ri/xt66Ug8jwjy53uc1rwOndKIWc
         2qDSHRtPP2dVteGYV8D1T6XkSfq1qVPpx/P6He3+bnJ3Fy+0L4tS/dkKiVroS0OAJByV
         oojXwQjRawdr/18ZI6K1jbw8plPt2U1D7WGkm0uBntZir7eMf8jnydRKphl+KIia4MfR
         JlQIB7KMIy4zHGMM3XuAdHaBtCbKu5qw4urNkE8dPsSOLdFG+afLAsuGqbI9e9Yn3IA0
         3NRPh9/lpVhdOvOS9uksOUwQBUqRrEDDoIgZ0qA2HtOB0CkWkQ/Y6Z5+5Un8wVYhFYuj
         5IRg==
X-Gm-Message-State: ANoB5pkusocqqEG7RKIQqv2R3wx/qedpQthXxcI+VJHedcF+jNYS+tI6
	r5DeXySHSeZLf2MgUqbupW9pfgNo5Ouqzw==
X-Google-Smtp-Source: AA0mqf6TQ1koGCmlZK9YCC9NB7zyUCBVD7Fkn8rq9QsoNGdVfuIJ45JB4ueSNfLVa5nVBCb2BWdXPQ==
X-Received: by 2002:a05:622a:5d92:b0:35c:ea7a:fcac with SMTP id fu18-20020a05622a5d9200b0035cea7afcacmr11286966qtb.172.1668873502708;
        Sat, 19 Nov 2022 07:58:22 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 14/35] python3-google-auth: upgrade 2.12.0 -> 2.13.0
Date: Sat, 19 Nov 2022 10:57:38 -0500
Message-Id: <0bface73cb739452278397e0dfae6f93f5cd16c8.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99653

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0789ccf0cb8a958bc1949e90f29414994912949c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...hon3-google-auth_2.12.0.bb => python3-google-auth_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.12.0.bb => python3-google-auth_2.13.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
index 53c1d00ccb..9e4129b6b6 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f12d86502ce0f2c0174e2e70ecc8d36c69593817e67e1d9c5e34489120422e4b"
+SRC_URI[sha256sum] = "9352dd6394093169157e6971526bab9a2799244d68a94a4a609f0dd751ef6f5e"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


