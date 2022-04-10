Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE170C4708A
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.21493.1649623411519009510
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=LaWHT2Hw;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id o2so1731499lfu.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjFDHcbp3HQcOGMRg9q8/J4MYwUQDH1d6xCETgR7E98=;
        b=LaWHT2HwcJ49C7+WQ1mzn39hpp7QaRVahS/n59lC9+YIg8hLUpLyZrBHCvPWu5hkDl
         ChXNqs/Yr7olYU/onHPnOYRapkzkzw8oVHKt2j9+6ogjWIh4qXMZt+zhTmrp/v2lCIKx
         0KK/12Y/N8JuUiGnXDDx/2PNbNg3XV9O4B1Xf4zpgtj6dogKSPW6oV2Z1mIQzswFfDaA
         KrH7BwyCyeZ+195LJkQ9DJ/ghg/hvrtfI07bWtp4CZbdls2EKonOHRyQqdWI34vI5AGM
         s1/L2I9SfVR9uXzvcpTPJ09EpIbb9ZzZcPWjvi8CakGAvHAUME6bCTe6XqM13FN5rfKQ
         JEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjFDHcbp3HQcOGMRg9q8/J4MYwUQDH1d6xCETgR7E98=;
        b=KPb1B0BS+ez4MR7f1EwlSJ/naMgAvzOxenCKswgKitORURejgNlO3+PgR+X3yv/IG+
         g5uVQXYyMpZA8BOwoX3RvdAQXCLWFMKhrdoVU93hslMdDVJSMAq6Q6qEQmg8ofK8BXiN
         XOnOPOAvSbBMYz57FaXC4mRbikueNNRbZf1S3gmoyXR4Pg0OEAZHFC7+UOu0HWE/ztNY
         S2iVHLIskqx+fa3u8XqZplYpLaak9tLstnrbc+oKYkHbEzuc+d8SlVCf0PdIjF/OorEj
         tL9VHKLq3zxprc5QJn6WxNRD8x+xx0B35Afh9xR0E5iqvv7BTZ5/HgxGaJB4n3vBdwls
         Ccxg==
X-Gm-Message-State: AOAM531T5x7s+ihqzd/Mx/gjPaVD4Aq+701/9g4uofZlFkVt3Vkc4VoK
	Bx8jAsboI3dvKMkp/RgbRjQGGt/1l6g1Khep
X-Google-Smtp-Source: 
 ABdhPJw4yMBpfuoN4asEdEcyjH6qMfbTDbE3Nu3hhOxBAyQQ6An0X/7Mmt2cjHIp7EfN+vVbxfR0mQ==
X-Received: by 2002:a05:6512:1116:b0:46b:8d74:26ef with SMTP id
 l22-20020a056512111600b0046b8d7426efmr7063310lfg.546.1649623409357;
        Sun, 10 Apr 2022 13:43:29 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 f16-20020a05651201d000b00464f22b4242sm1173994lfp.159.2022.04.10.13.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:43:29 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-auth: update to 2.6.3
Date: Sun, 10 Apr 2022 22:43:27 +0200
Message-Id: <20220410204327.4046638-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96526

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-google-auth_2.3.0.bb => python3-google-auth_2.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.3.0.bb => python3-google-auth_2.6.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.3.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.6.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.6.3.bb
index 9d192c15e..ee5311f4f 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.6.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2800f6dfad29c6ced5faf9ca0c38ea8ba1ebe2559b10c029bd021e3de3301627"
+SRC_URI[sha256sum] = "d65bb0e3701eaaa64fd2aa85e1325580524b0bddc6dc5db3ab89c481b6a20141"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


