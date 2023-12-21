Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DE5C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:24:10 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.1382.1703183041080650353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b71e389fb2so44649439f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183039; x=1703787839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCnY48ApsHJlTqVSyjHkJSrsr1AjogU/98mkWfEwnus=;
        b=Z0crtwsHPjiogMo6aaNEOyEe/JBhzUNEtfx5KM9Fz/dOEkEjO7OI0GzrG+Zbn758NH
         W0tnqsD5lnhqIvgp41QSotX2vALadwveEiv5ySJVDByGfpETJX6voxcF1/4UeGqqOuTw
         4E9Ws3JkNQ+HOtSqnpkbpcFGevOEwJKp9RUXkGk8ovgJtF8DHP268oggHqc1sTZX9ddQ
         iMYrOJzjSIQsieNt0WiZTMYnFam8QKoG8dTyRdXjWPrYLfEVJODaE55Qm0gDNgDoI6bN
         QSP+xppZ34H4ZOfwT2QK1MRZsgMRQ7UZgBT5Vq12i2BokZJ9l9z1ouElbSg7yCevhZBZ
         B8Ag==
X-Gm-Message-State: AOJu0YwniIvvfzhg1/L+x9uIGVwsljH80AbMELoFXozY2Y3L9tU8xuBB
	cGtE8RLzyu2IJ+5+4RmCM4OLEjfjeyhb8Q==
X-Google-Smtp-Source: AGHT+IF5AfKeDxGAfkhaDn6VwoT7ZLx8N9yyDnEjYnmmey18PipvO63SlD2Ca0ybLtN1W9oP8lWLpA==
X-Received: by 2002:a6b:7b47:0:b0:7b7:c8cd:7552 with SMTP id m7-20020a6b7b47000000b007b7c8cd7552mr175177iop.36.1703183039488;
        Thu, 21 Dec 2023 10:23:59 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id g5-20020a05660226c500b007ba84f9db00sm521557ioo.46.2023.12.21.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:23:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-uswid: update to version 0.4.7
Date: Thu, 21 Dec 2023 18:23:51 +0000
Message-Id: <20231221182351.3921070-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107730

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-uswid_git.bb => python3-uswid_0.4.7.bb} | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uswid_git.bb => python3-uswid_0.4.7.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-uswid_git.bb b/meta-python/recipes-devtools/python/python3-uswid_0.4.7.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-uswid_git.bb
rename to meta-python/recipes-devtools/python/python3-uswid_0.4.7.bb
index 40adc34c1..4499edb21 100644
--- a/meta-python/recipes-devtools/python/python3-uswid_git.bb
+++ b/meta-python/recipes-devtools/python/python3-uswid_0.4.7.bb
@@ -2,6 +2,11 @@ SUMMARY = "A pure-python library for embedding CoSWID data"
 HOMEPAGE = "https://github.com/hughsie/python-uswid"
 SECTION = "devel/python"
 LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
+
+SRC_URI[sha256sum] = "de15c2421bedaa5f54606558700c1f628f07d73da49ec69d1888214ac52c49e6"
+
+inherit setuptools3 python3native pypi
 
 DEPENDS += " python3-cbor2 python3-lxml python3-pefile"
 RDEPENDS:${PN} += " \
@@ -10,12 +15,5 @@ RDEPENDS:${PN} += " \
     python3-lxml \
     python3-netclient \
 "
-LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
-
-SRC_URI = "git://github.com/hughsie/python-uswid.git;branch=main;protocol=https"
-SRCREV = "3223034abef88ae29cf79fdc7fe11ec7e21e11ff"
-S = "${WORKDIR}/git"
-
-inherit setuptools3 python3native
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


