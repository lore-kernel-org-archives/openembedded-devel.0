Return-Path: <scott.branden@broadcom.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0755F60214
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 02:49:47 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id z12so5633166pgl.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 19:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=N1ZStbQ/KjCmQE4AISo5yBUbfFJoXMXpeOeXEreXlCE=;
	b=iKbN6OHwzxfg9UQa24SlaYAPa2yQqvAVqsDR77v93Vz1KBAIc+tnWPYZA/VGAz+W3t
	YLLas9FzAad2hJO++TQ2hWD1cboWeM3EPaO4/waHILdsuX0+FbLyuE+SgP2PM0/VBMmW
	Fzkp3/jbcTDGscCdoIxhV9cLnqfjvNTDPhk40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N1ZStbQ/KjCmQE4AISo5yBUbfFJoXMXpeOeXEreXlCE=;
	b=mZYzhSRpm3CPnNEFW0YgEkGRr9x0MjXNC6X7A2AAaIbKAMTSn1LQ8gLku1LOONgmq9
	HEoEl/JXFony1R3i5/p4A7dV+xXbwhhpU2ah2l5nlLkrLNQVBq9Vw4e+EqG5B5Vuv+Ic
	YFeB4J8ygNif72Ex47vgpGHzZtjGbMItzeaXpxIvJBCAhHLRIzETFc5gsPDqoGNmfXUs
	ESH8vV+fegSrmjztT0JVxyGKHIZgGj9vCk274dFjMoDeJRDyudAq3FwxEPTM3j17ZXK1
	xg9kZltVZEXV2k9UubQ7rw/lIZm0Ext7qYFy0Z2xrbzBKCE9IvhoW/kORjcYilGf8GUw
	jeCQ==
X-Gm-Message-State: ANhLgQ1diAJWkXjPmVi6sXHMpai45BTBAkCVVbbYr4GBAuS3enkAxA/v
	r2Yy8RvcSomNhsXtB+tRMtpe26ablM7lOKPbAyEx0aCwt0LXj5OZ9GJu8bUYEfHLue4B7FSgajZ
	Bo1FIMCbE/wWJy3Z7+toR7h4KvE/Cwo1aPTqOu/ghigwUaM9qaePMgq7Hdt0P0dA/9zEAjLp3hf
	wNPGMyOtPssaS+aC+uPmLXQiD1vNSX
X-Google-Smtp-Source: ADFU+vsPPNUBtNi47KQW6IUUn8H0T51KZieqxGfEwCsfW+7qo/82lC6t488BBDd/XOqTMYvmcluetQ==
X-Received: by 2002:a65:404d:: with SMTP id h13mr18684157pgp.156.1583808588368;
	Mon, 09 Mar 2020 19:49:48 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	s12sm22938970pgv.73.2020.03.09.19.49.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 19:49:47 -0700 (PDT)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2020 19:49:36 -0700
Message-Id: <20200310024936.18941-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Cc: Rajesh Ravi <rajesh.ravi@broadcom.com>
Subject: [meta-python][PATCH] python3-pycryptodomex: add 3.9.4 recipe
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
X-List-Received-Date: Tue, 10 Mar 2020 02:49:48 -0000

From: Rajesh Ravi <rajesh.ravi@broadcom.com>

Add python3-pycryptodomex 3.9.4 recipe needed to build
such components as optee 3.8.0.

Signed-off-by: Rajesh Ravi <rajesh.ravi@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../python/python3-pycryptodomex_3.9.4.bb     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
new file mode 100644
index 000000000..be6b10f3f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Cryptographic library for Python"
+DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
+ cryptographic primitives."
+HOMEPAGE = "http://www.pycryptodome.org"
+LICENSE = "PD & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
+
+SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
+SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
+
+inherit pypi
+inherit setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-math \
+"
+
+RDEPENDS_${PN}-tests += " \
+    ${PYTHON_PN}-unittest \
+"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests += " \
+    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
+    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


