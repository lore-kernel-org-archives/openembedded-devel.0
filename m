Return-Path: <denis@denix.org>
X-Greylist: delayed 435 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Feb 2019 00:06:38 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 0E74D7C409
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 00:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9FBE40AD5;
	Mon, 11 Feb 2019 23:59:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4vIpbWxH1PCH; Mon, 11 Feb 2019 23:59:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B655840A3D;
	Mon, 11 Feb 2019 23:59:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E5CAC16AD1E; Mon, 11 Feb 2019 18:59:22 -0500 (EST)
Date: Mon, 11 Feb 2019 18:59:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-ID: <20190211235922.GI19169@denix.org>
References: <20181211204754.25956-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
In-Reply-To: <20181211204754.25956-1-bradleyb@fuzziesquirrel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gtest: update to 1.8.1
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
X-List-Received-Date: Tue, 12 Feb 2019 00:06:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 11, 2018 at 03:47:54PM -0500, Brad Bishop wrote:
> Update to 1.8.1, which has proper pkg-config support (so
> Add-pkg-config-support.patch can be dropped).
> 
> Also the canonical gtest seems to have moved out of the google github
> organization into something called abseil.  Update HOMEPAGE and SRC_URI
> to match.

This is incorrect ^^^
Opening https://github.com/abseil/googletest redirects back to 
https://github.com/google/googletest

-- 
Denys


> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  .../gtest/gtest/Add-pkg-config-support.patch  | 106 ------------------
>  .../gtest/{gtest_1.8.0.bb => gtest_1.8.1.bb}  |   7 +-
>  2 files changed, 3 insertions(+), 110 deletions(-)
>  delete mode 100644 meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
>  rename meta-oe/recipes-test/gtest/{gtest_1.8.0.bb => gtest_1.8.1.bb} (69%)
> 
> diff --git a/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch b/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
> deleted file mode 100644
> index 4c8977b49..000000000
> --- a/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From ec9256bb704e94f41407fc8ace6a580491430196 Mon Sep 17 00:00:00 2001
> -From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Thu, 15 Dec 2016 04:35:41 -0800
> -Subject: [PATCH] Add pkg-config support
> -
> -Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> -Signed-off-by: Rodrigo Caimi <caimi@datacom.ind.br>
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ----
> - googlemock/CMakeLists.txt | 9 +++++++--
> - googlemock/gmock.pc.in    | 9 +++++++++
> - googletest/CMakeLists.txt | 9 +++++++--
> - googletest/gtest.pc.in    | 9 +++++++++
> - 4 files changed, 32 insertions(+), 4 deletions(-)
> - create mode 100644 googlemock/gmock.pc.in
> - create mode 100644 googletest/gtest.pc.in
> -
> -diff --git a/googlemock/CMakeLists.txt b/googlemock/CMakeLists.txt
> -index beb259a..f17e2d7 100644
> ---- a/googlemock/CMakeLists.txt
> -+++ b/googlemock/CMakeLists.txt
> -@@ -27,6 +27,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
> -   pre_project_set_up_hermetic_build()
> - endif()
> - 
> -+# pkg-config support
> -+configure_file("gmock.pc.in" "gmock.pc" @ONLY)
> -+
> - ########################################################################
> - #
> - # Project-wide settings
> -@@ -104,9 +107,11 @@ endif()
> - #
> - # Install rules
> - install(TARGETS gmock gmock_main
> --  DESTINATION lib)
> -+  DESTINATION ${CMAKE_INSTALL_LIBDIR})
> - install(DIRECTORY ${gmock_SOURCE_DIR}/include/gmock
> --  DESTINATION include)
> -+  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
> -+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gmock.pc"
> -+  DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/")
> - 
> - ########################################################################
> - #
> -diff --git a/googlemock/gmock.pc.in b/googlemock/gmock.pc.in
> -new file mode 100644
> -index 0000000..04bc0b4
> ---- /dev/null
> -+++ b/googlemock/gmock.pc.in
> -@@ -0,0 +1,9 @@
> -+Name: libgmock
> -+Version: 1.8.0
> -+Description: Google's framework for writing C++ tests on a variety of platforms
> -+
> -+prefix=@CMAKE_INSTALL_PREFIX@
> -+includedir=@CMAKE_INSTALL_INCLUDEDIR@
> -+libdir=@CMAKE_INSTALL_LIBDIR@
> -+Cflags:-I${includedir}/gmock
> -+Libs: -L${libdir} -lgmock -lgmock_main
> -diff --git a/googletest/CMakeLists.txt b/googletest/CMakeLists.txt
> -index 621d0f0..58aaf54 100644
> ---- a/googletest/CMakeLists.txt
> -+++ b/googletest/CMakeLists.txt
> -@@ -34,6 +34,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
> -   pre_project_set_up_hermetic_build()
> - endif()
> - 
> -+# pkg-config support
> -+configure_file("gtest.pc.in" "gtest.pc" @ONLY)
> -+
> - ########################################################################
> - #
> - # Project-wide settings
> -@@ -103,9 +106,11 @@ endif()
> - #
> - # Install rules
> - install(TARGETS gtest gtest_main
> --  DESTINATION lib)
> -+  DESTINATION ${CMAKE_INSTALL_LIBDIR})
> - install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest
> --  DESTINATION include)
> -+  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
> -+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gtest.pc"
> -+  DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/")
> - 
> - ########################################################################
> - #
> -diff --git a/googletest/gtest.pc.in b/googletest/gtest.pc.in
> -new file mode 100644
> -index 0000000..fb95152
> ---- /dev/null
> -+++ b/googletest/gtest.pc.in
> -@@ -0,0 +1,9 @@
> -+Name: libgtest
> -+Version: 1.8.0
> -+Description: Google's framework for writing C++ tests on a variety of platforms
> -+
> -+prefix=@CMAKE_INSTALL_PREFIX@
> -+includedir=@CMAKE_INSTALL_INCLUDEDIR@
> -+libdir=@CMAKE_INSTALL_LIBDIR@
> -+Cflags:-I${includedir}/gtest
> -+Libs: -L${libdir} -lgtest -lgtest_main
> --- 
> -1.9.1
> -
> diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
> similarity index 69%
> rename from meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> rename to meta-oe/recipes-test/gtest/gtest_1.8.1.bb
> index 48cf4e04b..23862c930 100644
> --- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> +++ b/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Google's framework for writing C++ tests"
> -HOMEPAGE = "https://github.com/google/googletest"
> +HOMEPAGE = "https://github.com/abseil/googletest"
>  SECTION = "libs"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
> @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd51
>  PROVIDES += "gmock"
>  
>  S = "${WORKDIR}/git"
> -SRCREV = "ec44c6c1675c25b9827aacd08c02433cccde7780"
> +SRCREV = "2fe3bd994b3189899d93f1d5a881e725e046fdc2"
>  SRC_URI = "\
> -    git://github.com/google/googletest.git;protocol=https; \
> -    file://Add-pkg-config-support.patch \
> +    git://github.com/abseil/googletest.git;protocol=https; \
>  "
>  
>  inherit cmake
> -- 
> 2.19.2
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

