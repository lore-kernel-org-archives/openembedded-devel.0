Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE433785AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:25 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a90so6522776pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IDGXEklN0iAvW7sCkR1SXT+tuworULLC/0XTCshcEhk=;
	b=vei8qdh46Z8E9XFACAzox08t77ABQon/9gCW54xZvlGWsKk2lNHLZAErrUtpu3tuNf
	82s8NIGRnQvq8GjAjfg3A0WyQWmfCsWB/WiUv87e4x1hzLbxtqknQecVfB8HxrZOr3Ph
	1k/dX2mJmYLrP3FV8R7su/BeNEq3GgGpYsRIVqsYPKwtOiYVwmiOeBG1HIceXTIIUX6e
	dzvsZmV7tnVORNntDtk4wBLOolMak7eNXqgE38XZ614o79AtaoYChDbryNYC4ZF7DM5w
	/CrPup6n4mrMD0wf4+3DQYD5herjJmOnL84jnX6kJyS9FVxF8hsRgUo7lVsSNaN7HZ3p
	PKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IDGXEklN0iAvW7sCkR1SXT+tuworULLC/0XTCshcEhk=;
	b=D5c16A3vtiPlFdG9pBiiVditzjfA0h4E3/j3PhBHLvOnTkEFOBAMrXHLdVScxEHzza
	lrEXFoe/RhHc51Q1kPWw5YXAYxlHYQaUkb6bN7lXdNixaPTsJM4sNSNpGRiwJY8LLN2j
	3KnDpEMd56IbMEogQ44G2O630ZqiS9/Sl6kLIBW84bPOON37m3fmcUOn414pxgRaRD6d
	x98NrgM7g4pbk1lo9QAFO2h7hkon5+zOsGfv9f5RwwyoL6C9LvOmAmGVjiTcQ4mTqtIE
	w6djx2GkNye4zNrmpVnJjhMYEvTjOdAzSFpyGUBAK8z5x/F5Q9tK5Pkv5uBY9UPgMmvL
	qpMw==
X-Gm-Message-State: AJaThX56wHPIDBPvnrO8G0ji67Xz4F/JOTjNhdJZjmJO2irq8xip0J7X
	8v5f/zQSAcFv0qPumUciG3fcYQ==
X-Google-Smtp-Source: AGs4zMbJA8U/3BEGYMhdmq3ftKK/Rr/y+hqS3pB4Xcdx6VNOlaj3VN/hzQZY/zXZ9fhE2bJvEAE3yQ==
X-Received: by 10.101.70.196 with SMTP id n4mr28059613pgr.353.1512711986377;
	Thu, 07 Dec 2017 21:46:26 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:25 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:37 -0800
Message-Id: <20171208054548.26218-2-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 01/12] python-dominate: move core of recipe to a .inc file
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:26 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-dominate.inc     | 11 +++++++++++
 .../recipes-devtools/python/python-dominate_2.3.1.bb        | 13 +------------
 2 files changed, 12 insertions(+), 12 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-dominate.inc

diff --git a/meta-python/recipes-devtools/python/python-dominate.inc b/meta-python/recipes-devtools/python/python-dominate.inc
new file mode 100644
index 0000000..ecf74a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dominate.inc
@@ -0,0 +1,11 @@
+SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+
+SRC_URI[md5sum] = "45bd97e6f7888aac24ae86013c57638e"
+SRC_URI[sha256sum] = "4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+    "
diff --git a/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb b/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
index 13ebf92..c19445e 100644
--- a/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
@@ -1,13 +1,2 @@
-SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
-
-SRC_URI[md5sum] = "45bd97e6f7888aac24ae86013c57638e"
-SRC_URI[sha256sum] = "4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-    "
+require python-dominate.inc
-- 
2.7.4


