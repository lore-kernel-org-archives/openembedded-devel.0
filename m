Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.1363.1609787965879685434
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 11:19:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39382 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwVO0-0007Kw-8z; Mon, 04 Jan 2021 21:19:25 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-nocasedict: Upgrade 1.0.1 -> 1.0.2
Date: Mon,  4 Jan 2021 21:19:15 +0200
Message-Id: <20210104191916.7071-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210104191916.7071-1-leon.anavi@konsulko.com>
References: <20210104191916.7071-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 1.0.2:

- Migrated from Travis and Appveyor to GitHub Actions. This
  required changes in several areas including dependent packages
  used for testing and coverage. This did not cause any changes
  on dependent packages used for the installation of the package.

License-Update: File changed but the licence remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-nocasedict_1.0.1.bb  | 9 ---------
 .../recipes-devtools/python/python3-nocasedict_1.0.2.bb  | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
deleted file mode 100644
index af5da52f68..0000000000
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "A case-insensitive ordered dictionary for Python"
-HOMEPAGE = "https://github.com/pywbem/nocasedict"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
-
-SRC_URI[md5sum] = "93e7f19f73c7cd56c36cd7535b6b9ab1"
-SRC_URI[sha256sum] = "6e5d5bd11de33f93d22545d9ed23a0b98f840f2cdac0d749d2faa4617adc7772"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
new file mode 100644
index 0000000000..952286d37c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A case-insensitive ordered dictionary for Python"
+HOMEPAGE = "https://github.com/pywbem/nocasedict"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
+
+SRC_URI[sha256sum] = "86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b34c390c6c58885c85a0"
+
+inherit pypi setuptools3
-- 
2.17.1

