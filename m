Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99C68745F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 17:12:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u4-v6so15996409wrg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oeAZTSd5/EeGsG+mJ+B/K4AreNe/5tJzWhKKnKH5/C0=;
	b=KnQYDn052G4JqXZBGq3CReHRp+w+WI5SRHpMwAu6A+S1SCEb1x81HYgdSd3FxaxgC0
	4ljPdHpWCFpOuEXmwHedwAGRUngxB8SRAtA8db0uOn28dvwKjGQPE0e+7sAhWubDB+wf
	A1CWSlTXcdopD4h9GW1/bx1IY0nTYa+P4tqZ0mkbHj80+ClZSA4Ak8trv8UBC1KXp+17
	fd6sTvIjqGJ3/ycBifeOx7+KNDfT4Ci51I5oiPKNBpIdgEtkqU9gm8TcircZVCpapCWE
	EdwL9Ad+eyu3A8OFKxOSj0qBwIH7Y2DeTf1UGlewlTTKuTj6t8+QM3vnnXDimV6Qhf/+
	CRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oeAZTSd5/EeGsG+mJ+B/K4AreNe/5tJzWhKKnKH5/C0=;
	b=UgfBuQCEfkENT7QJm0JBp4I7jlmsQabkB6cN5MzyvUA4G9hDaXfOZF6DINBqfm1IpG
	4nrRbV/iHB9g/s1GYzsCDx/wdvRKQMEj+wDSR7G7JB6vt/AAjpLnl986xoCpD+Mn3ngn
	+gCorNrx4Is7G1wsyZf4a+o7uM96XfIzO+f5F9DcWRcVCGt0+o+BGCbCWqgG6VLfor4/
	n3J8NEKhL1/G1Vs5+XsEj48XndbzHdrWystM+pOPCb0+8qA6R5JWS6+1rPJXVBZuMfaB
	cSj3nWhnBTwv1Qqh0clZ8PA3Wkg4aiqkI/ANBbt5xSJCMWv4xW8sYo8dhtSMF8FoKA66
	mYFQ==
X-Gm-Message-State: ALQs6tBEOM2T0kBpy5V5iCiRGLJr5/quN58cYUI5Mit1TmNL8F2W0ZS7
	UC904eeNOGngr4PL1suj2nSTDJS+
X-Google-Smtp-Source: AIpwx48ZMc+/49Mg/GqbXipVnG9UfyzxQK2AXj8i9iKkOXM3hMh/Fz264FBC5UbfXDQo+IotxnrmEw==
X-Received: by 10.28.107.151 with SMTP id a23mr5100126wmi.14.1524157932854;
	Thu, 19 Apr 2018 10:12:12 -0700 (PDT)
Received: from localhost.localdomain ([37.180.10.76])
	by smtp.gmail.com with ESMTPSA id 11sm5456040wmr.16.2018.04.19.10.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 10:12:12 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 19:12:07 +0200
Message-Id: <20180419171207.5020-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180419171207.5020-1-costamagnagianfranco@yahoo.it>
References: <20180419171207.5020-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] cpprest: add new recipe based on Debian packaging
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
X-List-Received-Date: Thu, 19 Apr 2018 17:12:12 -0000

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
---
 .../cpprest/cpprest-2.10.2/fix-cmake-install.patch      | 17 +++++++++++++++++
 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb       | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
new file mode 100644
index 000000000..0feafef5b
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
@@ -0,0 +1,17 @@
+Description: install cmake files into /usr/lib/cmake/cpprestsdk
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Upstream-Status: https://github.com/Microsoft/cpprestsdk/pull/737
+Forwarded: https://github.com/Microsoft/cpprestsdk/pull/737
+Last-Update: 2018-04-19
+
+--- cpprest-2.10.2.orig/CMakeLists.txt
++++ cpprest-2.10.2/CMakeLists.txt
+@@ -18,7 +18,7 @@ enable_testing()
+ set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
+ set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
+ set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
+-set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
++set(CPPREST_EXPORT_DIR lib/cmake/cpprestsdk CACHE STRING "Directory to install CMake config files.")
+ set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
+ set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
+ 
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
new file mode 100644
index 000000000..2ba6fc66c
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
+SECTION = "libs/network"
+HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
+DEPENDS = "openssl websocketpp zlib boost"
+
+SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
+
+SRC_URI += "file://fix-cmake-install.patch"
+
+# tag 2.10.2
+SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
+
+S = "${WORKDIR}/git/Release"
+
+inherit cmake
-- 
2.14.1


