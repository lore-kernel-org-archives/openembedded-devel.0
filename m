Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id AC5B474502
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 08:30:39 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id s70so399010qks.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 01:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zzJxaSB2kcz5sFYIqda8Ve72PK1lbMPrVoqrkIUKqv0=;
	b=ib17z3jfXnljQp1ixdGb1RO/9y/mBtHTqovKncsT4VuBLY0+3YNrPf+ObBZ4q8oKDK
	FnWyxWrE9nBy7IZvjUonKJ8RJdWS1W2/e7/b8M8epVo4CyXbd9BCZ/jmDgaMJY1S7TyY
	EVXMJ2ISIXn8yGuElJl3b8DXc7eCm7vJa0yw+9zYBXjy4hkNuRrNl/jlqcMaojaUuFsH
	I1HJgkKSTjrnjGfM+hQ70w4OogT7xDWNMGDpg0dFzyCng2p8/18n3VA/kBcaRd+V63Ht
	bjnL4gBozK5mpjcSZseP2Wf5ThdSXA0/nBiqwlissrXCYl6H7fQc3qBMHtmD2q4Hrhm5
	Js7g==
X-Gm-Message-State: ALQs6tDQLU4BXvZ2tp63RzV0Qr6/yNlLEV+AOguVQ6oiEM1xTk2zwsiJ
	AgpyTfFf6RyCw3yQox8vINP3F4+C
X-Google-Smtp-Source: AIpwx49NIUYl8Y5flldqWgn56i8vyXqJu99opM4Fwr0yffYnY092YVjN88MX6lCg6sR6QEp7KHjvRA==
X-Received: by 10.55.139.197 with SMTP id n188mr15861356qkd.212.1523867440356; 
	Mon, 16 Apr 2018 01:30:40 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 36sm3033415qtz.8.2018.04.16.01.30.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 01:30:39 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Apr 2018 09:30:37 +0100
Message-Id: <20180416083037.12784-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-pybluez: add missing RDEPENDS (fcntl)
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
X-List-Received-Date: Mon, 16 Apr 2018 08:30:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-pybluez.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pybluez.inc b/meta-python/recipes-devtools/python/python-pybluez.inc
index ed72716b6..399fe579f 100644
--- a/meta-python/recipes-devtools/python/python-pybluez.inc
+++ b/meta-python/recipes-devtools/python/python-pybluez.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "Bluetooth Python extension module"
 HOMEPAGE = "http://karulis.github.io/pybluez/"
 SECTION = "devel/python"
 
-RDEPENDS_${PN} = "bluez5"
 DEPENDS = "bluez5"
 
 LICENSE = "GPL-2.0"
@@ -15,3 +14,8 @@ SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
 SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
 
 S = "${WORKDIR}/PyBluez-${PV}"
+
+RDEPENDS_${PN} += "\
+    bluez5 \
+    ${PYTHON_PN}-fcntl \
+"
-- 
2.16.2


