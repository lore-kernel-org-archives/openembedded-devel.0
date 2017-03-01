Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF36E77316
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 21:11:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s186so14059894qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 13:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Oi2AEbTl1EIhxjZxIorFKuiyKa97Tq9YPHXBS76ZiP0=;
	b=dEStCQzaJt3AiXShpcrCwhYwKF2+zLWhfLamiuAJWkoKakbSceqzSufspce5xEJT+L
	dPEoTb0X3ddC/6qt+0saj9WuSLOCFE+W0UlcK3nmcQcxcxVgZP2yRfJWDV2V9o/vjJpb
	THuy1Pgidt1h/nOKwmn7Xx226OvtPcecvaEwu6Hk5Y/CcVxtpn0HEDp22NUfEOty/520
	PXHq9COi2CV3cCOy0Bd0qwEk+QjTxWv4smpIlAd6K3n8Um6ZjKIc8gdmCdkL4WLFszkG
	6xprtvCQ0fe+XgFjHZzfCdvZsK8lsjl3Y3bpgmVvgf3WAXwJkzZkWHAf9ZE3VqbBSJ5C
	As0w==
X-Gm-Message-State: AMke39nfUUYdY5QB3V5vxSjRF9d8ZFRPqp5G70R9kgCWX8Em5T0dnGXz4SCLATP26BI3gg==
X-Received: by 10.55.109.198 with SMTP id i189mr13057394qkc.242.1488402703941; 
	Wed, 01 Mar 2017 13:11:43 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	143sm3950055qki.59.2017.03.01.13.11.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Mar 2017 13:11:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:10:18 -0500
Message-Id: <1488402618-27790-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pysqlite: add initial recipe for version 2.8.3
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
X-List-Received-Date: Wed, 01 Mar 2017 21:11:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pysqlite.inc        | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-pysqlite_2.8.3.bb   |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pysqlite.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pysqlite.inc b/meta-python/recipes-devtools/python/python-pysqlite.inc
new file mode 100644
index 0000000..8845565
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pysqlite.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "DB-API 2.0 interface for SQLite 3.x"
+HOMEPAGE = "http://github.com/ghaering/pysqlite"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=28ad4f115e06c88bd737372a453369d8"
+
+SRC_URI[md5sum] = "033f17b8644577715aee55e8832ac9fc"
+SRC_URI[sha256sum] = "17d3335863e8cf8392eea71add33dab3f96d060666fe68ab7382469d307f4490"
+
+inherit pypi
+
+DEPENDS += "${PYTHON_PN}-pip"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-datetime \
+    sqlite3 \
+"
+
+FILES_${PN}-doc += "${datadir}"
diff --git a/meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb b/meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb
new file mode 100644
index 0000000..95938f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pysqlite.inc
-- 
2.7.4


