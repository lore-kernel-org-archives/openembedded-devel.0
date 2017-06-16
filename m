Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 34A5778550
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 20:15:57 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id x58so12793927qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K7HeZfOXUGpWl3NK8CwWPJgqwk/LUweryUWvS6XCnBE=;
	b=Kmr9I9FNrakT6L1xQgBZgcx3qiN5FjbazFBd7GVqWjztdJ+vPprThRpsCwSvYFTJV4
	K9VNUQtE3aGrRLCw/2+aRIy5kZI4FuQyRnNc33UjsjFUKFfUyqkHmEtw/ThKY3XeyBaJ
	7y11DmDBQTWO61CArL1djhnUoZbihzIqSiGUb1ussZVheiJeuGweCYGRp1wpKJiPidqa
	4kDMjKenqcudn5hYADDjHnKVh3BphcGEWJgVNCMsj/J3/voNJ35eslTDzzWKavjY8Oge
	4HM8kydO8rKoc29kvoy1Vt2PeSUZSvgyXrMsqbWG+xJQVgzAqalPF38P6NIMz8cgPMQM
	Asgw==
X-Gm-Message-State: AKS2vOwLjNJdlngS6MDN/M5XZx4afMdKNkraeearzWmYFnIjx0U+jw4v
	TBAeUqbslN2trOzZERk=
X-Received: by 10.237.49.166 with SMTP id 35mr15464609qth.53.1497644158964;
	Fri, 16 Jun 2017 13:15:58 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id r9sm2370978qtr.31.2017.06.16.13.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 13:15:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:14:42 -0400
Message-Id: <1497644082-17033-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-paho-mqtt: update to version 1.2.3
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
X-List-Received-Date: Fri, 16 Jun 2017 20:15:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc              | 4 ++--
 .../python/{python-paho-mqtt_1.2.bb => python-paho-mqtt_1.2.3.bb}     | 0
 .../python/{python3-paho-mqtt_1.2.bb => python3-paho-mqtt_1.2.3.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.2.bb => python-paho-mqtt_1.2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.2.bb => python3-paho-mqtt_1.2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 7ff3fb2..545985c 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
 SRCNAME = "paho-mqtt"
 
 inherit pypi
-SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
-SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f"
+SRC_URI[md5sum] = "4bd192ea24e7aa347f6d240101ef82f6"
+SRC_URI[sha256sum] = "0fd746d8650563290f1bd0fec01e74cb57c3ab7406bdb58e5d9252bb5fa5ca44"
 
 RDEPENDS_${PN} = "\
                ${PYTHON_PN}-math \
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.3.bb
-- 
2.7.4


