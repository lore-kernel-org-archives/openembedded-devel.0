Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0C6C7EC54
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 18:38:52 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q22so23528681iog.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=3K7k2PtEekpQmakcbNLXglc/q73t5p2QMs2dz2eNumI=;
	b=ei2pzhRhg9NlwR1gsiIdlwbE+nv/KCvmHCnItIsOL1BJtzesK4UUbg+5iTQkR05dUX
	rcl8TiTf8tJQXcIIYyZS9BVQBNavsRjpDHui43zUk6GFUVPSL69GCF+AEa+ElSOvcijP
	MZMDdLFfy064PSRvzDAiHuH7luCSlszkOam+gZRKsVM+h4lu+tblg3N8BgqsjAnfTecf
	6LP6+XXMds1woLZhszOS1RI0GAHIoc7cHMCYHocTqspfxd2OrXx4wOGdm0rWBW5UaiOU
	lgPNqgrnYROSvpZtfp42Mc5OJT6fjmBRJgSf2GTGtEJJ+dT+wNaZyKzBvOfwglJqWy5A
	A8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3K7k2PtEekpQmakcbNLXglc/q73t5p2QMs2dz2eNumI=;
	b=HVl6bFzGjPPioKal5b5sbLGGVelClIZokPJfetohOHwvyVx2VdiOyiKt8XbzpiGoL+
	UGuTsXgVrCQWdBtebyLLxBYUTghz4YZoNZx7dpQK/4n1qqChUEY8igaz3ZXVGj/zbFDO
	WVl0EzfC3C4v+5IkyH5/lojXl1pz3v90CH0d8NGAwmbZPZ/MdqSOe9pkjGw1X+tQbXlV
	LY1tuLtxXLjv+65KMRqfk6iEXvaVvGSh+Gj3FmSek0xchvRRPcDwFg3mc4w/97objIlt
	276d/G7qLyD1zCHgFs94pqqNhFggOOzHmtF3r9LXg7JMpcW8UZPliZJdAm9CcXRfNuOG
	zZog==
X-Gm-Message-State: APjAAAUdPZiGGOMHr4z8VXg9YI1SH25q0APdc4sYt3XEZ6bj/NRUl2gn
	1k2eULIm4q6yZOkLMvLD+ac=
X-Google-Smtp-Source: APXvYqy00iONI4Sgpc6IGMpugTwl8uGqWA4NZFsJadBYbJrVZCWMD6NMx9d/jCicUDFLMM/LBa65Kw==
X-Received: by 2002:a5d:9942:: with SMTP id v2mr2009872ios.177.1562697533690; 
	Tue, 09 Jul 2019 11:38:53 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	m10sm27306905ioj.75.2019.07.09.11.38.52
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jul 2019 11:38:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190627182540.3212-1-costamagnagianfranco@yahoo.it>
Message-ID: <311ddf45-0054-4b91-1cff-4b18deaba221@gmail.com>
Date: Tue, 9 Jul 2019 13:38:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190627182540.3212-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
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
X-List-Received-Date: Tue, 09 Jul 2019 18:38:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/27/19 1:25 PM, Gianfranco Costamagna wrote:
> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> ---
>   .../iniparser/Add-CMake-support.patch         | 63 +++++++++++++++++++
>   .../iniparser/iniparser_4.1.bb                | 17 +++++
>   2 files changed, 80 insertions(+)
>   create mode 100644 meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
>   create mode 100644 meta-oe/recipes-support/iniparser/iniparser_4.1.bb
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
> +
> +DEPENDS = "doxygen-native"
> +
> +SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
> +	   file://Add-CMake-support.patch"

iniparser has a Makefile; why is the cmake patch necessary?

> +
> +# tag 4.1
> +SRCREV= "0a38e85c9cde1e099ca3bf70083bd00f89c3e5b6"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake

