Return-Path: <nicolas.ferre@atmel.com>
Received: from eusmtp01.atmel.com (eusmtp01.atmel.com [212.144.249.242])
	by mail.openembedded.org (Postfix) with ESMTP id 8952577344
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:34:06 +0000 (UTC)
Received: from tenerife.corp.atmel.com (10.161.101.13) by eusmtp01.atmel.com
	(10.161.101.30) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 13 Nov 2015 17:28:50 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Date: Fri, 13 Nov 2015 17:29:17 +0100
Message-ID: <1447432157-15189-2-git-send-email-nicolas.ferre@atmel.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1447432157-15189-1-git-send-email-nicolas.ferre@atmel.com>
References: <1447432157-15189-1-git-send-email-nicolas.ferre@atmel.com>
MIME-Version: 1.0
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [meta-python][jethro][PATCH] python-evdev: add python-evdev 0.5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 16:34:07 -0000
Content-Type: text/plain

Python-evdev is a Python module that gives access to the input event interface
from userspace.
https://python-evdev.readthedocs.org/en/latest/

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 meta-python/recipes-devtools/python/python-evdev_0.5.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-evdev_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb b/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb
new file mode 100644
index 000000000000..2435b456b5e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Python evdev lib"
+HOMEPAGE = "https://github.com/gvalkov/python-evdev"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b500cb3c70f576a0a75125beda9491a"
+
+SRC_URI = "https://github.com/gvalkov/python-evdev/archive/v${PV}.zip"
+SRC_URI[md5sum] = "30c11ee7bd4a943f8ae586d839b860f2"
+SRC_URI[sha256sum] = "ce6a757e28b56a12a9ad4e86420db4b11918b75ba1cd70f7444e904a7284b6fe"
+
+inherit setuptools
-- 
2.1.3


