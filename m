Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8FBE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:11 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.676.1736539742572304208
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844e06e5d11so67588239f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539741; x=1737144541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zddTgc8QKvYWiAbwySUIM3qgnuEMzqxc8U2KAFVf9Xs=;
        b=TAeoSojoUaWBjyNQzTcpainDvvIFzcSXItr4Y6bfACjkvyo4dcFNiqvbSnhRFtgnP8
         YdDKkNiYQynH7epv1SblqNSg7Axvr0kebjV/ty6U1hGnky0kTYswUMy2xhbX2Y17Yhr5
         V+QZsMqBO8pR9S0sUOYK9zrXUalQM8LcSZfext2FZjiJ9h0XGKzcG7MBpa7jPGd8MZkG
         ausgboCKEy12d3+3ORO0O3ZTk76R5R3lyLTkruredd4BIqGRQF3TKFtgUAhXD1vr7S9g
         WlHACe7ucs8Y9OR2ptTmIR0F7rUrN8I2FDS4sT/WsyRS6zTH1kP2X2eVQXjwRrvtrTec
         A0pg==
X-Gm-Message-State: AOJu0Yy+QRmot07U5hYXjBhJRvxK8tlabxflo4U4TDFkKqZX+B+3RQS9
	SuqKGCZJJwIOhuGb1De5NHY00LFd5jwrA0zDtOvWHCaET6Zwd0aGUJ38yA==
X-Gm-Gg: ASbGncvYzuU7aipAt7hUISzBSaNiuv+1ll///JMEhS16Ynqpkc3G6OWJJT9I58D8vEp
	tRHMtEWy5pP3TAbMle04KSgXRHsfkpGcf49TU8LBUlEa4QfEBSKgN6KdMdfSKM0hBsAnX/bAo/u
	42PiDEJaZY6GOShPdyz/5T7TP6gva97FpO6gI/X+GZvDKneL8rZ2CxPTJH2gQ1J4L7QMa99QHNH
	hhWcejPg63tdBZXxRd80u9d+D1SBfJY2PlOW/srsVVY3g/GF+Kq2ZaWHASm0oKy0eytvfVo3TPw
	rXuh0xt+1HiF/nP5hhQ0rbeB7w==
X-Google-Smtp-Source: AGHT+IHA+L2h/v2NSP/CT9zJWjUy3kBRZ7wptOiE0Jrnt12aga4bGiPPea0DwcGRbLPkX3Jrd0b2+g==
X-Received: by 2002:a05:6602:7504:b0:844:cb6b:56b2 with SMTP id ca18e2360f4ac-84ce007c893mr1188306939f.6.1736539741407;
        Fri, 10 Jan 2025 12:09:01 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/13] python3-xlrd: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:12 +0000
Message-Id: <20250110200822.3958062-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114793

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-xlrd/run-ptest        | 3 ---
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb | 8 +-------
 2 files changed, 1 insertion(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-xlrd/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-xlrd/run-ptest b/meta-python/recipes-devtools/python/python3-xlrd/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-xlrd/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index aedf483be..5c572c615 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -10,13 +10,12 @@ SRC_URI[sha256sum] = "f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef27
 
 
 SRC_URI = "git://github.com/python-excel/xlrd.git;branch=master;protocol=https \
-           file://run-ptest \
 "
 SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
 
 S = "${WORKDIR}/git"
 
-inherit ptest setuptools3
+inherit ptest-python-pytest setuptools3
 
 RDEPENDS:${PN} += " \
     python3-compression \
@@ -31,9 +30,4 @@ RDEPENDS:${PN}-ptest += " \
     python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


