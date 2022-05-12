Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E625AC352AA
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.1834.1652344923292715515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=Dom5YCQY;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso4685781wmh.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=++NMC+HXKd4giikEpnq8b2RTFVBS+JChzIvQfj6Yk2w=;
        b=Dom5YCQYHT+U/ONcpSXRADbNA6ReylbV1chMT6mUnYn8sXK25TBHT6SJWsIpqYfVI7
         nxmywMS08CUgfMwThhb1qrmw+svspxtZ+oI+NMAtGvkP6HR0AVwF+m26hyDQ9LESF8gr
         r/R6Z67VXgFvonnrBzkG4Ab1/D9nUgFyBuzWluzGzbqrc2Qh9Aawc9o6tBCF0n2pQ12d
         BEAQT60IS6P+6EaRv74sis8rmBgBCvYcTeEXxPLE0quMzLzxxm7doN43lG+/ioMRaYEM
         dCLHvZ9sWuViWfXIn9gJ75NXZcacG95SvPy4DPMG5V4L8mGzQ4Ya5FGLj0Yn5Jr5VQKl
         iQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=++NMC+HXKd4giikEpnq8b2RTFVBS+JChzIvQfj6Yk2w=;
        b=pO9h3ffM/2i5pI+oigX4xUsGjBDBN5rz+1ieCqhOJi4hJ3sYH1U0qPjn/GHiRe3p7O
         XpGuaKo0fLehWnbxOIplTrXHTcvb/HwxaP4RV29nWzaMxH3JLHsXYyztyu8/gixXkaUu
         gwZh79yu4sjB5c+3Wsv52VqkRHlnuyfhwLGkr4te5/bFJBD2fwETMfpzJUa1MQirJdLq
         aA4jY84+Orn1ANQ/RmJtN5fLYWOH1fvHXQmjwbw3oSV5CeDh0lGrawNmEJJTO4a50S50
         oe1xLkjGr1nc5MmDYYCeMZG0eYE/AEwtmEeRfp56f17BQCmMLXVkupavg9aNpBDUNj7n
         8cPA==
X-Gm-Message-State: AOAM533tUNGjvJy5rT35eXe0JyLsaIp378J5J1SiwSTF034mYtPRzAZU
	EugjzvCgyCkuikJ40fCtlLY5mw==
X-Google-Smtp-Source: 
 ABdhPJzr2cTZhHpQ/rMD4O8tTH7AVvy1dictAWSUQHyIFp2bXBCR8RukTHgzUI11XjrRxAxJJp8bJg==
X-Received: by 2002:a05:600c:378b:b0:394:3894:3a65 with SMTP id
 o11-20020a05600c378b00b0039438943a65mr8884268wmr.18.1652344928675;
        Thu, 12 May 2022 01:42:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 12/16] python3-parsimonious: new package
Date: Thu, 12 May 2022 10:41:48 +0200
Message-Id: <20220512084152.1388464-13-brgl@bgdev.pl>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97060

Add a recipe for parsimonious: an arbitrary-lookahead parser written in
pure Python.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../python/python3-parsimonious_0.9.0.bb              | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 41a98ba05..41e30fad0 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -261,6 +261,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-paramiko \
     python3-parse \
     python3-parse-type \
+    python3-parsimonious \
     python3-parso \
     python3-passlib \
     python3-pastedeploy \
diff --git a/meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb b/meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb
new file mode 100644
index 000000000..5a604fa41
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Parsimonious aims to be the fastest arbitrary-lookahead parser written in pure Python."
+HOMEPAGE = "https://github.com/erikrose/parsimonious"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
+
+SRC_URI[sha256sum] = "b2ad1ae63a2f65bd78f5e0a8ac510a98f3607a43f1db2a8d46636a5d9e4a30c1"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-regex"
-- 
2.34.1


