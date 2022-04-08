Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA09C4167E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.1151.1649446389018636631
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g7wH9rCN;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso657585pjj.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2UDMEgwrKqPLhPVgNJKVnWS00tT4KeSzarRXz4JGF2Q=;
        b=g7wH9rCN2RTiBqFRLkUhspPyDjDiktH8w9W/rHrwHIbbiN3p28tomUAiaMAFwG3S09
         AJ+eYe0lTneU82onV/R9LWxn9i6c4Xxi4XnPbxwI9mbKSm0l8f80cK0uNjWLw9nB+UZz
         ygxK6Xy+/FvMbh3aksjASWtIlZs5TteNMK1rRwx2K4a8Vaokh8yv17MvzpYCrN6O9BO7
         6PW2RtT4f0PS6BIiiAiVYKvzIh7dN/lpbxvl4IWsoUFePo/wDh2uwwGbQPZ/DmzRVo1E
         IgnjzOMKSKOdAsX+IOJFtQc+YLvToetK+YVIHVAMnWh3SlP7EUgFN9Ld8asLIFO6hPmX
         XMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2UDMEgwrKqPLhPVgNJKVnWS00tT4KeSzarRXz4JGF2Q=;
        b=V7Adoilufg4besw7yce7VFONeKbVbPt7ap+yrj7JQ+9kuMsDWKySzcDXgl5fZl5Qek
         JqY2tJGT28jyYa1HtRc3yR8OzuAezWHELpy9zj31+WB7oRtSu1BfCnHg36PxiYjIpd/3
         a/4dkfFqqvhMVNRn1VnKzI/lJhKR6Xq0JWSWtvueefkpyuCWzZ7raIYdTzITGVVIlfB1
         2v4EcoEEuDf7GlN4Duap5jp/2h4V2vIoYvyZbKJ6DBg2lCsWVUSX4Obk0WLivBnuVSg7
         fuXeslCSDNUPTa1Dja4eDzmehJYZ6s9kkQExAf0G/GAWLNCvBxzfpu5RzLrqVXACwHKN
         pNig==
X-Gm-Message-State: AOAM532kyXmzUsCUSpXdtqazFD+50jMyeIl9rIVmbqrQdItB4Iu4hJkR
	mvXGvTvPCPbDxpUx5vaixIAG2oOJIy7FVg==
X-Google-Smtp-Source: 
 ABdhPJwsnAczQXXFRTepP7RoQm0ppzTURxVdCHrh4P6StRuqRZZqRGp8fwVJTMCrGhZV6FM0qBf7Cg==
X-Received: by 2002:a17:902:b590:b0:153:a243:3331 with SMTP id
 a16-20020a170902b59000b00153a2433331mr21565068pls.129.1649446388173;
        Fri, 08 Apr 2022 12:33:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004fa7da68465sm26666433pfl.60.2022.04.08.12.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:33:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-python][PATCH] Revert "python3-cppy: upgrade 1.2.0 -> 1.2.1"
Date: Fri,  8 Apr 2022 12:33:05 -0700
Message-Id: <20220408193305.1347498-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96486

This reverts commit c4c2a90040bf3ab472d3d1a733bbda47d5f86ec6.

This update fails to build python3-kiwisolver, it works ok with 1.2.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cppy_1.2.1.bb => python3-cppy_1.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cppy_1.2.1.bb => python3-cppy_1.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb b/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
index b84b46164c..f86f571938 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
-SRC_URI[sha256sum] = "83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b"
+SRC_URI[sha256sum] = "95e8862e4f826c3f2a6b7b658333b162f80cbe9f943aa0d0a7a6b2ef850aeffc"
 
 RDEPENDS:${PN} += "python3-setuptools python3-distutils"
 
-- 
2.35.1


