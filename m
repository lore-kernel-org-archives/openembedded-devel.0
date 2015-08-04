Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 68A48605D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 23:16:00 +0000 (UTC)
Received: by ioea135 with SMTP id a135so32799690ioe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2015 16:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=eIzeB7Kr/Pr78lc+7t9O4pIF3C7k1EB2IG5eWc3BatM=;
	b=xai501x9y4L00t8hsBPaQJ8lwjbo3WIkvnQbpPyfPkaa7/5GCS5O8qCDfF7bn1d2tS
	fHKlEa5z1yCQo7+jnF+OCnr9+dGyep1VnAq4q89mpHTa+h5lpraGwXdADV/S4ZLCzBJb
	YgeUrpR8MfT7flqqeGSKAzSqfObeW0jX3F0ieMzppnJAxAjz0KCnKtICzAqngNMwjNTT
	ZwD8A9C/X2CNPI4omMMx82Y2Psp+TcStLMAWRzU9qvF5lbQHckSk9W08Idg21iZK5fWP
	uoOq6MD7Ydk9r72SKnBIvW9opsRd+ln3ej1CKCNTUCTsuB8gvMS0xmu7MZgWEKDX3/fM
	6UfA==
X-Received: by 10.107.168.145 with SMTP id e17mr6693348ioj.112.1438730159981; 
	Tue, 04 Aug 2015 16:15:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Tue, 4 Aug 2015 16:15:30 -0700 (PDT)
In-Reply-To: <1438571196-44094-7-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438571196-44094-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1438571196-44094-7-git-send-email-leimaohui@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2015 16:15:30 -0700
Message-ID: <CAMKF1srTQ_Cq9FOnYuPVAWXrS5HDf8LSncD30V0s=qcVLW_Myg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4 6/6] openlmi: add openlmi and it's depends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Aug 2015 23:16:02 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 2, 2015 at 8:06 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> OpenLMI  = Open Linux Management Infrastructure.
> OpenLMI is open-source project aiming to improve management of Linux systems using WBEM standards.
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../openlmi/openlmi-networking_0.3.1.bb            | 29 ++++++++++++
>  .../openlmi/openlmi-providers/0001-fix-error.patch | 26 +++++++++++
>  .../openlmi/openlmi-providers_0.6.0.bb             | 54 ++++++++++++++++++++++
>  .../openlmi/openlmi-storage_0.8.1.bb               | 31 +++++++++++++
>  .../openlmi/openlmi-tools_0.10.5.bb                | 23 +++++++++
>  5 files changed, 163 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
>
> diff --git a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
> new file mode 100644
> index 0000000..0bb4890
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "CIM providers for network management"
> +DESCRIPTION = "\
> +openlmi-networking is set of CMPI providers for network management using \
> +Common Information Model (CIM)."
> +HOMEPAGE = "http://www.openlmi.org/"
> +LICENSE = "LGPLv2+"

this should be LGPL-2.1+

> +LIC_FILES_CHKSUM = "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
> +SECTION = "System/Management"
> +DEPENDS = "openlmi-providers konkretcmpi sblim-cmpi-devel cim-schema-exper networkmanager dbus libcheck glib-2.0"
> +
> +SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
> +          "
> +SRC_URI[md5sum] = "f20de8c76fb6a80001b14c1eb035953e"
> +SRC_URI[sha256sum] = "578eaa5c65fe924b5d7aeb635509dd46443166cd6a88b019bc42646e3518a460"
> +
> +inherit cmake
> +
> +do_configure_prepend() {
> +    export STAGING_DATADIR="${STAGING_DATADIR}"
> +}

why is this needed to be manually exported like this. Sounds redundant

> +
> +do_install_append() {
> +    if [ -d ${D}${prefix}/lib64 ]; then
> +        mv ${D}${prefix}/lib64 ${D}${libdir}
> +    fi

have you tested it on multilib builds ? I think it will fail.

> +}
> +
> +FILES_${PN} =+ "${libdir}/cmpi/libcmpiLMI_Networking.so ${prefix}/libexec*"

this will not work since the default globs will put the .so into a -dev package.

> +FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
> diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch b/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
> new file mode 100644
> index 0000000..85dfd55
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
> @@ -0,0 +1,26 @@
> +From 764171866b84e0198b67538f63022abde3e628ad Mon Sep 17 00:00:00 2001
> +From: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +Date: Fri, 16 Jan 2015 14:15:25 +0800
> +Subject: [PATCH] fix error
> +
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +---
> + cmake/modules/OpenLMIMacros.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cmake/modules/OpenLMIMacros.cmake b/cmake/modules/OpenLMIMacros.cmake
> +index d55f983..dbc32ec 100644
> +--- a/cmake/modules/OpenLMIMacros.cmake
> ++++ b/cmake/modules/OpenLMIMacros.cmake
> +@@ -89,7 +89,7 @@ macro(konkretcmpi_generate MOFS CIM_PROVIDERS CIM_HEADERS CIM_CLASSES)
> +         endforeach(CLASS ${CIM_CLASS_NAMES})
> +
> +         # Generate headers for CIM classes
> +-        set(ENV{KONKRET_SCHEMA_DIR} "/usr/share/mof/cim-current")
> ++        set(ENV{KONKRET_SCHEMA_DIR} "$ENV{STAGING_DATADIR}/mof/cim-current")

can you try to use CMAKE_INSTALL_DATDIR or CMAKE_INSTALL_FULL_DATADIR
here instead ?

> +         execute_process(COMMAND ${KONKRETCMPI_KONKRET}
> +                                 ${KONKRET_MOF_FILES}
> +                                 ${GENERATE_PROVIDERS}
> +--
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
> new file mode 100644
> index 0000000..5ed97b9
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
> @@ -0,0 +1,54 @@
> +SUMMARY = "Set of basic CIM providers"
> +DESCRIPTION = "\
> +openlmi-providers is set of (usually) small CMPI providers (agents) for \
> +basic monitoring and management of host system using Common Information \
> +Model (CIM)."
> +HOMEPAGE = "http://www.openlmi.org/"
> +LICENSE = "LGPLv2+"

same as above use LGPL-2.1+

> +LIC_FILES_CHKSUM = "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
> +SECTION = "System/Management"
> +DEPENDS = "konkretcmpi-native konkretcmpi sblim-sfcb sblim-cmpi-devel cim-schema-exper lmsensors libuser swig swig-native dbus udev systemd-systemctl-native pciutils"
> +
> +SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
> +           file://0001-fix-error.patch"
> +SRC_URI[md5sum] = "5904f23cf494946237cfbbdbe644a3cd"
> +SRC_URI[sha256sum] = "e2b2fbeaec45a83905d0da3b87da83904d9cd94c1b86312f844587b3fff11f56"
> +
> +inherit cmake
> +LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> +EXTRA_OECMAKE = " \
> +                 -DWITH-DEVASSISTANT=OFF \
> +                 -DWITH-JOURNALD=OFF \
> +                 -DWITH-SERVICE=OFF \
> +                 -DWITH-SERVICE-LEGACY=ON \
> +                 -DWITH-ACCOUNT=OFF \
> +                 -DWITH-PCP=OFF \
> +                 -DWITH-REALMD=OFF \
> +                 -DWITH-FAN=OFF \
> +                 -DWITH-LOCALE=OFF \
> +                 -DWITH-INDSENDER=OFF \
> +                 -DWITH-JOBMANAGER=OFF \
> +                 -DWITH-SSSD=OFF \
> +                 -DWITH-SELINUX=OFF \
> +                 -DWITH-SOFTWARE-DBUS=ON \
> +               "
> +
> +do_configure_prepend() {
> +    export STAGING_DATADIR="${STAGING_DATADIR}"
> +}
> +
> +do_install_append() {
> +    if [ -d ${D}${prefix}/lib64 ]; then
> +        mv ${D}${prefix}/lib64 ${D}${libdir}
> +    fi

multilib testing is needed

> +
> +    if [ -d ${D}${prefix}${sysconfidr} ]; then
> +        mv ${D}${prefix}${sysconfdir} ${D}${sysconfdir}
> +    fi
> +}
> +
> +FILES_${PN} =+ "${libdir}/cmpi/libcmpiLMI* ${prefix}/libexec*"
> +FILES_${PN}-dev =+ "${datadir}/cmake*"
> +FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
> +
> +RDEPENDS_${PN} = "python"
> diff --git a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
> new file mode 100644
> index 0000000..6d351c6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "CIM providers for storage management"
> +DESCRIPTION = "\
> +The openlmi-storage package contains CMPI providers for management of storage \
> +using Common Information Managemen (CIM) protocol. \
> +\
> +The providers can be registered in any CMPI-aware CIMOM, both OpenPegasus and \
> +SFCB were tested."
> +HOMEPAGE = "http://www.openlmi.org/"
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +SECTION = "System/Management"
> +DEPENDS = "openlmi-providers pywbem cmpi-bindings"
> +
> +SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz"
> +SRC_URI[md5sum] = "898cf0d8c03b8ad6b45d65f335ddee0d"
> +SRC_URI[sha256sum] = "4a1ba9957750f94ea58a89cea28985564f38d7cc9aa00fcae20c51e7b32bd0a8"
> +
> +inherit setuptools
> +
> +do_install_append() {
> +    install -m 755 -d ${D}${datadir}/${BPN}
> +    install -m 644 ${S}/mof/* ${D}${datadir}/${BPN}/
> +
> +    install -m 755 -d ${D}${sysconfdir}/openlmi/storage
> +    install -m 644 storage.conf ${D}${sysconfdir}/openlmi/storage/storage.conf
> +
> +    install -m 755 -d ${D}${libexecdir}/pegasus
> +    install -m 755 pycmpiLMI_Storage-cimprovagt ${D}${libexecdir}/pegasus/
> +}
> +
> +FILES_${PN} =+ "${sysconfdir}/openlmi/storage/storage.conf ${datadir}/${BPN}/*"
> diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
> new file mode 100644
> index 0000000..b23869d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Set of CLI tools for Openlmi providers"
> +DESCRIPTION = "openlmi-tools is a set of command line tools for Openlmi providers."
> +HOMEPAGE = "http://www.openlmi.org/"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
> +SECTION = "System/Management"
> +
> +inherit setuptools
> +
> +DEPENDS = "python-native pywbem-native python-m2crypto pywbem"
> +
> +SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
> +          "
> +SRC_URI[md5sum] = "e156246cb7b49753db82f4ddf7f03e50"
> +SRC_URI[sha256sum] = "292b8f5f2250655a4add8183c529b73358bc980bd4f23cfa484a940953fce9e4"
> +
> +do_compile_prepend() {
> +    cd cli
> +    sed 's/@@VERSION@@/$(VERSION)/g' setup.py.skel >setup.py
> +}
> +do_install_prepend() {
> +    cd cli
> +}
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

