Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AED0C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 14:29:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.38117.1699885753627040590
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 06:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RLqbrD+k;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32ded3eb835so3091174f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 06:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699885752; x=1700490552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+L5K4Q3J+oBUvzxQDZNC79wrADu7bG6xBk7cAPCogE=;
        b=RLqbrD+kup4pRcQdOgjNgoWrvk9jzYMyCyEXE/ynx2cWbNztuNWiXlPBXafOaZBZ3G
         ml9TIDXw996MZLNq/fU4kEqNscoxiY2o0PWQfp/MrW5iolQ49aN5y5Eh6k9+e/j93q9Q
         f3Xzzzzv9HdwnGU3oommoW2shppnQ/RaiPC/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699885752; x=1700490552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+L5K4Q3J+oBUvzxQDZNC79wrADu7bG6xBk7cAPCogE=;
        b=QRlrTdHMDpZq3UtMfW4rJga+5dyU7Kan8T0f6KrRC+TxRQsylM7ouH5wqTBLdc+tD4
         05PgszBk6wdstmFUeOtnWpm8jyHkBDiJ54tH+FuUVIwajDtZNPAWNhAa4wEy+tj+VMK3
         wV9DfVWm9Hj79WLe3r/O0U+Ny7bCB0oWpZHTlz3nxFOXGDdjLlnMXzAHSFAM6kAp7XYY
         aKhfxtkRWDCJ239ITP1EpuiW2zx6J9kn6Rz2j2lTWkCr9ByM9vjaf2QmS1cQu768lkXm
         0nBFlSpqsGJ4p3zPPInL3OqjXDCLYmZaqFuaCqflB/2fXFVM1WND/famRQenny5ZhC/F
         k4/g==
X-Gm-Message-State: AOJu0YzXpEU59GKySzglcFOlBJGjWTSM1ZXX+0PPEyF9C3R15hcJqA4I
	+Yl0XOfkmn6syH4byQ8bJunUtI/mOt2EpPth2Lk=
X-Google-Smtp-Source: AGHT+IHGCbiJd4J6UHgiuKAugOoygcqcs1o3QkOr+fOWCVRSfFYunpGeswrGsisw98H1yyfvBJ1j/Q==
X-Received: by 2002:adf:f341:0:b0:32f:7ae6:64a7 with SMTP id e1-20020adff341000000b0032f7ae664a7mr4650472wrp.55.1699885751596;
        Mon, 13 Nov 2023 06:29:11 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d456f000000b0032ddf2804ccsm5535042wrc.83.2023.11.13.06.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:29:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-file-magic: add recipe
Date: Mon, 13 Nov 2023 16:29:07 +0200
Message-Id: <20231113142909.3093632-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106642

Add file-magic version 0.4.1, a Python front end for libmagic(3).

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-file-magic_0.4.1.bb        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
new file mode 100644
index 000000000..837edf7df
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Python front end for libmagic"
+DESCRIPTION = "This library is a Python ctypes interface to libmagic."
+HOMEPAGE = "https://darwinsys.com/file/"
+LICENSE = "BSD-2-Clause"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0e949c0b3fb4fd86232f00c6ee0bdef3"
+
+SRC_URI[sha256sum] = "a91d1483117f7ed48cd0238ad9be36b04824d57e9c38ea7523113989e81b9c53"
+
+PYPI_PACKAGE="file-magic"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    file \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


