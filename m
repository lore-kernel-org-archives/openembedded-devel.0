Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5597459C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 15:50:00 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id d1-v6so15352451wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 08:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CqB3MItkb8nZmZiEINmbblF5Vr9e+MVN5nd0D26xrGo=;
	b=DuqOvqfJbCVxHnV3AH0kNxCJ1qdYwWXYmzyC2Qe+lZPMhqU6y0EV4ZjQaC6GdEdV5g
	z88tfzE9ndzK55/rwUdf3dCXS6mu6JmQxTV2TeAGlCtrRCqueJ/a05nA84yPE1hfFJDV
	0u/4B5pCP5fkUqgIxd/Fa2MxYeLCSXrxXMEV/pxlKOvHVj8RXCvjsudf7bt2MveKFful
	2/s47h0krWSXeCsIdJyw5lDUG9k9aoLiOjrw2btUNI0Jl6oQvpoOiiCMkt9L9NecJ5Fj
	/NdRTE6ZzoRuQjMsRaJ+u5gS+CLBor4la+iR6QgZpOkk+51E7rGQZqgMFMS09oQZe3nE
	i1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CqB3MItkb8nZmZiEINmbblF5Vr9e+MVN5nd0D26xrGo=;
	b=Pj3aPYS2hjyBmSjU+9ZPh81yVZ48/IymPKePvQ2/ESaEKFaLuQU5dHI/UuM4kYi4p9
	oo8yuQuFsxnWCwl4WSkJgR98SK2UWcdXyP3Vp3/ZabeWZgnW1w6UpBKJbiFloGxpCXiy
	fsvz//JU5tnra9CLFTy7GdOjxa6g1+zg2DLLUIeIiH4nhODKCKTyltcE7SFrkXpr7Vs4
	vpaEGoiMx9strmVxCiuaj2kUyRpWAOmsOObf+6uSdFJoEylqHoI5FAGcpFHE2N8onLBm
	+gvBHU6a/LHjaKEGGb3UZYrQNbcAcSvdew/ezUGrNIjdQiVyMLwZntYd576aC0RuXDKE
	qTkA==
X-Gm-Message-State: ALQs6tA2Zk/zMifeh8553zTkmTyEBaT01zuGFcufKp3wLQ5KV+VGponu
	xTMr2Vft8pzAKVtQ3XodSjmbVX4u
X-Google-Smtp-Source: AIpwx48txlSkOxMk6QMfRHavWigZKB1YFhpqkZiEE5fZva3xvN1r61KEE8lqPHobCzvp3aww41EDiA==
X-Received: by 2002:adf:9267:: with SMTP id
	94-v6mr5274896wrj.206.1524153001254; 
	Thu, 19 Apr 2018 08:50:01 -0700 (PDT)
Received: from localhost.localdomain ([93.68.254.169])
	by smtp.gmail.com with ESMTPSA id w14sm3834210wmd.1.2018.04.19.08.50.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 08:50:00 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 17:49:55 +0200
Message-Id: <20180419154955.29803-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180419154955.29803-1-costamagnagianfranco@yahoo.it>
References: <20180419154955.29803-1-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Thu, 19 Apr 2018 15:50:01 -0000

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
---
 .../cpprest/cpprest-2.10.2/fix-cmake-install.patch      | 15 +++++++++++++++
 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb       | 17 +++++++++++++++++
 2 files changed, 32 insertions(+)
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


