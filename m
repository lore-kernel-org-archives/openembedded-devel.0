Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A64C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:07 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28090.1786651746885388852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cFZUEtb8;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso307718a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651746; x=1787256546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nm976d85q63LEMib33GKiNj47He2E7NyzYjAw6vZ21E=;
        b=cFZUEtb85VmwIxy0jsPX4NYEcEDZy6l6CXqqMVqQ2F+FHfhIHew5tdHrIL7wGSBOeQ
         g02bn3Klcrm62ftXTBxwS+ByqJowqWZqZ8pPUEI9T8eq+xf9BOGvhdZCD3CaCg/Yr5VZ
         gLZxGQkXxKQTP1iV3fjUDL+5dZ7zIuW7cl5HRZxG3HTww0MDMkcu4tYoWBHQFb9BraO8
         C1sFxrE/ekZgVKIKqVFgqHAHX/pkHc7iNvMoxAbEDHExii0SsueOrxu5MJmwJZd5HCvT
         Er+glHv/M1G/qgZrWn0Du8umWhZqoq4oHkUXs4MhTWyB3zgA8MBiFRV9SHSQoe45ARX6
         sxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651746; x=1787256546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nm976d85q63LEMib33GKiNj47He2E7NyzYjAw6vZ21E=;
        b=or90d4yDn05ZkMZ/MbpSIVPn8tN6kaMHCM1j0DIELsZWlCSR9h2liyNZuSZqDgPE5G
         JJPnN0oJD83y+aVH2vXNHb9mixzQjlb5+dyq4MbGvX+yx3kZwQg6/ZJLUHGBa1SItda3
         OUc5L+EpcYHgpsZza6+tg/RPFDv9AJHtD4uSJpdh2RcO0z8862U/DwdcH/E17nBksc8F
         JljqIk5vTqQLGFdbn1OsisyeftmvenkH/2OUi8Xdbg+8YPg2qcbAXwRa3XTVQzQP5o/w
         tIHQgQT9Gd4l+7agIjarwTLcVUYuQ1rXM7QCYcJXfxEywX8l++fzi54VaEZUWgmkbOaI
         p8AQ==
X-Gm-Message-State: AOJu0YxBbF3RrShOitNB/GZjHq+Nd5ExVqYGMV0JC/v1egujXEXACn/R
	xzwRXExOtqYbe5Avi9C3cRRzKFskZiEpAxh4hopGQ2PEBqPSOtGyoaQYP1/x7CGv
X-Gm-Gg: AR+sD10Z6nAY9bVT3gO46t6haHW0R4JTUbudk1gmoljftDbBTtFriG2SD014oeTqPc+
	yWX6smwGZSY1xgnicigNms7DzkIMBH6i2w/KPJSl4gEMntDj4pmoK97gnpOXhTZVfJLHE+oI7Sh
	gjC9KfZ8Bt8pFRWdhjsvXZ4rV87sAIDGir5AgTVMYMEkGhEX1PDMFjke3mM7iZxF4Ob6NtR4+E+
	d9NDRievScwFjEuCRJDUkC7YTrSZ5EeLLkUQbLTndTpB4/Q0c6ZfXIlZvOIIqlhlF8s211KbLcG
	+SI+1G9mokZ/Q+4k5PzW/pPyhNXlhw0Bfb25z3y2AOluBqi1slpJVJdyq0pZFmAwqtg9wsyWKm7
	LGXuBFetS5utxCflYTzS9gv/sYzYfPOo6evXJsnK9XNqgH2LlxmXgexehEkjdRY2nn54j6OLM3O
	C5XdtQGZ3j4ZbY80NJDOhtfiAfXXWMBYQjLBOxPHJCoC6TGOyDajjtqGQ9bJ0ANish0ZehheQaJ
	eXw3xJtJVzOQmzuX1KqxHO2SuV5YLerVA/C1nf3j5s6sAQ6Eu/V92+dScP8fQpeBcckVd7lKJ/p
	ndh6KZKdOuWzB/xKdeWcwBzvRPikRerbhnxI2cKlkMkUM603hY4tw/x64FAgfi7+m8pE94hL9IQ
	60WqQXuBhGl5Rwv0oDi/JwU9jiYpXY51bQTcowOJfhvQomA==
X-Received: by 2002:a17:90b:5450:b0:38e:655c:6516 with SMTP id 98e67ed59e1d1-3933b4f3238mr739651a91.0.1786651746219;
        Thu, 13 Aug 2026 13:09:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 15/80] python3-daemon: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:29 -0700
Message-ID: <20260813200834.1302829-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128959

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
index 6b76ba6cec..761c746a24 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55f76b1b31719284caf4bc3ecbb70d6f"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "f7b04335adc473de877f5117e26d5f1142f4c9f7cd765408f0877757be5afbf4"
 
 PYPI_PACKAGE = "python_daemon"

