Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42413C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 07:00:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11032.1785826839136662320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 00:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DkX/lH/e;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbb85186d43so2041551a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785826838; x=1786431638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSOqx3j1/fiN7gy/rDE5MefQSuJ0If0OaSPkDkOuVAs=;
        b=DkX/lH/e2MdF4u9KGPmajHLE5tf7SinTWa8620bRwFsXlFn4cHa5GbIPdqln5AS5IU
         1aLP6KA1TZfoK6jbBqGjBdgfpWB5OwnQbhU8oXIw8/Lxdm7CeXbCNxNUSk9HACQLfxPs
         LJ3KmFka2eNXhVpnwZ3hBeVFtU2EcuJ2cDRDK8HbnfXyj61KfxV0rZybSmNQzDkDBIHf
         zDBkCPcSXBzzHPjVEn2NvLJW8PSf4b9Bp4t7BXrCrDjXDjoYpQSi0N5p9AHADDfsfvIG
         eCbn0KZGik6E3AZAbuf7kD2cDud64W/WErMZMttSWwY6nbb+P7YBcaRLUahNmYPLw1uV
         ChVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785826838; x=1786431638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSOqx3j1/fiN7gy/rDE5MefQSuJ0If0OaSPkDkOuVAs=;
        b=svr7zfbO2hKCJQSaLE2fWpK1EF0C2hMdwfv8M0jkbqOJN21UIw1s0TBh/djkhCXJtq
         HCRNZlOHhPrcelDtdDUBcdnw+NTt6zNDc9qrsYTn9gYB+Hv5MaE0XUQk5voejRMuay1U
         vwfJenU/wUDvNlN7R71YLaox3zaYlPM+J4eWkdRgJAjxWo84eF/Npfa6YjC+I40um7aD
         Chw+UWJs0HDaLPlS8PWHXXbmCrQ92kP7H9jLnDgtkMyC9P8omUQMgWxlLJ1cEpkILGtz
         u3a0d6z4SS6c40o1y88EIdrAXqMRNJZ8p/uI1Ra4Pafw3OEok+RuPRcTHnjjuafJ/0/9
         zZOA==
X-Gm-Message-State: AOJu0Yz05No0M9ipG6Gda947WX7U5DAV3bioqQ2Ht+dfhB7rdL+IM063
	L7hALOD0lHNY9B23qHp66/9sqGAPLdC6MweJl5A6Qjn5tnHA5/l4szd/0UxXpQ==
X-Gm-Gg: AR+sD12YOhTeJIZehBdOb0Ru9rzzp0RpE0t6TvEsqBHWzHM4QosuiPfxdOjOPE6Uobk
	9O1oJx7VU9OkAL5TCkrrTaS4z4KmDV7Tyd5F1S4QrrlJN3+VGd+1gjT/KOfWmEfq4R0Vx5RFzLN
	mr0GL7k3U4X47hyxrmhMQLiBz7yLle2NM/vry2dDXoczxgA4SvlLGHFB4DshqR/A3Mr5FQs+aDD
	BlMhM5A30ZhkGLajQRx6lAAEF+bEf/ibEHI/NWU2TMTHzfmXVaaCn6FEYjxNh3Ahip9bU0a5czN
	R8edbdo8b2S3WUWZyDtH328MxHGbNnEqXLEmWORdO+6LdzGkql4tSgINvS8Cx3YgbPWoZUlte3s
	O3jlcpOloXEfgzg4ArcAQ0NIw72RNJSQUpZEGHm/ip24TAscBXV7qPHUCMYJVWrp0kZkgCgvnTc
	+hOllpIDsaPGNeTV/AbF0KD4KI8jsZhtW6DrQR2qqvPbtUYingXPYqjH5/WWeutPGqJzbSJxuci
	oNi2JNSKI+/
X-Received: by 2002:a05:6a20:7f8a:b0:3c3:875d:c531 with SMTP id adf61e73a8af0-3c92a598347mr13280404637.6.1785826822141;
        Tue, 04 Aug 2026 00:00:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm916034eec.12.2026.08.04.00.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:00:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 1/4] python3-cachetools: upgrade 7.1.4 -> 7.1.7
Date: Tue,  4 Aug 2026 19:00:09 +1200
Message-ID: <20260804070012.3171225-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 07:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128735

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/tkem/cachetools/blob/v7.1.7/CHANGELOG.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-cachetools_7.1.4.bb => python3-cachetools_7.1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.1.4.bb => python3-cachetools_7.1.7.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.1.4.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.1.7.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.1.7.bb
index b8aa53b67d..e55fa6d0e9 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.1.7.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "437f55a4e0c1b01a4f3077cc470e6991d47430970e36fbcb77e2be0df4fc1cd6"
+SRC_URI[sha256sum] = "a3e2a00b14d8f8a6b70c1dae7b4685e7ad3bc965c5b42124a2d6ce895da6cf50"
 
 BBCLASSEXTEND = "native nativesdk"

