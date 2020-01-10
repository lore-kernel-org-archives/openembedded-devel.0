Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 866107FD40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:50:14 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x6so792560pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 00:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qqg/YKo5fM1lMWJBAD8koygJq+NJ6XUGRjI4tPqIV4o=;
	b=vB66RJM/4l825FWuYUKDgP3t6qgZ0EMzCHcOw5ckslpvPIRzaWzQSAx+YKAJCbE3wl
	5cwWjoeW7cVYatamB2H75w+sC9tBwxpmORrKZe0S7tM+1NA4nP5Pt+1c0NdMrUpxOCk4
	QQ5sJEAly7/cbDLYyThHsHuJ5Uv3DLNIXYb9P3+VEZAeoo+ptEIlKQLSY5dRyBwb+wZp
	zjAVGCIkMaJBJNhk+3YN8S2sWrcBTKp5/GltTgbO+qsZt4pk+uHyq4vh5FkWz5WRlADw
	VP1u2iGQhn9XERqDD4blBYjRMe9P0T64PTujasHqDjvSm6tqtyZk3qhunBODorYZybkW
	ifkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qqg/YKo5fM1lMWJBAD8koygJq+NJ6XUGRjI4tPqIV4o=;
	b=cULbQSc1HHLK59sT60X8zROe2VjW+Ar8r03qAzKR7kgi8EwzWdb/JbVbbcuhQR238k
	8V5SChNL0KU/OY4sUKC+JxKJwzQIMqeVSh+MVqh5zSBoxp50nYfXuXFs/FwqfxBZnPRe
	8zEYMk9PapzG0lK6KUOXkp0LwyGEHAjYVh8sBSvLYDy0znjWSXOEiBolD7hRlkVUFN+1
	7lTiFZm65D1+JAnLV8ffv60MuGS79ZXocC35D3tgET8TyFk0yCtgSiahXTNR/KQ5KVWv
	tUeSewyzpVnsW33u1i4wxK3SHlmMcKv1vQtBfpzII4tvOoNGVfkWyEVxkvX5Z+Aw0q12
	YvVg==
X-Gm-Message-State: APjAAAWZ5JM3BobIeTQoMN7Z7aTIBecrLEdM4BY/lmP9Q/0v5au0JDUr
	1at3FuHq2bcb0r6nsCyV6IRN3N0wjB8=
X-Google-Smtp-Source: APXvYqyqcAUQZtCNU8wznFik333tBvjc7VCMCuQmIOCn8pFYjhB9L9HtpOYsE5nqP/qhNI7B3dFmbw==
X-Received: by 2002:a63:cd16:: with SMTP id i22mr3075119pgg.239.1578646214940; 
	Fri, 10 Jan 2020 00:50:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6f71])
	by smtp.gmail.com with ESMTPSA id
	b15sm1887580pft.58.2020.01.10.00.50.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 00:50:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2020 00:50:10 -0800
Message-Id: <20200110085010.2443416-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] cmpi-bindings: append PYTHON_ABI suffix to libpython soname
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
X-List-Received-Date: Fri, 10 Jan 2020 08:50:14 -0000
Content-Transfer-Encoding: 8bit

This makes it independent of python vesion 3.7 or 3.8 where with python
3.7 has 'm' as abi suffix but 3.8 wont

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
v2: Do not hardcode 'm' ABI suffix

 ...dd-PYTHON_ABI-suffix-to-the-python-library-name.patch | 9 ++-------
 .../cmpi-bindings/cmpi-bindings_1.0.1.bb                 | 4 +++-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
index b2a149b0f4..fa029da2b8 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
@@ -9,19 +9,14 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  swig/python/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
-index 128798b..391cef7 100644
 --- a/swig/python/CMakeLists.txt
 +++ b/swig/python/CMakeLists.txt
-@@ -49,7 +49,7 @@ ADD_DEFINITIONS(-DCMPI_PLATFORM_LINUX_GENERIC_GNU -DCMPI_VERSION=200)
+@@ -49,7 +49,7 @@ ADD_DEFINITIONS(-DCMPI_PLATFORM_LINUX_GE
  SET( NAME pyCmpiProvider )
  ADD_LIBRARY( ${NAME} SHARED ${SWIG_OUTPUT})
  #TARGET_LINK_LIBRARIES( ${NAME} ${PYTHON_LIBRARIES} )
 -TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION} )
-+TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}m )
++TARGET_LINK_LIBRARIES( ${NAME} python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}${PYTHON_ABI} )
  TARGET_LINK_LIBRARIES( ${NAME} pthread )
  TARGET_LINK_LIBRARIES( ${NAME} dl )
  TARGET_LINK_LIBRARIES( ${NAME} util )
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
index 251c5d0f5a..6c71d534be 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
@@ -22,7 +22,9 @@ S = "${WORKDIR}/git"
 inherit cmake python3native
 
 EXTRA_OECMAKE = "-DLIB='${baselib}' \
-                 -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
+                 -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
+                 -DPYTHON_ABI=${PYTHON_ABI} \
+                 "
 
 # With Ninja it fails with:
 # ninja: error: build.ninja:282: bad $-escape (literal $ must be written as $$)
-- 
2.24.1


