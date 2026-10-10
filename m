Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A10CA9EBE
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 08:57:34 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5864.1791622653205923701
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 01:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kk7wgBJC;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so167926a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 01:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791622652; x=1792227452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y2dfV6ziYdrKE/Fc2n5+YG0EVjAejwGrO6yuGWLH/E=;
        b=Kk7wgBJCkGuikvfnpNcG/98SdzoqBohNK5fkHRoFYpg75t0PpyhpinL9fb1EYGGW03
         x89W05bcyzmNbnjcgx+UlVkFEOFZmwu9AAgnqJzOG8oDS+L1vOl+3JfoepCXCTY7l/y+
         rzlpQA1dxPuOElb8A050SZYJKfnw1mPBARTmlGqqCqXaSNAG3HTUlFH1/IgQFy1VauRG
         M+Km9m4PX43bq15boqVDdylZNt+H7BeEhc+teKENFW5PRdetmnxLO7aYvPH2GK7bJx5S
         xEaf1W+3cPlqL8IvjV0pamTbv3G/FEIA4q8JEX+RuuD/YezM8yAjvht9y4dJlP5eBUxr
         +q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791622652; x=1792227452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y2dfV6ziYdrKE/Fc2n5+YG0EVjAejwGrO6yuGWLH/E=;
        b=dOU8n4/PAOcXZgwO3fy/Peglxa159ky2VChh1lmj4V7YE1M5TJ66Epm7cV5L/BozoV
         IClyPdeAu3ZglTrhrj25deymoh1FvrmjlcF8jHfqp9cfWKAciiUaWXK5W4Xag3dlopHL
         EMbRJTnZdEBChR0UeNegc16V3FBR8IvsWm2uHD1DnLjbyq0F2Fe35v3p86xVeBhGVEkp
         edUyKYq4tAsN9H2YqF69KQviamg7RzAVuQqcbEKqp1eM0TJ0LUEz+ABw3o22qgD3V+wX
         DE7ydPljbcn6GRZSsbqJhVjv1pIRqS85eoKRI45LpZE/YhNpXIro2QB3jdZNoG3BNv6M
         7TWg==
X-Gm-Message-State: AFq9FYLWxbew8RkcWidCRq4vh5Hye7MuXKJCvU0q2U3bxCqgBX+tZuh+
	XZh18nGwryAbZvgq+oUiQrbgIXj68dbvoudQnVv1aKu+bdAqZHdvh6VUcGlOQA==
X-Gm-Gg: AYBFou2/cty2wB5T6FeBvvtpySycdgnXeJMAA9+DOuutPElnGkucAhVrcA7v1JkI13Q
	a1oR5oQMQ5271wQxgDojvHxTCRD8+Bwm8XGmlDD9FDoYlVgW3hq4gjPc1tjM5yr0flMiUPAQDre
	HdIg9p4LJqegviX5WRBjgOFGAmLE48PZuFfJgq8A1k2W54i7ma7jNvBdVj5CWGXrl6H5D1o24fc
	9wFAI4lCQL9DCW6SGbzv0zOMjHocYP8+PTaor2GnNJZBYG2fmeJVqjCZHuWSKHcnh9/F2BzGT3D
	FeU9LCN6dcnlCSML0oL559cFZgbBfgXNlRbGoqKLiWxwOtqNXDDJqBZSkGfyFWZvK4twYW/Qvn9
	3fmzWFc04UyFyKvMRcmadCpKdFaSg6BZbZRPjoWqMOwAcMsQfBqpYqXFva8KFyt6rHlqvrEiXN+
	jl+q1vpIuqlIC2ONQ0eHsU3khy1mR+J8EKW8WYMFbVVVX3AkvRRj27FNrQgWUSbRyztcCqlmqT9
	2kEtgj7fv/0+BxgUM6bK+KKITlOu6DqSeROORs=
X-Received: by 2002:a17:90b:4fd1:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ab39feaf19mr3441208a91.0.1791622652151;
        Sat, 10 Oct 2026 01:57:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f5509fsm7379287a91.12.2026.10.10.01.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:57:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 1/1] apache2: upgrade 2.4.68 -> 2.4.69
Date: Sat, 10 Oct 2026 21:57:24 +1300
Message-ID: <20261010085724.738811-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 08:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130723

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.69
---
 .../apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
index dc8c0df12d..fba4667bd1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
+SRC_URI[sha256sum] = "c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 

