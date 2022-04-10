Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ED0C352A8
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.21469.1649623262133803263
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=s1kyMu78;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id p10so23304567lfa.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UcoiEg+o9AoYABV0wTHEiLuEMWoO17S6vciI14Kt5qQ=;
        b=s1kyMu78do3l6sxECVexZ/SEN6zC7/q8kUkrqlnk6fKen7taNz9kLnVa3xcKoFUcIz
         65MBaFQCZk35Aw7Po3KpKkZYZt8LJRgbEjE98RcmQ9DATh3clNhhfco8o49pc+RZkXev
         Ex3/XCxNTMtyBZfuRTExnDt0OaRoLwsPGQL++0XpeSO0cBNE3+IX+8fGyk9vMLhE0CZc
         wgTu9bXPAij3+udroiJyMj3kzTha7HcC5rsiWeVve3C7td2WU8v/dZvmDE4nQnDt8EEX
         SDZ0x8ZjHFc/XVpWj3ehlSOXCaG06Ymsf/RJ9ywZK3kcproR/YlKhGII3RfhsUock7Ft
         iHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UcoiEg+o9AoYABV0wTHEiLuEMWoO17S6vciI14Kt5qQ=;
        b=CCec9QtNyKwSGUfBpdB7at4m805ZIddT6o8P1oeio286IH2vSZlAZ9pfv8j2IjSqLj
         hLhixULFS0cj0RIsSjfg77CijmxRsiGTVvcmelbS1R6xA0/6zFKVxhbRo0d1LRSFBIY0
         apaD0ZMGQ7rnnCPzr0lttHWwiXon1UTuhfNKPFicsiExB6HuSgsuusQiuWDApS0RJyHD
         n2xz/h5/xd5OsjEvw2DoJM9oFxBPEPSIBwNhdP8YPBjLhwdnHhp//DiNIkH2516IKbTh
         aZwVc5B+fe2jKtJOQYrn6+LCqOLPdJNP5ZWhKiJGp8WBcTPM09LE66P1r8kzG1hbaR7L
         4qcQ==
X-Gm-Message-State: AOAM530hs5WCZBD3Yh2BDb8qtQYXtn/foCyUbiVB3LiPd6BmsOYiaxqv
	8PGyf5cERL3n68Wa67q34KkZF6jgB0U2IU1J
X-Google-Smtp-Source: 
 ABdhPJxKow9KN/fW4yqakWwf04R+r5yeCHJd6gplvJYAfevcb/tcksPmWOCxB96QoO89lZz7KeQM/w==
X-Received: by 2002:a05:6512:a86:b0:44a:7d2d:b763 with SMTP id
 m6-20020a0565120a8600b0044a7d2db763mr19900404lfu.540.1649623260045;
        Sun, 10 Apr 2022 13:41:00 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a2e9ecf000000b0024b0f17f790sm2624788ljk.21.2022.04.10.13.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:59 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-regex: update to 2022.3.15
Date: Sun, 10 Apr 2022 22:40:58 +0200
Message-Id: <20220410204058.4044152-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96514

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-regex_2022.3.2.bb => python3-regex_2022.3.15.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.3.2.bb => python3-regex_2022.3.15.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.3.2.bb b/meta-python/recipes-devtools/python/python3-regex_2022.3.15.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.3.2.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.3.15.bb
index c71394cb3..9633385f6 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.3.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "79e5af1ff258bc0fe0bdd6f69bc4ae33935a898e3cbefbbccf22e88a27fa053b"
+SRC_URI[sha256sum] = "0a7b75cc7bb4cc0334380053e4671c560e31272c9d2d5a6c4b8e9ae2c9bd0f82"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


