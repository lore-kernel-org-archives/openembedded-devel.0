Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCCDC47077
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.219017.1704025422777062751
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eE8hta8Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2339262835so830872266b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025421; x=1704630221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzbfHap1veE+augwRU6aJUT/4hO0qm223icoe6tZN4c=;
        b=eE8hta8YeosIERUAkMKuQRKutePREZWUUdlzYGDGcOtQ0ViULx+290VNRyDAsSRKK/
         Qxay+Syp2afAQDdvcb81LUZ+e/7pHbkGmkmbB8zOLtBMXmsXdJTKldOlXCS6HqZHBr+g
         sqGSlU0lEEbKsYx2YGb5uNJ0Ji3ePF3Q4ksTa4zw+U0R6dPLVmWiD8dRWBsIkWWKz7A+
         gWay5KTr7MAeMv7TWBTZLQA0afkgt48ns9rzFddR2hDq28B8SGu/9Yf8M5uwYQU4+Q38
         QOERldpFAmr9Zo/dMBSbNZv1j8MMs5XgsfhaIEuU8FJbVb1qmEAKw3DBmSoaRT/izpCm
         5Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025421; x=1704630221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzbfHap1veE+augwRU6aJUT/4hO0qm223icoe6tZN4c=;
        b=s4/8yM6F4QTPVXzZTPclzsoMSpCat+MfH5Z9Xf2F/KqA122NXfhyTNpaAgUH7VppDo
         dy6cP2mcQD+h5nM6iSxO4AIya0cNg1OkV2PhgxP/uNq1luGCBo+gnPlWWwhgzgdlPrS0
         FBSK1izkd9r1Tie+dMtZ3GnKHH83bT7Odj3hhU9KZSKdoBYk0+G9Mm4Q7SdSA3haroeD
         amYWaKwwAliwbc+7FJoOjgC7DSMEFA453pZhnGtM3h9hkvfJTlRb1mwDnpSq5YTIecSn
         dyrEDpn0Q03mW5zddyFi5Krp6X+8OAvdB5Z4J6g3VobFlIuBXOa5+cgdgV/uit3PrxJW
         NwoA==
X-Gm-Message-State: AOJu0Yzo7t560drvtNAa5opgMensKqbLTqOHveneLstt/padLVzUOwRT
	yQOvr1YGoRC5bmg5zi7b0RkZK2Lt5OA=
X-Google-Smtp-Source: AGHT+IH9V1iXunt0G+OxMIKSuFI6eaj+otffdQg94GEZ1Ap/NGO8lOY6C4CvGXj8qk+RizFjepj+Pw==
X-Received: by 2002:a17:906:bc88:b0:a27:fe31:ad84 with SMTP id lv8-20020a170906bc8800b00a27fe31ad84mr139813ejb.15.1704025421024;
        Sun, 31 Dec 2023 04:23:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/23] python3-custom-inherit: fix python 3.12 builds
Date: Sun, 31 Dec 2023 13:23:16 +0100
Message-Id: <20231231122329.405225-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107961

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...oneer.py-do-not-use-SafeConfigParser.patch | 29 +++++++++++++++++++
 .../python/python3-custom-inherit_2.4.1.bb    |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/0001-versioneer.py-do-not-use-SafeConfigParser.patch

diff --git a/meta-python/recipes-devtools/python/files/0001-versioneer.py-do-not-use-SafeConfigParser.patch b/meta-python/recipes-devtools/python/files/0001-versioneer.py-do-not-use-SafeConfigParser.patch
new file mode 100644
index 000000000..34caaca98
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/0001-versioneer.py-do-not-use-SafeConfigParser.patch
@@ -0,0 +1,29 @@
+From 0920bd21ceab75bc4b655c571a37835526dd2468 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 27 Dec 2023 15:12:19 +0100
+Subject: [PATCH] versioneer.py: do not use SafeConfigParser
+
+This has been deprecated for a long time, and finally removed in python 3.12
+
+Upstream-Status: Submitted [https://github.com/rsokl/custom_inherit/pull/49]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ versioneer.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/versioneer.py b/versioneer.py
+index 64fea1c..3aa5da3 100644
+--- a/versioneer.py
++++ b/versioneer.py
+@@ -339,9 +339,9 @@ def get_config_from_root(root):
+     # configparser.NoOptionError (if it lacks "VCS="). See the docstring at
+     # the top of versioneer.py for instructions on writing your setup.cfg .
+     setup_cfg = os.path.join(root, "setup.cfg")
+-    parser = configparser.SafeConfigParser()
++    parser = configparser.ConfigParser()
+     with open(setup_cfg, "r") as f:
+-        parser.readfp(f)
++        parser.read_file(f)
+     VCS = parser.get("versioneer", "VCS")  # mandatory
+ 
+     def get(parser, name):
diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
index 478abbf1f..e7409f77e 100644
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f910a85a4c3da51edf780f17a7608434"
 
 PYPI_PACKAGE = "custom_inherit"
 
+SRC_URI += "file://0001-versioneer.py-do-not-use-SafeConfigParser.patch"
 SRC_URI[sha256sum] = "7052eb337bcce83551815264391cc4efc2bf70b295a3c52aba64f1ab57c3a8a2"
 
 inherit pypi setuptools3
-- 
2.39.2


