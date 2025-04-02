Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73F7C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:42:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.24.1743565369621650013
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiY+VGEX;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so10704449a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743565369; x=1744170169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/izfMHFs4z+XXklQpV7bb12hFGK/GcPYI7pWl4HWQUk=;
        b=BiY+VGEX6pDHq/i/S2xDloF8s1l7ezXO6Q44lXOFQ+Rq+Q/qO7Igd7SULcMYhBBv5I
         h1OvmeDBlFfk8SqN9MBhso6mObdIViMgmcn2fc50Dsnj9ayg/iUFLWYaNrAU0p3wTTmN
         9qstC5k7Bals8CXibjOkjdxQWs1syywVka//x37hB8SsbJh2W/mkigwFu4m1ob7G2uN3
         vmn8OtgRqCF5I/P83fArmYrqHDxqPTa8j6MJmMx1vH2fm4y/2TmOh661iIfm9h53pJWe
         7BFbMtp76qHliYxR67qyXOnDwlEf+1iwrsUKg2cRzPvWcz+nKmMD0eII/hNQYAJhuaUR
         TDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743565369; x=1744170169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/izfMHFs4z+XXklQpV7bb12hFGK/GcPYI7pWl4HWQUk=;
        b=gMZju3o4QZpiyO96iniJbPbmUHmzmkdBIjb7vBF0O9xTflzazl6Ja5iUeDrZBahaLa
         6VkhM2Sd51DHh8EAfYVx7guUb0UVLjkRy3CLg0Mkq5H4BbIdK+rqsMkiuMCCnx6IsOka
         k6Vk2uMEt+F7WarL7Xp4mYaHkkdgtiMu/sy/FZPoo9YimtOhIkbMA3h3PN/R5mWpJZRm
         KdM8hu+cqQjrMReDxRE38agoaE7OuCrLaYprTvFkXUmuBfyfQ3hjPzQoM+hjcmhcoSng
         kJcj2Gyb2RUE4O6iaq0S5ndV+TRco5CqH9uWBGSIG5eeVk1Kr6ci3ZutewIgm2E9ZUUl
         +AVg==
X-Gm-Message-State: AOJu0YzrcWB3gKwcvAgOzGJwOKCcfN05zQbqNGTI+05FDGhVTS5FeiWR
	pxhGaIHyU8/HFyZRcjSSbc/b+uktZT7V/N02+vsGw94qcd4as11SRe0WY8vd
X-Gm-Gg: ASbGncszQP6uxQ+o/zPbXgwP+kFPGnsan3pJK2vXXa/rnbFUafppOYYjFeC+BN1SNpk
	LnZ6e2ECD15ak3JoDKgtMjBZrDPvMzhgiK7c4Zrw/L53jaRFdBAA72Q2TfI8XHnkXoGzULSIfxs
	A7Yjbx8+qq7ae//StHSi6uFiFMCahKEXxZTF//emk+le3vRP37JEzBepgx/NWT7evhfn8qHmme0
	9ws3YDmPFPY8+OyhzUneLmKFaAaLC+vdVBhYp9v1ABKCFD1lxF1OFzT6wkex5upYpQTEPSnDgBi
	CZd8bSXjp1AF+onpSMoTgrtjOkm7T45yto13
X-Google-Smtp-Source: AGHT+IG/wWjCYt+z5QAdVZtI2CXzbjinpwz7OGFYoL1YP/2PCUjBQ4Te3OiliA2FmiXa9YZ4A7M0jw==
X-Received: by 2002:a17:90a:f945:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-3056ee181d5mr1484030a91.4.1743565368540;
        Tue, 01 Apr 2025 20:42:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f93417bsm423010a91.37.2025.04.01.20.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:42:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/6] python3-typing-inspection: Add recipe
Date: Tue,  1 Apr 2025 20:42:41 -0700
Message-ID: <20250402034246.1488516-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116492

This is needed by new versions of lief and pydantic python modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc    |  1 +
 .../python/python3-typing-inspection_0.4.0.bb     | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-typing-inspection_0.4.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index fc71eb4003..fc6c164c3e 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -84,6 +84,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-tomlkit \
     python3-trustme \
     python3-typeguard \
+    python3-typing-inspection \
     python3-tzdata \
     python3-ujson \
     python3-u-msgpack-python \
diff --git a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.0.bb b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.0.bb
new file mode 100644
index 0000000000..52d846f799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Runtime typing introspection tools"
+HOMEPAGE = "https://github.com/pydantic/typing-inspection"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07cbaa23fc9dd504fc1ea5acc23b0add"
+
+DEPENDS = "python3-hatchling-native"
+SRC_URI[sha256sum] = "9765c87de36671694a67904bf2c96e395be9c6439bb6c87b5142569dcdd65122"
+
+inherit pypi python_hatchling ptest-python-pytest
+
+RDEPENDS:${PN}-ptest += "python3-typing-extensions"
+
+PYPI_PACKAGE = "typing_inspection"
+
+BBCLASSEXTEND += "native nativesdk"

