Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0483C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 17:59:01 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.50767.1670867939415174563
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 09:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=ZpiBhV6+;
 spf=pass (domain: norberthealth.com, ip: 209.85.166.173, mailfrom: roger@norberthealth.com)
Received: by mail-il1-f173.google.com with SMTP id i25so3748240ila.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 09:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KsKOU5mXLW8Nx21+5qyrH72Us0QbM6yMPTg7VoehHo=;
        b=ZpiBhV6+vd3Z2NMhy12EP6IQW/oKAxLrt7O6R6TcIB2ticrdLj625013sIHzf52jd1
         Aa1Lf7LFcshu/L7/iUZJqLkpzI6EHjKSI6ishVi7Nxnel9WLoDnLreDRhhh8IkBIGyin
         uuquzlt1ZAhK/JnijPDmVgx7J6KKUZnsdcKHS6QcmA5GAh+TePtesky3Q0ST77e7qgEl
         qZtW4TzG/us7mgx3aDlkaM11rPSAXvpqW+CoC/5BJtBIHwoYSHFVAvuE66MbZ+r9N0Go
         LHM62s1cmBjFKsDEn7MJU2skMRE+dp2Qn5mBQeeMZhnNTW+UmGWK3tJXsMQmkIsFuE3B
         Yt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KsKOU5mXLW8Nx21+5qyrH72Us0QbM6yMPTg7VoehHo=;
        b=o7zCoF6LTg6s9nBD8X3AA5NjaclOwOtfpXmOLxU38ptCnoD4aQBlxgqi4JETtkYzjP
         hhRNLr76vWvgcRoKXKfVYiF8qBUEYkQ3FDGUVGb0DE02ftbPdmruCjptZA/joS9imJOW
         8NENWRkLCAeIm9I7tScyWgfFBXX8WMk47bZ8zpMN9He4Ha9L+Tyq3U9tvPPnSL9N/H8Q
         +6Zdv/CoiDn936Mdxsveh2z+X/CI/qG1fo9R6/o/+qKjlaBo5gKuFM9RaOEEWxnqBBlp
         O14MEQ+RFuzUM7tNWC2+5qOlMi7Pr4e+XqAdvghrto4PB9EN1M5RCQy/2FGtDQZb9F8g
         by1A==
X-Gm-Message-State: ANoB5pnGlcDhSf5rFQyy/BT8EbTjVFvlAQ7S0HrToJTEe4MyUZNZwb0p
	KrmOYK1xrSIPgCPiFZ6++3cLA/CgEwei0xHAp9/4ZFjJ
X-Google-Smtp-Source: AA0mqf5nsjxyowIQv3A+5sozhllniZWycSGjtNFAYb2ISGxRCXIWEIqKMmpoJZ6KhididiUFD3Givg==
X-Received: by 2002:a05:6e02:806:b0:303:608d:b34d with SMTP id u6-20020a056e02080600b00303608db34dmr9185798ilm.18.1670867938516;
        Mon, 12 Dec 2022 09:58:58 -0800 (PST)
Received: from roger-build-machine.us-central1-a.c.qa-pipelines.internal (163.90.123.34.bc.googleusercontent.com. [34.123.90.163])
        by smtp.gmail.com with ESMTPSA id p19-20020a02b013000000b00388660ca27dsm136185jah.4.2022.12.12.09.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 09:58:58 -0800 (PST)
From: Roger Knecht <roger@norberthealth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	Roger Knecht <roger@norberthealth.com>
Subject: [meta-python][PATCH] python3-rapidjson: add recipe
Date: Mon, 12 Dec 2022 17:58:36 +0000
Message-Id: <20221212175836.13560-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 17:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100063

Add a recipe for the python bindings of the rapidjson library.

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
 .../python/python3-rapidjson_1.9.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
new file mode 100644
index 000000000..ebf053396
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python wrapper around rapidjson"
+HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
+
+SRC_URI = "gitsm://github.com/python-rapidjson/python-rapidjson.git;protocol=https;branch=master"
+SRCREV = "8f4ab8e197ca30c03726b675ae7cce6ac9d6622e"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-core \
+    rapidjson \
+"
-- 
2.17.1


