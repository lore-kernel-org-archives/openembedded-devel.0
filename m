Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A15D4920A
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:57:54 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11028.1765540671473168314
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZLBS1Ks;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so1377288b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540670; x=1766145470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1pi3Jc2VjhX9vR+ib6G2Hn5/zNa+cIqLAbaHThBDqA=;
        b=bZLBS1Ks21tC6I7qe7gRm+Nf+kG8QwXQ5BHU9t7a+2/DtaRPHMXnn394Ay2TtPZN1y
         ysVLKTMUE5vcBhifZmeXzIPW3lmIiVvQzOSPVQIoXRQYKCKeF7v1bwTxQJDunOv8DQVm
         H/f9WYa6iylq+WDGWfOdpiwaMyyqlphfBGvPaMzG+PW8GOjE3Lgpp9hjG8YmqOaCG4xA
         YVu7qQpSbHPvn6QdUqcfXd3rqcKeanGE1hR+haO4ZvdAMqEqwEKoVqmbYKe0fuei7Bag
         BkHZ4fc0w6T+6KAOT9xcKxsiWQ6TBlil+FQNL5MqSeFcRGXA+KoPmqGvzkTXmdxMJecP
         JV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540670; x=1766145470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1pi3Jc2VjhX9vR+ib6G2Hn5/zNa+cIqLAbaHThBDqA=;
        b=cgqP+o7Pl+j3DSVe1uOdAmZi7yXsufafOYgUAJNoKGFZlQCdNMoUWm1dg/B3W3zAVE
         s/sLsrYv144lVmtWKZYM+RTmsHub4MGPInTb5y0Uz3g8sJGqm2cnAQcW4voo7hufhrLA
         VZiCw3CBnFV285ZiFn9CF+SthZuVTAmIF31Xqg2euzBesX/yMngAiKWN4kX5Z6iku1HJ
         RxLmDmADAnE9qhWDRVt26Ei5EIb84is9VAYAwSY7j/zR8kpx2LR5frWyg8ruTwHeR4vp
         gmHvYNH6uAOUlgod2VgCGSL3C67X9Qz+Xdg3riDej8ik4TOUG5IQKOg0+2rTFnwG1CzN
         vw1Q==
X-Gm-Message-State: AOJu0YxOthav2+Q1Lx1+wyG1PEcuF7vDUpSEjX2QpMx8Fay/rUF4PnkN
	3zk0ZbVWyBbngFy4tSj4BwEYK5Ok8UGQPu460bfC/k2QunKl3fGzG9gYJtIprQ==
X-Gm-Gg: AY/fxX5yVN5adOtskiTc81fXOBnWO1EXP4StsjKb1repL1MDq5KN4FqN4YpaQmHgV/y
	ySAchCGkiRhvZrNdlfAPADtErwm3cY+ggBN/GgjYOEFADgmZQCbNNMg7c5H7zGrgFshkeHwNpFA
	nUcAv0YchsBpIl41jeIH1FcBu0VjbtUpDSJOxbcKVL5QfTJNcvdOPziQD5/dAbsAg/1n0pvdXpk
	4B+WJgnNY3aINMEQg0xlDHq/Oz3lS8WSaVEcUy/unJf/E5ZTYzw5c4qk2e0Gpb2sjUae3iOOCPX
	Wx1bNqPEqwN81btrpSws5b4peEwM+4Ulh4f4+hiUHgmsGTffXCgKenv1M4nFmUwZsy3aR7SDtfi
	YBv/+KPjIJtKVEqJBZEP8qeGNw6jPO1fY9gZBFyl0ewoBVZuJuCO+vis9uU5MuFspmDIxuIbaOC
	P6m2mpbMz1IJ1NWD4nPo/WnX8=
X-Google-Smtp-Source: AGHT+IEr+pKOgiZRZ+Z6i+KUPOxWbvQQFk4XuJKVXPFTXxNpVIqlt2vofBS2c06VLuB6xyR9aYqOcQ==
X-Received: by 2002:a05:6a00:420d:b0:7e8:43f5:bd2b with SMTP id d2e1a72fcca58-7f669c89073mr1654131b3a.64.1765540670478;
        Fri, 12 Dec 2025 03:57:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:57:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 01/15] python3-gpt-image: upgrade 0.9.0 -> 0.9.1
Date: Fri, 12 Dec 2025 17:27:30 +0530
Message-ID: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122601

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Partition commit offset calculation

License-Update: file type changed to "ASCII text"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc53efed84fd3c0239edea5aeba789a3b626edfe)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-gpt-image_0.9.0.bb => python3-gpt-image_0.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python3-gpt-image/{python3-gpt-image_0.9.0.bb => python3-gpt-image_0.9.1.bb} (78%)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
similarity index 78%
rename from meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
rename to meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
index 90b77cdfea..33bb3deca8 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
@@ -3,14 +3,14 @@ on local disks. Written in pure Python gpt-image allows GPT disk images to \
 be built on a local filesystem and exported to a destination device."
 SUMMARY = "GPT Image (pure python)"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=db5f8de88d13d0917db21293d0e82e1d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d91d608dc8f12334a889700389229b7b"
 
 DEPENDS += "python3-pip"
 
 PYPI_PACKAGE = "gpt_image"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "c06d8efc7cf8d6f3954c1c3d8544f494aa95da37fe04e38a9699ad3f57455f7e"
+SRC_URI[sha256sum] = "07363562ec1cf5b50319ad0389486b576ed43c4682a16a8286822af9fd1f4594"
 
 inherit pypi python3native python_setuptools_build_meta ptest-python-pytest
 

