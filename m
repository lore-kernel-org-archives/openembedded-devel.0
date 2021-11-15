Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A65C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 16:42:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.243.1636994577714529439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 08:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=McfhND3N;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id s13so32009895wrb.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 08:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6tUfhC59kDzBVT+MTxheDENBhpUYUhf5NZqvMNEzHZQ=;
        b=McfhND3NuD00SYfGYuyVNF3y6vcS43FgISRJAUKJK8CTt4RJg9H/nUd9IePINYNuEz
         J5e0C+ZS6jsHu3ukOzlHAmMk2UK5YMDH1eMRir9db9/dCDnjg+cUBMBctQsSm8xg6IFX
         6enV+Ypg240YMibPnHzLJoTCCVVJnQ3a6zD0IAZdSNJyvHgGMUms2yhFUApWsmp3XVT6
         4ugVW2ipBy3mXq48OBriRT1yxBlhWkgnXpZYb0kIlDWvUBpK7DsaoXbCpenBLDFgHmLR
         0l2VtNHHjJF8sXN9uHi3RA0ABa0QeE0rW0AxN5llt4mRgu4KZx62XNk5R1GLYlXjNuwR
         IgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6tUfhC59kDzBVT+MTxheDENBhpUYUhf5NZqvMNEzHZQ=;
        b=ybRbVtoWuXkO77xnwtWQoRk6Rt3kVN/qo1uf3CHuBtyCp1a1OUoqGwXHpNrlegi2nA
         15Zcd953oMqmk+fnkDPhpkWsBOgKAmKPZT3VVtyMzGNHnl+40XintRyAiJes5U9qPr4p
         JT7/Z3mpl1jW613eX/YK6C1ws0FPPZrjfQ/DaEKCt8DW97tJ3WqZ3qpl2G2fYlY5qlT9
         uAM+vfkpW8CSx13ASG7lkeUT2QnoEYhybkG6Ei7XUhB+NneqP/rNn9jz9Zj+xehlb+8W
         8e8q+7espVt9yATxOiC11KwYmZntsYbcTJIrszO/jPiiCqfHZZcbfONo/2o1iUYlRJCC
         20gA==
X-Gm-Message-State: AOAM5317euBBpgRuccnycA3k8ps0feQ5gIZGBzVqsSgmAtd4whhhbyf3
	obadUcu0/iHVjncY1OTJjvXbyQ==
X-Google-Smtp-Source: 
 ABdhPJwtZzFR37Fout9iMUBOOxs20QYfK0UnPlG5QlEWMmaP2bBlroCsxDuAyCWFN7v/fdqcxEPa5Q==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr513377wrl.24.1636994575993;
        Mon, 15 Nov 2021 08:42:55 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 o4sm24755987wmq.31.2021.11.15.08.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:42:55 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-email-validator: new package
Date: Mon, 15 Nov 2021 17:42:54 +0100
Message-Id: <20211115164254.30549-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 16:42:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93953

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb       |  1 +
 .../python/python3-email-validator_1.1.3.bb         | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-email-validator_1.1.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 477215118..be0786f60 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -113,6 +113,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-dynamic-dispatch \
     python3-ecdsa \
     python3-editor \
+    python3-email-validator \
     python3-engineio \
     python3-et-xmlfile \
     python3-evdev \
diff --git a/meta-python/recipes-devtools/python/python3-email-validator_1.1.3.bb b/meta-python/recipes-devtools/python/python3-email-validator_1.1.3.bb
new file mode 100644
index 000000000..b81e39a15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-email-validator_1.1.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A robust email address syntax and deliverability validation library."
+SECTION = "devel/python"
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
+
+SRC_URI[md5sum] = "25582cf3d415c7fdd44b980a095e0d53"
+SRC_URI[sha256sum] = "aa237a65f6f4da067119b7df3f13e89c25c051327b2b5b66dc075f33d62480d7"
+
+PYPI_PACKAGE = "email_validator"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-dnspython python3-idna"
-- 
2.25.1


