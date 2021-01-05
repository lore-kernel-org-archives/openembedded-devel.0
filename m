Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6714.1609859817023255644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4o-0007qz-Fk; Tue, 05 Jan 2021 17:16:51 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-nocaselist: Upgrade 1.0.3 -> 1.0.4
Date: Tue,  5 Jan 2021 17:16:33 +0200
Message-Id: <20210105151638.15700-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.4:

- Migrated from Travis and Appveyor to GitHub Actions. This
  required changes in several areas including dependent packages
  used for testing and coverage. This did not cause any changes
  on dependent packages used for the installation of the package.

License-Update: File changed but the licence remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-nocaselist_1.0.3.bb  | 9 ---------
 .../recipes-devtools/python/python3-nocaselist_1.0.4.bb  | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
deleted file mode 100644
index 1119c7f38e..0000000000
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "A case-insensitive list for Python"
-HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-
-SRC_URI[md5sum] = "42ba878fd70611cf345c61edd83f5fb0"
-SRC_URI[sha256sum] = "7e6decb7d85563b9044913c9087ef4b691bc3da4d7ad1d88968cdea409553326"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
new file mode 100644
index 0000000000..60c79c22a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A case-insensitive list for Python"
+HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d229da563da18fe5d58cd95a6467d584"
+
+SRC_URI[sha256sum] = "73a9c0659e7135c66e46a6ab06e2cb637ce9248d73c690ebd31afb72a4e03ac0"
+
+inherit pypi setuptools3
-- 
2.17.1

