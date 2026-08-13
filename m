Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67993C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:49 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28130.1786651788036463622
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d+IP5pbC;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so169326a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651787; x=1787256587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwSkzpZKb6zEImqCtBAU2lsx000tiMrMOQNCBVmHk3g=;
        b=d+IP5pbCf5tOW05OqboKwAtl7aDUkR049PLLOAmQccpIhW8wTUPr8tq5d7O9dY8diS
         YCJXiaCbxRfxiOEp3SZ+0t8UqYx676cSBMLW0ihP5B+IqD9KrSzg0W5xvGRQPW46t3tr
         /yYXZTRNz7/zJfe18DWeztExuWB/vaAcOVs+q8jw+qke9m7Q0gJHdY/2daSRgCmvkl7c
         NGKByB0P7bxGc6h85KNbnkwvsgJ4GvwUcV/6jIOWc8bZ4bR4sH5+tN0WHPHABGkwHhyz
         ZKLbMLl8VyODbbiaRYXOlD5EgCLOqlEhgVszkzaxohBjWgdscdC5n/QpKtF+/JEPo+sU
         n6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651787; x=1787256587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwSkzpZKb6zEImqCtBAU2lsx000tiMrMOQNCBVmHk3g=;
        b=bKJs26ODpicUzZbdYsWnItaloYVGdFldRlEZ+hbrDV55XCjrWseMIahbCKKVNBKd+u
         4vZqWzMVp3REh50vGoURrWCde9yDoAhadP4vE8zbIbrBVYtpO03aJ/aecwIUtJ1w4sAw
         Cr56lSp+V9Ii52GdytRMp2iofvOPlKClsnVBY7B6ygTOS5GqZZsr9ma9+WBA/i7Nk1Fk
         QJdrW/cDFG2K4yNPiv+DcV2DRpBiZ8ACn7D59epVnlM7x5CYrfM3skOGQ4T6twnFZgY7
         2HdnbcLDAja+FMmJ0+8Yk7ldSBDcPe5dL04vFPywEgZixTFLpsuGS7ocJYM2HrsKlG0b
         1mvg==
X-Gm-Message-State: AOJu0Yz0OsjCEmSmHECEouQRPDGFXTnl7TgPj3s+U2O2MF+nkNHF24DF
	4R2+ja02AtbuHwsemNx7o8gK6xYmErgQBGkm/2qbsboDJJCU8bowdalChMsniJtj
X-Gm-Gg: AR+sD11GCLZCFtuVeZ8PH6/RvxYyLcmeEiwUWsGtMDqr+aqWON2U0MfiFHza8OFTMYi
	dZbRMhc4hnGsae69sUSr+gKZjC5RxLZGg5xBgR3hVgzY4FgUen+14L5TySE9xtIs6hpgaIiIrty
	I9d//muspY6xETm2InNsCM2V57ojcjcRZVkgpTUoUz71aajlX3L7OJMxH08gS8iMxIZY3x4xShd
	5Xl8UFihq00pvpz8Ngnb0B8f7eYlrSpBFtYlEZa9iHi03N2cDhx0IA/WW8dcv4AUlqaVHVb3aik
	Mn8uuITY1MAOlJCOxJ79xs3mUegcmv62F7wbwKBYHhrHL77fkueH3adAYF8zGnJHEM3I88aipkX
	Yn3plSPCVaaSAfVu5fjke3C6fkYffguHfRggLsNMQKaKCVXp7S3ikXi1rj0PX+QYeA3cg6hz6Au
	1Co79Za7nNWoX/el1AZS/Ip/duUOATcuoRDwMdFXI6VOgiC7K9vlHf9ZCsh3Y1LktQuhoW6KJlX
	9MsVEbw7+8hBo5AqzPiW3RdNh80ZoDESIBB+MZ9Kop7JrdFRhhK+27odMmdRDFMtcwWN9MGBUwc
	qaJcE6BLWS05mBN8FFBn5qIjaE26q1Pzvm2Wy/4dfNNcJU0Z8rRZnLNsvcCBiA9VkE2GPudMdeZ
	hKjF/59CEgSaoFPIrkyNTh+fVt22/F08EPEcTJLA06iZMOw==
X-Received: by 2002:a05:6a20:5493:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3cc71ec3441mr305188637.19.1786651787312;
        Thu, 13 Aug 2026 13:09:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 38/80] python3-luma-core: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:52 -0700
Message-ID: <20260813200834.1302829-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128982

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
 meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
index 7c03aef40e..1d37cd7187 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2083293a38df91b8d470d3fe30069262"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "963c264164d4374f549d57db09599e0ca458cea1bd05e16939897619be4e6dbd"
 
 PYPI_PACKAGE = "luma.core"

