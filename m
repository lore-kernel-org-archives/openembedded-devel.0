Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3C37700F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:06:04 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q83so30357337qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dd24Xv/k/OlaRfFwpVxjVLPfi8dZZFRwp+Jbp4PYbbs=;
	b=Z2LZ7394YQKGmiAWKwk7xy8GQ0gRZAXs6t09xsWIRK2pxeMJfckmGiBZNGqCXXdA9l
	HxCrGvcG0HuA3f5KoZ2f3FRrrFFVDNOKSb7RbpI9Sq12+BktxpXcKPb44emNEstq6Jn1
	taf/XwoITiPQGYdb8zx4LD6CKhXVd8dEZK85PoC9iUncR3QHRGrPrYUMI1fCPBSBC1bl
	4f0tFcETyO6NUCPq8EpFw4jj7kz0fs/Hd5MF1/Q5SpqXiOzJKG2GG64jb2RKHeMFUtx8
	1bNDOifpjzR7rRTHub2Zqu96lKZ2ZUSsdkkmQ+DKPSDXV2VTIc+6tMPYDoeO96dn9DrH
	rlBg==
X-Gm-Message-State: AMCzsaWOrSMnVnQA4H1Jf2gq8jhsfhWCbpv1ueqHNYGJY3O6/woQLKD+
	MvINrDiC/0tIETd9XWegcbfPs1IP
X-Google-Smtp-Source: ABhQp+SlJHy8aRDm5uIbsZSXZLI4UjZQs/6wgJ+2WMx7XAGU1+LTXjO0x7JYnX8O/7aUi0FtiXC6TQ==
X-Received: by 10.55.79.74 with SMTP id d71mr2726150qkb.5.1508936765597;
	Wed, 25 Oct 2017 06:06:05 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	p41sm1825052qkp.94.2017.10.25.06.06.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:06:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:05:57 -0400
Message-Id: <1508936757-18342-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-paho-mqtt: update to version 1.3.1
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
X-List-Received-Date: Wed, 25 Oct 2017 13:06:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc              | 4 ++--
 .../python/{python-paho-mqtt_1.3.0.bb => python-paho-mqtt_1.3.1.bb}   | 0
 .../python/{python3-paho-mqtt_1.3.0.bb => python3-paho-mqtt_1.3.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.3.0.bb => python-paho-mqtt_1.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.3.0.bb => python3-paho-mqtt_1.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index ad1ce6a..9efbd2f 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
 SRCNAME = "paho-mqtt"
 
 inherit pypi
-SRC_URI[md5sum] = "b9338236e2836e8579ef140956189cc4"
-SRC_URI[sha256sum] = "2c9ef5494cfc1e41a9fff6544c5a2cd59ea5d401d9119a06ecf7fad6a2ffeb93"
+SRC_URI[md5sum] = "2cc27d8b369700b1fc99325add0dadd2"
+SRC_URI[sha256sum] = "31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0371122"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb
rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.1.bb
-- 
2.7.4


