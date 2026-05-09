Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D779CD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 11:06:14 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10044.1778324772849843267
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2026 04:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GwHZjyYN;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so1224008b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 04:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778324772; x=1778929572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQcqfm8668KmDi4ZtM/FSfc+/hsQ37Hisg/DdeVf/24=;
        b=GwHZjyYN738o1O87xqEF0KQbkjLENB2mUqXRxAwl0a2+ioZx5hUSimhFmAK4sfa6J4
         CPDm9gzmc9RiEuflaybPZzMzIzCEcy/9yumTJfWNda3WCupmRcQ2d03NZrIpa8MqUsZU
         NnmX/8P5r40rKTswELvY2g82qhyQTMLYQz1tqbjnVxkkOFUubGy17YdfvopGxXvqrfcd
         g1UXjtmWqmswbViOY53eEc1eaDFuGTrGg5jBAva3vZh1spC9iPJLQUIg8DQ58PBifWBo
         ToTvN69mbQcw3LwKoaq20OLGcc7CW7GobNr2Mj6rcvxyZEXgjzLzQ5rWKAyd5lZp+KsV
         qvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778324772; x=1778929572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQcqfm8668KmDi4ZtM/FSfc+/hsQ37Hisg/DdeVf/24=;
        b=gtzc3n1LIAX4ps4/GsypywbF3orXVFAKdkhaEhOwVUyHLCOBznaivIR1kFWAF+4ye9
         vpusrU0mYVTI5XTe7Xkx5VriLZ9CRtmx3TizTTzc6LHUB237ea1vCPTxMxwNUK/8tJid
         muWw7jdfNEex8/rs6SvO2LzBgr35ZbKPM0AmaGJA3Je9DGbS4fTUsViunM6v4HwVoqBr
         no4W/N4LvIIjVY4IbuOYp1raaxZi+989+Uh3LJBvYm6jaJ2+ZhRigK1Jl+i6SC6B+Qkx
         Q4VV5p0Imqkr47WLj9NONbgR6j0QG5lL4eF3Cif7ZXYCb7iidkkNDJILhA3f5PPxB7yg
         PGlw==
X-Gm-Message-State: AOJu0YyPvMJ069giTkME6aHRagoTu2Vtjq4DnR0F1/MfCY5RqqTWwCX8
	uaPIo3Qckau2OTAa77EUphtRdq1Ev7PcK+G0ucbIff2Ch80oGsEEQCFQCs7W7JM9
X-Gm-Gg: Acq92OGhwWDA+0cUtEJzA777p2MeN2du6qwwyuiuO4ESz0+mFP/zZquXEzFemrWT3Hr
	prVZRv3fepT3QE3OtecTFif5QXBZozA2P0yNtlx7UBSGy1qfmMN4O27wJ6/mG1J7iF1SD5l6nQz
	Xmm2LlgBcBnq/f9YH7pZchoVpQE+JFGk+V9ftdtohHnnJ/nbsm0XH3oH91VcqmctZygC4Qu3qQK
	EXhcb0sXOPTwG6n2xc5f7HPACMA1hNpuYDZztyNj6lBseblRLnhPgSkmBFy87kyAfRChXH6D/Lg
	XEJLV5jfmF94Z6ji1M9J50VnbXSFHU9cqYqkFybzNQnaZDSbnsbwkO+IuKO7A2T6HsxDWlterHn
	oGz/WeQOpo91xvbeaJVR77PamK4t4p/uKz5lAh9lCvN0Q+vvA9N6eJETUwc02Da4sqgZwIHZ4Yp
	cxO6PqWPfqkIF5JasU2jSNRHXR+PBfZGPY6cggV2WNu/v3vuA=
X-Received: by 2002:a05:6a00:27a8:b0:837:a211:4ed0 with SMTP id d2e1a72fcca58-83a5e13ef72mr15993470b3a.41.1778324771971;
        Sat, 09 May 2026 04:06:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d314f7sm15513951b3a.23.2026.05.09.04.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 04:06:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH v2 1/1] nginx: upgrade 1.29.7 -> 1.30.0
Date: Sat,  9 May 2026 23:06:00 +1200
Message-ID: <20260509110600.2726846-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 11:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126831

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

1.30.0 stable version has been released, incorporating new features and bug
fixes from the 1.29.x mainline branch (https://nginx.org/en/CHANGES-1.30)

Also dropped v1.28 support.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb |  7 -------
 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb |  6 ++++++
 3 files changed, 6 insertions(+), 17 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
deleted file mode 100644
index 9872a6de3b..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
-
-SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
-
-CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
deleted file mode 100644
index 4d884fcbb3..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.28.x branch is the current stable branch, the recommended default
-# 1.29.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
-
-SRC_URI[sha256sum] = "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
new file mode 100644
index 0000000000..139fe24dcd
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
+
+SRC_URI[sha256sum] = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"
+

