Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D984C0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 00:06:49 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.2216.1690416402927173212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 17:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 434E81B60D
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 02:06:41 +0200 (CEST)
Received: from [192.168.178.58] ([79.219.239.8]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qOoWc-0fMU6q0; Thu, 27 Jul 2023 02:06:38 +0200
Date: Thu, 27 Jul 2023 02:06:33 +0200
From: f_l_k@t-online.de
Subject: Re: [oe] [RFC][meta-gnome][PATCHv2] webkitgtk3: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <XMHFYR.S77TRQLZYHI82@t-online.de>
In-Reply-To: <1775908A8513B928.21492@lists.openembedded.org>
References: <1775908A8513B928.21492@lists.openembedded.org>
X-Mailer: geary/44.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mwYuW/BIINhIPsfz8J/f"
X-TOI-EXPURGATEID: 150726::1690416398-4F7FD980-43B8E5E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a99169d-9aee-46f9-ac36-92fa3b15252b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 00:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104040

--=-mwYuW/BIINhIPsfz8J/f
Content-Type: text/plain; charset=us-ascii; format=flowed

accidentally included a partial update of geary. I have corrected that 
and will send the geary update later.

On Thu, Jul 27 2023 at 02:02:18 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - Change the meta-gnome recipes to use the gtk3 variant of webkitgtk
> 
> Most Gnome recipes require webkitgtk built with gtk+3. oe-core is in 
> the
> process of updating webkitgtk to be built with gtk4. It will be 
> necessary
> to add a recipe that provides the gtk+3 variant, or we wont be able
> to use e.g. geary with gmail addresses or provide google integration 
> for
> gnome-calendar or nautilus/files.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-connectivity/geary/geary_43.0.bb  |   2 +-
>  .../evolution-data-server.bb                  |   2 +-
>  .../gnome-online-accounts_3.48.0.bb           |   2 +-
>  meta-gnome/recipes-gnome/yelp/yelp_42.2.bb    |   2 +-
>  .../recipes-gnome/zenity/zenity_3.44.0.bb     |   2 +-
>  ...spection.cmake-prefix-variables-obta.patch |  29 ++
>  ...tCore-CMakeLists.txt-ensure-reproduc.patch |  28 ++
>  ...44e17d258106617b0e6d783d073b188a2548.patch | 310 
> ++++++++++++++++++
>  ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch |  41 +++
>  .../check-GST_GL_HAVE_PLATFORM_GLX.patch      |  33 ++
>  .../webkitgtk3/reproducibility.patch          |  22 ++
>  .../webkitgtk/webkitgtk3_2.40.2.bb            | 169 ++++++++++
>  .../wxwidgets/wxwidgets_3.2.1.bb              |   2 +-
>  meta-oe/recipes-graphics/surf/surf_2.1.bb     |   2 +-
>  14 files changed, 639 insertions(+), 7 deletions(-)
>  create mode 100644 
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
>  create mode 100644 
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
>  create mode 100644 
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
>  create mode 100644 
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
>  create mode 100644 
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
>  create mode 100644 
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
>  create mode 100644 
> meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> 
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb 
> b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> index 6085d94fdc..bab4f909e0 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> @@ -26,7 +26,7 @@ DEPENDS = " \
>      libstemmer \
>      libxml2 \
>      sqlite3 \
> -    webkitgtk \
> +    webkitgtk3 \
>  "
> 
>  RDEPENDS:${PN} = "gnome-keyring"
> diff --git 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> index 43717a84cd..edbe30ff87 100644
> --- 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> +++ 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> @@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target = " 
> -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scan
>  PACKAGECONFIG ?= "oauth"
> 
>  PACKAGECONFIG[canberra] = 
> "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
> -PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK=ON 
> -DENABLE_OAUTH2_WEBKITGTK4=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF 
> -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk json-glib"
> +PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK=ON 
> -DENABLE_OAUTH2_WEBKITGTK4=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF 
> -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk3 json-glib"
>  PACKAGECONFIG[goa]    = 
> "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
>  PACKAGECONFIG[kerberos]    = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
>  # BROKEN: due missing pkg-config in openldap eds' cmake finds 
> host-libs when
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb 
> b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> index ca78fa0119..cd14b48508 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> @@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] = 
> "418bb9fcffdbd72a98205ad365137617fc1e3551a54de74f6a
>  PACKAGECONFIG ?= "goabackend kerberos owncloud lastfm google 
> windows_live"
> 
>  # goabackend requires webkitgtk to be built with gtk+3 and gcr3
> -PACKAGECONFIG[goabackend] = 
> "-Dgoabackend=true,-Dgoabackend=false,gtk+3 gtk+3-native json-glib 
> libxml2 libsoup rest libsecret webkitgtk"
> +PACKAGECONFIG[goabackend] = 
> "-Dgoabackend=true,-Dgoabackend=false,gtk+3 gtk+3-native json-glib 
> libxml2 libsoup rest libsecret webkitgtk3"
>  PACKAGECONFIG[kerberos] = "-Dkerberos=true, -Dkerberos=false,krb5 
> gcr3"
>  PACKAGECONFIG[exchange] = "-Dexchange=true, -Dexchange=false"
>  PACKAGECONFIG[google] = "-Dgoogle=true, -Dgoogle=false"
> diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb 
> b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> index 200ed0f709..51d51ee0ab 100644
> --- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> @@ -19,7 +19,7 @@ DEPENDS += " \
>      libxslt \
>      sqlite3 \
>      libhandy \
> -    webkitgtk \
> +    webkitgtk3 \
>      yelp-xsl \
>  "
>  PACKAGECONFIG_SOUP ?= "soup3"
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb 
> b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> index 8ea24ca49b..3548cc5bbe 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> @@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] = 
> "c15582301ed90b9d42ce521dbccf99a989f22f12041bdd5279
>  SRC_URI += 
> "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch" 
> <file://0001-harcode-shebang-to-avoid-pointing-to-build-system-s-.patch/>
> 
>  PACKAGECONFIG ?= "webkitgtk"
> -PACKAGECONFIG[webkitgtk] = 
> "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
> +PACKAGECONFIG[webkitgtk] = 
> "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk3"
> 
>  PACKAGES =+ "${PN}-gdialog"
>  FILES:${PN}-gdialog = "${bindir}/gdialog"
> diff --git 
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> new file mode 100644
> index 0000000000..8ae39f14e1
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> @@ -0,0 +1,29 @@
> +From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 
> 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com 
> <mailto:alex.kanavin@gmail.com>>
> +Date: Tue, 27 Oct 2015 16:02:19 +0200
> +Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables 
> obtained
> + from pkg-config with PKG_CONFIG_SYSROOT_DIR
> +
> +See discussion at <https://bugs.webkit.org/show_bug.cgi?id=232933> 
> for
> +reasons why this is not approproiate for upstream submission.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com 
> <mailto:alex.kanavin@gmail.com>>
> +---
> + Source/cmake/FindGI.cmake | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
> +index af039cbb..b3e810cd 100644
> +--- a/Source/cmake/FindGI.cmake
> ++++ b/Source/cmake/FindGI.cmake
> +@@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
> +     endif ()
> + endif ()
> +
> ++set(_GI_SCANNER_EXE 
> "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_SCANNER_EXE}")
> ++set(_GI_COMPILER_EXE 
> "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_COMPILER_EXE}")
> ++
> + find_program(GI_SCANNER_EXE NAMES ${_GI_SCANNER_EXE} g-ir-scanner)
> + find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_EXE} 
> g-ir-compiler)
> +
> diff --git 
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
> new file mode 100644
> index 0000000000..bbe265059d
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
> @@ -0,0 +1,28 @@
> +From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 
> 2001
> +From: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> +Date: Mon, 26 Jun 2023 14:30:02 +0200
> +Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure 
> reproducibility
> + of __TIMESTAMP__
> +
> +__TIMESTAMP__ refers to mtime of the file that contains it, which is 
> unstable
> +and breaks binary reproducibility when the file is generated at 
> build time. To ensure
> +this does not happen, mtime should be set from the original file.
> +
> +Upstream-Status: Submitted 
> [<https://github.com/WebKit/WebKit/pull/15293>]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> +---
> + Source/JavaScriptCore/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt 
> b/Source/JavaScriptCore/CMakeLists.txt
> +index 43dc22ff..c2e3b1cd 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -159,6 +159,7 @@ add_custom_command(
> +     OUTPUT 
> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> +     MAIN_DEPENDENCY 
> ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in
> +     COMMAND ${PERL_EXECUTABLE} -pe 
> s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ 
> ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in > 
> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> ++    COMMAND touch -r 
> ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in 
> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> +             VERBATIM
> + )
> +
> diff --git 
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> new file mode 100644
> index 0000000000..34e0ff9af3
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> @@ -0,0 +1,310 @@
> +From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 
> 2001
> +From: Adrian Perez de Castro <aperez@igalia.com 
> <mailto:aperez@igalia.com>>
> +Date: Thu, 2 Jun 2022 11:19:06 +0300
> +Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path 
> seems
> + unused <https://bugs.webkit.org/show_bug.cgi?id=241182>
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +Move the NEON fast path for the SVG lighting filter effects into
> +FELightingSoftwareApplier, and arrange to actually use them by
> +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> +
> +Some changes were needed to adapt platformApplyNeon() to the current
> +state of filters after r286140. This was not detected because the 
> code
> +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which 
> does
> +not get used much these days: CPU(ARM_THUMB2) is more common. It 
> should
> +be possible to use the NEON fast paths also in Thumb mode, but that 
> is
> +left for a follow-up fix.
> +
> +* 
> Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> +(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> +(WebCore::FELighting::getPowerCoefficients): Deleted.
> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> +(WebCore::FELighting::platformApplyNeon): Deleted.
> +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> +* Source/WebCore/platform/graphics/filters/FELighting.h:
> +* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> +* 
> Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
> +
> +Upstream-Status: Submitted 
> [<https://github.com/WebKit/WebKit/pull/1233>]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> +---
> + .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> + .../graphics/cpu/arm/filters/FELightingNEON.h | 52 
> +++++++++----------
> + .../graphics/filters/DistantLightSource.h     |  4 ++
> + .../platform/graphics/filters/FELighting.h    |  7 ---
> + .../graphics/filters/PointLightSource.h       |  4 ++
> + .../graphics/filters/SpotLightSource.h        |  4 ++
> + .../software/FELightingSoftwareApplier.h      | 16 ++++++
> + 7 files changed, 56 insertions(+), 35 deletions(-)
> +
> +diff --git 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> +index f6ff8c20..42a97ffc 100644
> +--- 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> ++++ 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> +     return s_FELightingConstantsForNeon;
> + }
> +
> +-void 
> FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* 
> parameters)
> ++void 
> FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* 
> parameters)
> + {
> +     neonDrawLighting(parameters);
> + }
> +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> +     "b .lightStrengthCalculated" NL
> + ); // NOLINT
> +
> +-int FELighting::getPowerCoefficients(float exponent)
> ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> + {
> +     // Calling a powf function from the assembly code would require 
> to save
> +     // and reload a lot of NEON registers. Since the base is in 
> range [0..1]
> +diff --git 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +index b17c603d..e4629cda 100644
> +--- 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> ++++ 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +@@ -24,14 +24,15 @@
> +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
> DAMAGE.
> +  */
> +
> +-#ifndef FELightingNEON_h
> +-#define FELightingNEON_h
> ++#pragma once
> +
> + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && 
> COMPILER(GCC_COMPATIBLE)
> +
> +-#include "FELighting.h"
> ++#include "FELightingSoftwareApplier.h"
> ++#include "ImageBuffer.h"
> + #include "PointLightSource.h"
> + #include "SpotLightSource.h"
> ++#include <wtf/ObjectIdentifier.h>
> + #include <wtf/ParallelJobs.h>
> +
> + namespace WebCore {
> +@@ -93,14 +94,14 @@ extern "C" {
> + void neonDrawLighting(FELightingPaintingDataForNeon*);
> + }
> +
> +-inline void FELighting::platformApplyNeon(const LightingData& data, 
> const LightSource::PaintingData& paintingData)
> ++inline void FELightingSoftwareApplier::applyPlatformNeon(const 
> FELightingSoftwareApplier::LightingData& data, const 
> LightSource::PaintingData& paintingData)
> + {
> +-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> +-    FELightingPaintingDataForNeon neonData = {
> ++    WebCore::FELightingFloatArgumentsForNeon alignas(16) 
> floatArguments;
> ++    WebCore::FELightingPaintingDataForNeon neonData = {
> +         data.pixels->data(),
> +         1,
> +-        data.widthDecreasedByOne - 1,
> +-        data.heightDecreasedByOne - 1,
> ++        data.width - 2,
> ++        data.height - 2,
> +         0,
> +         0,
> +         0,
> +@@ -111,23 +112,23 @@ inline void 
> FELighting::platformApplyNeon(const LightingData& data, const LightS
> +     // Set light source arguments.
> +     floatArguments.constOne = 1;
> +
> +-    auto color = 
> m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> ++    auto color = 
> data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> +
> +     floatArguments.colorRed = color.red;
> +     floatArguments.colorGreen = color.green;
> +     floatArguments.colorBlue = color.blue;
> +     floatArguments.padding4 = 0;
> +
> +-    if (m_lightSource->type() == LS_POINT) {
> ++    if (data.lightSource->type() == LS_POINT) {
> +         neonData.flags |= FLAG_POINT_LIGHT;
> +-        PointLightSource& pointLightSource = 
> static_cast<PointLightSource&>(m_lightSource.get());
> ++        const auto& pointLightSource = *static_cast<const 
> PointLightSource*>(data.lightSource);
> +         floatArguments.lightX = pointLightSource.position().x();
> +         floatArguments.lightY = pointLightSource.position().y();
> +         floatArguments.lightZ = pointLightSource.position().z();
> +         floatArguments.padding2 = 0;
> +-    } else if (m_lightSource->type() == LS_SPOT) {
> ++    } else if (data.lightSource->type() == LS_SPOT) {
> +         neonData.flags |= FLAG_SPOT_LIGHT;
> +-        SpotLightSource& spotLightSource = 
> static_cast<SpotLightSource&>(m_lightSource.get());
> ++        const auto& spotLightSource = *static_cast<const 
> SpotLightSource*>(data.lightSource);
> +         floatArguments.lightX = spotLightSource.position().x();
> +         floatArguments.lightY = spotLightSource.position().y();
> +         floatArguments.lightZ = spotLightSource.position().z();
> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const 
> LightingData& data, const LightS
> +         if (spotLightSource.specularExponent() == 1)
> +             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> +     } else {
> +-        ASSERT(m_lightSource->type() == LS_DISTANT);
> ++        ASSERT(data.lightSource->type() == LS_DISTANT);
> +         floatArguments.lightX = 
> paintingData.initialLightingData.lightVector.x();
> +         floatArguments.lightY = 
> paintingData.initialLightingData.lightVector.y();
> +         floatArguments.lightZ = 
> paintingData.initialLightingData.lightVector.z();
> +@@ -155,38 +156,39 @@ inline void 
> FELighting::platformApplyNeon(const LightingData& data, const LightS
> +     // Set lighting arguments.
> +     floatArguments.surfaceScale = data.surfaceScale;
> +     floatArguments.minusSurfaceScaleDividedByFour = 
> -data.surfaceScale / 4;
> +-    if (m_lightingType == FELighting::DiffuseLighting)
> +-        floatArguments.diffuseConstant = m_diffuseConstant;
> ++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
> ++        floatArguments.diffuseConstant = data.diffuseConstant;
> +     else {
> +         neonData.flags |= FLAG_SPECULAR_LIGHT;
> +-        floatArguments.diffuseConstant = m_specularConstant;
> +-        neonData.specularExponent = 
> getPowerCoefficients(m_specularExponent);
> +-        if (m_specularExponent == 1)
> ++        floatArguments.diffuseConstant = data.specularConstant;
> ++        neonData.specularExponent = 
> getPowerCoefficients(data.specularExponent);
> ++        if (data.specularExponent == 1)
> +             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
> +     }
> +     if (floatArguments.diffuseConstant == 1)
> +         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
> +
> +-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * 
> (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> ++    static constexpr int minimalRectDimension = 100 * 100; // 
> Empirical data limit for parallel jobs
> ++    int optimalThreadNumber = ((data.width - 2) * (data.height - 
> 2)) / minimalRectDimension;
> +     if (optimalThreadNumber > 1) {
> +         // Initialize parallel jobs
> +-        ParallelJobs<FELightingPaintingDataForNeon> 
> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, 
> optimalThreadNumber);
> ++        ParallelJobs<FELightingPaintingDataForNeon> 
> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, 
> optimalThreadNumber);
> +
> +         // Fill the parameter array
> +         int job = parallelJobs.numberOfJobs();
> +         if (job > 1) {
> +             int yStart = 1;
> +-            int yStep = (data.heightDecreasedByOne - 1) / job;
> ++            int yStep = (data.height - 2) / job;
> +             for (--job; job >= 0; --job) {
> +                 FELightingPaintingDataForNeon& params = 
> parallelJobs.parameter(job);
> +                 params = neonData;
> +                 params.yStart = yStart;
> +-                params.pixels += (yStart - 1) * 
> (data.widthDecreasedByOne + 1) * 4;
> ++                params.pixels += (yStart - 1) * data.width * 4;
> +                 if (job > 0) {
> +                     params.absoluteHeight = yStep;
> +                     yStart += yStep;
> +                 } else
> +-                    params.absoluteHeight = 
> data.heightDecreasedByOne - yStart;
> ++                    params.absoluteHeight = (data.height - 1) - 
> yStart;
> +             }
> +             parallelJobs.execute();
> +             return;
> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const 
> LightingData& data, const LightS
> + } // namespace WebCore
> +
> + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> +-
> +-#endif // FELightingNEON_h
> +diff --git 
> a/Source/WebCore/platform/graphics/filters/DistantLightSource.h 
> b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +index 70c6512f..b032c82e 100644
> +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +@@ -26,6 +26,10 @@
> + #include <wtf/ArgumentCoder.h>
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class DistantLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h 
> b/Source/WebCore/platform/graphics/filters/FELighting.h
> +index 53beb596..e78a9354 100644
> +--- a/Source/WebCore/platform/graphics/filters/FELighting.h
> ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> +@@ -35,8 +35,6 @@
> +
> + namespace WebCore {
> +
> +-struct FELightingPaintingDataForNeon;
> +-
> + class FELighting : public FilterEffect {
> + public:
> +     const Color& lightingColor() const { return m_lightingColor; }
> +@@ -64,11 +62,6 @@ protected:
> +
> +     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() 
> const override;
> +
> +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && 
> COMPILER(GCC_COMPATIBLE)
> +-    static int getPowerCoefficients(float exponent);
> +-    inline void platformApplyNeon(const LightingData&, const 
> LightSource::PaintingData&);
> +-#endif
> +-
> +     Color m_lightingColor;
> +     float m_surfaceScale;
> +     float m_diffuseConstant;
> +diff --git 
> a/Source/WebCore/platform/graphics/filters/PointLightSource.h 
> b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +index 3a5723f0..675d63f5 100644
> +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class PointLightSource : public LightSource {
> +diff --git 
> a/Source/WebCore/platform/graphics/filters/SpotLightSource.h 
> b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +index 684626f7..dea58389 100644
> +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class SpotLightSource : public LightSource {
> +diff --git 
> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h 
> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> +index c974d921..e2896660 100644
> +--- 
> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> ++++ 
> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> +@@ -36,6 +36,7 @@
> + namespace WebCore {
> +
> + class FELighting;
> ++struct FELightingPaintingDataForNeon;
> +
> + class FELightingSoftwareApplier final : public 
> FilterEffectConcreteApplier<FELighting> {
> +     WTF_MAKE_FAST_ALLOCATED;
> +@@ -132,8 +133,23 @@ private:
> +
> +     static void applyPlatformGenericPaint(const LightingData&, 
> const LightSource::PaintingData&, int startY, int endY);
> +     static void applyPlatformGenericWorker(ApplyParameters*);
> ++
> ++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && 
> COMPILER(GCC_COMPATIBLE)
> ++    static int getPowerCoefficients(float exponent);
> ++    static void 
> platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> ++    inline static void applyPlatformNeon(const LightingData&, const 
> LightSource::PaintingData&);
> ++
> ++    inline static void applyPlatformGeneric(const LightingData& 
> data, const LightSource::PaintingData& paintingData)
> ++    {
> ++        applyPlatformNeon(data, paintingData);
> ++    }
> ++#else
> +     static void applyPlatformGeneric(const LightingData&, const 
> LightSource::PaintingData&);
> ++#endif
> ++
> +     static void applyPlatform(const LightingData&);
> + };
> +
> + } // namespace WebCore
> ++
> ++#include "FELightingNEON.h"
> diff --git 
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
> new file mode 100644
> index 0000000000..79da855ff4
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
> @@ -0,0 +1,41 @@
> +From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 
> 2001
> +From: Diego Pino Garcia <dpino@igalia.com <mailto:dpino@igalia.com>>
> +Date: Mon, 22 May 2023 19:58:50 -0700
> +Subject: [PATCH] [GLIB] Fix build error after 264196@main
> + <https://bugs.webkit.org/show_bug.cgi?id=256917>
> +
> +Reviewed by Michael Catanzaro.
> +
> +Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
> +enabled.
> +
> +* Source/WTF/wtf/glib/Sandbox.cpp:
> +(WTF::isInsideUnsupportedContainer):
> +
> +Canonical link: <https://commits.webkit.org/264395@main>
> +Upstream-Status: Backport 
> [<https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9b13795c9b0f7894bf4>]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> +---
> + Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/WTF/wtf/glib/Sandbox.cpp 
> b/Source/WTF/wtf/glib/Sandbox.cpp
> +index 7d84e830ab33e..9b07bb8cb5a9b 100644
> +--- a/Source/WTF/wtf/glib/Sandbox.cpp
> ++++ b/Source/WTF/wtf/glib/Sandbox.cpp
> +@@ -36,6 +36,7 @@ bool isInsideFlatpak()
> +     return returnValue;
> + }
> +
> ++#if ENABLE(BUBBLEWRAP_SANDBOX)
> + bool isInsideUnsupportedContainer()
> + {
> +     static bool inContainer = g_file_test("/run/.containerenv", 
> G_FILE_TEST_EXISTS);
> +@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
> +
> +     return inContainer && !supportedContainer;
> + }
> ++#endif
> +
> + bool isInsideSnap()
> + {
> diff --git 
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
> new file mode 100644
> index 0000000000..ae99810ced
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
> @@ -0,0 +1,33 @@
> +Add additional check on GST_GL_HAVE_PLATFORM_GLX before using 
> gst_gl_display_x11_new_with_display
> +
> +This ensures that there is a compile time check for glx support in 
> gstreamer as
> +runtime check is not enough because 
> gst_gl_display_x11_new_with_display() API comes from
> +gst/gl/x11/gstgldisplay_x11.h which is only included when 
> GST_GL_HAVE_PLATFORM_GLX is defined
> +therefore make this check consistent to fix build with some 
> platforms which use pvr gl drivers
> +where this problem appear at compile time.
> +
> +
> +/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r0/webkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp:68:31: 
> error: use of undeclared identifier 
> 'gst_gl_display_x11_new_with_display'; did you mean 
> 'gst_gl_display_egl_new_with_egl_display'?
> +   68 |         return 
> GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
> +      |                               
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +      |                               
> gst_gl_display_egl_new_with_egl_display
> +
> +This issue is 2.40 specific since GLX support is removed [1] from 
> trunk upstream, therefore
> +this patch wont be needed when upgrading to 2.42+
> +
> +[1] 
> <https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf>
> +
> +Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> +
> +--- 
> a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-02-20 
> 01:22:18.917743700 -0800
> ++++ 
> b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-07-08 
> 08:45:09.739177065 -0700
> +@@ -63,7 +63,7 @@
> +     if (glPlatform == GST_GL_PLATFORM_EGL)
> +         return 
> GST_GL_DISPLAY(gst_gl_display_egl_new_with_egl_display(sharedDisplay.eglDisplay()));
> + #endif
> +-#if USE(GLX)
> ++#if USE(GLX) && GST_GL_HAVE_PLATFORM_GLX
> +     if (is<PlatformDisplayX11>(sharedDisplay) && glPlatform == 
> GST_GL_PLATFORM_GLX)
> +         return 
> GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
> + #endif
> diff --git 
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> new file mode 100644
> index 0000000000..e866a1a193
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> @@ -0,0 +1,22 @@
> +Injection a year based on the current date isn't reproducible. Hack 
> this
> +to a specific year for now for reproducibilty and to avoid 
> autobuilder failures.
> +
> +The correct fix would be to use SOURCE_DATE_EPOCH from the 
> environment and
> +then this could be submitted upstream, sadly my ruby isn't up to 
> that.
> +
> +Upstream-Status: Pending [could be reworked]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>>
> +
> +Index: 
> webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +===================================================================
> +--- 
> webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
> ++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +@@ -25,7 +25,7 @@ require 'date'
> + require 'digest'
> +
> + $LICENSE = <<-EOF
> +-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
> ++Copyright (C) 2021 Apple Inc. All rights reserved.
> +
> + Redistribution and use in source and binary forms, with or without
> + modification, are permitted provided that the following conditions
> diff --git 
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb 
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> new file mode 100644
> index 0000000000..9bd0c4e198
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> @@ -0,0 +1,169 @@
> +SUMMARY = "WebKit web rendering engine for the GTK+ platform"
> +HOMEPAGE = "<https://www.webkitgtk.org/>"
> +BUGTRACKER = "<https://bugs.webkit.org/>"
> +
> +LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM = 
> "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 
> <file://source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691> 
> \
> +                    
> file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 
> <file://source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12> 
> \
> +                    
> file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 
> <file://source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21> 
> \
> +                    
> file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 
> <file://source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80> 
> \
> +                    "
> +
> +SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz 
> <https://www.webkitgtk.org/releases/webkitgtk-$%7BPV%7D.tar.xz> \
> +           
> file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch 
> <file://0001-findgobjectintrospection.cmake-prefix-variables-obta.patch/> 
> \
> +           file://reproducibility.patch 
> <file://reproducibility.patch/> \
> +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch 
> <file://0d3344e17d258106617b0e6d783d073b188a2548.patch/> \
> +           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch 
> <file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch/> \
> +           
> file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch 
> <file://0001-source-javascriptcore-cmakelists.txt-ensure-reproduc.patch/> 
> \
> +           file://check-GST_GL_HAVE_PLATFORM_GLX.patch 
> <file://check-gst_gl_have_platform_glx.patch/> \
> +           "
> +SRC_URI[sha256sum] = 
> "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
> +
> +inherit cmake pkgconfig gobject-introspection perlnative 
> features_check upstream-version-is-even gi-docgen
> +
> +S = "${WORKDIR}/webkitgtk-${PV}"
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 'opengl', 
> '', d)}"
> +
> +CVE_PRODUCT = "webkitgtk webkitgtk\+"
> +
> +DEPENDS += " \
> +          ruby-native \
> +          gperf-native \
> +          unifdef-native \
> +          cairo \
> +          harfbuzz \
> +          jpeg \
> +          atk \
> +          libwebp \
> +          gtk+3 \
> +          libxslt \
> +          libtasn1 \
> +          libnotify \
> +          gstreamer1.0 \
> +          gstreamer1.0-plugins-base \
> +          glib-2.0-native \
> +          gettext-native \
> +          "
> +
> +PACKAGECONFIG_SOUP ?= "soup3"
> +PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland x11', 
> d)} \
> +                   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11 opengl', 'webgl 
> opengl', '', d)} \
> +                   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', '', 'webgl 
> gles2', d)} \
> +                   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl', 
> 'opengl-or-es', '', d)} \
> +                   enchant \
> +                   libsecret \
> +                   ${PACKAGECONFIG_SOUP} \
> +                  "
> +
> +PACKAGECONFIG[wayland] = 
> "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland 
> libwpe wpebackend-fdo wayland-native"
> +PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
> +PACKAGECONFIG[x11] = 
> "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 
> libxcomposite libxdamage libxrender libxt"
> +PACKAGECONFIG[geoclue] = 
> "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
> +PACKAGECONFIG[enchant] = 
> "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
> +PACKAGECONFIG[gles2] = 
> "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
> +PACKAGECONFIG[webgl] = 
> "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
> +PACKAGECONFIG[opengl] = 
> "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
> +PACKAGECONFIG[opengl-or-es] = 
> "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
> +PACKAGECONFIG[libsecret] = 
> "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
> +PACKAGECONFIG[libhyphen] = 
> "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
> +PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
> +PACKAGECONFIG[openjpeg] = 
> "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
> +PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
> +PACKAGECONFIG[reduce-size] = 
> "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
> +PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> +PACKAGECONFIG[soup2] = 
> "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
> +PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> +PACKAGECONFIG[journald] = 
> "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
> +PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
> +PACKAGECONFIG[media-recorder] = 
> "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
> +PACKAGECONFIG[gamepad] = 
> "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
> +PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
> +PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON 
> -DBWRAP_EXECUTABLE=${bindir}/bwrap 
> -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap 
> xdg-dbus-proxy"
> +
> +EXTRA_OECMAKE = " \
> +		-DPORT=GTK \
> +		${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> +		${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GIDOCGEN_ENABLED', 'True', 
> '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> +		-DENABLE_MINIBROWSER=ON \
> +		"
> +
> +# Javascript JIT is not supported on ARC
> +EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
> +# By default 25-bit "medium" calls are used on ARC
> +# which is not enough for binaries larger than 32 MiB
> +CFLAGS:append:arc = " -mlong-calls"
> +CXXFLAGS:append:arc = " -mlong-calls"
> +
> +# Needed for non-mesa graphics stacks when x11 is disabled
> +CXXFLAGS += "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', '', 
> '-DEGL_NO_X11=1', d)}"
> +
> +# Javascript JIT is not supported on powerpc
> +EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
> +
> +# ARM JIT code does not build on ARMv4/5/6 anymore
> +EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
> +
> +EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
> +EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
> +
> +# JIT and gold linker does not work on RISCV
> +EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
> +EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF"
> +
> +# JIT not supported on MIPS either
> +EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF 
> -DENABLE_C_LOOP=ON "
> +
> +# JIT not supported on X32
> +# An attempt was made to upstream JIT support for x32 in
> +# <https://bugs.webkit.org/show_bug.cgi?id=100450>, but this was 
> closed as
> +# unresolved due to limited X32 adoption.
> +EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
> +
> +SECURITY_CFLAGS:remove:aarch64 = "-fpie"
> +SECURITY_CFLAGS:append:aarch64 = " -fPIE"
> +
> +FILES:${PN} += 
> "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +
> +RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
> +
> +# <http://errors.yoctoproject.org/Errors/Details/20370/>
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +# <https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474>
> +# <https://bugs.webkit.org/show_bug.cgi?id=159880>
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 
> (-mthumb).
> +ARM_INSTRUCTION_SET:armv7a = "thumb"
> +ARM_INSTRUCTION_SET:armv7r = "thumb"
> +ARM_INSTRUCTION_SET:armv7ve = "thumb"
> +
> +# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
> +COMPATIBLE_HOST:x86 = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>_any('TUNE_FEATURES', 'core2 corei7', 
> '.*', 'null', d)}"
> +
> +# introspection inside qemu-arm hangs forever on musl/arm builds
> +# therefore disable GI_DATA
> +GI_DATA_ENABLED:libc-musl:armv7a = "False"
> +GI_DATA_ENABLED:libc-musl:armv7ve = "False"
> +
> +do_install:append() {
> +	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
> +}
> +
> +PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
> +src_package_preprocess () {
> +        # Trim build paths from comments in generated sources to 
> ensure reproducibility
> +        sed -i -e "s,${WORKDIR},,g" \
> +            ${B}/JavaScriptCore/DerivedSources/*.h \
> +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
> +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> +            ${B}/WebCore/DerivedSources/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
> +}
> +
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb 
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> index 39b6a2bc7c..91653e2852 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> @@ -74,7 +74,7 @@ PACKAGECONFIG[lzma] = 
> "-DwxUSE_LIBLZMA=ON,-DwxUSE_LIBLZMA=OFF,xz"
>  PACKAGECONFIG[mspack] = 
> "-DwxUSE_LIBMSPACK=ON,-DwxUSE_LIBMSPACK=OFF,libmspack"
>  PACKAGECONFIG[opengl] = "-DwxUSE_OPENGL=ON,-DwxUSE_OPENGL=OFF,libglu"
>  PACKAGECONFIG[sdl_audio] = 
> "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
> -PACKAGECONFIG[webkit] = 
> "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
> +PACKAGECONFIG[webkit] = 
> "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk3,,,no_gui"
>  PACKAGECONFIG[curl] = 
> "-DwxUSE_WEBREQUEST_CURL=ON,-DwxUSE_WEBREQUEST_CURL=OFF,curl"
> 
>  # Support LFS unconditionally
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb 
> b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> index 7140a72845..4d9d4d3dd0 100644
> --- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
> +++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> @@ -5,7 +5,7 @@ SECTION = "x11/graphics"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=2a6f86d002ae9ae1eb1ccc466289f146" 
> <file://license;md5=2a6f86d002ae9ae1eb1ccc466289f146/>
> 
> -DEPENDS = "webkitgtk gtk+3 glib-2.0 gcr3"
> +DEPENDS = "webkitgtk3 gtk+3 glib-2.0 gcr3"
> 
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
> 
> --
> 2.39.3
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104039): 
> <https://lists.openembedded.org/g/openembedded-devel/message/104039>
> Mute This Topic: <https://lists.openembedded.org/mt/100382212/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-mwYuW/BIINhIPsfz8J/f
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>accidentally included a partial update of geary. I have corrected that and will send the geary update later.</div></div><div id="geary-quote" dir="auto"><br>On Thu, Jul 27 2023 at 02:02:18 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Change the meta-gnome recipes to use the gtk3 variant of webkitgtk

Most Gnome recipes require webkitgtk built with gtk+3. oe-core is in the
process of updating webkitgtk to be built with gtk4. It will be necessary
to add a recipe that provides the gtk+3 variant, or we wont be able
to use e.g. geary with gmail addresses or provide google integration for
gnome-calendar or nautilus/files.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-connectivity/geary/geary_43.0.bb  |   2 +-
 .../evolution-data-server.bb                  |   2 +-
 .../gnome-online-accounts_3.48.0.bb           |   2 +-
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb    |   2 +-
 .../recipes-gnome/zenity/zenity_3.44.0.bb     |   2 +-
 ...spection.cmake-prefix-variables-obta.patch |  29 ++
 ...tCore-CMakeLists.txt-ensure-reproduc.patch |  28 ++
 ...44e17d258106617b0e6d783d073b188a2548.patch | 310 ++++++++++++++++++
 ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch |  41 +++
 .../check-GST_GL_HAVE_PLATFORM_GLX.patch      |  33 ++
 .../webkitgtk3/reproducibility.patch          |  22 ++
 .../webkitgtk/webkitgtk3_2.40.2.bb            | 169 ++++++++++
 .../wxwidgets/wxwidgets_3.2.1.bb              |   2 +-
 meta-oe/recipes-graphics/surf/surf_2.1.bb     |   2 +-
 14 files changed, 639 insertions(+), 7 deletions(-)
 create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
 create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
 create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
 create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
 create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
 create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
 create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb

diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
index 6085d94fdc..bab4f909e0 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
@@ -26,7 +26,7 @@ DEPENDS = " \
     libstemmer \
     libxml2 \
     sqlite3 \
-    webkitgtk \
+    webkitgtk3 \
 "
 
 RDEPENDS:${PN} = "gnome-keyring"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index 43717a84cd..edbe30ff87 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target = " -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scan
 PACKAGECONFIG ?= "oauth"
 
 PACKAGECONFIG[canberra] = "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
-PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK=ON -DENABLE_OAUTH2_WEBKITGTK4=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk json-glib"
+PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK=ON -DENABLE_OAUTH2_WEBKITGTK4=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk3 json-glib"
 PACKAGECONFIG[goa]    = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
 PACKAGECONFIG[kerberos]    = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs when
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
index ca78fa0119..cd14b48508 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
@@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] = "418bb9fcffdbd72a98205ad365137617fc1e3551a54de74f6a
 PACKAGECONFIG ?= "goabackend kerberos owncloud lastfm google windows_live"
 
 # goabackend requires webkitgtk to be built with gtk+3 and gcr3
-PACKAGECONFIG[goabackend] = "-Dgoabackend=true,-Dgoabackend=false,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk"
+PACKAGECONFIG[goabackend] = "-Dgoabackend=true,-Dgoabackend=false,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk3"
 PACKAGECONFIG[kerberos] = "-Dkerberos=true, -Dkerberos=false,krb5 gcr3"
 PACKAGECONFIG[exchange] = "-Dexchange=true, -Dexchange=false"
 PACKAGECONFIG[google] = "-Dgoogle=true, -Dgoogle=false"
diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index 200ed0f709..51d51ee0ab 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -19,7 +19,7 @@ DEPENDS += " \
     libxslt \
     sqlite3 \
     libhandy \
-    webkitgtk \
+    webkitgtk3 \
     yelp-xsl \
 "
 PACKAGECONFIG_SOUP ?= "soup3"
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
index 8ea24ca49b..3548cc5bbe 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
@@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] = "c15582301ed90b9d42ce521dbccf99a989f22f12041bdd5279
 SRC_URI += "<a href="file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch" "="">file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"</a>
 
 PACKAGECONFIG ?= "webkitgtk"
-PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
+PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk3"
 
 PACKAGES =+ "${PN}-gdialog"
 FILES:${PN}-gdialog = "${bindir}/gdialog"
diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
new file mode 100644
index 0000000000..8ae39f14e1
--- /dev/null
+++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -0,0 +1,29 @@
+From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;
+Date: Tue, 27 Oct 2015 16:02:19 +0200
+Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
+ from pkg-config with PKG_CONFIG_SYSROOT_DIR
+
+See discussion at <a href="https://bugs.webkit.org/show_bug.cgi?id=232933">https://bugs.webkit.org/show_bug.cgi?id=232933</a> for
+reasons why this is not approproiate for upstream submission.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;
+---
+ Source/cmake/FindGI.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
+index af039cbb..b3e810cd 100644
+--- a/Source/cmake/FindGI.cmake
++++ b/Source/cmake/FindGI.cmake
+@@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
+     endif ()
+ endif ()
+ 
++set(_GI_SCANNER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_SCANNER_EXE}")
++set(_GI_COMPILER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_COMPILER_EXE}")
++
+ find_program(GI_SCANNER_EXE NAMES ${_GI_SCANNER_EXE} g-ir-scanner)
+ find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_EXE} g-ir-compiler)
+ 
diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
new file mode 100644
index 0000000000..bbe265059d
--- /dev/null
+++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
@@ -0,0 +1,28 @@
+From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
+Date: Mon, 26 Jun 2023 14:30:02 +0200
+Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reproducibility
+ of __TIMESTAMP__
+
+__TIMESTAMP__ refers to mtime of the file that contains it, which is unstable
+and breaks binary reproducibility when the file is generated at build time. To ensure
+this does not happen, mtime should be set from the original file.
+
+Upstream-Status: Submitted [<a href="https://github.com/WebKit/WebKit/pull/15293">https://github.com/WebKit/WebKit/pull/15293</a>]
+Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
+---
+ Source/JavaScriptCore/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index 43dc22ff..c2e3b1cd 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -159,6 +159,7 @@ add_custom_command(
+     OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
+     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in
+     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in &gt; ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
++    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
+             VERBATIM
+ )
+ 
diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
new file mode 100644
index 0000000000..34e0ff9af3
--- /dev/null
+++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -0,0 +1,310 @@
+From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro &lt;<a href="mailto:aperez@igalia.com">aperez@igalia.com</a>&gt;
+Date: Thu, 2 Jun 2022 11:19:06 +0300
+Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
+ unused <a href="https://bugs.webkit.org/show_bug.cgi?id=241182">https://bugs.webkit.org/show_bug.cgi?id=241182</a>
+
+Reviewed by NOBODY (OOPS!).
+
+Move the NEON fast path for the SVG lighting filter effects into
+FELightingSoftwareApplier, and arrange to actually use them by
+forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
+
+Some changes were needed to adapt platformApplyNeon() to the current
+state of filters after r286140. This was not detected because the code
+bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
+not get used much these days: CPU(ARM_THUMB2) is more common. It should
+be possible to use the NEON fast paths also in Thumb mode, but that is
+left for a follow-up fix.
+
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
+(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
+(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
+(WebCore::FELighting::platformApplyNeonWorker): Deleted.
+(WebCore::FELighting::getPowerCoefficients): Deleted.
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
+(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
+(WebCore::FELighting::platformApplyNeon): Deleted.
+* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
+* Source/WebCore/platform/graphics/filters/FELighting.h:
+* Source/WebCore/platform/graphics/filters/PointLightSource.h:
+* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
+* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
+
+Upstream-Status: Submitted [<a href="https://github.com/WebKit/WebKit/pull/1233">https://github.com/WebKit/WebKit/pull/1233</a>]
+Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
+---
+ .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
+ .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
+ .../graphics/filters/DistantLightSource.h     |  4 ++
+ .../platform/graphics/filters/FELighting.h    |  7 ---
+ .../graphics/filters/PointLightSource.h       |  4 ++
+ .../graphics/filters/SpotLightSource.h        |  4 ++
+ .../software/FELightingSoftwareApplier.h      | 16 ++++++
+ 7 files changed, 56 insertions(+), 35 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+index f6ff8c20..42a97ffc 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
+     return s_FELightingConstantsForNeon;
+ }
+ 
+-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
+ {
+     neonDrawLighting(parameters);
+ }
+@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
+     "b .lightStrengthCalculated" NL
+ ); // NOLINT
+ 
+-int FELighting::getPowerCoefficients(float exponent)
++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
+ {
+     // Calling a powf function from the assembly code would require to save
+     // and reload a lot of NEON registers. Since the base is in range [0..1]
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+index b17c603d..e4629cda 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+@@ -24,14 +24,15 @@
+  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#ifndef FELightingNEON_h
+-#define FELightingNEON_h
++#pragma once
+ 
+ #if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE)
+ 
+-#include "FELighting.h"
++#include "FELightingSoftwareApplier.h"
++#include "ImageBuffer.h"
+ #include "PointLightSource.h"
+ #include "SpotLightSource.h"
++#include &lt;wtf/ObjectIdentifier.h&gt;
+ #include &lt;wtf/ParallelJobs.h&gt;
+ 
+ namespace WebCore {
+@@ -93,14 +94,14 @@ extern "C" {
+ void neonDrawLighting(FELightingPaintingDataForNeon*);
+ }
+ 
+-inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightSource::PaintingData&amp; paintingData)
++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData&amp; data, const LightSource::PaintingData&amp; paintingData)
+ {
+-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
+-    FELightingPaintingDataForNeon neonData = {
++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
++    WebCore::FELightingPaintingDataForNeon neonData = {
+         data.pixels-&gt;data(),
+         1,
+-        data.widthDecreasedByOne - 1,
+-        data.heightDecreasedByOne - 1,
++        data.width - 2,
++        data.height - 2,
+         0,
+         0,
+         0,
+@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
+     // Set light source arguments.
+     floatArguments.constOne = 1;
+ 
+-    auto color = m_lightingColor.toColorTypeLossy&lt;SRGBA&lt;uint8_t&gt;&gt;().resolved();
++    auto color = data.lightingColor.toColorTypeLossy&lt;SRGBA&lt;uint8_t&gt;&gt;().resolved();
+ 
+     floatArguments.colorRed = color.red;
+     floatArguments.colorGreen = color.green;
+     floatArguments.colorBlue = color.blue;
+     floatArguments.padding4 = 0;
+ 
+-    if (m_lightSource-&gt;type() == LS_POINT) {
++    if (data.lightSource-&gt;type() == LS_POINT) {
+         neonData.flags |= FLAG_POINT_LIGHT;
+-        PointLightSource&amp; pointLightSource = static_cast&lt;PointLightSource&amp;&gt;(m_lightSource.get());
++        const auto&amp; pointLightSource = *static_cast&lt;const PointLightSource*&gt;(data.lightSource);
+         floatArguments.lightX = pointLightSource.position().x();
+         floatArguments.lightY = pointLightSource.position().y();
+         floatArguments.lightZ = pointLightSource.position().z();
+         floatArguments.padding2 = 0;
+-    } else if (m_lightSource-&gt;type() == LS_SPOT) {
++    } else if (data.lightSource-&gt;type() == LS_SPOT) {
+         neonData.flags |= FLAG_SPOT_LIGHT;
+-        SpotLightSource&amp; spotLightSource = static_cast&lt;SpotLightSource&amp;&gt;(m_lightSource.get());
++        const auto&amp; spotLightSource = *static_cast&lt;const SpotLightSource*&gt;(data.lightSource);
+         floatArguments.lightX = spotLightSource.position().x();
+         floatArguments.lightY = spotLightSource.position().y();
+         floatArguments.lightZ = spotLightSource.position().z();
+@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
+         if (spotLightSource.specularExponent() == 1)
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+-        ASSERT(m_lightSource-&gt;type() == LS_DISTANT);
++        ASSERT(data.lightSource-&gt;type() == LS_DISTANT);
+         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
+         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
+         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
+@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
+     // Set lighting arguments.
+     floatArguments.surfaceScale = data.surfaceScale;
+     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
+-    if (m_lightingType == FELighting::DiffuseLighting)
+-        floatArguments.diffuseConstant = m_diffuseConstant;
++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
++        floatArguments.diffuseConstant = data.diffuseConstant;
+     else {
+         neonData.flags |= FLAG_SPECULAR_LIGHT;
+-        floatArguments.diffuseConstant = m_specularConstant;
+-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
+-        if (m_specularExponent == 1)
++        floatArguments.diffuseConstant = data.specularConstant;
++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
++        if (data.specularExponent == 1)
+             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
+     }
+     if (floatArguments.diffuseConstant == 1)
+         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
+ 
+-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
+     if (optimalThreadNumber &gt; 1) {
+         // Initialize parallel jobs
+-        ParallelJobs&lt;FELightingPaintingDataForNeon&gt; parallelJobs(&amp;WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
++        ParallelJobs&lt;FELightingPaintingDataForNeon&gt; parallelJobs(&amp;FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
+ 
+         // Fill the parameter array
+         int job = parallelJobs.numberOfJobs();
+         if (job &gt; 1) {
+             int yStart = 1;
+-            int yStep = (data.heightDecreasedByOne - 1) / job;
++            int yStep = (data.height - 2) / job;
+             for (--job; job &gt;= 0; --job) {
+                 FELightingPaintingDataForNeon&amp; params = parallelJobs.parameter(job);
+                 params = neonData;
+                 params.yStart = yStart;
+-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
++                params.pixels += (yStart - 1) * data.width * 4;
+                 if (job &gt; 0) {
+                     params.absoluteHeight = yStep;
+                     yStart += yStep;
+                 } else
+-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
++                    params.absoluteHeight = (data.height - 1) - yStart;
+             }
+             parallelJobs.execute();
+             return;
+@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
+ } // namespace WebCore
+ 
+ #endif // CPU(ARM_NEON) &amp;&amp; COMPILER(GCC_COMPATIBLE)
+-
+-#endif // FELightingNEON_h
+diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+index 70c6512f..b032c82e 100644
+--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+@@ -26,6 +26,10 @@
+ #include &lt;wtf/ArgumentCoder.h&gt;
+ #include &lt;wtf/Ref.h&gt;
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class DistantLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
+index 53beb596..e78a9354 100644
+--- a/Source/WebCore/platform/graphics/filters/FELighting.h
++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
+@@ -35,8 +35,6 @@
+ 
+ namespace WebCore {
+ 
+-struct FELightingPaintingDataForNeon;
+-
+ class FELighting : public FilterEffect {
+ public:
+     const Color&amp; lightingColor() const { return m_lightingColor; }
+@@ -64,11 +62,6 @@ protected:
+ 
+     std::unique_ptr&lt;FilterEffectApplier&gt; createSoftwareApplier() const override;
+ 
+-#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE)
+-    static int getPowerCoefficients(float exponent);
+-    inline void platformApplyNeon(const LightingData&amp;, const LightSource::PaintingData&amp;);
+-#endif
+-
+     Color m_lightingColor;
+     float m_surfaceScale;
+     float m_diffuseConstant;
+diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+index 3a5723f0..675d63f5 100644
+--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include &lt;wtf/Ref.h&gt;
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class PointLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+index 684626f7..dea58389 100644
+--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include &lt;wtf/Ref.h&gt;
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class SpotLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+index c974d921..e2896660 100644
+--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+@@ -36,6 +36,7 @@
+ namespace WebCore {
+ 
+ class FELighting;
++struct FELightingPaintingDataForNeon;
+ 
+ class FELightingSoftwareApplier final : public FilterEffectConcreteApplier&lt;FELighting&gt; {
+     WTF_MAKE_FAST_ALLOCATED;
+@@ -132,8 +133,23 @@ private:
+ 
+     static void applyPlatformGenericPaint(const LightingData&amp;, const LightSource::PaintingData&amp;, int startY, int endY);
+     static void applyPlatformGenericWorker(ApplyParameters*);
++
++#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE)
++    static int getPowerCoefficients(float exponent);
++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
++    inline static void applyPlatformNeon(const LightingData&amp;, const LightSource::PaintingData&amp;);
++
++    inline static void applyPlatformGeneric(const LightingData&amp; data, const LightSource::PaintingData&amp; paintingData)
++    {
++        applyPlatformNeon(data, paintingData);
++    }
++#else
+     static void applyPlatformGeneric(const LightingData&amp;, const LightSource::PaintingData&amp;);
++#endif
++
+     static void applyPlatform(const LightingData&amp;);
+ };
+ 
+ } // namespace WebCore
++
++#include "FELightingNEON.h"
diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
new file mode 100644
index 0000000000..79da855ff4
--- /dev/null
+++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
@@ -0,0 +1,41 @@
+From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
+From: Diego Pino Garcia &lt;<a href="mailto:dpino@igalia.com">dpino@igalia.com</a>&gt;
+Date: Mon, 22 May 2023 19:58:50 -0700
+Subject: [PATCH] [GLIB] Fix build error after 264196@main
+ <a href="https://bugs.webkit.org/show_bug.cgi?id=256917">https://bugs.webkit.org/show_bug.cgi?id=256917</a>
+
+Reviewed by Michael Catanzaro.
+
+Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
+enabled.
+
+* Source/WTF/wtf/glib/Sandbox.cpp:
+(WTF::isInsideUnsupportedContainer):
+
+Canonical link: <a href="https://commits.webkit.org/264395@main">https://commits.webkit.org/264395@main</a>
+Upstream-Status: Backport [<a href="https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9b13795c9b0f7894bf4">https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9b13795c9b0f7894bf4</a>]
+Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
+---
+ Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sandbox.cpp
+index 7d84e830ab33e..9b07bb8cb5a9b 100644
+--- a/Source/WTF/wtf/glib/Sandbox.cpp
++++ b/Source/WTF/wtf/glib/Sandbox.cpp
+@@ -36,6 +36,7 @@ bool isInsideFlatpak()
+     return returnValue;
+ }
+ 
++#if ENABLE(BUBBLEWRAP_SANDBOX)
+ bool isInsideUnsupportedContainer()
+ {
+     static bool inContainer = g_file_test("/run/.containerenv", G_FILE_TEST_EXISTS);
+@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
+ 
+     return inContainer &amp;&amp; !supportedContainer;
+ }
++#endif
+ 
+ bool isInsideSnap()
+ {
diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
new file mode 100644
index 0000000000..ae99810ced
--- /dev/null
+++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
@@ -0,0 +1,33 @@
+Add additional check on GST_GL_HAVE_PLATFORM_GLX before using gst_gl_display_x11_new_with_display
+
+This ensures that there is a compile time check for glx support in gstreamer as
+runtime check is not enough because gst_gl_display_x11_new_with_display() API comes from
+gst/gl/x11/gstgldisplay_x11.h which is only included when GST_GL_HAVE_PLATFORM_GLX is defined
+therefore make this check consistent to fix build with some platforms which use pvr gl drivers
+where this problem appear at compile time.
+
+
+/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r0/webkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp:68:31: error: use of undeclared identifier 'gst_gl_display_x11_new_with_display'; did you mean 'gst_gl_display_egl_new_with_egl_display'?
+   68 |         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast&lt;PlatformDisplayX11&gt;(sharedDisplay).native()));
+      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                               gst_gl_display_egl_new_with_egl_display
+
+This issue is 2.40 specific since GLX support is removed [1] from trunk upstream, therefore
+this patch wont be needed when upgrading to 2.42+
+
+[1] <a href="https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf">https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf</a>
+
+Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
+Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
+
+--- a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-02-20 01:22:18.917743700 -0800
++++ b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-07-08 08:45:09.739177065 -0700
+@@ -63,7 +63,7 @@
+     if (glPlatform == GST_GL_PLATFORM_EGL)
+         return GST_GL_DISPLAY(gst_gl_display_egl_new_with_egl_display(sharedDisplay.eglDisplay()));
+ #endif
+-#if USE(GLX)
++#if USE(GLX) &amp;&amp; GST_GL_HAVE_PLATFORM_GLX
+     if (is&lt;PlatformDisplayX11&gt;(sharedDisplay) &amp;&amp; glPlatform == GST_GL_PLATFORM_GLX)
+         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast&lt;PlatformDisplayX11&gt;(sharedDisplay).native()));
+ #endif
diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
new file mode 100644
index 0000000000..e866a1a193
--- /dev/null
+++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
@@ -0,0 +1,22 @@
+Injection a year based on the current date isn't reproducible. Hack this
+to a specific year for now for reproducibilty and to avoid autobuilder failures.
+
+The correct fix would be to use SOURCE_DATE_EPOCH from the environment and
+then this could be submitted upstream, sadly my ruby isn't up to that.
+
+Upstream-Status: Pending [could be reworked]
+Signed-off-by: Richard Purdie &lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;
+
+Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+===================================================================
+--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+@@ -25,7 +25,7 @@ require 'date'
+ require 'digest'
+ 
+ $LICENSE = &lt;&lt;-EOF
+-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
++Copyright (C) 2021 Apple Inc. All rights reserved.
+ 
+ Redistribution and use in source and binary forms, with or without
+ modification, are permitted provided that the following conditions
diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
new file mode 100644
index 0000000000..9bd0c4e198
--- /dev/null
+++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
@@ -0,0 +1,169 @@
+SUMMARY = "WebKit web rendering engine for the GTK+ platform"
+HOMEPAGE = "<a href="https://www.webkitgtk.org/">https://www.webkitgtk.org/</a>"
+BUGTRACKER = "<a href="https://bugs.webkit.org/">https://bugs.webkit.org/</a>"
+
+LICENSE = "BSD-2-Clause &amp; LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "<a href="file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691">file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691</a> \
+                    <a href="file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12">file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12</a> \
+                    <a href="file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21">file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21</a> \
+                    <a href="file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80">file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80</a> \
+                    "
+
+SRC_URI = "<a href="https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz">https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz</a> \
+           <a href="file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch">file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch</a> \
+           <a href="file://reproducibility.patch">file://reproducibility.patch</a> \
+           <a href="file://0d3344e17d258106617b0e6d783d073b188a2548.patch">file://0d3344e17d258106617b0e6d783d073b188a2548.patch</a> \
+           <a href="file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch">file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch</a> \
+           <a href="file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch">file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch</a> \
+           <a href="file://check-GST_GL_HAVE_PLATFORM_GLX.patch">file://check-GST_GL_HAVE_PLATFORM_GLX.patch</a> \
+           "
+SRC_URI[sha256sum] = "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
+
+inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
+
+S = "${WORKDIR}/webkitgtk-${PV}"
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
+
+CVE_PRODUCT = "webkitgtk webkitgtk\+"
+
+DEPENDS += " \
+          ruby-native \
+          gperf-native \
+          unifdef-native \
+          cairo \
+          harfbuzz \
+          jpeg \
+          atk \
+          libwebp \
+          gtk+3 \
+          libxslt \
+          libtasn1 \
+          libnotify \
+          gstreamer1.0 \
+          gstreamer1.0-plugins-base \
+          glib-2.0-native \
+          gettext-native \
+          "
+
+PACKAGECONFIG_SOUP ?= "soup3"
+PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+                   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
+                   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
+                   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
+                   enchant \
+                   libsecret \
+                   ${PACKAGECONFIG_SOUP} \
+                  "
+
+PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
+PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
+PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
+PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
+PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
+PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
+PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
+PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
+PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
+PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
+PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
+PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
+PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
+PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
+PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
+PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
+PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
+PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
+PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
+PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
+PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
+PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
+PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
+PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
+
+EXTRA_OECMAKE = " \
+		-DPORT=GTK \
+		<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
+		<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
+		-DENABLE_MINIBROWSER=ON \
+		"
+
+# Javascript JIT is not supported on ARC
+EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
+# By default 25-bit "medium" calls are used on ARC
+# which is not enough for binaries larger than 32 MiB
+CFLAGS:append:arc = " -mlong-calls"
+CXXFLAGS:append:arc = " -mlong-calls"
+
+# Needed for non-mesa graphics stacks when x11 is disabled
+CXXFLAGS += "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
+
+# Javascript JIT is not supported on powerpc
+EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
+
+# ARM JIT code does not build on ARMv4/5/6 anymore
+EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
+
+EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
+
+# JIT and gold linker does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
+EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF"
+
+# JIT not supported on MIPS either
+EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
+
+# JIT not supported on X32
+# An attempt was made to upstream JIT support for x32 in
+# <a href="https://bugs.webkit.org/show_bug.cgi?id=100450">https://bugs.webkit.org/show_bug.cgi?id=100450</a>, but this was closed as
+# unresolved due to limited X32 adoption.
+EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
+
+SECURITY_CFLAGS:remove:aarch64 = "-fpie"
+SECURITY_CFLAGS:append:aarch64 = " -fPIE"
+
+FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
+
+RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
+
+# <a href="http://errors.yoctoproject.org/Errors/Details/20370/">http://errors.yoctoproject.org/Errors/Details/20370/</a>
+ARM_INSTRUCTION_SET:armv4 = "arm"
+ARM_INSTRUCTION_SET:armv5 = "arm"
+ARM_INSTRUCTION_SET:armv6 = "arm"
+
+# <a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474">https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474</a>
+# <a href="https://bugs.webkit.org/show_bug.cgi?id=159880">https://bugs.webkit.org/show_bug.cgi?id=159880</a>
+# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
+# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
+ARM_INSTRUCTION_SET:armv7a = "thumb"
+ARM_INSTRUCTION_SET:armv7r = "thumb"
+ARM_INSTRUCTION_SET:armv7ve = "thumb"
+
+# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
+COMPATIBLE_HOST:x86 = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
+
+# introspection inside qemu-arm hangs forever on musl/arm builds
+# therefore disable GI_DATA
+GI_DATA_ENABLED:libc-musl:armv7a = "False"
+GI_DATA_ENABLED:libc-musl:armv7ve = "False"
+
+do_install:append() {
+	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
+}
+
+PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure reproducibility
+        sed -i -e "s,${WORKDIR},,g" \
+            ${B}/JavaScriptCore/DerivedSources/*.h \
+            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
+            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
+            ${B}/WebCore/DerivedSources/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
+}
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
index 39b6a2bc7c..91653e2852 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
@@ -74,7 +74,7 @@ PACKAGECONFIG[lzma] = "-DwxUSE_LIBLZMA=ON,-DwxUSE_LIBLZMA=OFF,xz"
 PACKAGECONFIG[mspack] = "-DwxUSE_LIBMSPACK=ON,-DwxUSE_LIBMSPACK=OFF,libmspack"
 PACKAGECONFIG[opengl] = "-DwxUSE_OPENGL=ON,-DwxUSE_OPENGL=OFF,libglu"
 PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
-PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
+PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk3,,,no_gui"
 PACKAGECONFIG[curl] = "-DwxUSE_WEBREQUEST_CURL=ON,-DwxUSE_WEBREQUEST_CURL=OFF,curl"
 
 # Support LFS unconditionally
diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
index 7140a72845..4d9d4d3dd0 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -5,7 +5,7 @@ SECTION = "x11/graphics"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=2a6f86d002ae9ae1eb1ccc466289f146" "="">file://LICENSE;md5=2a6f86d002ae9ae1eb1ccc466289f146"</a>
 
-DEPENDS = "webkitgtk gtk+3 glib-2.0 gcr3"
+DEPENDS = "webkitgtk3 gtk+3 glib-2.0 gcr3"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
<div>-- 
</div>2.39.3

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#104039): <a href="https://lists.openembedded.org/g/openembedded-devel/message/104039">https://lists.openembedded.org/g/openembedded-devel/message/104039</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/100382212/3618223">https://lists.openembedded.org/mt/100382212/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-mwYuW/BIINhIPsfz8J/f--


