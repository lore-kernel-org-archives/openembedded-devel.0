Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id A2582786EE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:26 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id z11so15151792qtm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fjmMo+gfxX7wFC0KOji67uteJIYJjFuCnBBOsR4a6qI=;
	b=TJl+AiAgNQZY3MibJfHSUO2U89MacwS24rlbnwWbOSjmY3XVMtimP5r4KrI+dtXgz1
	hgL41zZixvjbxwVPClUmg6KJ65h2Iqb3m+4SBwnkRqgt2mN9I0eU6RNeDpLrKJMUMmZJ
	0kTrLkkqu1gOrqjN7C5P1BABIzGQfeLsLBJey7YV3EHTO4qusRjGwz5Cr0IAwjanpngL
	1jIdhFMLUM3cEiCTrYCiMv8jK//iDxvMbv0xEgURjivPkeHHw0VYMaIeUWCnFNgpH4Lb
	cJKWsFc9by3EgXyTiX2t0C1nQ4iJ1BD+b3wlaUbyvfvw9iujIMoGkPh2e5SwsLZuuB/k
	TGsA==
X-Gm-Message-State: AKwxytcYXPUE07AYzYiAsY659dA2nz7ZllgLE76x1istLdAO49snllis
	W9Qq97dGpgh9IytkIg0b3Lrkouca
X-Google-Smtp-Source: AH8x2245UQ45eEwWHUkYKPsIxz0kzg7cV+GhZtgo5ff62Abg8rW3+pkPJZm41omKv/wc55xBqGGRjg==
X-Received: by 10.55.71.195 with SMTP id u186mr5864853qka.255.1516551687697;
	Sun, 21 Jan 2018 08:21:27 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:36 -0500
Message-Id: <1516551637-32255-10-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 09/10] Remove deprecated python3-textutils from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:26 -0000

The python3-textutils package was merged into core as part of the
json manifest migration

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb         | 1 -
 meta-python/recipes-devtools/python/python-asn1crypto.inc           | 1 -
 meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb     | 4 ++++
 meta-python/recipes-devtools/python/python-jinja2.inc               | 2 +-
 meta-python/recipes-devtools/python/python-jinja2_2.10.bb           | 6 +++++-
 meta-python/recipes-devtools/python/python-jsonschema.inc           | 1 -
 meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb      | 1 +
 meta-python/recipes-devtools/python/python-netaddr.inc              | 1 -
 meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb        | 4 ++++
 .../recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb        | 1 -
 10 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index ff08361..9b7a381 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -40,7 +40,6 @@ RDEPENDS_${PN}-bin = " \
     python3-shell \
     python3-stringold \
     python3-subprocess \
-    python3-textutils \
     python3-threading \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 0d3ee41..2777c21 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -18,7 +18,6 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-textutils \
     ${PYTHON_PN}-subprocess \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb b/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
index 6af60c2..1218519 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-asn1crypto.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-textutils \ 
+"
diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index 510765b..0c0bf0d 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -8,7 +8,7 @@ SRC_URI[md5sum] = "61ef1117f945486472850819b8d1eb3d"
 SRC_URI[sha256sum] = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-textutils \
+    ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
     ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
 
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.10.bb b/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
index 0607521..5233cf4 100644
--- a/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
+++ b/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
@@ -1,4 +1,8 @@
 inherit pypi setuptools
 require python-jinja2.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-lang ${PYTHON_PN}-re"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-lang \
+    ${PYTHON_PN}-re \
+    ${PYTHON_PN}-textutils \
+"
diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 748ef6e..8413692 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -19,7 +19,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-strict-rfc3339 \
     ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-textutils \
     ${PYTHON_PN}-unittest \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
index c118f2d..7407616 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
@@ -7,4 +7,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-functools32 \
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-re \
+    ${PYTHON_PN}-textutils \ 
 "
diff --git a/meta-python/recipes-devtools/python/python-netaddr.inc b/meta-python/recipes-devtools/python/python-netaddr.inc
index 486bfc6..5b6d4df 100644
--- a/meta-python/recipes-devtools/python/python-netaddr.inc
+++ b/meta-python/recipes-devtools/python/python-netaddr.inc
@@ -9,6 +9,5 @@ inherit pypi
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-textutils \
     ${PYTHON_PN}-xml \
 "
diff --git a/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
index 5e089a9..ca5a79a 100644
--- a/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ b/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -1,2 +1,6 @@
 require python-netaddr.inc
 inherit setuptools
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-textutils \
+"
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
index 1067d15..0e99917 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
@@ -4,5 +4,4 @@ require python-prompt-toolkit.inc
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-textutils \
 "
-- 
2.7.4


