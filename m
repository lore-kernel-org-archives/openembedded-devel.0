Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BD2C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:04:19 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.64159.1699041855950156995
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=Moj8fMJb;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.179, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c6ef6c1ec2so29778051fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699041854; x=1699646654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJm0xA4v/28NGpElfeHSmVoFrzzBZw4O4ycKQKIVg/I=;
        b=Moj8fMJbbQ7hAb2Z6FOlfAwXxyOpDQ+NWUE8NsKh2Do29L3k5j1hdL9sw8u/iQL2Kv
         F4qwcuC5JUmghN8WkLrMmSMjybXa8UqlKjKo93B4ELFbecqQF9XEh5rRfTaTqvNa5Rm7
         p1JXlNmbos1+TvGovfHOs9JlLZs8V+0D9pDyBUxqrrH55V7EDon0PdxmMVfdaZwtHowE
         YXNXoor+XHfTsdWp6W98suEjXG8SdjZEjNUV2nYICmZts8zxXtHNfyMn7hTr3mL3h6Rc
         ndnqJkp0BRm9KyQI5VCksfdOcQOSgcSeD1V1wYHZkYWNVUldkiTKlJa7LOefxy6bp0z0
         6HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699041854; x=1699646654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJm0xA4v/28NGpElfeHSmVoFrzzBZw4O4ycKQKIVg/I=;
        b=bepzi12BqKKa6wpwiY0Zjje9cjyQPbJWeG7HmQs8vPseXeltvoAPkZulFPq5IOyIrq
         Keu3Gto69PpGFSep7zp+H92NwWX07oxqzJBgk1OTWbNmeHx8OrcWqZBhROyYTRwRJerP
         t0yjtWB9eNqaAofPCJWbhK0ivvQkupBlGVRNR/BiH7Ylm2RjuZQ8kfPCZSEl6VvH1SEh
         5/kH7Pa/5CxjHwlbQ8iIo5Zav2rPKrkOUL47YIzf1Xuo0KhsbqL97bRK5AgG1CbDM3BG
         kKasKOa5nP053vqHIgYmSZxj9/3xW887TbMPlH4lscOnbh4t7A1+6IlKlqTdot20ohFd
         D28g==
X-Gm-Message-State: AOJu0YyLVOTyXv2BkXjmYcVusdazzldyWj8WRtdqRbD/6ukwX9wPhioQ
	OvSGIec0CCh7f4Lsq4793cYsTw==
X-Google-Smtp-Source: AGHT+IF66AuG+a7V1ZGJC7ZQ3LZPd2ushv0Xy7QXWw3Br+a4ImIYyhlMwGVN0VAPRdJFroeFV/mClg==
X-Received: by 2002:a2e:8e72:0:b0:2c5:2eaa:5399 with SMTP id t18-20020a2e8e72000000b002c52eaa5399mr15759714ljk.6.1699041853888;
        Fri, 03 Nov 2023 13:04:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:46da:49a1:7e38:ff1e])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c459000b003fefaf299b6sm3545565wmo.38.2023.11.03.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:04:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/2] shunit2: new recipe
Date: Fri,  3 Nov 2023 21:04:05 +0100
Message-Id: <20231103200406.338830-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106085

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for shunit2 - a testing framework for command-line tools
and shell scripts.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb

diff --git a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
new file mode 100644
index 000000000..0ac06c361
--- /dev/null
+++ b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
@@ -0,0 +1,14 @@
+SUMMARY = "shUnit2 is a xUnit based unit test framework for Bourne based shell scripts"
+AUTHOR = "Kate Ward <kate.ward@forestent.com>"
+HOMEPAGE = "https://github.com/kward/shunit2"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = " git://github.com/kward/shunit2.git;branch=master;protocol=https"
+SRCREV = "080159b303537888c5d41910b4d47a5002638e30"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -D -m 0755 ${S}/shunit2 ${D}${bindir}/shunit2
+}
-- 
2.39.2


