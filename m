Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227B3CCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 20:57:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1786.1761253020681177410
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 13:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9s7gZYv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47118259fd8so8583105e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253019; x=1761857819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSCCr1/tWKXJfLzSBJK3iMSs66X0/l58/cfdsQrUl/A=;
        b=L9s7gZYvtKMWP+OlxQf6v1cn6uXpnOfQy0h+97qejaNcQe6KXGKmtMAbwT9fn70V/t
         psRQ2kKx/z0rXYppaLUa7PtA/EMLxgsBmEwkfmqvMNVnGj/XS+bUO6KKbzIF3+gU0Q0W
         TAlx9FqjUhSgNt6rkF1L7CJB+MXV3QIb4d3rwhGLCSwaRMMTy9TIWZY6Mm/SU7KZIF1X
         dWkQThUxfsS+8AvOeKlLhvFMk96Q6EC70UQlMPm333NSA0Lkq+ni4J/V6HeWz8QcLuaK
         K7vG6PPosyUKP0LfSJrvC03UJQQ29bTTs/vq5CN9Q79I6TeRqUUywQcWY1qP8QtSqmoJ
         KjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253019; x=1761857819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSCCr1/tWKXJfLzSBJK3iMSs66X0/l58/cfdsQrUl/A=;
        b=huiFXWpyiPOgFNekDjBoJLZ95EexCH3RbyuyyawNywKY/2MKpY4DZOTixp8P8tOejw
         rn0ZTxBYaAcjgOBhKSGizykgETCAWpiDhzR7ZLSLIOW2IaeiqyJNG6qnugkKcBvzuydk
         uQ83Hb+nGGOhqrL0QoFql6Qkt9fuwSEQeDolu0M2NjrXIjlOQOqE4su51NuIcb2blVnM
         PwLfQmPZv26QiG67OTT7jxGKh8fqCT4XhWEFfQpLv4BTeFDVhY4YYppIu2hPvO5u2MUQ
         LoNkGZbIwGSQKBKXkXyhZNWwYcu59BZ2uyWdTN8V3bmh2yIkqa/6blIHkgGqd5q9fUgX
         nNLg==
X-Gm-Message-State: AOJu0YzOfGQMAvfmVBNbiLOtxHpGJIymhayAse/WhFnRH7mkDBIHfHWx
	P3WpMtpbNLUeAclJUKljY09EcyKBb8ldReXULJ0Cem/8LHxwFMcnuDmoBn+ogg==
X-Gm-Gg: ASbGnct/Nfv0N1r/Y3hOyfNxc5v5N5SfvCMXgKVA4AarN7USBlPzXi5WMUlkz5sWw6j
	6bJc+lgo8IHIO5pwrpmQZUNEkELya7dC3w4dqw5+ds+/h/iPdEZP5FnmEU555tKFoTRdm278D/Z
	mG+7Tk/s/ncnDgkRpzb598FC33P6WtPlxhD2jlhrA1oPSKuUNc9etxo9c60rKjcja9JgmixQ+hB
	PAOHXgYW9rncLsFDQYS+YabEc5wQxoBZB5QfQcZdMJ9fTy7OWUHx20fLyPdu2uTVedsA9H2+Zy5
	oZUdG6mzpQEI+mMUrQc7negsiOvF2c494Dd77WdB9lnmDU2f9piHD1EtxgVOt9kSIAxK5JvQbiO
	np3k7xLTCtYVnxWCo0UKi1H0MdnBjuchQu2Bd4otGDvCR3KpGJ/CAGP4icOd99xIKHAMNCiLKXQ
	==
X-Google-Smtp-Source: AGHT+IEUXM9ZowVbCeuIuxa5tMO41k7cp9XJeRRnZrrLP/BoWsIUdItrlbm2AZ9eAD6bqNcOO0JUng==
X-Received: by 2002:a05:600c:450a:b0:46e:442c:f5e1 with SMTP id 5b1f17b1804b1-4711791cb1fmr197684905e9.35.1761253018813;
        Thu, 23 Oct 2025 13:56:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342373sm137516275e9.12.2025.10.23.13.56.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:56:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-py-cpuinfo: fix ptests
Date: Thu, 23 Oct 2025 22:56:57 +0200
Message-ID: <20251023205657.804799-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 20:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120938

The tests require the library to be present in the folder of test execution,
otherwise many of them fail.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
index 6de2f17459..1cb33edf30 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://run-ptest \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -rf ${D}${PYTHON_SITEPACKAGES_DIR}/cpuinfo ${D}${PTEST_PATH}/
 }
 
 RDEPENDS:${PN}-ptest += "\

