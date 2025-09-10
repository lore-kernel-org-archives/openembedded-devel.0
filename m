Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CE0CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:16:52 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.19126.1757513478433851396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Sep 2025 07:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MQ5OuVqN;
 spf=pass (domain: linaro.org, ip: 209.85.218.44, mailfrom: tudor.ambarus@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7322da8so1285230366b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757513476; x=1758118276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aYBQ37K5LRlgweMOaGL0mn6zGsJnKTTRPEX1qglqUXc=;
        b=MQ5OuVqNz9UH1sWj8l6VTiRG6eFl1jw+/G5v2FaMTKYofVF74iVFmY1sSDo6JDwvzU
         dLMwFPi4yVpCexF5nD6Kh39E4ew/zCFQgghFh0w/zTX3f6WaBvAvisoqfGI99+U+QT9E
         p8meifwtNG9p5uxXjUcV7KvzbQBpmO9mBmu4hOysrEmevTzi3jP+y3dQPdRdwTtmVlpi
         V7ilN/dR1YpQK2gmjRbbJD7njHr6zpS/USxMUafmKZRmzsWKBRZeAU+OUxSuFs8xu8AG
         HWurYTaN5GS5uVsWc5l5atDX39H5y1FWkVVD2b5J4K5Q0ZdWsfySL81Pxd0H2rjK0XQe
         rV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513476; x=1758118276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYBQ37K5LRlgweMOaGL0mn6zGsJnKTTRPEX1qglqUXc=;
        b=C16oIEmrjIvN6+cmB3V/3sGvc1JBUvcVgsh85mAbIfQsPWC5NU11ZXMC3Ph7qKK2HD
         24dSzHWx0SVaLS6Ixm/rrusJ7XA+ePP8mFH5yQvXWJZfZNp5I52ksLy3toEwagP7lJlQ
         mZZE0Hc++4ZRniDOYgwh1+vtxTShNC8SxI6llFPbcfBfMiLstL694PrgC4v4dUdk3VKp
         fSIJP79YS39gf261Ud7+u95+RgRuQMJXJ97R1QFLxLeTb63H89NfsIstj8H4mjYcLmpT
         lWL7SqcFTpU5g5lnxPd04GU7I6e55HfvFS5yG+e9xaz4iA1Ni3EEo+ETcNxm2fCFk2a4
         6IDA==
X-Gm-Message-State: AOJu0Yy4T6pyX488w6ROPgmctdyNfV51HDPYky5wbDsnaDNiTNiUkoak
	egW/deHqaz0VZ6QT5+oEvJPgdXmmWEMYK9H/ISSgqUckSpfK6y9SDWSGcqN6fgijzQTPSfuQJme
	WMtWLjNA=
X-Gm-Gg: ASbGncsnbewLaEcTSbbjMTovgPhyaUIFbxZjfrSvY98J433QcyJ4wAvNvgfLU7+WDy3
	+TrMhTuyUR4Y8WpgZdEwg94y34cQKA7OOzYkwhOC19o/55dXc6r29gTxLyGmFXzjuZnSwK8iOuz
	KCx9d8sbvYWz9J+QYyef1FWhHGmn7VeVDWZKrISH1x/e+v3a9ugEWRuoxTZtbREbhApimh4RgeB
	p28OYGkTAefrsY1ku7/vnI3lJ/NuPHMUYdm1SKmH7KOuqqMAeDcKEhVwXHZeOBVY5EpOIHpktdN
	zJA3M/n0WcESJnCF/F2o6tBYPE/Yri8qNMYtR+uasJJKkGT56LggN4EK7cBpYNjXzhv1zmwmpll
	cXARSlA/2DJH6qea+4vvVAKqUPh+HSh4fE7H9X0jsnfeTcMXinuwwc+tOzxj2Vas3YtetUwLipa
	6UonHjEeg=
X-Google-Smtp-Source: AGHT+IGv2TtZxRN/9pH2K/4JQWXQqpmMPHint26c0ALNGkGY7yXnUpHWjop3MWajd3W5R9TCf0hr4A==
X-Received: by 2002:a05:600c:6304:b0:45b:43cc:e558 with SMTP id 5b1f17b1804b1-45dddef818cmr127293235e9.35.1757513062497;
        Wed, 10 Sep 2025 07:04:22 -0700 (PDT)
Received: from ta2.c.googlers.com.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bf605sm7032461f8f.12.2025.09.10.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:04:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [meta-oe][PATCH] kernel-selftest: add cpufreq and cpu-hotplug tests
Date: Wed, 10 Sep 2025 14:03:59 +0000
Message-ID: <20250910140400.3786320-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 14:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119347

Add cpufreq and cpu-hotplug tests to kernel-selftest.
Tested with pixel6.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 7f77f45c7e..430b5974b3 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -49,6 +49,8 @@ DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
 
 TEST_LIST = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
+    cpufreq \
+    cpu-hotplug \
     rtc \
     ptp \
     timers \
-- 
2.51.0.384.g4c02a37b29-goog


