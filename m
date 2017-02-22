Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B78D172FE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 06:45:02 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r90so267729qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LtQLNIfPbGjjgeu/CY6d0T0EijfxGjr6kVsgvFcZEmg=;
	b=BBII0UAgNHk9RD1b2qDUvqx+m8s4W4ckbqoGHeERiVvC7RZ+nwZJc7ji2KL+DBgLes
	oFs5YPpee8F7626PQDLpGTENsYwoVHeZ8tZWE1szDvbYdv5hU9+F8aZ5y7wawKDfie3E
	hzcwimvJr1hKE/tDIBYL6FbqboB5bIPCfbxg5y6GhYMPwnKxt6N2h4XDwuDT//VAZXe6
	YURd5/GMteSSkK/8t3cGNpISn2qPCUuzigpsy54cp0frHVHLlJ+g0t+pnS8DL7LV6s13
	3N3H8h9xGmB+K67qemjxW/pn6MFFZqCBx67RCynQRux8bR5VotJ1oBgDRnefB7wmGWFj
	NVbg==
X-Gm-Message-State: AMke39m9s5moSTOW3QzEMILEN4iaxKx6h0+8w9h5u86TegFm8cYNkzspjXJHncFaK+Jztw==
X-Received: by 10.55.24.33 with SMTP id j33mr24491842qkh.14.1487745903734;
	Tue, 21 Feb 2017 22:45:03 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id n42sm164604qtn.58.2017.02.21.22.45.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 22:45:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 01:44:35 -0500
Message-Id: <1487745875-26552-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jinja2: update to version 2.9.5
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
X-List-Received-Date: Wed, 22 Feb 2017 06:45:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jinja2.inc              | 7 ++++---
 .../python/{python-jinja2_2.8.bb => python-jinja2_2.9.5.bb}        | 0
 meta-python/recipes-devtools/python/python3-jinja2_2.8.bb          | 2 --
 meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb        | 7 +++++++
 4 files changed, 11 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jinja2_2.8.bb => python-jinja2_2.9.5.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index c3ed6de..cf8010e 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -4,11 +4,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
 PYPI_PACKAGE = "Jinja2"
 
-SRC_URI[md5sum] = "edb51693fe22c53cee5403775c71a99e"
-SRC_URI[sha256sum] = "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4"
+SRC_URI[md5sum] = "9e55f0db6620dd99a1b366183a94270d"
+SRC_URI[sha256sum] = "702a24d992f856fa8d5a7a36db6128198d0c21e1da34448ca236c42e92384825"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-textutils \
-    ${PYTHON_PN}-lang ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe"
+    ${PYTHON_PN}-lang ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
+    ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
 
 CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python-jinja2_2.9.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jinja2_2.8.bb
rename to meta-python/recipes-devtools/python/python-jinja2_2.9.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
deleted file mode 100644
index 61156b6..0000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-jinja2.inc
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb
new file mode 100644
index 0000000..8375f8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb
@@ -0,0 +1,7 @@
+inherit pypi setuptools3
+require python-jinja2.inc
+
+# Requires _pydecimal which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+"
-- 
2.7.4


