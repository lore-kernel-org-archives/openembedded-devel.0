Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7486D77D76
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 06:33:50 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o21so11976435wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 23:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZxpeCaaAlbj6mI9vgeK+L+iJopbXW/pmWcStman7Czg=;
	b=LeNLFHQ2siqSiQvsqXBu4yAd2NUUrVtVyF+G41B05h90GLve4j4v1H4Tn5RSX/uv7a
	uzxQ3otW2grZlwAFg+UQ+rcSgsdo0N2WkoXgs4YOOAxYyweq1Cy6lifngTkFg5r7edTV
	tgcJvKZPll4juJIw5oy6BbR/TedQnB2P0akKWqR5WhBl4K8Kp12sm4C0Iqy+SmjqG35x
	hqP9grnF/HxOVKYILHIJupWjYCeLVhmfZoWg7atGeJOMWU3OXet+zKioVzWWixAcyOAt
	cqdK2WOf+j+2ZhluC2bydPpCtgI0Ik4pZG8Ec3H8bjmX7bgUDBi/gmEajYSn/+2Co1N6
	8ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZxpeCaaAlbj6mI9vgeK+L+iJopbXW/pmWcStman7Czg=;
	b=Mc8eM235KFEmnLnChVtTPKf9Krwq1HYfTf2zPHHHpeDwV7sjnkVGpskApRPRXkwANJ
	EPTcBiD9qjsYELk+RxOb5c3UBwn1046FVxHKKWXUpCIBO0uGDGQL2Dsk5qZgYBB594GF
	4YUJBbz6hkJkpdod0Txr6i7Qpsu0WpkuL0Egprx39n3j2COIUqtqBq/BP8H6J4niWvnO
	abTyOYNQ7j1riAHrAONXZW46Bk4o1863H1xE8Z2nOuykuG7JBT8KjX83utgBM2boEMjQ
	wOZitA8a8adbDg7xn/EGMPfCoHff8Sr0NP5eIsL/qYWwXxW2AywXyOwyARm5jlKbNrx/
	Zq5Q==
X-Gm-Message-State: AFeK/H1I/o2gGp5dRaLl+fqzQsLiY2uqK0Da9HUJQQudLCmVn5qYfieE
	zFXMXWPL907eEg==
X-Received: by 10.28.40.198 with SMTP id o189mr27669725wmo.108.1491546831891; 
	Thu, 06 Apr 2017 23:33:51 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	h68sm2466299wmd.19.2017.04.06.23.33.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 23:33:51 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Apr 2017 08:33:43 +0200
Message-Id: <1491546823-24769-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] librcf: install missing SF headers
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
X-List-Received-Date: Fri, 07 Apr 2017 06:33:51 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A flaw was introduced by commit 414426a3:
[ librcf: add new recipe ]

in which, the SF headers wasn't installed, this could cause build
errors in projects that compiling/linking to librcf while librcf
was built with LIBRCF_USE_SF_SERIALIZATION option enabled.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../librcf/librcf/0001-Add-CMake-build-files.patch                 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
index 34d0f62..cd0d143 100644
--- a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
+++ b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
@@ -10,8 +10,8 @@ Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
  CMakeLists.txt     | 147 +++++++++++++++++++++++++++++++++++++++++++++++++++++
  FindLibRcf.cmake   |  63 +++++++++++++++++++++++
  VERSION.cmake      |  21 ++++++++
- src/CMakeLists.txt |  24 +++++++++
- 4 files changed, 255 insertions(+)
+ src/CMakeLists.txt |  25 +++++++++
+ 4 files changed, 256 insertions(+)
  create mode 100644 CMakeLists.txt
  create mode 100644 FindLibRcf.cmake
  create mode 100644 VERSION.cmake
@@ -271,7 +271,7 @@ new file mode 100755
 index 0000000..c227901
 --- /dev/null
 +++ b/src/CMakeLists.txt
-@@ -0,0 +1,24 @@
+@@ -0,0 +1,25 @@
 +IF (NOT LIBRCF_BUILD_SHARED_LIBS)
 +  ADD_LIBRARY (rcf STATIC RCF/RCF.cpp)
 +ELSE (NOT LIBRCF_BUILD_SHARED_LIBS)
@@ -287,6 +287,7 @@ index 0000000..c227901
 +SET_TARGET_PROPERTIES (rcf PROPERTIES INSTALL_NAME_DIR ${CMAKE_INSTALL_LIBDIR})
 +
 +INSTALL (DIRECTORY "${CMAKE_SOURCE_DIR}/include/RCF" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++INSTALL (DIRECTORY "${CMAKE_SOURCE_DIR}/include/SF" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
 +INSTALL (TARGETS rcf LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
 +
 +IF (LIBRCF_BUILD_STATIC_LIBS AND LIBRCF_BUILD_SHARED_LIBS)
-- 
2.7.4


