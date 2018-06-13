Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 37A11790A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:35:14 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id 31-v6so931583plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 23:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BhScGGFT47MY1hx/oOmwXXxuGHzYTFueY2BHp1oQWkg=;
	b=niHgpSRpOXqbNnZ7QI+RY2ohyqdLnTKV8oPnTND0c90V70gxiWCPo9RlpKcH00IF4f
	Chy5HNc6VeBY/ugQmGpHnsY19nJrIW+gs8ijGnmzsySIRN8oVKhcPL/re574dRASv9PC
	w4ypUu8T0jBOO1pAd5Ex9/mOtOj0vee6OTDJOX0oCppamucbBOuXDiS019Y44pm42zT0
	dcJqhn7mPjJE+obhEnePlIDQmxgvNJGlxv7sEQBW+sQ4e7dniQFfkiySfCByhgKFcnCI
	tMvV8hOIDp+Vy3JG9Zj59pSUZduPB92m3anPCyPpXe8lNXx3+yAehwmmH0CgJ2sCgzOs
	f3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BhScGGFT47MY1hx/oOmwXXxuGHzYTFueY2BHp1oQWkg=;
	b=MjcAqflhQqdltGH3RbxXGIjkD8lBljY+gEzOu6nC6w4Iob/Np8y1VVqg8OGQiFBZCO
	ocMhnSpvj3wFJEvcGXP5l6dR9KvvT77u2h4l+R+I+tALF1dq0IGEMvootrXp/+Wd7nVY
	AQjzY0EBDaDNN659R0EXeUSLsxGSwc8NwVAvjVE1P/hZRql144CrJo+pNNhcqArwrsbl
	CjLHHxtCQg78rjIfAB7o+JOUxsVL3v9S3y0LuWHFCQAAn48F2Os/u8dDmblEzjZEQpgg
	So0Sncrk9U7I66XtoJaS5yxImtLP6TXJaH4uGKSmP/DZIZw1XP4JsRevhKff4oGZXlDn
	pK1A==
X-Gm-Message-State: APt69E2B3EJPgMV8h2hdesGJEIpWEffrLTfAykcLICVRIrBT/P5upEJO
	1atxx9BoyfjRoOd18xSl3MdCsg==
X-Google-Smtp-Source: ADUXVKL8T9rihkJciQiwplogc1xSP4GvErNz1+Znu1WVIkgttdzvYrTn5Y/dTwljZbgB81WzjdE7jQ==
X-Received: by 2002:a17:902:563:: with SMTP id
	90-v6mr3739328plf.327.1528871715131; 
	Tue, 12 Jun 2018 23:35:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	b83-v6sm3525707pfe.159.2018.06.12.23.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 23:35:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 23:35:11 -0700
Message-Id: <20180613063512.1755-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613063512.1755-1-raj.khem@gmail.com>
References: <20180613063512.1755-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 4/5] cpprest: Fix build with gcc-8
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
X-List-Received-Date: Wed, 13 Jun 2018 06:35:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-disable-more-Werror-warnings.patch   | 48 +++++++++++++++++++
 .../recipes-support/cpprest/cpprest_2.10.2.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
new file mode 100644
index 0000000000..febfd5bc96
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
@@ -0,0 +1,48 @@
+From ee92f84a96a507b0a7a3c54929ce190ee28b4ecd Mon Sep 17 00:00:00 2001
+From: Alexander Moriarty <amoriarty@fetchrobotics.com>
+Date: Wed, 6 Jun 2018 10:38:43 -0700
+Subject: [PATCH] disable more -Werror warnings
+
+gcc-8: -Wno-format-truncation
+
+clang-6: -Wdelete-non-virtual-dtor
+clang-6: -Wunused-lambda-capture
+
+removed duplicated: -Wno-reorder
+
+This fixes #778
+
+Upstream-Status: Pending [https://github.com/Microsoft/cpprestsdk/pull/779]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Release/CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
+index 1267aff1..fb291ccd 100644
+--- a/Release/CMakeLists.txt
++++ b/Release/CMakeLists.txt
+@@ -166,12 +166,12 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-attributes -Wno-pointer-arith")
+   elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
+     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls)
+-    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unused-local-typedefs)
++    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
+     set(WARNINGS ${WARNINGS} ${LINUX_SUPPRESSIONS})
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration")
+   else()
+     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls)
+-    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unused-local-typedefs)
++    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
+     set(WARNINGS ${WARNINGS} ${OSX_SUPPRESSIONS})
+ 
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++ -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration")
+@@ -184,7 +184,7 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
+ elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
+   message("-- Setting gcc options")
+ 
+-  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code)
++  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code -Wno-format-truncation)
+   set(LD_FLAGS "${LD_FLAGS} -Wl,-z,defs")
+ 
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fno-strict-aliasing")
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
index 1dbe093bee..fea5d4b2eb 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://fix-cmake-install.patch \
            file://0001-Fix-a-build-problem-on-Clang.patch;patchdir=.. \
            file://0002-Define-virtual-destructor.patch;patchdir=.. \
+           file://0001-disable-more-Werror-warnings.patch;patchdir=.. \
            "
 
 # tag 2.10.2
-- 
2.17.1


