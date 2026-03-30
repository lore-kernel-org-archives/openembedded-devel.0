Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145EEFF4954
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 06:52:16 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45680.1774853531801710680
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 23:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qF54JmXy;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so1734623a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 23:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774853531; x=1775458331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rs9yZGabCYy2RgwO8m0Pigzyhcd7ontvbn1eTksC+g=;
        b=qF54JmXydFoPjgKAvelStWnHjTr7FR/X/P/ES7lP+GYJK7XvdwWMefEaK8YmGVePt6
         1CiVQy2Ou/GxfNy6PacQen4zGU8IV2f6E1P7HBYWm5jABu9K58PJ5jLAZaMH8td48WH+
         U2JC0W+wQQ79dNo/B2PcnIu3crl7PJ+h5pHwjcHdzv7m6Mtncrh+3IWdugXsE06Omkfx
         +F8YJm3Y2rwAgcYHZjbyhziQnC9Ac5IRJOPxyDMvx6CW0Xy4Syiy4VhTsvitRIlrm2Nk
         sx/hyOSELS54//mdUa8evzUIqcYlo1wEDn+kSHRcWaKl2DNkHMoyslfvQkRNnuegDtLR
         1E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853531; x=1775458331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rs9yZGabCYy2RgwO8m0Pigzyhcd7ontvbn1eTksC+g=;
        b=KbwDQHTpvGHsk9yqHOdAtbtj4ydIEFYibwHxUDG5kM8ttSLWr/jMqLyomcDlJOZL1S
         WAzV1/QnYC4YgQh5p8FrZuHiWXdmXAkSimqNOGukgdYryiYgaZzsZhP6xp5EHWRdDNpI
         NVkRjHmmzxoaJj8iR5GWxKNfFuYuBRQ6HVk0nj4A4rEMqzrvqdwhUkmwyXABHpflCWbK
         TeHgpUB/7+P1z8FS63KYdgPbr6j537qnGQaxxrMsk3WXfUDWPrY9IF+kvwmyWyYn/tj8
         O8/AKo46paFDHgmOh6vA7yIGfCtf+p6Sjz40s/WyEXF2dIS58Hoeh0Iqo22EomlmZBGC
         hVog==
X-Gm-Message-State: AOJu0YyxJW/z39farSsaxOKhumLEv11/OQw7jEoAmhOb9X/G6zZtDJ6E
	sO8vkoR5YFj9d1py26MCtDZazOADDh4jexmpMXeG4FbCg/IicRIqXCh0LMr4tw==
X-Gm-Gg: ATEYQzwRAdozo7cNvrRlKO/fgL2hNmovXOedEwth/5sCg9LoRyQQNnm3v8B9qQ9dZ3T
	vZVxj91Yb4RcnBviwi0jZduR0Su3avJYdrpjVVAICwJPVpkNTUscl3ebnFdg7CJeWCn9UCI6HWQ
	ZgZR6hd+P64Vj3dYxkZnfC3DAA9pTP988tFVeOJB1pKaXe6B/PW4YiRn3QjVn/SVXoKyeHNyxKX
	k48AUATHgEzDEZYNLH00dllpJSMoJPq3MePkpxdhMZwSg2rSS9hJX/sP0Ut/soODv4tkNgaqhwl
	SUdXdK9kOo29ZylQiJpapvCeAyfkETOGrbKJQz0ZrhDyQCZi4sMnh273N1YipfuS9olWFZOOVDB
	oCvpbbCpxc31qdiR8zujWg4hHbO03wSjs4G52hPhFKmD/ub/f0AHnZnOURGEkYcxfqin++DXOvn
	zRpQs8Jr5/XHckLJqAZYbJlad/ilPH4nWc6AqkI5hg3yJy8ehg84q1BBPocBzMeW9EVWPUlM4G
X-Received: by 2002:a05:6a20:914b:b0:39b:8b8b:39ce with SMTP id adf61e73a8af0-39c878b6c73mr12033304637.28.1774853530983;
        Sun, 29 Mar 2026 23:52:10 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.197.75.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916ceaf1sm5316756a12.11.2026.03.29.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 23:52:10 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
Subject: [meta-python][kirkstone][PATCH] python3-protobuf: ignore CVE-2024-7254
Date: Mon, 30 Mar 2026 12:21:50 +0530
Message-Id: <20260330065150.2931505-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 06:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125833

From: Naman Jain <namanj1@kpit.com>

CVE-2024-7254 is a stack overflow vulnerability caused by unbounded
recursion, specifically within the Java Protobuf Lite and Full runtimes
(including Kotlin and JRuby bindings).

The python3-protobuf recipe builds the Python implementation using the
C++ backend (--cpp_implementation). This implementation does not
contain the vulnerable Java-specific parsing logic (such as
DiscardUnknownFieldsParser or ArrayDecoders).

Authoritative security sources, including Red Hat and GitHub Advisory
have confirmed that non-Java implementations
(Python/C++) are not affected by this specific flaw.

Reference: https://access.redhat.com/security/cve/cve-2024-7254

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
index dbb30ad4df..52fea2ae6e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
@@ -14,6 +14,9 @@ SRC_URI[sha256sum] = "2e3427429c9cffebf259491be0af70189607f365c2f41c7c3764af6f33
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
+# CVE-2024-7254 is Java/ruby/kotlin specific and does not affect the Python/C++ implementation.
+CVE_CHECK_IGNORE += "CVE-2024-7254"
+
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
 CLEANBROKEN = "1"
-- 
2.34.1


