Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BFDC43219
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.1834.1652344923292715515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=cr9BAvGY;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso4685781wmh.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZKXknG9XFFu9nXhYyB3XuYZEkc0pLAuOk3vFc4aDMNA=;
        b=cr9BAvGYFHogkPJ5Nna0ynlm1UVuAO5a+PVzwGDfvT7qnhinORmThohLN+4llrBvf+
         PYI+ykdfEU3pUW1rdNI34XvpSXX0gnvptQaYLubuQpbv2F+RiWaQbzQDUAxjdNku/fg7
         GZaMOYtJy3BRmIXwD2tqOqsKF9VlTgAs07DhvjyNKCajMA5j6uwh5RP63BRXuPuk7Xl4
         rQk83BmNYKrNoCb50nRBhPOM5G0RaX4YHzxN6qbem0BikFOSQC2LtcJHLgaqkNH1wIZh
         eWDdRKmH1vqGQ5dfFTY61xNny+S0yBicCdAz5yqEAXvatOsGNO4b65unne2XW7iNRLAf
         ZY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZKXknG9XFFu9nXhYyB3XuYZEkc0pLAuOk3vFc4aDMNA=;
        b=KTgonU84BhUORXuiIjSZZW1RFFrEKuNmJ+YhIjnneYoZmnoLKehilH5aX56h0ferEW
         4QPyKBW4lXwOCOjvqBeaT7yNRl8pYPAji5njQimeE0CAOw+OXHzAnMj5b1C4x0Gmq9Uc
         6PKRu/b4DiBMNqLq30x+rnzbYH0F44dd+qEmt1w14fXpx93z0JuF8FV6f9WDJa+orCXf
         QPSpgblaaTIGpYmdwqQzl3MARW4kYVpgpm56ZlWKTf+Z+73If3Y8bnY9oV0osTEq4HLh
         7N0803//fzzlKkxd2CS7/rPKDmE4qjuJU4cOFL/BqLRpGIA+ArhkK0Dl3UoJuP7Hh2V8
         mTWQ==
X-Gm-Message-State: AOAM533FEGEl27gqhv3hwEJy1yOieCOsHV7Yy1jNf1reTQDyN2RoDC/n
	VgpT3NplLLEdoyLhEQkPr5Ciqw==
X-Google-Smtp-Source: 
 ABdhPJxubCQ7ZJ9uxIwNJQbPExRU+YfUC81y86eNMlzMuFO0OBtppnlAMpDQX3DLljV3D+6Bvb5jrw==
X-Received: by 2002:a05:600c:4e94:b0:394:89c9:a505 with SMTP id
 f20-20020a05600c4e9400b0039489c9a505mr9024125wmq.172.1652344921824;
        Thu, 12 May 2022 01:42:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 03/16] python3-decouple: new package
Date: Thu, 12 May 2022 10:41:39 +0200
Message-Id: <20220512084152.1388464-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97051

Add a recipe for python-decouple: generic tool for separating settings
from code.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb    |  1 +
 .../python/python3-decouple_3.6.bb               | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-decouple_3.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 5f97bd954..922a08af5 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -92,6 +92,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-dbus-next \
     python3-dbussy \
     python3-decorator \
+    python3-decouple \
     python3-defusedxml \
     python3-dill \
     python3-diskcache \
diff --git a/meta-python/recipes-devtools/python/python3-decouple_3.6.bb b/meta-python/recipes-devtools/python/python3-decouple_3.6.bb
new file mode 100644
index 000000000..772ee7faf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-decouple_3.6.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Strict separation of settings from code."
+HOMEPAGE = "https://github.com/henriquebastos/python-decouple/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a46375b26bb7d7603565d829a2a51782"
+
+SRC_URI[sha256sum] = "2838cdf77a5cf127d7e8b339ce14c25bceb3af3e674e039d4901ba16359968c7"
+
+PYPI_PACKAGE = "python-decouple"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-shell \
+    python3-stringold \
+"
-- 
2.34.1


