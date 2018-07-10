Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id C62EC76036
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 15:20:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j5-v6so8522323wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=idLZn1a4UV27xou3D8xRsP7gIGDprX7+4mZpsydb/Bg=;
	b=EY6BRZVY3NW2t5XxBDnWV7b8zpWrZP9Z2YsTU41Qb3NrpQjpJPIgmIHs1laZHfOSND
	85+PhIigGuN9O6z84kU2XPDypPZWFFol6YpWNu5iKXFLBebp9FQX0NsCH8HbzZ0DhUZc
	tQp55PFDjBfWhaHnhQ08tM9owUtqjO/pVC/bJlG2iH4XTm3grjGvvyHhApifYg0TuTdn
	qitnAKBc8T7QGNzXcLzLYRgv2C0TwGl2zTOHcmqY1fw7udaDsnAy/Il1w2h1P0mMqTpO
	rwp95mOKxqwNw/2KsRulhkZ88YB4zaJrrEIa07nbC8TjSfAPd7HtoazODbddN+QlUL8n
	Lsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=idLZn1a4UV27xou3D8xRsP7gIGDprX7+4mZpsydb/Bg=;
	b=RR7AleRsXAnZYzqY9zv/Z7Hrg6QcajdoriFwomOdi4q164O3NF3yLU0VZdcldnh/eM
	EUjmNuV+fca6/q25FSL/eOG56/maSNG0RL4IMAsOZi+ENY3TYsbLS82NVwfo4HaYbjDE
	jTrAYwDuqWj9IODQ9GO2zHygQf+OLMCeRZDzD6rSACQXm+4qbSqjHJvrwx7DnlyPDktQ
	29Uxb0KEfJLW+QyA4HNBxwQJearHKLvOeorB4QYptzc64w7kkPyxpQhrHzYulhPY8no4
	obXIesf/2EgNH7WJk37Tsm/79h+ELl4Wfy9TAweU6wiyHsgkJ99C7nHsgoGZGKayqXd5
	sYiQ==
X-Gm-Message-State: APt69E3PLRRjEdyuslxdzaPG7HKGhL6L3xzJmeR5yVfKxtTKK1o8fvQX
	4gQfOrnmoojO8VRm1REOGGOgt0eS
X-Google-Smtp-Source: AAOMgpfnIxqNPvHEWvcRbQdoTtifoguStTODhYt3sXI5V0gMDT2Vjv7iB/MhEhgmQiAA1CVypeUSxw==
X-Received: by 2002:adf:a9f0:: with SMTP id
	b103-v6mr17472260wrd.271.1531236016203; 
	Tue, 10 Jul 2018 08:20:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t10-v6sm28857031wre.95.2018.07.10.08.20.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 08:20:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:20:12 +0100
Message-Id: <20180710152012.8950-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][meta-python] python-pbr: add python3-pbr variant
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
X-List-Received-Date: Tue, 10 Jul 2018 15:20:16 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-pbr.inc     | 14 ++++++++++++++
 .../recipes-devtools/python/python-pbr_3.1.1.bb        | 18 ++----------------
 .../recipes-devtools/python/python3-pbr_3.1.1.bb       |  2 ++
 3 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pbr.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pbr.inc b/meta-python/recipes-devtools/python/python-pbr.inc
new file mode 100644
index 0000000000..d8847f6502
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pbr.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
+HOMEPAGE = "https://pypi.python.org/pypi/pbr"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
+SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pip"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
index bdff867f30..8f7f924dab 100644
--- a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
-HOMEPAGE = "https://pypi.python.org/pypi/pbr"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
-SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN}_class-target += " \
-        python-pip \
-        "
-
-BBCLASSEXTEND = "native"
+inherit setuptools
+require python-pbr.inc
diff --git a/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
new file mode 100644
index 0000000000..97e7361b16
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pbr.inc
-- 
2.11.0


