Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34285.1794851649877517792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MLiB1zC8;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7088035eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851649; x=1795456449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQSNn4uPvs5t8O2nlWKmmqBSfVPGuqgdjc6YtKjGw7Y=;
        b=MLiB1zC8zzHlzdho0kACL/6P2L7F2fKcySwqPRVkIa77d/8dFUQW/ZUdx1exwWIDGl
         sforDPpJx5sjVsfCv7NBzqOQP0TN4r0tYdREWEwSWAlQNKA/As7kVgO7JwOvbJI0rHFW
         PoHjeTj5Ju6G1g+tMrHBZ9XtELVXaIxOXzTK+fqyxbB5sxtB6WHDqumul3jxiFO6TeBD
         SGpJ8moRWcthLm9nEfbKC9JLFHi48FHsO8uwSpsMq4C/vbNKLZ3YVjsQ+8bhrS/+kaAo
         soovWcAbyBofqxlu9wYDohjOnvi9hccBzhfdCxlYD66nAUp84+6lR04CDodXEoCYkU5t
         nDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851649; x=1795456449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQSNn4uPvs5t8O2nlWKmmqBSfVPGuqgdjc6YtKjGw7Y=;
        b=iMFKdwPdK6ONYDBqoNfL6UDxFE6asxtBA/mw9sCv0yEKypEJaYGDhvrAsFFeCBAjOq
         MQbz18izfdFxlci9IS9T9k7XL0OKYm1LiHUiQ1tEBkIG5DXGBF/iBbwNgjQDaNbSAj27
         tbi79R5hmpGJBJFzHEsXkelLvGHKoPMBb1OMGj1rjldkREjQYaWtv3b13nV0QX6m65mw
         l85hB2P0EFjzeQN5h8wZsh7OupVf4ctoyaMwZBwB4kArY3O/4SjJDqqXQgso/WUlNerJ
         NTilX1pw4ubSR/KKc29+3MHnl4upLQQRoylRrcxHFDsNrW9UFLInPu6vqObBGcvtil+k
         Qr7Q==
X-Gm-Message-State: APuU4Z985MX6bZ/bUoYOJ0iaPuxsZMeFBxiqrNVUt+8qB1CSY+YB34I6
	eVXuZMDf9gFS44SuUEycmV+GQwOESHA18ElhSReZdIYTyKULbpTUsd+5H6BenkPb
X-Gm-Gg: AYBFou3pH7yBn5QRuZC8w3Jy7gC7TX8RFddh0+c2lELvPyMguiMM2+nWiW48oqhjFML
	FqsG0PysN2cd5efN6M49C1ZlQNAUgMUhm8A+M7xNOr7gGhBIGWMfK+HhosJKtEX5z11dOZ4etyE
	hX8R2HyFbPLf28nguMZitPvF5vSiUS0pLJzPUTaRAsHyUslSW3FGjLOzssOkM+obuxBWQ07Dq9a
	wa8ptvdUXvXxXh1hFnQv1mg9/Ro3yU8VfqR2uOAtv6T2FRqznbtcGlrnhYqUKRebTtaB56fqhyt
	p1cZ4FoRI66Jb4qMILpv4DCWiwpnMjUpRFq6q0lltZDnyF7touhDgo1nb4u74FBvUvpF81Dq5X7
	LvyAzmPakZDJfeFEmAdkYeo3FPl5Sok+ilRSyUAP1GodoktfoVy1Ge3nZHKDoQWyRe1gJj5Q1CQ
	1+/ryrIGdhIp+xfSvqmuIb5k0fHaSsyKUfXDri5+eLBSy5HTbndDO1OGMnnGUHENFQM5haTz+nj
	1BybxhV49Z5WUweghtJmh20+NbhM3DhHAMC5v4ca30STODdqYhdKkghScazAEE7pucNnvq1S7RU
	c9+L2pHnBaOVKEcn+NNcZyeeSbuJQ9CAVvuFVJlq/pc8vsmygSeB6TfEsMkpu4xnu00Gv2Zw+PM
	edqI0Vw8/XGW8+hcbZ1CdogTRddjcVimdX9pXlUjVDEXyyJv596rUEpLhs0n9cpbgG3htKTTyxR
	w5loXPFmhDoOxFpXkiL2eNavoc89T8VINy6v9qOtxaiwlTZn5PC+SS+Qq6gVxSI+AiP27rd+8tU
	hCPhdQNVCn00tbJ1qjdpwfdSwViWC+4AFc5+Nye6PGouNKsewMwVOon3HhrJnOJ3s7NLV3afPWa
	IPg6
X-Received: by 2002:a05:693c:8114:b0:36e:a321:5353 with SMTP id 5a478bee46e88-37963371e09mr11938461eec.2.1794851648924;
        Mon, 16 Nov 2026 09:54:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 005/105] python3-aws-iot-device-sdk-python: upgrade 1.5.2 -> 1.6.2
Date: Mon, 16 Nov 2026 09:52:17 -0800
Message-ID: <20261116175359.342679-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132461
Content-Type: text/plain; charset="utf-8"

Drop the setuptools patch, it is part of this release.

Changes:
- Security: fixed TLS hostname verification in the bundled paho
  client (SSLContext check_hostname/server_hostname) and in
  Greengrass discovery, which previously could skip hostname checks
  on Python 3.7+. No CVE ID given upstream.
- Updated bundled Paho client; now handles SUBACK packets.
- Python 3.12+ support (ssl.wrap_socket removed); setup.py uses
  setuptools instead of distutils. Minimum Python version raised;
  Python 2.7 and 3.3-3.5 classifiers dropped.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Use-setuptools-instead-of-distutils.patch | 29 -------------------
 ...ython3-aws-iot-device-sdk-python_1.6.2.bb} |  6 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.5.2.bb => python3-aws-iot-device-sdk-python_1.6.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch
deleted file mode 100644
index 9bc8b36f36..0000000000
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python/0001-setup.py-Use-setuptools-instead-of-distutils.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 36f8106535150b970c75e8b8456ebc5a7d1dbdb3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Mar 2022 11:11:01 -0800
-Subject: [PATCH] setup.py: Use setuptools instead of distutils
-
-distutils is deprecated and will be gone in 3.12+
-
-Upstream-Status: Submitted [https://github.com/aws/aws-iot-device-sdk-python/pull/305]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 3846bae..d0c2b8d 100644
---- a/setup.py
-+++ b/setup.py
-@@ -3,7 +3,7 @@ sys.path.insert(0, 'AWSIoTPythonSDK')
- import AWSIoTPythonSDK
- currentVersion = AWSIoTPythonSDK.__version__
- 
--from distutils.core import setup
-+from setuptools import setup
- setup(
-     name = 'AWSIoTPythonSDK',
-     packages=['AWSIoTPythonSDK', 'AWSIoTPythonSDK.core',
--- 
-2.35.1
-
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.6.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.6.2.bb
index 27aaf2d28f..f713a16036 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.6.2.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
 "
-SRCREV = "0ea1a2d013529839fc1e7448d19dadff25d581b4"
-SRC_URI = "git://github.com/aws/aws-iot-device-sdk-python;branch=master;protocol=https \
-           file://0001-setup.py-Use-setuptools-instead-of-distutils.patch \
-           "
+SRCREV = "ffa4076ba754932c247c05352b810835c6bdc8ff"
+SRC_URI = "git://github.com/aws/aws-iot-device-sdk-python;branch=master;protocol=https"
 
 
 inherit setuptools3
