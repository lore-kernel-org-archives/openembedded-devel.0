Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398E4C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:00:55 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.15341.1702530047375690465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7b783ee485eso52109239f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702530046; x=1703134846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EthqmdYO1EcpCAbPtLmOIqc427+6O8tqsLa1ogXgJgA=;
        b=BOvAp9fvxlJIeSdXDbYcoUfV72VK+zpAmvsBsGgm7DFmrs5Dwpwfd4ZOhBESu6qlou
         ItcRgpidaKA5iD6DQ/HYETxwEpV4MgsgSLPK7r0KZMq7jS19wTB26shTtJW69H2kNquB
         IIBuSToIBxfP/uqwj8CIYSGyhy+KItBv9arsjd8o/DTuw/ozcaWZ0seM1BMXluROwH/H
         9j5JuW7cNlHc04OkezatlUDxGAL6sDMRs/jL9M/sn/ZryVt4MzFc18EwuSt/GdK7cWQw
         0Vii2jM0tIMtOIf4o3Jeq3mo1/XI/kdDyDxzUm+bMJAdMc7TXi1axB9mrSJnvBDk7zM9
         canA==
X-Gm-Message-State: AOJu0Yx202BF0Yr6zIJ/HmqIiuwairDPq3qeHw1cLIm38x2m5edhijZd
	KgB/yzfGxzaGb/xXZVLd42jaj4MiDyUfbQ==
X-Google-Smtp-Source: AGHT+IHfNigKV36gLyKjztOCs0hlMGL9BrzJrcln6awbNPtfmsbVOC8uUcxyqXg8nsfp+iFtq3r/dg==
X-Received: by 2002:a05:6e02:214f:b0:35d:4482:ac50 with SMTP id d15-20020a056e02214f00b0035d4482ac50mr8283270ilv.22.1702530045811;
        Wed, 13 Dec 2023 21:00:45 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id j30-20020a02cb1e000000b00469607f2fdcsm2594936jap.89.2023.12.13.21.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:00:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-distlib: update to version 0.3.8
Date: Thu, 14 Dec 2023 05:00:35 +0000
Message-Id: <20231214050035.1189572-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107412

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-distlib_0.3.7.bb => python3-distlib_0.3.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distlib_0.3.7.bb => python3-distlib_0.3.8.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb b/meta-python/recipes-devtools/python/python3-distlib_0.3.8.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
rename to meta-python/recipes-devtools/python/python3-distlib_0.3.8.bb
index 1d9d53e27..41a66479c 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.3.8.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/distlib"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"
 
-SRC_URI[sha256sum] = "9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8"
+SRC_URI[sha256sum] = "1530ea13e350031b6312d8580ddb6b27a104275a31106523b8f123787f494f64"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
-- 
2.34.1


