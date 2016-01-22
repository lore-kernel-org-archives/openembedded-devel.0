Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DB50B77065
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u188so518659wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MsPEeRKfzZEHoDaDTeUIkLvlvZyeUCKzG8gakeoTg40=;
	b=LAa/oLRtfvorKjT982hgARMuVK4LWvOHt+y1/KFKrEWbDifx6WOboJ8LGEWjNroHFH
	pMMMsG0Qg64ToCxhxbqrQAnIqWLGOsArnZKs2ew7KW3WZu2pVm8UIVO7fLyxGIcishnx
	yy7yhOBzdQCMI555JH8xdf9a2/RCqxvoCAoUspRhxS7zoB0zWRxn6BSd/g4AVB3TDJ5K
	d2WWz8eNok2lr8EOcfFDD0y/QTWd0Kp3rXfnddOKVaX0cTAoDXn6CTNwWWJIz1m61jBb
	anBeR8ZwXNRNCsykC9lZhhKwkbSZQsUvoekq9ePc5zNvyucX96waEnSFFmcLqpZAHeSV
	FVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=MsPEeRKfzZEHoDaDTeUIkLvlvZyeUCKzG8gakeoTg40=;
	b=mj/OEwAUBgDllWjpobqdd2FfdSpuuZAmK+47gqK5lmYsZvowDuBxPwDwrGcdUmloxv
	S/+NICTEmZ9zekgXb4lSg5xKm1P4N941PNJ4VJQD5mdRkCLivDZ2i0U0ldUd/2J1n4zt
	bLiTRt9+zkrazNFlUu/wnJh25crauBZeOBA0hKSNQg0DBHrueiY6WJh8ZZNK0Icl0pz9
	/8MxfrGg5sMareDKZRMx0R/oNWgiBwE54tWRlJH7rJSm9/AtV2RXDfgtDs8RAwiShwXQ
	Raiql4dHqBFf64QXb6m6ztv6DFvc/h7vhd8MSyaXqS1MHkjbcNklgKrMIavRbI4HIQa5
	HSUQ==
X-Gm-Message-State: AG10YOQB0LXx4EgSGRbmCxBcLURXmhs0rLLto39m3KKG6QKcVZDvWBVUZzEimY5htmMb0Q==
X-Received: by 10.28.46.193 with SMTP id u184mr6361173wmu.102.1453505457358;
	Fri, 22 Jan 2016 15:30:57 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:56 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:15 +0100
Message-Id: <aabeeb9f76d8545da6bdd06bcfcb53e19e3ebe97.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 13/21] python-jinja2: 2.7.3 -> 2.8 and add python3 recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:57 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/python-jinja2.inc       | 16 ++++++++++++++++
 .../recipes-devtools/python/python-jinja2_2.7.3.bb  | 21 ---------------------
 .../recipes-devtools/python/python-jinja2_2.8.bb    |  2 ++
 .../recipes-devtools/python/python3-jinja2_2.8.bb   |  2 ++
 4 files changed, 20 insertions(+), 21 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-jinja2.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-jinja2_2.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.8.bb

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
new file mode 100644
index 0000000..879550b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+HOMEPAGE = "https://pypi.python.org/pypi/Jinja2"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
+
+PR = "r0"
+PYPI_PACKAGE = "Jinja2"
+
+SRC_URI[md5sum] = "edb51693fe22c53cee5403775c71a99e"
+SRC_URI[sha256sum] = "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-textutils \
+    ${PYTHON_PN}-lang ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe"
+
+CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb b/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
deleted file mode 100644
index aa5c082..0000000
--- a/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
-HOMEPAGE = "https://pypi.python.org/pypi/Jinja2"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
-
-PR = "r0"
-SRCNAME = "Jinja2"
-
-SRC_URI = "https://pypi.python.org/packages/source/J/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "b9dffd2f3b43d673802fe857c8445b1a"
-SRC_URI[sha256sum] = "2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-io python-pickle python-crypt python-math python-netclient python-re python-textutils python-lang python-pprint python-shell python-markupsafe"
-
-CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python-jinja2_2.8.bb
new file mode 100644
index 0000000..712c796
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jinja2_2.8.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-jinja2.inc
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
new file mode 100644
index 0000000..e2f9c1e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-jinja2.inc
-- 
1.9.1


