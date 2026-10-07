Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0480CA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 06:06:25 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2121.1791353184896160408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 23:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BlOXt4uG;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0be347b8so1111239f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 23:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791353183; x=1791957983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKWieATIltJAPBN/57B4oqzSjKjxJTGnxIX2VbbTFnk=;
        b=BlOXt4uGswnI7HVchLTmkxc/P1/ij0OPWkcFBHNlOcw/zuDBvFwP0kr6fU6907lKBm
         Zfu0zdBJh1ujWjpBmMb/mIOCn1K8Hpq6mBdcni0+vF6q8STkkIBTl4NVbo3Y4W5peO0j
         yCSGFi8ItKMWRLEXfduDp53F7b/I2+faRmtWtJgwzQ1gYeRWEjWRQfOeDQY+KUA3fQ1F
         cifGTe+6LRvVDDR9fOYbIPVFwFxnNcKuti6AL1rrLusE+wGUVEJ4XXmmNdT3q9WMys03
         qdhwg2xDccFdUmu60EV+zbbiquKRYL8blw++i5k0cROOfZ5kLE7eEfuWJlqLl0Quz6uX
         1PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791353183; x=1791957983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKWieATIltJAPBN/57B4oqzSjKjxJTGnxIX2VbbTFnk=;
        b=1LIsZqP6MaF3rwKJSP6R0A7SQN5ADM5ESW/AEOwyUX1rM3lfzMGjDCCz4Fm44MI+Nk
         /mOnILBCI8pCr6zS1HC4Fa0dvRODNOAwcfHWkQVVxn/puQ5QN79UNZvLC8K5lqffeLck
         ZBJofgfqBKYZcx/s71gXla8K7Hh4K+70hPnI3C7W6LUbAQ6b/8XWFaOVAmK7YdD/LS7B
         kaQ0lVU/qp7hJblOJ4LC61T0YCxTq7BSveziYjUi7TXGsIQj/PcFmgFHdkgSAmBJBZcm
         s8iTmDyB9pgBKUzXU3jaADRiYdX+xlHJNDaZlpSOgJeYFkNmEhJ+6/jDtH172YJgMW+O
         8elQ==
X-Gm-Message-State: AFq9FYIm+FvBcWB1cqOdTNA8Pp/vaWoBj7Ltpod5V07jSdDCSkKz0iaw
	AYH8yjow5c8XbiWtU8IPoXWkG+9riWF5YldGmHC6rcfyp9xZbsZkHPk0WRB3Xsgz
X-Gm-Gg: AYBFou1rsYm7jv16OuRMRBgh+EXrhILglZZGWNL319h/AKacWlfpSH9CLJrXQG1CiMo
	42Gi8j7iCPAnJAhQO21k3KXlJkg+35Pk4e2QtgJ8967SB8YRRIEJxAXrTElADrj7OWmPifWuEwo
	KLUS+syijtDxiTJrz7aWiU9N4TG2hFe3bfAdLtPUzmYY22LJow5rwI7LV8qCHEaLuP0eYR53PgN
	mRtNLxyyMfhtfxJBGHUyowVFLxtTz/6SXnOogsWefB4DAIH0aBfzlsIRCzUj0Xqqseiwf+mR+bO
	cpfaRm6pNnygmQPejP+JO42eu8eJZsLpxTC67C3v9P+73igZ9bDqB3zalhHFgA2P/pNEAV3lEWS
	V40BN+zoPhn37l+O16b/A3rcMR30pKXjLDxJKLbfvRC4j5DH3XJJChFle3TFXY8t0Nm916MokyQ
	O++xhmREi/YTzcZ0VZMhg2nEjzBqpNeMw6l2cVgZ43qxtHMK7r3D2FSZIEZeqdXFlNqY70sAEuY
	u5x+a0USyrXJAwE6TwL5ZKYUpKx3HEeXrY/uEqDSGEMSorP3OTaI/I=
X-Received: by 2002:a05:6000:22c8:b0:48c:69b3:610f with SMTP id ffacd0b85a97d-48c7278e83dmr2395648f8f.26.1791353182732;
        Tue, 06 Oct 2026 23:06:22 -0700 (PDT)
Received: from localhost ([109.238.212.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10216sm3182502f8f.20.2026.10.06.23.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:06:21 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH] python3-async-timeout, python3-google-api-python-client, python3-requests-toolbelt: set PYPI_PACKAGE_SDIST
Date: Wed,  7 Oct 2026 08:06:20 +0200
Message-ID: <20261007060620.442458-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 06:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130642

From: Martin Jansa <martin.jansa@gmail.com>

Avoid replace("-", "_") from:
https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952

Otherwise do_fetch will fail due to different source archive and expected WORKDIR won't match.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-devtools/python/python3-async-timeout_4.0.3.bb    | 4 ++++
 .../python/python3-google-api-python-client_2.136.0.bb        | 4 ++++
 .../python/python3-requests-toolbelt_1.0.0.bb                 | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
index 2c05f25956..5aab88153e 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
@@ -12,6 +12,10 @@ SRC_URI[sha256sum] = "4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c4
 
 inherit pypi python_setuptools_build_meta
 
+# Avoid replace("-", "_") from:
+# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 DEPENDS += "python3-wheel-native"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
index d2802815c0..1900106a92 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
@@ -8,6 +8,10 @@ SRC_URI[sha256sum] = "161c722c8864e7ed39393e2b7eea76ef4e1c933a6a59f9d7c70409b663
 
 inherit pypi setuptools3
 
+# Avoid replace("-", "_") from:
+# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 RDEPENDS:${PN} += "\
     python3-logging \
     python3-json \
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
index 8956dee1f1..e7263fe768 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
@@ -13,6 +13,10 @@ SRC_URI[sha256sum] = "7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc3921ce23c8
 
 inherit pypi setuptools3 ptest-python-pytest
 
+# Avoid replace("-", "_") from:
+# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 RDEPENDS:${PN} += " \
     python3-requests (>=2.0.1) \
 "

