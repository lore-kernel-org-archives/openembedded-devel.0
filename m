Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F37C3ABAA
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 11:16:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.7497.1745899866715645816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5mztisr;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264aefc45dso83734635ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 21:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745899865; x=1746504665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8KN1wFBSJdcIx+UPpeGte/QLvfS2qdptJX5Bekv7ng=;
        b=N5mztisrIq+kB8eJR6GoShMNLUY/tIj7GQ37CCSqf1cTE+l+kvnVAh2P2RfsvE7578
         fjHwQplQn42F0ZPSBSKrSdWt7KX4/Xn+P8bKFxLnnYIsXyVM02OwE2NBRbTW1vqN4yBM
         NxBDvzJ2cRbdDPMj9umvSZn5gjoqdsyckeH82PX/fsk+NQsZ4QVShcr6F3yHJbn4UpO+
         PEgpgw17qfiJhzJqWYgXt4cEVNAMkH3gc0MPcEjA2AWtjzVO/BXtlMdtGVPtB5GK7rAZ
         Tc4ocSsOSDH52QzqtSbxKd4w5vQfVA/AM//Y4w54tJ+OFpfPisXwENplaFbksyCHwNoZ
         DhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745899865; x=1746504665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8KN1wFBSJdcIx+UPpeGte/QLvfS2qdptJX5Bekv7ng=;
        b=kUJZtQq+zhLFFd60/h6MiJWLRS+EId0A8Ei+tkkjdSZfQSOIG+XP9HWVfaMlId2DgY
         9oI1/yhNKNAK4d0NL0DxPaXznZsoc4qAIF1cWm0n3GH7LuTxNv4GIE2GWm4NgPANfdf4
         Zyff4wcn2QmF/wzG4eGG89gMwN4pJD+yR29dy6bp9j9Huoe46oxZB1S5AzGdTg16RpUa
         xnAcfF0QgWjeeBZGdAZkprRrrC+0PbBOc3rFoLe1evBxqWg2Bi8FWslkhuw0QgtdRvSg
         i+z8sX5Dp3lDY0L8pyr7yrI9y4ZjxNQ9u4uJE9C3Je4lfwVS1reu0RQM/NeTX1ZPv3YE
         2ZEA==
X-Gm-Message-State: AOJu0YyQwVFdXk9SW5aXxf/zjOvNMsipXOD/Czt4Vp6Tw7blAZkisGcM
	mJ8fxfnqsSvTyWPMk/lkRWnTcp4nDK/OnPoKnK8ZZMVFqAInfwpdtkDnzw==
X-Gm-Gg: ASbGncuKtJ8hrmsOykQ39z9rn/3ojZTFvlfHvtHcKtp4qwxwFZ3uiilBNGszTwItJiE
	Or7V2Z2ilVdyhcKK7aTXASB8xuGyFQl5FjvfH/pq/P3EzcASO/8XiK5eD/G+qf0Z0xsdmvPfnIQ
	sVFiZjOVx3IOQ7hIB7roCCde4oB/+yADMNMJ7ytWaAYxx6/GJZ9kb/IWVj3nwVjcuyBA94wIi37
	TaRah3IlMuRhdhaR8Xe6qogi/8ytBUDauV3Kz/2QqvBfALM8a9r4PMOLXZ23FfO+m+vPU3hzmJh
	O8YZD0czUw8aRFazajAblbifoq3jw0xO8qoL4gu2wl0kpV6s8h6S/TJBVeioj5NkA1i9Wg==
X-Google-Smtp-Source: AGHT+IFrcjTnDkBmAV/hbfEeFImk00vBxWCrHq+CudVu/kppE4f3jXGj9hwenA93SDg7bXirfVxSmg==
X-Received: by 2002:a17:902:d58c:b0:224:376:7a21 with SMTP id d9443c01a7336-22de6058dd2mr30784215ad.42.1745899865104;
        Mon, 28 Apr 2025 21:11:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50ea7b4sm92230725ad.152.2025.04.28.21.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 21:11:04 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
Date: Tue, 29 Apr 2025 11:10:52 +0700
Message-ID: <20250429041052.11681-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 11:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117238

    - Simple, stable, powerful.
    - Apply for embedded devices to PC, server.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_git.bb          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
new file mode 100644
index 000000000..8acf50fe8
--- /dev/null
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -0,0 +1,20 @@
+
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
+
+PV = "1.0.6+git"
+SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


