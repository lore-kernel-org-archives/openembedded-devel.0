Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B8D5D7F7E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 12:52:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w15so4111396wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 04:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0JU7KTe9neY6J7n1jpHZUamjNvqCxZD+Ji9/5coV4z4=;
	b=huXqvyCrFi8ysmVuimlpa7b7tic0I+sWvw7M30QPqRlOAcYJODCYCBSvGmw18ku82U
	19xsEakuzaO8H5y09m02pX573MfOFnwGlSm5JNQ4vs0hMwMPLFidgtaOvgT43ZBnLNes
	6UFjSh6+XzDXKqFtpqd2H3qn7MMvnVkTGUspyzz2ewjSKk9a3hHwLA5YUyqHwoPaMONH
	j3w/Mpd5FWftiAhZn53YYh50BzUDbbt62EcEZmsbvVFyFdE5nBnEu1LSkdXX5yc3O3Oy
	Qjiej0kzTFHM2SPzGyR5Vv5FTVgpjZAxLhZ4YmNoFi3rDANEPdqAxxDsUE3JyBGiMAvM
	pTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0JU7KTe9neY6J7n1jpHZUamjNvqCxZD+Ji9/5coV4z4=;
	b=K0zpfZ794VqrvJMjIuvwk7tFP9VVFLO58oN8Q39xt/+ry8isWnQm3+Dwlln9B/ahsd
	n5SyhFcxlyP4aO7rNn60IIJfEXDdwk5KI10XYOivDv62NiD75G0L4BqoGM703mohdR4J
	pJx+/PDU5Sd0AkvIKG87zAezrZFRdKxGLlM6RwpP89H5X5QG6D51H9StqpoMOhH8j0Ip
	Gw9rb5gQZOtKWLUgHEWcVoY7vrCIXymYN4GQNCOC2B/Q9CQyJXFYTyR+yXiPybQJ7KpB
	qwZyEclFUlZZMNCha7I5iYyFl8GOcTyRjFFwJUiq8rKtmceidpgNNeMuKmUk1j+hlZjC
	LcFA==
X-Gm-Message-State: APjAAAWvWzWOVC2XBOFDYK560kK+lPuDKr2LacH0Cwxan6msRi/S8V6y
	yiAslYS/qGYqVvmE/xh0ql6y90kadjg=
X-Google-Smtp-Source: APXvYqxVbXt+YuTziIIcyvkpTYkolx30FQsc1/JvhjDQ2/ZeX6Fz0nNV5ppVCRN63ZAd8Am2MmVbRg==
X-Received: by 2002:a5d:6350:: with SMTP id b16mr33822600wrw.132.1575031943873;
	Fri, 29 Nov 2019 04:52:23 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x13sm13058927wmc.19.2019.11.29.04.52.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 04:52:22 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Nov 2019 12:52:02 +0000
Message-Id: <20191129125201.38715-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-dbussy: add recipe (v1.2.1)
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
X-List-Received-Date: Fri, 29 Nov 2019 12:52:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pure python dbus library with support for various loop including asyncio

From the readme:

  DBussy allows you to take advantage of asyncio, but it doesn’t force
  you to use it. DBussy is meant to give you access to (nearly) all the
  functionality of the underlying libdbus library
  <https://dbus.freedesktop.org/doc/api/html/index.html>. libdbus is a
  very low-level, very general library, designed to be called from C
  code, that makes no assumptions about event loops at all.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-dbussy_1.2.1.bb            | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
new file mode 100644
index 0000000000..ac4b8c2aa6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "language bindings for libdbus, for Python 3.5 or later"
+HOMEPAGE = "https://github.com/ldo/dbussy"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+
+SRC_URI = "git://github.com/ldo/dbussy.git"
+
+SRCREV = "d0ec0223f3797e1612d835e71694a1083881149f"
+
+S = "${WORKDIR}/git"
+
+inherit distutils3
+
+RDEPENDS_${PN} += "\
+    python3-asyncio \
+    python3-core \
+    python3-ctypes \
+    python3-xml \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.20.1


