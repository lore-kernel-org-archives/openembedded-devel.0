Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13FBCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:27:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.35852.1756981674966611175
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BwQ5rRVP;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so5629455e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756981673; x=1757586473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLJ2NwxuMMSwMjKEbUMdOYxe6intIJAt/+HHQb7xmmo=;
        b=BwQ5rRVPWLlDGjHN7sUIAiBVpb5e5YgdC1pwoWmi16X6JIsWAL9IoEHS52J6av/1qT
         wpsbeQv6e05OfsKVIRTIEAE+iukxeN8DIcwVlBhrBQ11OOXiOOxRo902k8fydDhVFD+9
         39nn7WtgQ2fc156RDdJEhFWnjAVSBnjnSp8XcPYGasB/0vJcLXXRqfsJBNRtiUF2H0DM
         o2wnveeIAC3RAh6cjmJgYm5m7W3dydTLVvlge2jlYW55lajP6EksOf4ynu4aAiKF//Ki
         4P3VZ/ipNqb+csvYApqPOBUOrRAyqRJojz4mgnHmtKcgX0mLasZGYR6m5Rotq8rBg3og
         itHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981673; x=1757586473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLJ2NwxuMMSwMjKEbUMdOYxe6intIJAt/+HHQb7xmmo=;
        b=Nx27A26wroSa1AaNX5Bv8+NNFtrFKy/HO3bMoDDTI/8BiQeJxACEQUO2cNOJWlwbfL
         BBlXnrouvpyP/AEUmXQYkyX4qb/QAzACniPTJhhnzXqS2pG8T83QivWnz5JHlpRy7UZM
         /Di9sxACbwQEPa56SeooAzhlCRC6Nz6Cp9dZ1D9kVRwqd8MgUHT5r0Yd9TMyzo/kNWtL
         oA/s2t7MZRL4M2OJVebMqyX7q5GkGtoaGPLC6CJyouRITVoCUEszvlbZbfEopQUqWp0c
         ug9CFt7TKz5POsXrG9qO/4gq/UuoUUBauZGxt1tgA0LrFAiXoxszwz6niL8Qrtr9ck/C
         Xwew==
X-Gm-Message-State: AOJu0Yx1ZuIxn8M9GevOVCwE8P+oa33TOp/ho403OsudQM+4eZu4f8bw
	2jyDZJZ0YdejIbWJEzz25IAC6CCzZn6aqSrdAnlda2cWo37mcL88Ab0tzrEXTg==
X-Gm-Gg: ASbGnctzFd5Nr0FRHPlbIDcLJmIXswk/hftHtf+IipmoMwSWZxw9miiq3qJ+YWNpi/V
	Xdx7mkXtzGiwN5IkPbjmF/oOIoD5DNTVfhPFhsl/MiAHNj+q+L3YKc15+fyf6w+45Gu7rt5B4/5
	0dmIPhLrokMbUGNYToOySgwJJHnf9Sk33iVrXp7zHxveDgft09NhsECnJGMywOGO3O5i0lI5Bnd
	1RnCEHiH0PKzaFHfhWdFLOg7eQA2VcuW0ZeL2dE2m20x3K/ZefxVUCtZmcYdqUFSeKN4wptSKPX
	fKY0x9FMZRy+K/uRNuVyCAnBjk15ibzg2xTHg3c3U4c8MKrz07bgJw/4TFfcc+TIXt/8Z89HBBA
	a+pKsMphyekqBH+BW3xtxlW+cuKDJ9J1UllokKQmrOptx
X-Google-Smtp-Source: AGHT+IGP/dJHz12j2uWXMYExcyTX0vKz2gkG9FX1WDFkJURWihNPkDzy3mD5zxEWDbHsBDeekV02Aw==
X-Received: by 2002:a05:600c:4ece:b0:45b:97e0:22ad with SMTP id 5b1f17b1804b1-45d5160105bmr33974185e9.24.1756981672955;
        Thu, 04 Sep 2025 03:27:52 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05faa9esm14925335e9.3.2025.09.04.03.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:27:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-cfgv: New recipe
Date: Thu,  4 Sep 2025 12:27:44 +0200
Message-ID: <20250904102748.602126-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119279

It is a dependency of python3-pre-commit.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb b/meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb
new file mode 100644
index 0000000000..73d5d2567a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Validate configuration and produce human readable error messages."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=92844452d544a48a78abc3a862fbd8a4"
+
+PYPI_PACKAGE = "cfgv"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "e52591d4c5f5dead8e0f673fb16db7949d2cfb3f7da4582893288f0ded8fe560"
-- 
2.51.0


