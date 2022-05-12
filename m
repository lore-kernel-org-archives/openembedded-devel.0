Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9742C3527B
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.1863.1652344928131925194
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=LOdZDMQt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id
 bd25-20020a05600c1f1900b0039485220e16so3816297wmb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhxyOUOM8RoRmxbSTTgSWOQPJo6AwUboCGZypV6dXE4=;
        b=LOdZDMQt13SXmKN1GQ8e5jXL2LcvoXbsvV1TcsAbBMbjq0ddGBLbCg/l7f78v2JtgA
         o3ZByIEPsnoMyN7IAmWsfKitoQvuAIM2IMECiWoWrXYb0HmjJMEf6BQESEfKKOG45BzH
         Nja9lJhtyr9hppA6F3hrf5wA4M4hhpt5SL90eitzAEJCQjz7+eDkOthICiBGNUnggW3c
         VWODfrARAu3ZBXfl7jWRa9LQoQZcJB62oeH1SF6sjiwhydYzIroQYhcHhRFdjuS0UJ3G
         RSUCPYtVR6LdwJ0JKDRq4c4kN54w905r2XOYG3cKRSTFFEUFJyF4ql/D5ZyRxC/0t1C0
         xS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhxyOUOM8RoRmxbSTTgSWOQPJo6AwUboCGZypV6dXE4=;
        b=0LpSPgUeaxtmUbbFpBYrvyGwkGLpGr0SGUx6JsdpvjkDVQHz6rOqCupt1wvX4PV3cS
         RTVbfjFHVb95NxX6xzRg0ftKqHw50Ek4H9sq9hjeo1dcBf7j3+9J8Dr5auUqHdMZC7NR
         8YbBMj6zxWYC3f78p/voqLfFyNuUiHK2Qr0OwGit41GP+K9ss5UvUcaAQ6f4YtSTO4KM
         xB7nl/JOossdU6vpAU8EkZdQCWBok0w6if2xoR3ojsZXWDsgiOP12zGnyXNbYYqXxj3G
         DwP/coYbs/5gJpTeZDRTGLyqpy4KhijvaXbpFWqPrjCMljSckq7bIic+fi728S27HSrc
         waTg==
X-Gm-Message-State: AOAM532O5G5l3l5qKbITgqJCU0yIR6SJk9RS89KpjEVyq5GV0XVZwTEe
	fRBAp7zkdH6yFNbSaam+2+IAsQ==
X-Google-Smtp-Source: 
 ABdhPJyDSN647+r6ha2Yn04i9Oy4P4cv/kVOX8PWvcA9qnXKuDp3IMoAOzgf28JPdN7xdXG60FdNNA==
X-Received: by 2002:a7b:c4d8:0:b0:393:fecd:2718 with SMTP id
 g24-20020a7bc4d8000000b00393fecd2718mr8995322wmk.23.1652344926624;
        Thu, 12 May 2022 01:42:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 09/16] python3-hexbytes: new package
Date: Thu, 12 May 2022 10:41:45 +0200
Message-Id: <20220512084152.1388464-10-brgl@bgdev.pl>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97057

Add a recipe for hexbytes: a Python bytes subclass that decodes hex,
with a readable console output.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 +
 .../recipes-devtools/python/python3-hexbytes_0.2.2.bb    | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 5e41d92c1..0a96e4005 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -474,6 +474,7 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-dominate-ptest \
     python3-geojson-ptest \
     python3-gunicorn-ptest \
+    python3-hexbytes \
     python3-html2text-ptest \
     python3-inflection-ptest \
     python3-intervals-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb b/meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb
new file mode 100644
index 000000000..89792d980
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python bytes subclass that decodes hex, with a readable console output."
+HOMEPAGE = "https://github.com/ethereum/hexbytes"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+
+SRC_URI[sha256sum] = "a5881304d186e87578fb263a85317c808cf130e1d4b3d37d30142ab0f7898d03"
+
+inherit pypi setuptools3
-- 
2.34.1


