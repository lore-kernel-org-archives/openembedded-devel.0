Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7005A784AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:59:25 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id p66so5930872qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V29LLTMGiBsFo4nyEICgHcOUwocBzHsI2dXC6y1sIYw=;
	b=R8S79H4NTdaLTmV/4YpbuyoLY3LS4bZLwY013FMCqd56iRtpx1qKecVasYV2aK9GTr
	RPurDqF4nUugTMl7Q0jbXnhNCFn0C13ao7EfrFmEODIl4WRnWPmhwdXhjpxg78Jb7Uq0
	W23X4HXSJ8gqjcUNNutdSwX7ABX5OPfk3jFSG2BLlSowvTM2LaR75LKntndCVqcYCKEx
	DSozLcGYBMKUlQu2bsD62eoGuAJEbhp7CHvd9aNN6Vbu6VnGWDYV8Rd9bN9XHEGQ2yF0
	wxZ/+BtuxvQzsNBz5IkBiW//w7zSJaarWpGpjsQedFN4arB+8//0fLavTZWhJSzMVbSR
	ig2w==
X-Gm-Message-State: AElRT7E9OXdCDAWJIvnmmVPAYPM6DHF4jg1BCdb13Jy1wA0datV6e68S
	GgqkmGFAJpmcXxNrAxHtpBmwYiWg
X-Google-Smtp-Source: AG47ELudPvK11wZbAgp/NLeuQLccXKgKy+PKIJBZ3y5RZs5RBpgCjUaN5+0KLj3tYAnF9T7+wlGG/Q==
X-Received: by 10.55.24.1 with SMTP id j1mr30842612qkh.23.1521651566169;
	Wed, 21 Mar 2018 09:59:26 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d11sm3065587qth.97.2018.03.21.09.59.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 09:59:25 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:59:21 +0000
Message-Id: <20180321165923.31902-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/3] python-aws-iot-device-sdk-python: fix runtime dependencies
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
X-List-Received-Date: Wed, 21 Mar 2018 16:59:25 -0000
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


