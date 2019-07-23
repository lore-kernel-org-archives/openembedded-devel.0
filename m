Return-Path: <stefan@herbrechtsmeier.net>
X-Greylist: delayed 332 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Jul 2019 19:31:01 UTC
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 36CE87ED59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 19:31:01 +0000 (UTC)
Received: from [192.168.178.29] (i59F77E0B.versanet.de [89.247.126.11])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 9092111A0652;
	Tue, 23 Jul 2019 21:25:29 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20190722211814.14237-1-raj.khem@gmail.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <00aec8c0-9378-c77d-67e2-0331c0dc29d1@herbrechtsmeier.net>
Date: Tue, 23 Jul 2019 21:25:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722211814.14237-1-raj.khem@gmail.com>
Cc: sangelovic <angelovic.s@gmail.com>
Subject: Re: [meta-oe][PATCH] Introduce recipes for sdbus-c++ library and its tools
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
X-List-Received-Date: Tue, 23 Jul 2019 19:31:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

Am 22.07.19 um 23:18 schrieb Khem Raj:
> From: sangelovic <angelovic.s@gmail.com>
> 
> ---
>   .../sdbus-c++/sdbus-c++-0.7.2/run-ptest       | 15 ++++++
>   .../sdbus-c++/sdbus-c++-tools-native_0.7.2.bb | 14 ++++++
>   .../recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb | 49 +++++++++++++++++++
>   3 files changed, 78 insertions(+)
>   create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest
>   create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb
>   create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb
> 
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest
> new file mode 100644
> index 0000000000..8fa9453e39
> --- /dev/null
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.7.2/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +set -e
> +set -o pipefail
> +
> +logger "** Starting sdbus-c++-unit-tests"
> +/opt/test/bin/sdbus-c++-unit-tests --gtest_output=xml:/data/ptest/sdbus-c++/sdbus-c++-unit-tests.xml |& \
> +sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
> +sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
> +awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}'
> +
> +logger "** Starting sdbus-c++-integration-tests"
> +/opt/test/bin/sdbus-c++-integration-tests --gtest_output=xml:/data/ptest/sdbus-c++/sdbus-c++-integration-tests.xml |& \
> +sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
> +sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
> +awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}'
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb
> new file mode 100644
> index 0000000000..e319404f49
> --- /dev/null
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.7.2.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "sdbus-c++ native tools"
> +DESCRIPTION = "Native interface code generator for development with sdbus-c++"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git-tools/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
Why you need the "${WORKDIR}/git-tools"?

> +
> +inherit cmake native
> +
> +DEPENDS += "expat"
> +
> +SRCREV = "750dab39270f338181db8d841cd4b1a9a50ae4d7"
> +SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;destsuffix=git-tools;branch=master;subpath=tools"
> +
> +S = "${WORKDIR}/git-tools"
Why don't you use "${WORKDIR}/git" and skip the destsuffix in SRC_URI?

> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb
> new file mode 100644
> index 0000000000..457f5d676a
> --- /dev/null
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.7.2.bb
> @@ -0,0 +1,49 @@
> +SUMMARY = "sdbus-c++"
> +DESCRIPTION = "High-level C++ D-Bus library designed to provide easy-to-use yet powerful API in modern C++"
> +
> +SECTION = "libs"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
> +
> +inherit cmake pkgconfig systemd ptest python3native
> +
> +TEST_BIN_DIR = "/opt/test/bin"
Is this a correct path for a test? Shouldn't we set TESTS_INSTALL_PATH 
to a correct path.

> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-external-libsystemd', 'with-builtin-libsystemd', d)} \
> +                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
> +PACKAGECONFIG[with-builtin-libsystemd] = "-DBUILD_LIBSYSTEMD=ON,-DBUILD_LIBSYSTEMD=OFF,meson-native ninja-native git-native gperf-native gettext-native util-linux libcap,libcap"
Should we really support an embedded systemd build? Furthermore this 
will build systemd with a hidden version and bypass the bitbake fetcher. 
Is there a real use case for this and isn't the correct solution to 
create a systemd library only recipe?

> +PACKAGECONFIG[with-external-libsystemd] = "-DBUILD_LIBSYSTEMD=OFF,-DBUILD_LIBSYSTEMD=ON,systemd,libsystemd"
> +PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${TEST_BIN_DIR},-DBUILD_TESTS=OFF"
> +
> +DEPENDS += "expat"
> +
> +SRCREV = "750dab39270f338181db8d841cd4b1a9a50ae4d7"
> +SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;destsuffix=sdbus-cpp-${PV};branch=master"
> +SRC_URI += "file://run-ptest"
> +
> +# Allow CMake to use git on the host machine
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
> +# Ninja is the default CMake generator in Yocto now, so let's set Unix Makefiles explicitly
> +OECMAKE_GENERATOR = "Unix Makefiles"
> +
> +EXTRA_OECMAKE = "-DBUILD_CODE_GEN=ON \
> +                 -DBUILD_DOC=ON \
> +                 -DBUILD_DOXYGEN_DOC=OFF"
> +
> +S = "${WORKDIR}/sdbus-cpp-${PV}"
Why don't you use "${WORKDIR}/git" and remove the destsuffix from the 
SRC_URI?

> +
> +PACKAGES += "${PN}-test"
> +ALLOW_EMPTY_${PN}-test = "1"
> +RDEPENDS_${PN}-test = "${PN}"
It is common to create an additional test package?

> +RDEPENDS_${PN}-ptest = "${PN}-test"
> +
> +# Don't take org.sdbuscpp.integrationtests.conf file into the base package
> +FILES_${PN} = "${libdir}/"
Why don't you use PACKAGE_BEFORE_PN or PACKAGES =+ ?

> +
> +FILES_${PN}-test += "${sysconfdir}/dbus-1/system.d/"
> +FILES_${PN}-test += "${TEST_BIN_DIR}/"
> +
> +FILES_${PN}-dev += "${bindir}/sdbus-c++-xml2cpp"
> +FILES_${PN}-dev += "${libdir}/cmake/sdbus-c++/sdbus-c++-config.cmake"
> +FILES_${PN}-dev += "${libdir}/cmake/sdbus-c++/sdbus-c++-config-version.cmake"
You don't need to add the two cmake paths any longer.

Regards
   Stefan

