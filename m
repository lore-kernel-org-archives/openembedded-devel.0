Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 157F67874D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:24 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g14so5947860qti.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v45PRrGrBhzz41WqcnEKg73b4ppanADBrX9QmqY0M/0=;
	b=uaaRTauqz7kKBJ1rRq5wkt0bR0o7iGIDuQ0LlS96mbRS0frn8Ay5UUTCGurBlubbbP
	n285YfE6nScFGoPp3vBUd/gxO69ysJIU2NQNy16URxVMFgeKwynUplSj0131lBDX+oog
	6ak7v5aWLsXrAuv0vV/kBqz2yNEtBydzhk8PP23rOXX/nIAU+Sn4HVifhoV16leoY+Ef
	SvqPwjg/tBfmEN8Wmw8NOhdiGgJz16Ezrs6+9bq/I1JjXTmeUB6Yg63dFRrSDKx8HwqT
	ws4XdbQE3K0bsy4HbsMy66c4BU3QEAeKBCIO1Esybqa5aGL9pCLrKbD6bucW9HeN7vIx
	9e8w==
X-Gm-Message-State: AKwxytdVZMZ8QfPImv5tb1le7ZYn4qeKi4RvJ30Wto6C+D7axzYTNM8l
	RiX5IGzrVIro23Z/hfC1/7TatHqi
X-Google-Smtp-Source: AH8x225atTDM55x7N6tRJQdB5HjOnnuhlgmwUl66Lk+ZCszHNe+u723ulcNcVXdJY4b7KAYr1yesKg==
X-Received: by 10.233.220.130 with SMTP id q124mr6940609qkf.170.1516551685716; 
	Sun, 21 Jan 2018 08:21:25 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:33 -0500
Message-Id: <1516551637-32255-7-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 06/10] Remove deprecated python3-selectors from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:25 -0000

The python3-selectors package was removed as part of the migration to the
json manifest file.  The functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb  | 2 --
 meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb    | 4 ----
 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-pyserial_3.4.bb      | 2 --
 meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb     | 1 -
 meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb      | 1 -
 9 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
index 9d98372..cfbe575 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
@@ -2,6 +2,5 @@ inherit setuptools3
 require python-asn1crypto.inc
 
 RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-selectors \
     ${PYTHON_PN}-shell \
 "
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
index e28389e..091eb36 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
@@ -4,5 +4,4 @@ require python-dnspython.inc
 # Requires _pydecimal.py which is in misc
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-selectors \
 "
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
index bd2bcb3..70813bf 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
@@ -1,4 +1,2 @@
 inherit setuptools3
 require python-hyperlink.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-selectors"
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
index be55770..30416a4 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
@@ -1,6 +1,2 @@
 require python-netaddr.inc
 inherit setuptools3
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-selectors \
-"
diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
index 997b0ca..93df83a 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools3 python3native pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-selectors"
+RDEPENDS_${PN} += "${PYTHON_PN}-datetime"
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
index 55b0314..e6e9726 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
@@ -4,6 +4,5 @@ require python-pymongo.inc
 # Requires _pydecimal which is in misc
 RDEPENDS_${PYTHON_PN}-bson += " \
     ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-selectors \
     ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
index 6807b95..17ed3f8 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
@@ -5,5 +5,3 @@ do_install_append() {
     rm -f ${D}${bindir}/miniterm.py
     rmdir ${D}${bindir}
 }
-
-RDEPENDS_${PN} += "${PYTHON_PN}-selectors"
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
index e5f00e8..bbda05a 100644
--- a/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
@@ -3,5 +3,4 @@ require python-pysocks.inc
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-selectors \
 "
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index b8dc174..8ad1c17 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -4,5 +4,4 @@ require python-whoosh.inc
 # Requires _pydecimal.py which is in misc
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-selectors \
 "
-- 
2.7.4


