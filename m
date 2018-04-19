Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3719E745F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 14:17:42 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id h3-v6so14535475wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 07:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ppd7wNaKaadSDy9UCg3VCcHq6cvywBNKywGQ/d3OhsU=;
	b=ZlVkFmJAD2BAPsSsqUzhMlYg3eFBXFtBykOHJW2wlPsFQOdJXlLUftJX4nOPbsk3EK
	ayQfHA3CMQRzRV4agux3TY6wJ/WISziwORhPiWUFl4hxlkuK7EDOTu21/kAeZ+QkcNCV
	9AZYRxtJaKXMhbCORIU/In09Wt6+j23SA8MdxxzggDD3d5dP10ZukBeculqjZ24MdhVF
	y1trLgMkhStttIyyxagYBQHopZihs+BjLh2Jp7+xDRIyqHJxyjSfxWaUHGyQFCWHZOlg
	aO8+KjIGj83l3gHWW+dQCzMmxKN/1w3EvlvOXEJoUyJioVW0UfNvM0IfXqWvk6wXKf1y
	5/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ppd7wNaKaadSDy9UCg3VCcHq6cvywBNKywGQ/d3OhsU=;
	b=FGI3axRCuWcvDRPTFtC/imrSECBKCcZLo07huIkeyX/qleI85VmAEow6jAkMIseQJS
	SsahnyzZ/7aNzUTRxI5q85gHABdjUNZkgwiYfuKmvwalh26GoQo3zAlvSVSgUU5JTBXI
	VeY0SMaNLOInrNL5311g8Ld4Kl/lGFl73SaOMVPPQ6Ezxyrs5BlcW97yAmEqCntqgTWp
	kmd8+V9SK6gcTnBMCzqr286zYfQ16RX3m6mVRSvlqkv9RWeONtR8Q+r5IPmKjvcjZoqw
	4KRfpnQiRgrWvqUeilpznJTTs40clXWe91Ib+8xjyDkwBcuQ9xwegf18nbTlzBjNjx4l
	OzkQ==
X-Gm-Message-State: ALQs6tCs95c2d1euQZ52H6NC8HqklmEbP6SWPKYJWfuJGb3mf5F+3BAH
	UagP6cs9/kPDol08C29lx2zd3cQH
X-Google-Smtp-Source: AIpwx48pGATZ/AoIIEg1Z31K3tTjmSp8aFjS1eTBDFflpmszJohzBSc96JA+DwqUSdQ/nKCbOGooHw==
X-Received: by 2002:adf:b722:: with SMTP id
	l34-v6mr5222524wre.85.1524147463074; 
	Thu, 19 Apr 2018 07:17:43 -0700 (PDT)
Received: from localhost.localdomain ([93.68.254.169])
	by smtp.gmail.com with ESMTPSA id
	b47-v6sm6506793wrg.13.2018.04.19.07.17.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 07:17:42 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 16:17:37 +0200
Message-Id: <20180419141737.21053-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
References: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Thu, 19 Apr 2018 14:17:43 -0000

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
---
 .../cpprest/cpprest-2.10.2/fix-cmake-install.patch    | 15 +++++++++++++++
 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb     | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
new file mode 100644
index 000000000..aeb8da052
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
@@ -0,0 +1,15 @@
+Description: install cmake files into /usr/lib/cmake/cpprestsdk
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
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
index 000000000..5f19d14ae
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -0,0 +1,19 @@
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
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
2.14.1


