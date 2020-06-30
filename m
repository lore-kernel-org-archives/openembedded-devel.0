Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.1974.1593537129688072729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46852 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqJnk-0004sv-PG; Tue, 30 Jun 2020 20:12:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-h2: Consolidate in a single file
Date: Tue, 30 Jun 2020 20:11:18 +0300
Message-Id: <20200630171119.25540-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630171119.25540-1-leon.anavi@konsulko.com>
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-connectivity/python-h2/python-h2.inc    | 12 ------------
 .../python-h2/python3-h2_3.1.1.bb                   | 13 +++++++++++--
 2 files changed, 11 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc

diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
deleted file mode 100644
index c457836b7..000000000
--- a/meta-python/recipes-connectivity/python-h2/python-h2.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
-HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
-
-SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
-SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe"
diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
index 7230a27e8..5d9a65530 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
@@ -1,3 +1,12 @@
-require python-h2.inc
+DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
+HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
+LICENSE = "MIT"
 
-inherit setuptools3
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
+
+SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
+SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe"
-- 
2.17.1

