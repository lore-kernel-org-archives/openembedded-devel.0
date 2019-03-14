Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 06D2B6D3A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2019 14:22:44 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id k14so502239qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2019 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r1gE0nXV1j2pJHO7aZh7BTgkE5BmDfdGraLYS9pFfnw=;
	b=Y9gX+DdD82BDp5POwkGP8gDfQDZ8rtTDCurooqQ8jh9N3WmouMkkcDdV0kJCvKcZQo
	VJMl0+m1VrXhizWinFC5UrlD2JVnXyxoS1ct11cadOiTKFxmGKhp8keYJW/nnI0FmRgF
	ZXM4UWjxG1N0YGe9d6Mg+7PdPMudEskptr8VzdA/8jkZOAH/YKmwEaAITrq3xKyqNY0y
	vJ/vMxczurNDxi1LtEfcxrBDuXv1amlx5Un7a8RDTHhoNXO7bmJlcDmc5UtFy14QMVlN
	+nCC+ye2aijUuvkWEH2tnn85iBuoM/hkX+xMyr5i09ZEGqO+fa0O0s1hT//2DOI4bGn6
	8+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r1gE0nXV1j2pJHO7aZh7BTgkE5BmDfdGraLYS9pFfnw=;
	b=b4i3RwmhgdxKwfUoOIvJwLH2MshfV9rhp1jI7DwPe0bDqU7egWRs2u3ckPAOWrqxb8
	5zDvEQUCsalCuJi6ljtY+3PY57LfFPeKOI4YX7Bfwimkq+HyrMtg/AS4h+3/iW5JSvGw
	frmjaxnrAO2hPUssnZDlvzzS9lzegjVrThSuJ1j7jZeEoOitsr/e1RBki5v7k+fc8CfF
	OU6DjvWzUd0Uh3XjbuBb8Yk+SdyGU15TiL9zjVcnEye2eWTIYUQPQI3rc/3kS21aQ2Id
	Y6NuAPXiuXpXybF/nrQRx6cxrgPs3KI/Zj8kYHnXRgJf2xVT3z8Aq4bxkuYH5wP/HZWJ
	39tg==
X-Gm-Message-State: APjAAAUVv4WfUzZFaIciqtsgDg861WEDeihOEzA1WTRoH0egj6zewFtq
	KxSv2XwzDlDD+ersDpZLc0Hhzgtyh2SlnG92yDCpieTn
X-Google-Smtp-Source: APXvYqxvvjA8HGseUkvT25BnbWLs48/JIjvoxmE95oVkrDNhinSATDnwFdm5I6gqqEFqNa7UylrbaUB6jFIQV4MtP+k=
X-Received: by 2002:ac8:1a34:: with SMTP id v49mr5485619qtj.236.1552573365520; 
	Thu, 14 Mar 2019 07:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <1552404492-13477-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1552404492-13477-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 07:22:18 -0700
Message-ID: <CAMKF1sqGVa7HKO44U2Y=Ewyn8Dj5mioXjM0v+-RPs9oTgtB4aQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] librcf: bump to 3.0.251
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
X-List-Received-Date: Thu, 14 Mar 2019 14:22:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 12, 2019 at 8:28 AM <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Drop obsolete patches.
>

fails for musl
https://errors.yoctoproject.org/Errors/Details/232890/

> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  .../librcf/librcf/0001-Add-CMake-build-files.patch | 135 +++++----------------
>  .../librcf/0001-Check-for-__powerpc__-define.patch |  28 -----
>  ...lientStub.hpp-fix-a-clang-compiling-issue.patch |  35 ------
>  ...yptionFilter.cpp-replace-old-state-define.patch |  38 ++++++
>  .../librcf/librcf/aarch64-support.patch            |  13 --
>  .../librcf/librcf/mips-support.patch               |  19 ---
>  meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  53 --------
>  meta-oe/recipes-devtools/librcf/librcf_3.0.251.bb  |  40 ++++++
>  8 files changed, 108 insertions(+), 253 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
>  delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
>  create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-OpenSslEncryptionFilter.cpp-replace-old-state-define.patch
>  delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
>  delete mode 100644 meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
>  delete mode 100644 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
>  create mode 100644 meta-oe/recipes-devtools/librcf/librcf_3.0.251.bb
>
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
> index 560c3a6..b841f6b 100644
> --- a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
> +++ b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
> @@ -1,28 +1,28 @@
> -From 613297214d78ee10111e74e90e025166ebbcad9f Mon Sep 17 00:00:00 2001
> -From: Peter Liu <peter.x.liu@external.atlascopco.com>
> -Date: Sun, 5 Mar 2017 16:15:40 +0100
> +From b377a914a8771e89eb6eaad939f1088f45b68244 Mon Sep 17 00:00:00 2001
> +From: Ming Liu <liu.ming50@gmail.com>
> +Date: Tue, 12 Mar 2019 15:00:17 +0100
>  Subject: [PATCH] Add CMake build files
>
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [specific to oe setup]
>
> -Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>  ---
> - CMakeLists.txt     | 147 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> - FindLibRcf.cmake   |  63 +++++++++++++++++++++++
> - VERSION.cmake      |  21 ++++++++
> - src/CMakeLists.txt |  25 +++++++++
> - 4 files changed, 256 insertions(+)
> + CMakeLists.txt     | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + FindLibRcf.cmake   | 63 +++++++++++++++++++++++++++++++++++++++++++++++
> + VERSION.cmake      | 21 ++++++++++++++++
> + src/CMakeLists.txt | 25 +++++++++++++++++++
> + 4 files changed, 181 insertions(+)
>   create mode 100644 CMakeLists.txt
>   create mode 100644 FindLibRcf.cmake
>   create mode 100644 VERSION.cmake
> - create mode 100755 src/CMakeLists.txt
> + create mode 100644 src/CMakeLists.txt
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
>  new file mode 100644
> -index 0000000..f6e24be
> +index 0000000..16e1765
>  --- /dev/null
>  +++ b/CMakeLists.txt
> -@@ -0,0 +1,147 @@
> +@@ -0,0 +1,72 @@
>  +PROJECT (librcf)
>  +
>  +CMAKE_MINIMUM_REQUIRED (VERSION 2.6)
> @@ -31,22 +31,14 @@ index 0000000..f6e24be
>  +# OPTION                                                           #
>  +####################################################################
>  +OPTION (LIBRCF_USE_OPENSSL "Build with OpenSSL support?" OFF)
> -+OPTION (LIBRCF_OPENSSL_STATIC "Enable static linking to OpenSSL?" OFF)
>  +OPTION (LIBRCF_USE_ZLIB "Build with zlib support?" OFF)
> -+OPTION (LIBRCF_ZLIB_STATIC "Enable static linking to zlib?" OFF)
> ++OPTION (LIBRCF_USE_FILETRANSFER "Build with filetransfer support?" OFF)
>  +OPTION (LIBRCF_USE_SF_SERIALIZATION "Build with SF serialization support?" ON)
> -+OPTION (LIBRCF_USE_BOOST_SERIALIZATION "Build with Boost.Serialization support?" OFF)
> -+OPTION (LIBRCF_USE_BOOST_FILESYSTEM "Build with Boost.Filesystem support (required for file transfer support)?" OFF)
> -+OPTION (LIBRCF_USE_BOOST_ASIO "Build with Boost asio support?" ON)
>  +OPTION (LIBRCF_USE_PROTOBUF "Build with Protocol Buffer support?" OFF)
> -+OPTION (LIBRCF_USE_JSON "Build with JSON Spirit (required for JSON-RPC support)?" OFF)
>  +OPTION (LIBRCF_USE_IPV6 "Build with IPv6 support?" OFF)
>  +OPTION (LIBRCF_USE_CUSTOM_ALLOCATOR "Build with custom allocator support?" OFF)
> -+OPTION (LIBRCF_BUILD_DLL "Build a DLL exporting RCF?" OFF)
> -+OPTION (LIBRCF_AUTO_INIT_DEINIT "Enable automatic RCF initialization and deinitialization?" OFF)
>  +OPTION (LIBRCF_BUILD_STATIC_LIBS "Build the static library?" ON)
>  +OPTION (LIBRCF_BUILD_SHARED_LIBS "Build the shared library?" ON)
> -+OPTION (LIBRCF_BUILD_DEMOS "Build demo programs?" ON)
>  +
>  +####################################################################
>  +# CONFIGURATION                                                    #
> @@ -61,114 +53,47 @@ index 0000000..f6e24be
>  +    FIND_PACKAGE (OpenSSL REQUIRED)
>  +  ENDIF (NOT OPENSSL_FOUND)
>  +  INCLUDE_DIRECTORIES (${OPENSSL_INCLUDE_DIR})
> -+  ADD_DEFINITIONS (-DRCF_USE_OPENSSL)
> ++  ADD_DEFINITIONS (-DRCF_FEATURE_OPENSSL)
>  +ENDIF (LIBRCF_USE_OPENSSL)
>  +
> -+IF (LIBRCF_OPENSSL_STATIC)
> -+  LIST (APPEND LIBRCF_LIBRARIES ${OPENSSL_LIBRARIES})
> -+  ADD_DEFINITIONS (-DRCF_OPENSSL_STATIC)
> -+ENDIF (LIBRCF_OPENSSL_STATIC)
> -+
>  +IF (LIBRCF_USE_ZLIB)
>  +  IF (NOT ZLIB_FOUND)
>  +    FIND_PACKAGE (ZLIB REQUIRED)
>  +  ENDIF (NOT ZLIB_FOUND)
>  +  INCLUDE_DIRECTORIES (${ZLIB_INCLUDE_DIR})
> -+  ADD_DEFINITIONS (-DRCF_USE_ZLIB)
> ++  ADD_DEFINITIONS (-DRCF_FEATURE_ZLIB)
>  +ENDIF (LIBRCF_USE_ZLIB)
>  +
> -+IF (LIBRCF_ZLIB_STATIC)
> -+  LIST (APPEND LIBRCF_LIBRARIES ${ZLIB_LIBRARIES})
> -+  ADD_DEFINITIONS (-DRCF_ZLIB_STATIC)
> -+ENDIF (LIBRCF_ZLIB_STATIC)
> ++IF (LIBRCF_USE_FILETRANSFER)
> ++  ADD_DEFINITIONS (-DRCF_FEATURE_FILETRANSFER)
> ++ENDIF (LIBRCF_USE_FILETRANSFER)
>  +
>  +IF (LIBRCF_USE_SF_SERIALIZATION)
> -+  IF (NOT Boost_SYSTEM_FOUND)
> -+    FIND_PACKAGE (Boost REQUIRED COMPONENTS system)
> -+  ENDIF (NOT Boost_SYSTEM_FOUND)
> -+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
> -+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SYSTEM_LIBRARY})
> -+  ADD_DEFINITIONS (-DRCF_USE_SF_SERIALIZATION)
> ++  ADD_DEFINITIONS (-DRCF_FEATURE_SF)
>  +ENDIF (LIBRCF_USE_SF_SERIALIZATION)
>  +
> -+IF (LIBRCF_USE_BOOST_SERIALIZATION)
> -+  IF (NOT Boost_SERIALIZATION_FOUND)
> -+    FIND_PACKAGE (Boost REQUIRED COMPONENTS serialization)
> -+  ENDIF (NOT Boost_SERIALIZATION_FOUND)
> -+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
> -+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SERIALIZATION_LIBRARY})
> -+  ADD_DEFINITIONS (-DRCF_USE_BOOST_SERIALIZATION)
> -+ENDIF (LIBRCF_USE_BOOST_SERIALIZATION)
> -+
> -+IF (LIBRCF_USE_BOOST_FILESYSTEM)
> -+  IF (NOT Boost_FILESYSTEM_FOUND)
> -+    FIND_PACKAGE (Boost REQUIRED COMPONENTS filesystem system)
> -+  ENDIF (NOT Boost_FILESYSTEM_FOUND)
> -+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
> -+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_FILESYSTEM_LIBRARY})
> -+  LIST (APPEND LIBRCF_LIBRARIES ${Boost_SYSTEM_LIBRARY})
> -+  ADD_DEFINITIONS (-DRCF_USE_BOOST_FILESYSTEM)
> -+ENDIF (LIBRCF_USE_BOOST_FILESYSTEM)
> -+
> -+IF (LIBRCF_USE_BOOST_ASIO)
> -+  IF (NOT Boost_FOUND)
> -+    FIND_PACKAGE (Boost REQUIRED)
> -+  ENDIF (NOT Boost_FOUND)
> -+  INCLUDE_DIRECTORIES (${Boost_INCLUDE_DIR})
> -+  ADD_DEFINITIONS (-DRCF_USE_BOOST_ASIO)
> -+ENDIF (LIBRCF_USE_BOOST_ASIO)
> -+
>  +IF (LIBRCF_USE_PROTOBUF)
>  +  IF(NOT Protobuf_FOUND)
>  +    FIND_PACKAGE (Protobuf REQUIRED)
>  +  ENDIF (NOT Protobuf_FOUND)
>  +  INCLUDE_DIRECTORIES (${Protobuf_INCLUDE_DIR})
>  +  LIST (APPEND LIBRCF_LIBRARIES ${Protobuf_LIBRARIES})
> -+  ADD_DEFINITIONS (-DRCF_USE_PROTOBUF)
> ++  ADD_DEFINITIONS (-DRCF_FEATURE_PROTOBUF)
>  +ENDIF (LIBRCF_USE_PROTOBUF)
>  +
> -+IF (LIBRCF_USE_JSON)
> -+  IF (NOT LibJsonSpirit_FOUND)
> -+    FIND_PACKAGE (LibJsonSpirit REQUIRED)
> -+  ENDIF (NOT LibJsonSpirit_FOUND)
> -+  INCLUDE_DIRECTORIES (${LibJsonSpirit_INCLUDE_DIR})
> -+  LIST (APPEND LIBRCF_LIBRARIES ${LibJsonSpirit_LIBRARIES})
> -+  ADD_DEFINITIONS (-DRCF_USE_JSON)
> -+ENDIF (LIBRCF_USE_JSON)
> -+
>  +IF (LIBRCF_USE_IPV6)
> -+  ADD_DEFINITIONS (-DRCF_USE_IPV6)
> ++  ADD_DEFINITIONS (-DRCF_FEATURE_IPV6)
>  +ENDIF (LIBRCF_USE_IPV6)
>  +
>  +IF (LIBRCF_USE_CUSTOM_ALLOCATOR)
> -+  ADD_DEFINITIONS (-DRCF_USE_CUSTOM_ALLOCATOR)
> ++  ADD_DEFINITIONS (-DRCF_FEATURE_CUSTOM_ALLOCATOR)
>  +ENDIF (LIBRCF_USE_CUSTOM_ALLOCATOR)
>  +
> -+IF (LIBRCF_BUILD_DLL)
> -+  ADD_DEFINITIONS (-DRCF_BUILD_DLL)
> -+ENDIF (LIBRCF_BUILD_DLL)
> -+
> -+IF (LIBRCF_AUTO_INIT_DEINIT)
> -+  ADD_DEFINITIONS (-DRCF_AUTO_INIT_DEINIT)
> -+ENDIF (LIBRCF_AUTO_INIT_DEINIT)
> -+
>  +####################################################################
>  +# SUBDIRECTORY                                                     #
>  +####################################################################
>  +ADD_SUBDIRECTORY (src)
>  +
> -+IF (LIBRCF_BUILD_DEMOS)
> -+  # Server
> -+  ADD_EXECUTABLE (RcfServer demo/Server.cpp)
> -+  TARGET_LINK_LIBRARIES (RcfServer rcf ${LIBRCF_LIBRARIES})
> -+  INSTALL (TARGETS RcfServer DESTINATION ${CMAKE_INSTALL_BINDIR})
> -+
> -+  # Client
> -+  ADD_EXECUTABLE (RcfClient demo/Client.cpp)
> -+  TARGET_LINK_LIBRARIES (RcfClient rcf ${LIBRCF_LIBRARIES})
> -+  INSTALL (TARGETS RcfClient DESTINATION ${CMAKE_INSTALL_BINDIR})
> -+ENDIF (LIBRCF_BUILD_DEMOS)
> -+
>  +INSTALL (FILES ${CMAKE_SOURCE_DIR}/FindLibRcf.cmake DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake/Modules)
>  diff --git a/FindLibRcf.cmake b/FindLibRcf.cmake
>  new file mode 100644
> @@ -241,7 +166,7 @@ index 0000000..9d7d8cd
>  +ENDIF()
>  diff --git a/VERSION.cmake b/VERSION.cmake
>  new file mode 100644
> -index 0000000..8b4bcdc
> +index 0000000..5313a81
>  --- /dev/null
>  +++ b/VERSION.cmake
>  @@ -0,0 +1,21 @@
> @@ -263,12 +188,12 @@ index 0000000..8b4bcdc
>  +# - The package VERSION will be MAJOR.MINOR.PATCH.
>  +#
>  +
> -+SET (LIBRCF_SOVERSION_MAJOR "2")
> -+SET (LIBRCF_SOVERSION_MINOR "2")
> -+SET (LIBRCF_SOVERSION_PATCH "0")
> ++SET (LIBRCF_SOVERSION_MAJOR "3")
> ++SET (LIBRCF_SOVERSION_MINOR "0")
> ++SET (LIBRCF_SOVERSION_PATCH "251")
>  diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> -new file mode 100755
> -index 0000000..c227901
> +new file mode 100644
> +index 0000000..898e9a6
>  --- /dev/null
>  +++ b/src/CMakeLists.txt
>  @@ -0,0 +1,25 @@
> @@ -298,5 +223,5 @@ index 0000000..c227901
>  +  INSTALL (TARGETS rcf_static LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
>  +ENDIF (LIBRCF_BUILD_STATIC_LIBS AND LIBRCF_BUILD_SHARED_LIBS)
>  --
> -1.9.1
> +2.7.4
>
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
> deleted file mode 100644
> index d91accf..0000000
> --- a/meta-oe/recipes-devtools/librcf/librcf/0001-Check-for-__powerpc__-define.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From ac7316679e30f7013604b19aa0949a0744e91d2f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 1 Jul 2017 13:06:30 -0700
> -Subject: [PATCH] Check for __powerpc__ define
> -
> -Also check for gcc's internal define for ppc platform
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/RCF/ByteOrdering.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/RCF/ByteOrdering.cpp b/src/RCF/ByteOrdering.cpp
> -index 278ca80..9f9c446 100755
> ---- a/src/RCF/ByteOrdering.cpp
> -+++ b/src/RCF/ByteOrdering.cpp
> -@@ -36,7 +36,7 @@ namespace RCF {
> -
> -     const ByteOrder MachineByteOrder = BigEndian;
> -
> --#elif defined( __ppc__ )
> -+#elif defined( __ppc__ ) || defined( __powerpc__ )
> -
> -     const ByteOrder MachineByteOrder = BigEndian;
> -
> ---
> -2.13.2
> -
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
> deleted file mode 100644
> index e949dee..0000000
> --- a/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From d78851b6f87f2472f041102d7b3726ffc009bfad Mon Sep 17 00:00:00 2001
> -From: Ming Liu <peter.x.liu@external.atlascopco.com>
> -Date: Tue, 6 Jun 2017 05:54:20 +0200
> -Subject: [PATCH] ClientStub.hpp: fix a clang compiling issue
> -
> -A error was observed with clang compiler, as follows:
> -| src/RCF/RCF.cpp:49:
> -| src/RCF/ClientStub.cpp:28:
> -| include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of 'RCF::ClientStub'
> -
> -it can be fixed by declaring Future as a friend class of ClientStub.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ----
> - include/RCF/ClientStub.hpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/include/RCF/ClientStub.hpp b/include/RCF/ClientStub.hpp
> -index 9882cf4..8465625 100755
> ---- a/include/RCF/ClientStub.hpp
> -+++ b/include/RCF/ClientStub.hpp
> -@@ -372,6 +372,8 @@ namespace RCF {
> -
> -     private:
> -
> -+        template<typename U>
> -+        friend class Future;
> -         friend class FutureImplBase;
> -
> -         template<
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-OpenSslEncryptionFilter.cpp-replace-old-state-define.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-OpenSslEncryptionFilter.cpp-replace-old-state-define.patch
> new file mode 100644
> index 0000000..4437436
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/librcf/librcf/0001-OpenSslEncryptionFilter.cpp-replace-old-state-define.patch
> @@ -0,0 +1,38 @@
> +From 82a86be2f7f273f5eedc376453f814cae8a907c7 Mon Sep 17 00:00:00 2001
> +From: Ming Liu <liu.ming50@gmail.com>
> +Date: Tue, 12 Mar 2019 14:45:46 +0100
> +Subject: [PATCH] OpenSslEncryptionFilter.cpp: replace old state defines with
> + new ones
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> +---
> + src/RCF/OpenSslEncryptionFilter.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/RCF/OpenSslEncryptionFilter.cpp b/src/RCF/OpenSslEncryptionFilter.cpp
> +index 0b60f0d..5c69b5d 100755
> +--- a/src/RCF/OpenSslEncryptionFilter.cpp
> ++++ b/src/RCF/OpenSslEncryptionFilter.cpp
> +@@ -939,7 +939,7 @@ namespace RCF {
> +         RCF_ASSERT(mPreState == Reading || mPreState == Writing);
> +
> +         int sslState = SSL_get_state(mSsl.get());
> +-        if (!mHandshakeOk && sslState == SSL_ST_OK)
> ++        if (!mHandshakeOk && sslState == TLS_ST_OK)
> +         {
> +             mHandshakeOk = true;
> +
> +@@ -980,7 +980,7 @@ namespace RCF {
> +                 }
> +             }
> +         }
> +-        else if (mHandshakeOk && sslState != SSL_ST_OK)
> ++        else if (mHandshakeOk && sslState != TLS_ST_OK)
> +         {
> +             mHandshakeOk = false;
> +         }
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch b/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
> deleted file mode 100644
> index e08efb9..0000000
> --- a/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
> -===================================================================
> ---- RCF-2.2.0.0.orig/src/RCF/ByteOrdering.cpp
> -+++ RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
> -@@ -60,7 +60,7 @@ namespace RCF {
> -
> -     const ByteOrder MachineByteOrder = LittleEndian;
> -
> --#elif defined(__arm__)
> -+#elif defined(__arm__) || defined(__aarch64__)
> -
> -     const ByteOrder MachineByteOrder = LittleEndian;
> -
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch b/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
> deleted file mode 100644
> index 4a327f7..0000000
> --- a/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Index: RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
> -===================================================================
> ---- RCF-2.2.0.0.orig/src/RCF/ByteOrdering.cpp
> -+++ RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
> -@@ -64,6 +64,14 @@ namespace RCF {
> -
> -     const ByteOrder MachineByteOrder = LittleEndian;
> -
> -+#elif defined(__mipsel__) || defined(__mips64el__)
> -+
> -+    const ByteOrder MachineByteOrder = LittleEndian;
> -+
> -+#elif defined( __mips__ ) || defined(__mips64__)
> -+
> -+    const ByteOrder MachineByteOrder = BigEndian;
> -+
> - #elif defined(__bfin__)
> -
> -     const ByteOrder MachineByteOrder = LittleEndian;
> diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> deleted file mode 100644
> index dcd47a4..0000000
> --- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -SUMMARY = "RCF (Remote Call Framework) is a cross-platform interprocess communication framework for C++"
> -DESCRIPTION = "Unlike other communication frameworks, RCF doesn't use a separate \
> -IDL (Interface Definition Language). RCF interfaces are defined directly in C++, \
> -and serialization for user-defined data types likewise is implemented in C++. \
> -Instead of a separate IDL compiler tool, RCF uses the C++ compiler to generate \
> -client and server stubs."
> -HOMEPAGE = "http://www.deltavsoft.com/"
> -SECTION = "libs"
> -PRIORITY = "optional"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://license.txt;md5=7586a312b9e978f9d6fac9a5780d1f84"
> -
> -SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
> -           file://0001-Add-CMake-build-files.patch \
> -           file://aarch64-support.patch \
> -           file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
> -           file://mips-support.patch \
> -           file://0001-Check-for-__powerpc__-define.patch \
> -           "
> -
> -SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
> -SRC_URI[sha256sum] = "bbfcc88de502c39604878c395f516b03fff4eac63eb4f7f44c07d433839712dd"
> -
> -S = "${WORKDIR}/RCF-${PV}"
> -
> -inherit cmake dos2unix
> -
> -PACKAGECONFIG ?= "zlib openssl sf-serialization boost-filesystem boost-asio protobuf json dll static shared demos"
> -PACKAGECONFIG[zlib] = "-DLIBRCF_USE_ZLIB=ON,-DLIBRCF_USE_ZLIB=OFF,zlib,zlib"
> -PACKAGECONFIG[zlib-static] = "-DLIBRCF_USE_ZLIB=ON -DLIBRCF_ZLIB_STATIC=ON,-DLIBRCF_ZLIB_STATIC=OFF,zlib,"
> -PACKAGECONFIG[openssl] = "-DLIBRCF_USE_OPENSSL=ON,-DLIBRCF_USE_OPENSSL=OFF,openssl,libssl libcrypto"
> -PACKAGECONFIG[openssl-static] = "-DLIBRCF_USE_OPENSSL=ON -DLIBRCF_OPENSSL_STATIC=ON,-DLIBRCF_OPENSSL_STATIC=OFF,openssl,"
> -PACKAGECONFIG[sf-serialization] = "-DLIBRCF_USE_SF_SERIALIZATION=ON,-DLIBRCF_USE_SF_SERIALIZATION=OFF,boost,"
> -PACKAGECONFIG[boost-serialization] = "-DLIBRCF_USE_BOOST_SERIALIZATION=ON,-DLIBRCF_USE_BOOST_SERIALIZATION=OFF,boost,"
> -PACKAGECONFIG[boost-filesystem] = "-DLIBRCF_USE_BOOST_FILESYSTEM=ON,-DLIBRCF_USE_BOOST_FILESYSTEM=OFF,boost,"
> -PACKAGECONFIG[boost-asio] = "-DLIBRCF_USE_BOOST_ASIO=ON,-DLIBRCF_USE_BOOST_ASIO=OFF,boost,"
> -PACKAGECONFIG[protobuf] = "-DLIBRCF_USE_PROTOBUF=ON,-DLIBRCF_USE_PROTOBUF=OFF,protobuf,protobuf"
> -PACKAGECONFIG[json] = "-DLIBRCF_USE_JSON=ON,-DLIBRCF_USE_JSON=OFF,json-spirit,json-spirit"
> -PACKAGECONFIG[ipv6] = "-DLIBRCF_USE_IPV6=ON,-DLIBRCF_USE_IPV6=OFF,"
> -PACKAGECONFIG[custom-allocator] = "-DLIBRCF_USE_CUSTOM_ALLOCATOR=ON,-DLIBRCF_USE_CUSTOM_ALLOCATOR=OFF,"
> -PACKAGECONFIG[dll] = "-DLIBRCF_BUILD_DLL=ON,-DLIBRCF_BUILD_DLL=OFF,"
> -PACKAGECONFIG[auto-init-deinit] = "-DLIBRCF_AUTO_INIT_DEINIT=ON,-DLIBRCF_AUTO_INIT_DEINIT=OFF,"
> -PACKAGECONFIG[static] = "-DLIBRCF_BUILD_STATIC_LIBS=ON,-DLIBRCF_BUILD_STATIC_LIBS=OFF,"
> -PACKAGECONFIG[shared] = "-DLIBRCF_BUILD_SHARED_LIBS=ON,-DLIBRCF_BUILD_SHARED_LIBS=OFF,"
> -PACKAGECONFIG[demos] = "-DLIBRCF_BUILD_DEMOS=ON,-DLIBRCF_BUILD_DEMOS=OFF,"
> -
> -PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'demos', '${PN}-demos', '', d)}"
> -
> -FILES_${PN}-demos = "${bindir}/*"
> -
> -BBCLASSEXTEND = "nativesdk"
> -
> -PNBLACKLIST[librcf] = " error: invalid use of incomplete type 'RCF::AsioIoService {aka class boost::asio::io_service}; among others?"
> diff --git a/meta-oe/recipes-devtools/librcf/librcf_3.0.251.bb b/meta-oe/recipes-devtools/librcf/librcf_3.0.251.bb
> new file mode 100644
> index 0000000..d34e8e2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/librcf/librcf_3.0.251.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "RCF (Remote Call Framework) is a cross-platform interprocess communication framework for C++"
> +DESCRIPTION = "Unlike other communication frameworks, RCF doesn't use a separate \
> +IDL (Interface Definition Language). RCF interfaces are defined directly in C++, \
> +and serialization for user-defined data types likewise is implemented in C++. \
> +Instead of a separate IDL compiler tool, RCF uses the C++ compiler to generate \
> +client and server stubs."
> +HOMEPAGE = "http://www.deltavsoft.com/"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57c8b244761965bfff3b2a8f3eeefde3"
> +
> +SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
> +           file://0001-Add-CMake-build-files.patch \
> +           file://0001-OpenSslEncryptionFilter.cpp-replace-old-state-define.patch \
> +           "
> +
> +SRC_URI[md5sum] = "9032c5ae9e26253d7cbc4ac77d0095a9"
> +SRC_URI[sha256sum] = "419420f0fb9879b27477e818f0fe52597a4ea16cf9a33b7c284699e35d013e0e"
> +
> +S = "${WORKDIR}/RCF-${PV}"
> +
> +DEPENDS = "util-linux"
> +
> +inherit cmake dos2unix
> +
> +PACKAGECONFIG ?= "zlib openssl sf-serialization protobuf static shared ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> +PACKAGECONFIG[zlib] = "-DLIBRCF_USE_ZLIB=ON,-DLIBRCF_USE_ZLIB=OFF,zlib,zlib"
> +PACKAGECONFIG[openssl] = "-DLIBRCF_USE_OPENSSL=ON,-DLIBRCF_USE_OPENSSL=OFF,openssl,libssl libcrypto"
> +PACKAGECONFIG[filetransfer] = "-DLIBRCF_USE_FILETRANSFER=ON,-DLIBRCF_USE_FILETRANSFER=OFF,"
> +PACKAGECONFIG[sf-serialization] = "-DLIBRCF_USE_SF_SERIALIZATION=ON,-DLIBRCF_USE_SF_SERIALIZATION=OFF,"
> +PACKAGECONFIG[protobuf] = "-DLIBRCF_USE_PROTOBUF=ON,-DLIBRCF_USE_PROTOBUF=OFF,protobuf,protobuf"
> +PACKAGECONFIG[ipv6] = "-DLIBRCF_USE_IPV6=ON,-DLIBRCF_USE_IPV6=OFF,"
> +PACKAGECONFIG[custom-allocator] = "-DLIBRCF_USE_CUSTOM_ALLOCATOR=ON,-DLIBRCF_USE_CUSTOM_ALLOCATOR=OFF,"
> +PACKAGECONFIG[static] = "-DLIBRCF_BUILD_STATIC_LIBS=ON,-DLIBRCF_BUILD_STATIC_LIBS=OFF,"
> +PACKAGECONFIG[shared] = "-DLIBRCF_BUILD_SHARED_LIBS=ON,-DLIBRCF_BUILD_SHARED_LIBS=OFF,"
> +
> +FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibRcf.cmake"
> +
> +BBCLASSEXTEND = "nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

