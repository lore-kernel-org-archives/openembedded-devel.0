Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 17B2C75414
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 18:25:30 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a132-v6so10199626qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 11:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oao6CM61Zy5oQpJl9zQvuJFt8Jxo0i3S4h+Tu5DB8Gw=;
	b=c6qX7FJsyGT1YJ6F8QdCIdwvSbpk7n08zESftjRRXHpUeCYgU/gzkV+rsPonutd47D
	8gQ1KEc7RKtfrBVbkFmVsitHA7/mxB2BQdlV1mb+2HQownD39De7TaMPh2Ch6N02vwFz
	2ZGSewDzfqH5pF4mSe3J4Z9cDqsJY8FWyZ2VRJYztk2R6ZYTuJAnS7XR9CfIHrlHbSRH
	JctObjpxt7UkT+5QqaSMx2Pt8Eaz64SKfsEtLmRMosj2Ke0RHm4sCVtBYDPRDamATWj/
	XCSi1yrDdV/vx2exrGrRHI2rY+uVO8NnMrFVfvVc7rBrt3mVcscVrdR/N5XuhhTRK5OA
	aSGA==
X-Gm-Message-State: APt69E23SaGzMa+b5IGcaHLWVCqgoUVcrU8bd/l2ESLwgU4nbkhrgEpV
	oLH1Z0SleNr5D/dxHlwiwex5bP2O
X-Google-Smtp-Source: AAOMgpenn6Ll/ClTgFdPq77V9WGuhWvdD05p1HGqJneIt/kJW/VfktQf7CiJKEiQEzh+aB2UyASt4A==
X-Received: by 2002:a37:2990:: with SMTP id
	p16-v6mr18927774qkp.386.1531160731673; 
	Mon, 09 Jul 2018 11:25:31 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	f70-v6sm8038098qke.77.2018.07.09.11.25.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 11:25:30 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 14:25:24 -0400
Message-Id: <1531160724-17168-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-aws-iot-device-sdk-python: update to version 1.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2018 18:25:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-aws-iot-device-sdk-python.inc      | 4 ++--
 ...-sdk-python_1.3.1.bb => python-aws-iot-device-sdk-python_1.4.0.bb} | 0
 ...sdk-python_1.3.1.bb => python3-aws-iot-device-sdk-python_1.4.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-aws-iot-device-sdk-python_1.3.1.bb => python-aws-iot-device-sdk-python_1.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.3.1.bb => python3-aws-iot-device-sdk-python_1.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index a3299e4..7423fa7 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "\
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
 "
 
-SRC_URI[md5sum] = "97e8cf0d40ef3765d979c19b534a716d"
-SRC_URI[sha256sum] = "d68cbff396143e837b4c23b6621d3b7ae374281afc75eed8e51a28625d9125ba"
+SRC_URI[md5sum] = "50a5c46410c2b44b5c09f1ea5eb15a3b"
+SRC_URI[sha256sum] = "b3c8af3ce24eab861447a194f3c382509dd70e90452c86a5426f1e7272460177"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.0.bb
-- 
2.7.4


