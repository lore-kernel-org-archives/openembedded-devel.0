Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11244.1793278602235745443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Bey/Piya;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0759so1083371f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793278600; x=1793883400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wgp3/HbIZxBVeYJ3FJKoHifzetuHFvOR5paeP0ajdw=;
        b=Bey/PiyaYppIk2hHWzxAfbjRcIQUB8IFTnL32AAvZRMNtCXVQQYOxL+JBjRabzL5RO
         furgbm0uEMoDJTiuEUw8Zztgco8VBRtDQfoFRqvQqIrigTRQLKuzPxszwCGlO/8GqXq7
         h61I04rHyM5slGneYnLMPEGztqMMfZEgQWc3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278600; x=1793883400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wgp3/HbIZxBVeYJ3FJKoHifzetuHFvOR5paeP0ajdw=;
        b=CjtgfnG6kFBK3l0a3/d4KBPv6BSzNtfTXkXasa6fcwHaLK4K+MmMawCyxzz01oLFHm
         m8R+2GQOdrXiBkmIxG5+q7g5QLcFwe99TquehR9bm7pWzARvgIX17aw6bX7uTLTS4y6i
         pG7lzXkwfq6fH3M+SOk7x6vEwZbYsa3z5jN6NG21DWsSCuuqrbW2JyW7szmcL+IYxF+o
         HMN9W1/suTF281EV29jRxIOQ3dNVhuR6eDcCf+qmGBx/hxiO9yUvuvvnkiNXsL7iEG7Y
         fx/N+MCZsZg61IWd5VAbyJoRdlZO7EEd/MrwtByrpmCsI2nGgSZ/XgiNqGmrS1qol+l1
         jqrQ==
X-Gm-Message-State: AFq9FYKcmvWC0LxVkLDqUZaJSjS3fqHgbtIrfU8ajTraV0tlGV4+tXRP
	e75XFK/NDDhsvYjF4th8cYo+JZP8uGa6oBoMWpaLE9lFU6yh4vrgtDebEmoGEU5BoHZ3I2X/xeM
	kIOum
X-Gm-Gg: AYBFou2MRL8HyUulbr5wzd/HVHcNJzSvGmguDTIXs6yCzQ9wHxPsR0qEMCiBHox7aeB
	nrvgFcujOVOI6zwTreXjPaoM2osMDvUUBJF5G3lX6e6ljiDOwDbNENscaZUxJ6uF2csZ9EefGmU
	pkqZ8B3U5UMcoK0I06tV/2nIYos99MIFPpu6NGOIoIGSe3nCpq8cYyudKfNKMZ0eB1/l3Zmapco
	VzHG6ArrhafzwR5924hDGW527qvD48NxFJhAPB6DimkkqhIGJ6Ewf3Xn55O+Mk5UV6H1K8sWRMF
	ePymsKjOT1VxETmHTZIApTuA4YjC795j3231/SEmFcya+yZVDnkGGKM0wqFOEeqQerfdewdL9pJ
	LfAk+jdFmTUshlQdPk1YuSLoGbWigwhp57B3vFznRpLvpYu3fCLADZr3enPkLqxsZfG82V/WHS0
	EpZ0PXb4454gCkhcSfhGSAO/bUAbplXM74EwRoeViA8oWmjpxnEtTolH6PN9L8a+NBcFzISSBWF
	5h/WP4df2+3vo2Rdbu2YohQLnWSpI/dNnsAKwZ0BNX07kS2BhxntBvQX6WgGkhykhHv4ghJkF8A
	27cJQFL+ZyKAsQl3o+wIgCmZdeWoXjxFpfp7g8qur+0o9CiQ+ozRry6aD0zA/ygHSimEowSW/KP
	ZPvB8YoE1Ciuy7tKhBD3yG2axTFc13lqlvjYM6iXpzn71MCZTB/5INQ==
X-Received: by 2002:a05:6000:24c8:b0:488:7787:469d with SMTP id ffacd0b85a97d-48e5d2f0914mr14251786f8f.25.1793278600371;
        Thu, 29 Oct 2026 05:56:40 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm36160335f8f.28.2026.10.29.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:56:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 1/4] python3-opentelemetry-api: Add recipe
Date: Thu, 29 Oct 2026 14:56:34 +0200
Message-ID: <20261029125637.811856-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 12:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131660
Content-Type: text/plain; charset="utf-8"

Add recipe for OpenTelemetry Python API, release 1.45.1:

- Make AnyValue and AttributeValue explicit type aliases
- Fix quadratic time parsing of the tracestate header and discard
  tracestate headers longer than 8192 characters

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-opentelemetry-api_1.45.1.bb           | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.1.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.1.bb
new file mode 100644
index 0000000000..6e2018a808
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "OpenTelemetry Python API"
+DESCRIPTION = "Python API for OpenTelemetry, an open source \
+observability framework for cloud native software."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "aa38ed19bcc084ba42782a73255b3582283eced7ad6dddbd6695189e69adfb75"
+
+inherit pypi python_hatchling
-- 
2.47.3

