Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 77E4F7E6FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 17:48:06 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id s22so16649492qkj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kVv9rm+FenGBxH4cyuQIAb0tNtVzlD8YiNVxGxGFDBQ=;
	b=PeKqPBcZ0b9QyZAYEFeuKeVW5JWa7ZEd6qupGNeI0fYG2APEaiGmHmItKwszzG9Nxj
	87z0ziiS4+G5P79S22kK4V2U7Vketu+//R1wsVuvGCoI6k3F7MzqnfGrcHkfzrR3SD/e
	MT4SIKez6+WgtdIYtYIkzL7InXevxlfvJ5cojjtun/QilPvRVN4wQKrdDONdgctzFiDA
	zhwmzaBHSviQ4qGLaoIVMBqUKLCLFTIK+CfsOP9zu3LxppuhcW7HKfNGRKrfoOv2JEPB
	J05+pjAR63UbcVjDgE0f5dvhABtFuXNcQK/nRvX8tUA1okOc2ntvPt62WvKiNFwdxr8t
	E5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kVv9rm+FenGBxH4cyuQIAb0tNtVzlD8YiNVxGxGFDBQ=;
	b=BPYS9vd/mbPFE8cfsje0RQfjmQKFEB1nPoTmbCyLngx4I9B8GLWG5kW5CadYWpapB4
	47YeDo/W14y4TO0LsV5qPIpSeYJdBfo7yNdS7BVzvPZysHRjvFDTJvm4LP3sPu10NRQO
	utEkUxX9xnra6x3REHMCm0LdWk1O2XJFotOSifiUgwaNnZfYKSs52bKqA7NxqmqFfDVl
	CJSWD9YsGBMxfrAhPCF0+anCJ5eEGSgYQCB0KWmEZe5u1dKWIut0aRN8qElXHb9y4ecD
	SRgCec6GjgrmF3X7SRWJqezRQ7xx9jhS8UEasDeXHHipZHb40KRI7nmyurcj5t9CxHC/
	m/bg==
X-Gm-Message-State: APjAAAVAXFYpfTcWAARjswnMKLO0CkOtk2rdctEeIcOBB77F4mld3Rs1
	SCS7Mfpzv3wx7A144/1QOPLJigQ38n5jxKveoqA=
X-Google-Smtp-Source: APXvYqxCtks0cRl61V+mirFWc0KGYv02azT08w2Szf7qnWMWxOfsfY2vD3tx1qoKxxBxdNd6jDh74L/lwod9L2zVAw8=
X-Received: by 2002:a37:4243:: with SMTP id p64mr19819147qka.9.1562694486999; 
	Tue, 09 Jul 2019 10:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190627182540.3212-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20190627182540.3212-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 10:47:41 -0700
Message-ID: <CAMKF1sqJ1MTD3qWft=92vHrL=4U9kpbtjenK=76BOuhRrEy3xA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: Re: [meta-oe][PATCH] iniparser: add initial recipe
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
X-List-Received-Date: Tue, 09 Jul 2019 17:48:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 27, 2019 at 11:26 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> ---
>  .../iniparser/Add-CMake-support.patch         | 63 +++++++++++++++++++
>  .../iniparser/iniparser_4.1.bb                | 17 +++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
>  create mode 100644 meta-oe/recipes-support/iniparser/iniparser_4.1.bb
>
> diff --git a/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch b/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
> new file mode 100644
> index 000000000..b666f00f7
> --- /dev/null
> +++ b/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
> @@ -0,0 +1,63 @@
> +Origin: Debian packaging
> +From: Klee Dienes <klee@mit.edu>
> +Date: Thu, 13 Feb 2014 07:03:26 -0500
> +Subject: Add CMake support.
> +
> +---
> + CMakeLists.txt | 44 ++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 44 insertions(+)
> + create mode 100644 CMakeLists.txt
> +
> +--- /dev/null
> ++++ b/CMakeLists.txt
> +@@ -0,0 +1,50 @@
> ++cmake_minimum_required (VERSION 2.8.8)
> ++
> ++project (iniparser)
> ++include (GNUInstallDirs)
> ++
> ++include_directories (src)
> ++
> ++set(INIPARSER_SRCS src/dictionary.c src/iniparser.c)
> ++set(INIPARSER_HDRS src/dictionary.h src/iniparser.h)
> ++
> ++add_library(iniparser-shared SHARED ${INIPARSER_SRCS} ${INIPARSER_HDRS})
> ++add_library(iniparser-static STATIC ${INIPARSER_SRCS} ${INIPARSER_HDRS})
> ++
> ++set_target_properties(iniparser-shared PROPERTIES SOVERSION 1)
> ++set_target_properties(iniparser-shared PROPERTIES OUTPUT_NAME iniparser)
> ++set_target_properties(iniparser-static PROPERTIES OUTPUT_NAME iniparser)
> ++
> ++install (TARGETS iniparser-shared
> ++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
> ++  DESTINATION ${CMAKE_INSTALL_LIBDIR}
> ++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++
> ++install (TARGETS iniparser-static
> ++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
> ++  DESTINATION ${CMAKE_INSTALL_LIBDIR}
> ++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++
> ++find_package(Doxygen)
> ++if (NOT DOXYGEN_FOUND)
> ++message(FATAL_ERROR "Doxygen is needed to build the documentation. Please install it correctly")
> ++endif()
> ++
> ++file (WRITE ${CMAKE_CURRENT_BINARY_DIR}/iniparser.dox
> ++  "@INCLUDE = ${CMAKE_CURRENT_SOURCE_DIR}/doc/iniparser.dox\n"
> ++  "OUTPUT_DIRECTORY = ${CMAKE_CURRENT_BINARY_DIR}\n"
> ++  )
> ++
> ++add_custom_target (doc ALL
> ++  COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/iniparser.dox
> ++  SOURCES doc/iniparser.dox)
> ++
> ++enable_testing()
> ++
> ++add_test(NAME testsuite
> ++  COMMAND make
> ++  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/test)
> ++
> ++install (FILES ${INIPARSER_HDRS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/iniparser)
> ++
> ++install (DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html DESTINATION ${CMAKE_INSTALL_DOCDIR})
> diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> new file mode 100644
> index 000000000..491298506
> --- /dev/null
> +++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "The iniParser library is a simple C library offering INI file parsing services (both reading and writing)."
> +SECTION = "libs"
> +HOMEPAGE = "https://github.com/ndevilla/iniparser"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e02baf71c76e0650e667d7da133379ac"

${S} seems redundant here.

> +
> +DEPENDS = "doxygen-native"
> +
> +SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \

branch=master is default so you can remove it.

> +          file://Add-CMake-support.patch"
> +
> +# tag 4.1
> +SRCREV= "0a38e85c9cde1e099ca3bf70083bd00f89c3e5b6"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

