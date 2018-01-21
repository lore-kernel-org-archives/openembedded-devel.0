Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0140F7870F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:22 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l20so13807600qtj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kwDO6RCQ5cBx12azTkICqor4Pi+t3QCYdzUx3AVZXvE=;
	b=hWSPOBc9qtWVEpk6Pc4t8lqww3kS0PuBTUP1WIQVXtiS8dhHPKXE5D4gMBayMTGqmM
	/s8Z9I7UhsXLTR6LGYkihOOTSD/IGAfkIcf3T52lJOrRI6F5i8cd9LAF7iv4AKuFPTGF
	jKt6CHt0Z8Md+mE/DIbk8QeJZByxoBqFNoO2BoLmOp/bk49gHXUdK1pqdF4RzdaY/qNR
	nD9FGpffAhwON5Li3sWJ5VdaNbfGjhEupIeJA+d6QW7HzMCN67E5Fj4+wN61xMhXLkUn
	+f15WCeyha6WIh7a2mgWUX+DQMa7k1JkXHsJOzblkik2n7301Kqarq0qZkgRngDZI1Lr
	lZ8g==
X-Gm-Message-State: AKwxytdlblt4hqRoKJ/uQK0NAZRY6GS7mmcG8cu96uHhYcUdogdvWrEv
	vx84tZSAigPeicZiW9N7n7ymQPrw
X-Google-Smtp-Source: AH8x225mkaWc3nKAPK7oaTylNXElcfIgtl8KQ0FRLcv84DzX4b5LCLE18+krZGjuXr5sRzpC9HoCYA==
X-Received: by 10.55.200.207 with SMTP id t76mr6505195qkl.291.1516551684009;
	Sun, 21 Jan 2018 08:21:24 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:30 -0500
Message-Id: <1516551637-32255-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 03/10] Remove deprecated python3-enum from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:23 -0000

The python3-enum package was removed as part of the migration to the
json manifest file.  The functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-automat_0.6.0.bb         | 2 --
 meta-python/recipes-devtools/python/python3-click_6.7.bb             | 2 --
 meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb       | 4 ----
 meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb      | 1 -
 meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb        | 4 ----
 meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb      | 1 -
 meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb        | 1 -
 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb          | 2 +-
 meta-python/recipes-devtools/python/python3-ply_3.10.bb              | 4 ----
 meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb | 1 -
 meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb         | 1 -
 meta-python/recipes-devtools/python/python3-pyserial_3.4.bb          | 2 +-
 meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb         | 1 -
 meta-python/recipes-devtools/python/python3-serpent_1.23.bb          | 1 -
 meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb          | 1 -
 18 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
index bc67215..9d98372 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
@@ -2,7 +2,6 @@ inherit setuptools3
 require python-asn1crypto.inc
 
 RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-selectors \
     ${PYTHON_PN}-shell \
 "
diff --git a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
index 0469e61..2c74764 100644
--- a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
@@ -1,4 +1,2 @@
 inherit setuptools3
 require python-automat.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-enum "
diff --git a/meta-python/recipes-devtools/python/python3-click_6.7.bb b/meta-python/recipes-devtools/python/python3-click_6.7.bb
index ecd1514..1920644 100644
--- a/meta-python/recipes-devtools/python/python3-click_6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-click_6.7.bb
@@ -1,4 +1,2 @@
 inherit pypi setuptools3
 require python-click.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-enum"
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb b/meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb
index 7840b20..844cbdc 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb
@@ -1,6 +1,2 @@
 inherit setuptools3
 require python-decorator.inc
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-enum \
-"
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
index 26024c6..e28389e 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
@@ -3,7 +3,6 @@ require python-dnspython.inc
 
 # Requires _pydecimal.py which is in misc
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-selectors \
 "
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
index 3d30af2..bd2bcb3 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
@@ -1,4 +1,4 @@
 inherit setuptools3
 require python-hyperlink.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-selectors ${PYTHON_PN}-enum"
+RDEPENDS_${PN} += "${PYTHON_PN}-selectors"
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb
index eb55934..73efcee 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb
@@ -1,6 +1,2 @@
 inherit setuptools3
 require python-jsonpatch.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-enum \
-"
diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
index 429c6bf..436a664 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
@@ -25,7 +25,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-xml \
 "
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
index a64abcc..be55770 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
@@ -2,6 +2,5 @@ require python-netaddr.inc
 inherit setuptools3
 
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-selectors \
 "
diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
index 080372c..997b0ca 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools3 python3native pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-selectors ${PYTHON_PN}-enum"
+RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-selectors"
diff --git a/meta-python/recipes-devtools/python/python3-ply_3.10.bb b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
index de8881d..72410ba 100644
--- a/meta-python/recipes-devtools/python/python3-ply_3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
@@ -1,6 +1,2 @@
 require python-ply.inc
 inherit setuptools3
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-enum \
-"
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
index d8f6389..1067d15 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
@@ -3,7 +3,6 @@ require python-prompt-toolkit.inc
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-textutils \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
index 9f02cab..55b0314 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
@@ -3,7 +3,6 @@ require python-pymongo.inc
 
 # Requires _pydecimal which is in misc
 RDEPENDS_${PYTHON_PN}-bson += " \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-selectors \
     ${PYTHON_PN}-subprocess \
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
index 44c1368..6807b95 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
@@ -6,4 +6,4 @@ do_install_append() {
     rmdir ${D}${bindir}
 }
 
-RDEPENDS_${PN} += "${PYTHON_PN}-enum ${PYTHON_PN}-selectors"
+RDEPENDS_${PN} += "${PYTHON_PN}-selectors"
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
index f8aa01b..e5f00e8 100644
--- a/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
@@ -2,7 +2,6 @@ inherit pypi setuptools3
 require python-pysocks.inc
 
 RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-selectors \
 "
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.23.bb b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
index 199dcfa..bc8bfff 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
@@ -3,6 +3,5 @@ require python-serpent.inc
 
 # Requires _pydecimal which is in misc
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-misc \
 "
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
index 01f1e97..eaa0090 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
@@ -2,4 +2,4 @@ inherit setuptools3
 require python-sqlalchemy.inc
 
 # Requires _pydecimal.py which is in misc
-RDEPENDS_${PN} += "${PYTHON_PN}-enum ${PYTHON_PN}-misc"
+RDEPENDS_${PN} += "${PYTHON_PN}-misc"
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index 4a4e679..b8dc174 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -3,7 +3,6 @@ require python-whoosh.inc
 
 # Requires _pydecimal.py which is in misc
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-enum \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-selectors \
 "
-- 
2.7.4


