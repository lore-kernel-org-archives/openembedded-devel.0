Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id C97327872A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:54:23 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d54so15269049qtd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TorbEQDMJkOWm3eoGxDzfngjGQ7XsJ3TGuHiEp2ijpo=;
	b=P6NqPIiZSFsR3VGgaYC3Z9F+zOf//03j9Ne1jSMsLDEiZAISXRDai3apLCbYARM6mI
	oq4m26UUyy64nwyYKo5EuHZEiTSYsMK7qozqeqjdL8om8SXK85ZI1dgQfA+avfjl6itQ
	gXdaVzNIuBn9D5c5nxpoQ7RP/WIRNa1tZ19mK9sNVfwX8x6iX+HXx0sP1BDSRe6id82s
	bNtpL7SKN/pL01O12ZYRjg6S2aiTHm8878auyImlUCHcs3Pa9YU4/D8Rl+cxbS7tDQoC
	BeIHbVeC2rRDSit0rMcj1MHjv29RSILiiXwuA671SALqKSlIDzE+xYndFFqa0RugIDr3
	zveQ==
X-Gm-Message-State: AKwxytdz33HULrzwJIUs3e3jdKn4NNKMok5nlrbnXLTPv6+nbPOaG9ds
	WmADPZJM8mpG4G4mDUeqpsscgGKJ
X-Google-Smtp-Source: AH8x224GwDe0EQnC+e8yZhDMvUcwr1exfxV+1MEx0H4RRRBfaumjix1SpfSc208CQlhCANreBx8yow==
X-Received: by 10.200.38.243 with SMTP id 48mr7138397qtp.163.1516553664278;
	Sun, 21 Jan 2018 08:54:24 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id s3sm8866087qkb.52.2018.01.21.08.54.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:54:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:54:14 -0500
Message-Id: <1516553654-14732-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-smbus: update to version 4.0
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
X-List-Received-Date: Sun, 21 Jan 2018 16:54:23 -0000

Fixes issues related to incompatibility with i2c-tools upgrade in oe-core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-smbus.inc               | 7 +++----
 .../python/{python-smbus_3.1.2.bb => python-smbus_4.0.bb}          | 0
 .../python/{python3-smbus_3.1.2.bb => python3-smbus_4.0.bb}        | 0
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-smbus_3.1.2.bb => python-smbus_4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-smbus_3.1.2.bb => python3-smbus_4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-smbus.inc b/meta-python/recipes-devtools/python/python-smbus.inc
index de2a270..0bca58f 100644
--- a/meta-python/recipes-devtools/python/python-smbus.inc
+++ b/meta-python/recipes-devtools/python/python-smbus.inc
@@ -2,10 +2,9 @@ SUMMARY = "Set of i2c tools for linux - Python module"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
 
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/i2c-tools-${PV}.tar.bz2 \
-"
-SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
-SRC_URI[sha256sum] = "db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441"
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
+SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
+SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f071ca403"
 
 DEPENDS += "i2c-tools"
 
diff --git a/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb b/meta-python/recipes-devtools/python/python-smbus_4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
rename to meta-python/recipes-devtools/python/python-smbus_4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb b/meta-python/recipes-devtools/python/python3-smbus_4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-smbus_4.0.bb
-- 
2.7.4


