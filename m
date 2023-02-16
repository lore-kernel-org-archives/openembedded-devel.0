Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2ABC678DB
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.8632.1676550485411512169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m05G3ucX;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id 5so1825224qtp.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10KJ+qCr8ThUJANza7UP0e+8nAPg9yLVTktRVHYalCQ=;
        b=m05G3ucXVsq9u46BdUqIuJwTSj0za5DA2pXRDr0Kq3lnD7dcIMGhyVQVKoK9s2VkFn
         z+AsbGB2weujrIzgUsLWloJDQgBxOHfAwsU4RMbQ/l7ufakwn++mk5XL4JY2UC3sA35q
         Pm09cTYYTe9f4wVbA5PR9WWYvxAAwbzTkOHnPwn2sUFiImDEpJujy8nDtxiHRsctLrgx
         dabOGVACeVtvMxumTFCYZzdhogfLpD10QeHFhAHC5eQlRkiON7bm1RigxJALiQCBhJ+K
         4v8zk+6tQZzuPQL7MUFEpJKzQt+hBLRR4j3dzCRHdBN9JdvfZshhXU5ewvVmhwJbovpx
         55Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10KJ+qCr8ThUJANza7UP0e+8nAPg9yLVTktRVHYalCQ=;
        b=slIqneuQl3zxRyODlfTnD4w0yUWZMJQF+bqGWSIf4PN7caE5fbFYXEfLA+UDKjVrbE
         uQBa4ddkHXS3UGJYSP1RVeY0s4xDcs6a6srfoOcmjLS41Pve8GUNZG/BTTxKx73KxQ6z
         1vdYHpMTRhHi/OAC1BVhBUbhYhxGi969/pqHfzjNNstn8s90KcPMlQcpgSQYRO6FL/ng
         G1o4ZtOASfL0/uAfLckweY5RMC2uaptLkhWEzZQ8Nqz/GVl4LZqTUbVkl/Cz42ZwLhhV
         IVnlAVQ5y1WMxRh4xn22ONmxU2dwtamFQlUd8/1n4TLPwF3OUgr6+dpJold4MjKV/Knf
         2fcg==
X-Gm-Message-State: AO0yUKUi67DHs5krqO/xj/0L7tuipGFrHcKyp5shfe358KutxduHkuRQ
	I2S6tG8zyifwPboIWyvo/me+epkOdIE=
X-Google-Smtp-Source: AK7set/BhqCokTTbtFzls1Q7QMxhvyItwVz3ngE1f6URnhyOwpDzdYWcibh1SAMicPmlZ12HhhWDxQ==
X-Received: by 2002:a05:622a:2c7:b0:3bb:7702:97f5 with SMTP id a7-20020a05622a02c700b003bb770297f5mr9949172qtx.15.1676550484341;
        Thu, 16 Feb 2023 04:28:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 07/15] apache2: upgrade 2.4.54 -> 2.4.55
Date: Thu, 16 Feb 2023 07:27:17 -0500
Message-Id: <02c53492ea4085ba13ff73063d6f9144dad5a627.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101109

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.55

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cba6df61c7cbc4446aab09eb11673bcb6c581307)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
index 4f30eca59e..88cef0ef83 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340"
+SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


