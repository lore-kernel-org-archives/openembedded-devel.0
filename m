Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93780C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:38 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.4270.1634338597416528170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ZtNQKTIz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id u21so44557001lff.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mk92Mow0uvYFtoTQwx8hECbHyNqXVqFH1uF7+q+G5T4=;
        b=ZtNQKTIzRS6c9d3pCUs5lQO7QpPsmw6x3xijvIVwLG0VwJ9rvPZtyqsWZ923Gpg7td
         lPYo3M6OiBx+ECWQ2sOMZ71XZQ/IX0JlerqxBoQHXj3Wza+MjpFoV9G36xIk4YIU1wU7
         IVdqJ/gcH88BuuHfGxXWCHtSH8AgXDPV3Sx8xTYKa/52UqOVQKob4PZWnPYgyMv2ZVLr
         Vf4FvpZZJPTex+OjbxJvEtcDB6HKdlM8jtSA6pm0BqXJ8z0tc65WvkQ1sSZxJzlGZKBt
         MZzuvcN38FwO5Wg/AmaYGf0YGh+vNsPsKVYw824vosRHsicowI8QmuNePw+cUmONgvt0
         7o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mk92Mow0uvYFtoTQwx8hECbHyNqXVqFH1uF7+q+G5T4=;
        b=bTuhkFV05jEqZLfnNlEPpjtGuswkT2Y6nctOc31yFHuh0vs558G1mollzs9lsj7YxJ
         S8RjjMpxUjZTMU1lrR9JV43peii6xTzyy6Tu+dy9f9WnN6XoTu4DUucUx7Vnw4m/PbGz
         M1rN7H+lxX8Z9Prad9UPlbR2J8K2jfeiztuuRHxQ4x4s4t8uemlaGWtTpZ6SGWiWNlyA
         mp1mJniG0Sg66+G61YzlLC9Duyp6Xa+YCkHLt1brLYo8XBodd0S7R8WlUruptcKrVCnP
         KkVhL++vbnsUd0LMTM/ohdNzyqX8oA9TEobs2AQPCwyhNqdZnMQcB7lx3zDs4zbTFYyE
         Aujw==
X-Gm-Message-State: AOAM533ogbnaMcK+9wHJZCGmUIexh/JOgJ371DJqHSnabUAe7xXOHZV5
	xi3SYCLfPNebtqwO7nSicer7RncIgDtdhRe6
X-Google-Smtp-Source: 
 ABdhPJwx44fdj3Tz0GG8nYVyk/IpmwiH3sFl4tKrodIzM8DCbANoauhR4DL+/Rgnt9K3mXoaLmUaeQ==
X-Received: by 2002:a05:6512:12c9:: with SMTP id
 p9mr14668657lfg.236.1634338595409;
        Fri, 15 Oct 2021 15:56:35 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 q189sm698168ljb.8.2021.10.15.15.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-jsonschema: update to 4.1.0
Date: Sat, 16 Oct 2021 00:56:33 +0200
Message-Id: <20211015225633.4163097-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93362

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-jsonschema_3.2.0.bb => python3-jsonschema_4.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonschema_3.2.0.bb => python3-jsonschema_4.1.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_4.1.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-jsonschema_4.1.0.bb
index c7efe33a8..8db72658f 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_4.1.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
-SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
+SRC_URI[sha256sum] = "9dd7c33b4a96138dc37bb86b3610d3b12d30d96433d4d73435ca3025804154a8"
 
 inherit pypi setuptools3
 
-- 
2.25.1


