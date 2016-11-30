Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id D5A3E71AAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 17:57:46 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n21so217908471qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l/hJ3UU4hEDwAaDUFFoMu9YlQohRX/A3STuQcw7IBio=;
	b=GHqxXRkFgHl7n07A0NcVuNa+iiXSGYdq4YP1OI7Ot9EXPKU30Ln2kNHm65355T6Fx2
	vWZPSje+ihqLlas4IG4aNVEIFeP3yruTSBL/1mSxFNZZDey4CqvTT8D2L8Z3JJAYl86v
	U0tzE1uy5HiX9yXFET+RGdekdEloLMqSBAW6EJ7NZSlpE6w/5MhUKgvYHNeLP/253JfJ
	9GjSYqK64ZmiID2zRIU8FaVpSuZgivGm+Xm1XtkR28QcrUd2ogLa/79FxknAb5RLpJV3
	YyqI8S6waUUlvvRHp2MxOmwDujcYVK3VKClNHu5Bk8REmyBpsQ2g77HfhrHDb+kn780I
	X2+g==
X-Gm-Message-State: AKaTC02UTnBaeS7XZkXCxxiVeXlcKYjt1C5GiPqWNrIixWEWiA/c93Y4V2rihwsv6VDwyA==
X-Received: by 10.55.149.134 with SMTP id x128mr28006968qkd.263.1480528668373; 
	Wed, 30 Nov 2016 09:57:48 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	j64sm34006698qkc.24.2016.11.30.09.57.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 09:57:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:57:38 -0500
Message-Id: <1480528658-827-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.0.4
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
X-List-Received-Date: Wed, 30 Nov 2016 17:57:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc               | 6 +++---
 .../python/{python-pytest_3.0.1.bb => python-pytest_3.0.4.bb}       | 0
 .../python/{python3-pytest_3.0.1.bb => python3-pytest_3.0.4.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.0.1.bb => python-pytest_3.0.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.0.1.bb => python3-pytest_3.0.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 454939e..27f6c27 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -2,10 +2,10 @@ SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
 
-SRC_URI[md5sum] = "6e736a6d7bc854b25d44a60bcba5f2f9"
-SRC_URI[sha256sum] = "e82bc0596ee96b2287c08705cfcb6898db1fe4b5c87db3b6823f1fdd77fb3ff1"
+SRC_URI[md5sum] = "0fbf3cf9f127ae34300e2c8bb002b6a6"
+SRC_URI[sha256sum] = "879fee2c1fdbaacd1bf2c0047677c6dd4aee05b9c1e64330b34d130a584fa40d"
 
-RDEPENDS_${PN} = " \
+RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.0.1.bb b/meta-python/recipes-devtools/python/python-pytest_3.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.0.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.0.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pytest_3.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.0.4.bb
-- 
2.7.4


