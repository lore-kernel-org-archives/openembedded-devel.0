Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 51802788E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:11:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j73so8395981qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 02:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E5VuCHDarGyzXDYyG1vqkq1esI4v5RhCk7oPmJ9RDRY=;
	b=EuvNni1xOgAcYx9FLM/GkorGd4chs1o3Py5tr3w3W2cGgCAA7s5sYpNxkBx3vthWDq
	/lZOqAw3SJ5BGthTrMqNeQoX39stj8YCxT5KHFZ5aztVGlJ6d5qZN2pVoJRgpXBcgANq
	eH+55zoudwSqSzDI6SnsZoreWC+rQHJ3sBWS5qs0hb+LdcrEDHI2CL87TbzykpCESxPI
	qXeSb2QFGcK0ar6J8FutCd6MSyONekNhR7CxodXEcBFZb7qeknPzbrO9aYKAQTJINHsS
	98UZWMyek5BURNHzRYQCb4PxQZpYUlUwf+Em9oYjBEvCVZANjof4wg9iqXTffOKQP2d+
	NfgQ==
X-Gm-Message-State: AElRT7FcJ7va06zPOxVZdGhLF3rTbTq7lYgKByP+6IReobtOcROZyTJ+
	2d9Q5ysjnnY5pIj68Lld2GxSF5KJ
X-Google-Smtp-Source: AG47ELt6AYwZ/g4oDejiQ89Y8KN3snf6YESsYWlwUc4hIJJ4NZ6rsSacGKXJN1T2L3fwUdsXV6K66g==
X-Received: by 10.55.136.129 with SMTP id k123mr32285908qkd.205.1521709916076; 
	Thu, 22 Mar 2018 02:11:56 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id n68sm823747qke.25.2018.03.22.02.11.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 02:11:55 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 09:11:50 +0000
Message-Id: <20180322091152.3145-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 1/3] python-aws-iot-device-sdk-python: fix runtime dependencies
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
X-List-Received-Date: Thu, 22 Mar 2018 09:11:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

They were completely wrong...
List of imports obtained via:
   rgrep -w import \
   | awk -F : '{ $1="" ; gsub(/^[ \t]+|[ \t]+$/, ""); print; }' \
   | grep -v AWSIoTPythonSDK \
   | sort -u
and packages providing the relevant modules extracted using
oe-pkgdata-util find-path.

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v2:
* no changes
---
 .../recipes-devtools/python/python-aws-iot-device-sdk-python.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index 177b819d4..1fc98bdbd 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -11,8 +11,15 @@ inherit pypi
 PYPI_PACKAGE = "AWSIoTPythonSDK"
 
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


