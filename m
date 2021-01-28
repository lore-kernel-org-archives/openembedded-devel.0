Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.22810.1611829770897278153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43042 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l54YI-00080R-7T; Thu, 28 Jan 2021 12:29:29 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pybind11: Upgrade 2.5.0 -> 2.6.2
Date: Thu, 28 Jan 2021 12:29:02 +0200
Message-Id: <20210128102903.11760-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128102903.11760-1-leon.anavi@konsulko.com>
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 2.6.2:

- enum: add missing Enum.value property.
- Allow thread termination to be avoided during shutdown for CPython
  3.7+ via .disarm for gil_scoped_acquire/gil_scoped_release.
- Fix bug where the constructor of object subclasses would not
  throw on being passed a Python object of the wrong type.
- The type_caster for integers does not convert Python objects with
  __int__ anymore with noconvert or during the first round of trying
  overloads.
- When casting to a C++ integer, __index__ is always called and not
  considered as conversion, consistent with Python 3.8+.
- Fixed segfault in multithreaded environments when using
  scoped_ostream_redirect.
- Leave docstring unset when all docstring-related options are
  disabled, rather than set an empty string.
- The module key in builtins that pybind11 uses to store its
  internals changed from std::string to a python str type (more
  natural on Python 2, no change on Python 3).
- Fixed assertion error related to unhandled (later overwritten)
  exception in CPython 3.8 and 3.9 debug builds.
- Fix py::gil_scoped_acquire assert with CPython 3.9 debug build.
- Fix issue with a test failing on PyTest 6.2.
- Fix warning modifying constructor parameter 'flag' that shadows
  a field of 'set_flag' [-Wshadow-field-in-constructor-modified].
- Suppressed some deprecation warnings about old-style
  __init__/__setstate__ in the tests.
- Fix invalid access when calling a pybind11 __init__ on a
  non-pybind11 class instance.
- Fixed various minor memory leaks in pybind11's test suite.
- Resolved memory leak in cpp_function initialization when
  exceptions occurred.
- Added a Valgrind build, checking for leaks and memory-related
  UB, to CI.
- Intel compiler was not activating C++14 support due to a broken
  define.
- Support ICC and NVIDIA HPC SDK in C++17 mode.
- Support Intel OneAPI compiler (ICC 20.2) and add to CI.

License-Update: Update a link.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ck-pointer-size-when-cross-compiling.patch | 15 +++---
 .../0001-Do-not-strip-binaries.patch          | 51 +++++++++++--------
 ...d11_2.5.0.bb => python3-pybind11_2.6.2.bb} |  6 +--
 3 files changed, 41 insertions(+), 31 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.5.0.bb => python3-pybind11_2.6.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
index 6455c95e7..761422e07 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 3abfa65517959ad279481021fafefba28f955e76 Mon Sep 17 00:00:00 2001
+From 2e9318f7a70699eed239aee6301d1d0bbd2457ee Mon Sep 17 00:00:00 2001
 From: Philip Balister <philip@balister.org>
 Date: Fri, 10 Jul 2020 10:14:59 -0400
 Subject: [PATCH] Do not check pointer size when cross compiling.
@@ -8,23 +8,24 @@ It is reasonable to build for 32 machine on a 64 bit build machine. Prevents:
 |   Python config failure: Python is 64-bit, chosen compiler is 32-bit
 
 Signed-off-by: Philip Balister <philip@balister.org>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  tools/FindPythonLibsNew.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
-index d0c8fa2..8479e70 100644
+index 3605aebc..67f4d4a0 100644
 --- a/tools/FindPythonLibsNew.cmake
 +++ b/tools/FindPythonLibsNew.cmake
-@@ -123,7 +123,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
+@@ -156,7 +156,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
  
  # Make sure the Python has the same pointer-size as the chosen compiler
  # Skip if CMAKE_SIZEOF_VOID_P is not defined
 -if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
 +if((NOT CMAKE_CROSSCOMPILING) AND CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
-     if(PythonLibsNew_FIND_REQUIRED)
-         math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
-         math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
+   if(PythonLibsNew_FIND_REQUIRED)
+     math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
+     math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
 -- 
-2.25.4
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
index 07ab9a03b..699eb6155 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
@@ -1,4 +1,4 @@
-From 918f3ef01c7a67f3beb67307966698474f144581 Mon Sep 17 00:00:00 2001
+From debd676cd94f92a30b3be45f1245aa13d8c398c0 Mon Sep 17 00:00:00 2001
 From: Philip Balister <philip@balister.org>
 Date: Wed, 8 Jul 2020 09:41:43 -0400
 Subject: [PATCH] Do not strip binaries.
@@ -6,34 +6,43 @@ Subject: [PATCH] Do not strip binaries.
  * OpenEmbedded strips them after creating debug packages.
 
 Signed-off-by: Philip Balister <philip@balister.org>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- tools/pybind11Tools.cmake | 13 -------------
- 1 file changed, 13 deletions(-)
+ tools/pybind11NewTools.cmake | 5 -----
+ tools/pybind11Tools.cmake    | 4 ----
+ 2 files changed, 9 deletions(-)
 
+diff --git a/tools/pybind11NewTools.cmake b/tools/pybind11NewTools.cmake
+index 18da8be1..82ebf5e7 100644
+--- a/tools/pybind11NewTools.cmake
++++ b/tools/pybind11NewTools.cmake
+@@ -246,11 +246,6 @@ function(pybind11_add_module target_name)
+     endif()
+   endif()
+ 
+-  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
+-    # Strip unnecessary sections of the binary on Linux/macOS
+-    pybind11_strip(${target_name})
+-  endif()
+-
+   if(MSVC)
+     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
+   endif()
 diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
-index a3603ab..b4c8f63 100644
+index 32313539..a7d81012 100644
 --- a/tools/pybind11Tools.cmake
 +++ b/tools/pybind11Tools.cmake
-@@ -230,19 +230,6 @@ function(pybind11_add_module target_name)
- 
-   _pybind11_add_lto_flags(${target_name} ${ARG_THIN_LTO})
+@@ -201,10 +201,6 @@ function(pybind11_add_module target_name)
+     endif()
+   endif()
  
--  if (NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
--    # Strip unnecessary sections of the binary on Linux/Mac OS
--    if(CMAKE_STRIP)
--      if(APPLE)
--        add_custom_command(TARGET ${target_name} POST_BUILD
--                           COMMAND ${CMAKE_STRIP} -x $<TARGET_FILE:${target_name}>)
--      else()
--        add_custom_command(TARGET ${target_name} POST_BUILD
--                           COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${target_name}>)
--      endif()
--    endif()
+-  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
+-    pybind11_strip(${target_name})
 -  endif()
 -
    if(MSVC)
-     # /MP enables multithreaded builds (relevant when there are many files), /bigobj is
-     # needed for bigger binding projects due to the limit to 64k addressable sections
+     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
+   endif()
 -- 
-2.25.4
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
index 5d57590a1..bd16a6d0d 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Seamless operability between C++11 and Python"
 HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f"
 
 DEPENDS = "boost"
 
 SRC_URI = "git://github.com/pybind/pybind11.git \
            file://0001-Do-not-strip-binaries.patch \
            file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
-          "
-SRCREV = "3b1dbebabc801c9cf6f0953a4c20b904d444f879"
+"
+SRCREV = "8de7772cc72daca8e947b79b83fea46214931604"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

