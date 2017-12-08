Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 889D178698
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p84so6528682pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=daVm69xCEJ70D7Hvb66dAdPxTxpNYZpyJoiEvze9v5k=;
	b=hd0NsgiYoIXtTgwsbktkm2iW8ka3VcS+gv42KNB56m66kujd4Iov60AliDklqo0r4w
	ij2AvKK4UtGEuaKbGMOHSIoZwNYOBSLffJ9nY7L0J1FBlEnRjkSrUnSuMopM5MTFXeDa
	i+4ZqlzNbW9Ef1uf8OynPxYhCCZh/2zJk44w9q5V9JnbKSgtpCqS2m7FBYHQangZOASB
	hJ+QlaGDUJiqq+qqDvqqeoORHL4sWHxL9t1AGjYWM1srdk/aD6nfOl7vVJ0AXRnNSlK5
	qeHsT7pwzq7NHxn33PBKR7ZSdOEgOiom479vr34eOusvjjEScSOxy7hiFvDXmHGmCHgZ
	R5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=daVm69xCEJ70D7Hvb66dAdPxTxpNYZpyJoiEvze9v5k=;
	b=CEA63LvK377372ouOOM5s74nJZDjWEf7DIv2Z5hbBbpOJIGtdguwL2Uazj0O9xV4+7
	wmxarvj5GWWOKHzFm3oV9dDCNui4nTlT4FfF+guDkImzPUAUnI7xu7UM6+D3Edcp/6Ll
	DERgv9HltdFBeH2U8hYoLdlgUCOCI5WvfCBBHFqU1jsdLSp1LBHp+T6eNpmw0wl/Wn4S
	PGLVkCxXVO0jHY89iHh2BvG3PK3TR+GMAo8QE0myMqnQLVOkwzxZPISiGayfeEkXwUww
	a7YCfsGazsRUeBr0/X4WvURAye3lKU5JYs0cx1MvrvwdiYxtoTrfe8Y4GVbuDKJieYgZ
	Mx1A==
X-Gm-Message-State: AJaThX52S5CPlw1hzmgrDdJtPJv2Q2rpsmNn9ao5QIK29Z0VOXaLB8cT
	uAa1bLnP1Sx0wx3lW/oefeMXnQ==
X-Google-Smtp-Source: AGs4zMZw81kjnE1d1R4s4Ako+dt8u0Yphhv/IsHlI4u4v5R3NYcXDLRzN0s2IsF51oBic3tRz72DmQ==
X-Received: by 10.99.53.3 with SMTP id c3mr26882189pga.194.1512712170465;
	Thu, 07 Dec 2017 21:49:30 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:29 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:04 -0800
Message-Id: <20171208054911.27014-7-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 06/13] python[3]-flask-script: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:29 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-script.inc  | 12 ++++++++++++
 .../recipes-devtools/python/python-flask-script_2.0.6.bb     |  2 ++
 .../recipes-devtools/python/python3-flask-script_2.0.6.bb    |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-script.inc b/meta-python/recipes-devtools/python/python-flask-script.inc
new file mode 100644
index 0000000..fca777b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-script.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Scripting support for flask"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e686048adb69341fc8a08caeda528b41"
+
+SRC_URI[md5sum] = "3fbd91fe13cebedfb2431331f6eabb68"
+SRC_URI[sha256sum] = "6425963d91054cfcc185807141c7314a9c5ad46325911bd24dcb489bd0161c65"
+
+PYPI_PACKAGE = "Flask-Script"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb b/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
new file mode 100644
index 0000000..b7d55af
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-script.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb b/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
new file mode 100644
index 0000000..9f88519
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-script.inc
-- 
2.7.4


