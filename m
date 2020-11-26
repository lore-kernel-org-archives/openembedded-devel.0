Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3684.1606389762052348664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 03:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52394 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiFMF-0005Yd-HF; Thu, 26 Nov 2020 13:22:41 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-transitions: Upgrade 0.8.4 -> 0.8.5
Date: Thu, 26 Nov 2020 13:22:15 +0200
Message-Id: <20201126112215.11451-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126112215.11451-1-leon.anavi@konsulko.com>
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.5:

- AsyncMachine.switch_model_context is expected to be async now
  for easier integration of async code during model switch.
- Bugfix: Initializing a machine with GraphSupport threw an
  exception when initial was set to a nested or parallel state

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-transitions_0.8.4.bb               | 11 -----------
 .../python/python3-transitions_0.8.5.bb               |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
deleted file mode 100644
index 3da97ef95e..0000000000
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-inherit pypi setuptools3
-
-SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
-
-SRC_URI = "https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz"
-SRC_URI[md5sum] = "ef07ea90015a296653a4b095837b0354"
-SRC_URI[sha256sum] = "9a2841b24789dfd345267cb92e26b79da75fd03f6021d1a5222c71b5c9ae3c16"
-
-RDEPENDS_${PN} += "python3-six"
diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
new file mode 100644
index 0000000000..7f88bc1d22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "e441c66a0c753d56c01c3e5e547f21dbe4a5569c939f12477475c5e81d79769b"
+
+RDEPENDS_${PN} += "python3-six"
-- 
2.17.1

