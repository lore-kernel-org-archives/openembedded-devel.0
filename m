Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0661CE7C70A
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 07:33:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47561.1770017575896908500
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 23:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iiauXFHe;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso33583465e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 23:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770017574; x=1770622374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5OmTeAnHaXdedGmLnjI2o4cQFGJk2DYNGQNHe0cTPM=;
        b=iiauXFHeuGPmW9HbTgloxnlF6h/cl7iTKfWwuVFv1J4iSpnLzdghxsXJir6jLvkpct
         dYZ2Bhvxk1ZZreN6+VMr2CVqe1fCl9y8xz/kDDva3k9l8tfJ2OsIWR+O7q872F1uyhpP
         81p/FPae4s6CMM0xcmZb8jKR93tOn2fPOWp+43aQ3SSNC5/yAoi6dS+VisuOL/k7NxX8
         ZRaHRJmAciYX1IOpG/9o8NGlu1g/p3qng1I/JBIMZQMCB6aCDNQjYeOc60jj80c5xbkR
         su4uSLbLT1hiN1np/+hfuDNxaq7VwTlS6u2HfXfum1unwv3DCbMF52GjH46eGErn/Oxy
         nfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017574; x=1770622374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5OmTeAnHaXdedGmLnjI2o4cQFGJk2DYNGQNHe0cTPM=;
        b=v+d3TskpZIFCVCfrYrpAMqGXq0wIwOLoivxoaVrTPkjGVZUqbZE15VjNfSkrGE7aby
         lXzl4NxOqOykUSNFECi7FfgNYycaZ3XGLtmCRmjH49Yhrn44g5q04mlKX88OOItb9NvQ
         3PsnbTfm3Jw8qVEwOHrDyK8L7yAGy/VVs4hnO+lN6D5iEwX9eS80HZycKUPRGHHXyngs
         vbTnzVLmxRM2Ys/pv8LNdQ7pK1Sm2k8J49OcvmUkCpZmSeVrsk2A1W4e2HEwRrOnFmeb
         qwv01gBNTb1nW6cY1cjtlehL2WaNRwJLtDW9A+fsP0O3c6EklhZBcVZFbMzsyxXgGla0
         TCRA==
X-Gm-Message-State: AOJu0YzNCH7/yAUz8Wc2oZK1hP2Kzh376r0wLBINAmGX3XrIPWATtC5X
	JPG5/qi6O9DgXEl/si3mAxQBeh80boZoDvpf/2/2ZZFmsJDg128Bzkz9JqEGfA==
X-Gm-Gg: AZuq6aIp5u0uzqsXMf11/Qj+N1OZNl+dTmdm/4YsPWIWqyb0Ekl7gy/W2QrssTCB1sp
	xao0dT4qYTc5Oe8Q7zbbBjbS0nZsCmd36dEKPz0P4YUyZaTBlJS/iBYNF6bJJjHQTcMrurDAS00
	tNK729HncBl6lCHhYYScXlzJCM66xzSKuwYL+HQwWG1XtRC7OG1wuFIVL1OjAfYmEeLGzG/eY8K
	8YSoX7kb2IWqA0cGwPnh/cFOKLwBtDnMzg1dB8O+JwBR8whBbYic0aFRTzfdXnFCcua+1bDaAgI
	Ee3Eztt2QEANME0ixN4Kcnm//ax4yv2S+h2ecWCX04M8qiFE4UbSaxzJ714ZVlO+fxPNoJIGd+X
	WMRU6oJjrD6sqZAOGVMORPiyOzJcO4wNCOgmQCZzl8XudBC4IOtJdsHFKXseYTD48JA8eDFHB6S
	3WBZkEyUvN
X-Received: by 2002:a05:600c:4ed2:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-482db4488aamr148730505e9.3.1770017574262;
        Sun, 01 Feb 2026 23:32:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb59asm419355615e9.7.2026.02.01.23.32.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:32:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] unicode-ucd: rename license file
Date: Mon,  2 Feb 2026 08:32:53 +0100
Message-ID: <20260202073253.1332796-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 07:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124052

After the previous hash update the license file was not renamed,
which causes it to clash in the DL_DIR if it was already downloaded
with the previous hash.

This change renames the file to avoid this clash.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 7a1b463c5d..02908b905a 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v3.txt;md5=3049f4ad14be1ebf8c80a93d9d32b2d6"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v4.txt;md5=3049f4ad14be1ebf8c80a93d9d32b2d6"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
+    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v4.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
 SRC_URI[ucd-license.sha256sum] = "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96"

