Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.60119.1600089353788225932
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKm-0000ED-Cv; Mon, 14 Sep 2020 16:15:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-pyusb: Upgrade 1.0.2 -> 1.1.0
Date: Mon, 14 Sep 2020 16:15:33 +0300
Message-Id: <20200914131536.6072-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.1.0:

- Make deploy script compatible with setuptools_scm and add
  prompts
- tutorial: fix the description of the return of
  find(find_all=True)
- Fix broken link in tutorial to libusb caveats
- Use setuptools_scm for versioning
- simplify version_info regex
- Bug fixes

License-Update: Normalize all copyright disclaimers, update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-pyusb_1.0.2.bb   | 12 ------------
 .../recipes-devtools/python/python3-pyusb_1.1.0.bb   | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
deleted file mode 100644
index 44c24f423..000000000
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "PyUSB provides USB access on the Python language"
-HOMEPAGE = "http://pyusb.sourceforge.net/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=51691ed11cc2c7ae93e383f60ed49b0f"
-DEPENDS += "libusb1"
-
-SRC_URI[md5sum] = "862b56452c64948c787ad8ef9498590b"
-SRC_URI[sha256sum] = "4e9b72cc4a4205ca64fbf1f3fff39a335512166c151ad103e55c8223ac147362"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
new file mode 100644
index 000000000..6b48d6a25
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "PyUSB provides USB access on the Python language"
+HOMEPAGE = "http://pyusb.sourceforge.net/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c"
+DEPENDS += "libusb1 ${PYTHON_PN}-setuptools-scm-native"
+
+SRC_URI[md5sum] = "3b2e38e9f697d2f90d86376bd10a9505"
+SRC_URI[sha256sum] = "d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

