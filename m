Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD64D1814C
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 03:09:47 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.4726.1728961780686506193
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 20:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PG5yj83q;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso3069706a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 20:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728961780; x=1729566580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3l6aguzna6iDKN6DLmgMmLtxsayTR9oMsJeXcHvhzfk=;
        b=PG5yj83q/fGouyyUOxCsVSejmWeCaV9ICM3aShtrQ8lj6Ajnb2UanvFYldBfTmavE0
         1xqNMOgzLqDSXGgw4Vig3BDCdyo6jo1dbFAwB5GYsotAXkVfz8LOnQOsBUcaYt1oLe/I
         RHRAK+LXDhzelfwgt4OihFb6zzEpv66X6iIfrKmjvHL6gpz5c9EB95h7Q4MHlbO95D2B
         x+Q4CuOxkrAXOBJtezWSgFXd58e+fCztV84DRblAZFE8kPGv4VmgHOYgyYgwVx10JBWN
         zpipLORZfT+TbCVa3GEuXq3NT5bRKOYv6OdYDXke4ciVNN9C7jhnhFzSUu6tMBRY6zZV
         eLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728961780; x=1729566580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3l6aguzna6iDKN6DLmgMmLtxsayTR9oMsJeXcHvhzfk=;
        b=vI7x0phVyOFFVbUAWjtRyBKyLoZv+s9nc1Y0yQD3VeBgKEf8mu1Ddng7V9QgGX5pVt
         nsFZWTXPJWcqtzJHuSH5Y3G1sbw7WSQb59F6TkObMRExwH+B+nbxMGYgejxhD/OLvmRT
         Q8h9+Dpoha6TUpsMmekYQM5ncjoC2CWCYwN4S/htx6Z2tfQS9d63ic6FKCk/j9zUjq37
         LHwsgBgg30CeDghX8BNbe2jLSnod+swIxTrpNI37/XbWsX7QzZDI0hpNxzv5P7+6aR8b
         B3rgxNkxyzxdwjQ6UWSzPDfguwfKnHKZliv1LHA3TDiLdTW+TkCmN4KutVgmcXzaaEq0
         S4Fg==
X-Gm-Message-State: AOJu0Yzwt9xZthz9NVcUoQQcrlVOupKuZGNxdqIJSjMmX4NgV5eySBxd
	mr6J/imGJGOJ1EyLdeodGV4uda9QWaFrWYqSbm5l7WK6MDT7MpZ0LRmV4yPD
X-Google-Smtp-Source: AGHT+IGwIBkOfIMbDlSQSMvRUgNTSZaz+DQG0+mdV1VNIwpBif2l25tQEs963jfPj/iw2WNFK80hvA==
X-Received: by 2002:a05:6a20:d48b:b0:1d8:f97e:b402 with SMTP id adf61e73a8af0-1d8f97eb71emr299089637.13.1728961779527;
        Mon, 14 Oct 2024 20:09:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7932])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c728767sm286105a12.93.2024.10.14.20.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 20:09:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pytest-codspeed: Add recipe
Date: Mon, 14 Oct 2024 20:09:36 -0700
Message-ID: <20241015030937.3585151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 03:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112917

Needed by yarl ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pytest-codspeed_2.2.1.bb          | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-codspeed_2.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_2.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_2.2.1.bb
new file mode 100644
index 0000000000..b7b5461f6b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_2.2.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Pytest plugin to create CodSpeed benchmarks"
+HOMEPAGE = "https://codspeed.io/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
+
+DEPENDS = "python3-hatchling-native"
+SRC_URI[sha256sum] = "0adc24baf01c64a6ca0a0b83b3cd704351708997e09ec086b7776c32227d4e0a"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "pytest_codspeed"
+RDEPENDS:${PN} = "python3-cffi python3-filelock python3-pytest"

