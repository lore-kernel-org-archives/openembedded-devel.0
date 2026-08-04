Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F2DC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:12:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18772.1785856358491487136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 08:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aLRN2XwK;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4720f3bf164so715920f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785856357; x=1786461157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fr1SphxOdTaFjhdmIvAMVv5JHQExHHdPI8Bpqz5D7tk=;
        b=aLRN2XwKa2nZsgtHON2Cc63LXnHrkIzvnoug14cfM0M2BB1J/cwKTlEoQs7cD238Qc
         UVZdax8HNU+mhxKhp4i8hCVeE7GYagL5AiUGAdi5G+poGumyqxG23QxP0DxjVVfK2MRs
         WDBFoMpQnaK1kw+dDmFG2REkvAbsuRtRdo9TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856357; x=1786461157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr1SphxOdTaFjhdmIvAMVv5JHQExHHdPI8Bpqz5D7tk=;
        b=jGp5cn6Fyr6mhyqCtIC3Xvor7sgCmXfLh+1Zvnk7YsnZiNoE0+sHPcvmLL9Rp/iU7l
         BRSvDvup675sIqKj740/xW0K69tzcg52QA0v7QJ8d9qy1Tu8XBCFq+MRSWdMPDRbWQXT
         qCdwQN6eRHQHFBfSIJgjE2p6vUBvbAT8AcpnGaaTrpPVvI2RJlUePnNWWPcL9/pF+qeJ
         vUl/LyRj60ae2hU1xQfZhA7xpkSD6gLOh/ffotDfEhwnSKb0aMsgosnMJN+v1dYctn4F
         TKPtxzErY3zTA3Sda0q74G0yD2AQUQiszXirAS36PWG61/uwbyTmk4fg+p2TqRx1TYHG
         eWIg==
X-Gm-Message-State: AOJu0YzbdOsQtGxsrl+tgj4WyjjhWwpUVh30oKSC3e2HmPC7QPBXAJpk
	KPW4XoUmSJfRw6ObNbXKTYeDCLoDDeYzM63ttuqoXs7TzAI0pbJbegLbVtA7puDjxTofA617pc0
	Slt+o
X-Gm-Gg: AR+sD13gAPi+c80aae0Q+ESo91fZXw1TVr2tXoA5wOzQN23C1BHy3p6yPTO2w02vDIV
	LFsx3646sLPP41nNeHMVtDeLjirvRe+qTdv/pu0dtdWS+EfQSgj8532IrYV/566A+FhyVSzubu9
	aQuDCWzgy/nYYJT/+6TgIE9TbAEQ5W+hcXAE4nT57aflrr3ODKArZBl/FbHIjwMTerg6LxrNZSb
	A0Vp+zMpbe5C+SyyPZHkVaGyFNQghhwhP4IUB1iowdsnLg1T8/6lmwLq8FAcsw4Q1Q6BfiY13Go
	dLMv3Juge+pvORt62acQzDfl5bkRUKjkZhP9iDvxVMXx8CoLqwJIrDmE5NyjECX1U84K8mM2Zvu
	Yp/0HLPJScxJk1hWQbEimpFY3x0YqUEq2Z/Wk4xIYSj1FH74m/peknKF1ECS5HGLQI0WdJnBJ3d
	/ciIxpuFwYVh3xU1us7dFZ2UFQ72J4VMEjhk1zxygvxMdasYN9TUE99DG5yB0R4YOO7sfo0BmZ6
	poks4Z4CF/SXo6luRjRAS8XZuVkEKMznSyO2LgUeg02XZYNTG1n5wBIzBaXYED3eKGEpV3HYmWu
	s52XHphA2RCqPg==
X-Received: by 2002:a05:6000:430d:b0:47f:71a0:c060 with SMTP id ffacd0b85a97d-47fe8196d7cmr11204285f8f.2.1785856356578;
        Tue, 04 Aug 2026 08:12:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec232d17sm320029f8f.22.2026.08.04.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:12:34 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pytest-timeout: Add runtime dependencies
Date: Tue,  4 Aug 2026 18:12:30 +0300
Message-ID: <20260804151231.3046238-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 15:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128746

Add a DESCRIPTION and extend the runtime dependencies of the recipe
for pytest-timeout, a pytest plugin to abort hanging tests.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pytest-timeout_2.4.0.bb        | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
index 6d7901f5e7..c30e7a1ddd 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
@@ -1,13 +1,18 @@
-SUMMARY = "py.test plugin to abort hanging tests"
+SUMMARY = "pytest plugin to abort hanging tests"
+DESCRIPTION = "pytest plugin to abort hanging tests"
 HOMEPAGE = "https://github.com/pytest-dev/pytest-timeout/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 SRC_URI[sha256sum] = "7e68e90b01f9eff71332b25001f85c75495fc4e3a836701876183c4bcfd0540a"
 
-inherit pypi python_setuptools_build_meta
-
-RDEPENDS:${PN} = "python3-pytest"
-
 PYPI_PACKAGE = "pytest_timeout"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+    python3-core \
+    python3-pytest \
+    python3-pexpect \
+"
-- 
2.47.3


