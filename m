Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71ECC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:10:43 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.45832.1702599039136206895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b751f23ff1so4299439f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 16:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702599038; x=1703203838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxauUXF/B8/atU0Gn1knHdxmGPpiZl8FVW6OCMcsYEM=;
        b=BbPvbLJ43oht1cdjtem5tpBrpClCZllHRZdBz32pMXUTBcIU6vSzBUDs42YFtFceZ2
         BuLkeYdc+acuX4qI9Q21Ymf46X8MKU4k2o/I3+lwd2jT4Gui47hfHo8VHd+w+Jf2p5LT
         yh3w+u++cBqCboVdXvKb8eDy9GVtfSeo1OhEd08nH5M0QFn14VxMlQNIaGpkrWErCY8S
         3uHzI51l9zJpsPT/gZ6b5XNMVJDL/QFiBzkNamApO+4tpLW6+O9MuDl7Zju1DjRgTfQQ
         2c0r3/xUwZKpjBB80VGMfxhYZjnyscBBVAGz37CFT20tyqCcIMv6MMVx7krO1iNogK3I
         G6DQ==
X-Gm-Message-State: AOJu0YyuU2YbhHY0njDyl0zd+dFhyoSHABcqRFHA9nvr6JYejxLtiTVy
	TY8CjI1XU+2HZO1kL1ZcCbeFCBYQj34vJw==
X-Google-Smtp-Source: AGHT+IF9W36odFmn8jVV+xhRPXBpRjlTlJt8xUQZQVZU4nOp2vbHpvv9Jv91Gv4Cpc9XM5Xr+js1Mw==
X-Received: by 2002:a05:6602:641f:b0:7b4:28f8:df with SMTP id gn31-20020a056602641f00b007b428f800dfmr15578964iob.40.1702599037706;
        Thu, 14 Dec 2023 16:10:37 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m39-20020a05663840a700b004596858b397sm3795591jam.7.2023.12.14.16.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 16:10:37 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-portalocker: update to version 2.8.2
Date: Fri, 15 Dec 2023 00:10:17 +0000
Message-Id: <20231215001017.2557084-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107467

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...n3-portalocker_2.7.0.bb => python3-portalocker_2.8.2.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.7.0.bb => python3-portalocker_2.8.2.bb} (66%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
similarity index 66%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
index 03c4f2f40..e18aa83df 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
@@ -4,9 +4,11 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "032e81d534a88ec1736d03f780ba073f047a06c478b06e2937486f334e955c51"
+SRC_URI[sha256sum] = "2b035aa7828e46c58e9b31390ee1f169b98e1066ab10b9a6a861fe7e25ee4f33"
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


