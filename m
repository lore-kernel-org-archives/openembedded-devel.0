Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5789C4321E
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.1861.1652344924795774067
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=V94eQdxR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id w4so6170628wrg.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ha6zPouw+TOAZiVer7xOSurqEo8YC53bsDENimXV0Gw=;
        b=V94eQdxRaPAOJLjzS//1vmHlXIG+oYcpMxP74bM7S4UvzLrYernOLUKMovzIwBiI2e
         e8g8WfV+AGSRh9pjYOBsOvRoHAtXKZODeVETEIn4in4nf2ioMLEbIHeBKebJpAFjryl6
         P+yMgGYHQymLoqdtaLj+lXEmGZ0o36xCl1ZC3VUYobfGmG2fJFQsRVET1bp0naoUKVlg
         yUSvP3ZrjJgpFKi/Jufa1EiSRodXRuUkK2w0zQH9mp1H4OTjaHztVGQjPjpMa8ajcaSE
         9ZWz9hK/OxxYRA0QKJ4YpnQlx9mvA97W+ZDnpt4p+YTJA8HrzL8VLJRtCb44VsH9jIEx
         GESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ha6zPouw+TOAZiVer7xOSurqEo8YC53bsDENimXV0Gw=;
        b=1uUeRGdJT98galwzvICoV+lcDALqQLu7KaECmB7BcyB4umLEUC4Rrr8XL5/jCYyh1b
         XgE1luLW3eaiI7ePraXY+jKA5xQQ89Ec1mUPtDAZOYF+XzWckBuqwclesRJQ17g0rASG
         s18Y2Su/w6jUySF/JkO8bbA43eLZVmzdA7btsXXMzd4nm3SBd6WlEIFzDjxGfJhh8Zj1
         T9Q1rh0hiqis797B+8PDeMKJ88AeMdI1zDmjg31oPJClPCa1ey+uexaZsHVWo3nxS28I
         zPYxlVsSO+QaOpNAInjHaETrmqdT+RfQ1abnkeRm/x8Yk/tX9NYWKoFFXW1DK9aWJ/v6
         rOgw==
X-Gm-Message-State: AOAM530TKADrWz4SbJiqkDnvFl5BKizQwdoCUlXku9LG0g/1RQVpitsD
	HB6D80D1RkhNMnF8Rt204rjnAxc2cVNy3zvI
X-Google-Smtp-Source: 
 ABdhPJxUxnRrTS4fl8evDn4BQCnjpSpA0LJsS4M4CE+iPl/gZz8cFvfUScOtZmhpVbhwr7eXF3K31g==
X-Received: by 2002:a05:6000:2cd:b0:20c:5ff6:1816 with SMTP id
 o13-20020a05600002cd00b0020c5ff61816mr25444898wry.336.1652344923328;
        Thu, 12 May 2022 01:42:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 05/16] python3-eth-typing: new package
Date: Thu, 12 May 2022 10:41:41 +0200
Message-Id: <20220512084152.1388464-6-brgl@bgdev.pl>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97053

Add a recipe for eth-typing: common type annotations for ethereum
python packages.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 +
 .../recipes-devtools/python/python3-eth-typing_3.0.0.bb  | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 4b32c7db2..d8cc9c0a5 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -111,6 +111,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-engineio \
     python3-et-xmlfile \
     python3-eth-hash \
+    python3-eth-typing \
     python3-evdev \
     python3-execnet \
     python3-fann2 \
diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb
new file mode 100644
index 000000000..a500d5b52
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Common type annotations for ethereum python packages."
+HOMEPAGE = "https://github.com/ethereum/eth-typing"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
+
+SRC_URI[sha256sum] = "079e4c41e98cf2635d3830a99f3cbd7b1d73d2368464d4493c002bece545184a"
+
+inherit pypi setuptools3
-- 
2.34.1


