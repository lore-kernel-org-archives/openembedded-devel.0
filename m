Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF5657CF10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:35:34 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id b16so2575038qtt.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2019 21:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KI/4XuhLIPwT6qZXnnIjKSCzGuy4ajO/apyXipHD9bo=;
	b=i+BaUCo6n3rXfAoQupJitdxpN1IIvc0nhCUuSqRG32IhfVqiUhrgDawPyi0uxvBd5k
	DarFLN2A/HE2rarxsZjeB1fdf93SeocxzH8H93LjvEKFsSzikDgpCEV6d9986vZCuk/r
	D6n2NqIrUPlx8swk+HeYCLmxptW+6yE8pU+ATSKIyI3F+S+dN+9sabRasu5r4nodanqm
	rmykXGPxQths50xwWoozwFbiKVzbjbQrYYGstllgEWoOwSPO5ZLv5iYhvjPej3qoDS/f
	l9MLzgtZprHDHtNE36na8APXSbim6eykQ6hpb0wM7dfA5Ey71Cra7/3k900fXwb7IAnw
	9cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KI/4XuhLIPwT6qZXnnIjKSCzGuy4ajO/apyXipHD9bo=;
	b=iQgP4eJgvV7CXbj+ud5Z0wrmVSqG6V6MSkpOK0Crhi9yAyopDGsEmcvaGSUzMCQ8Gs
	e22f6kcPqmA5xKwkaz7aUrZEIcIr4kTPyFSit3DfCVyu0K3AJQUn7lfVDljIM4UFhayv
	XcfPfH7gUnJQWX6BjQ8lFqHVyU5w53ac71Ll6mU+/cVP8/ftu6VNeOqhQwdPE3XiVO3T
	jqstzECxUHWU9nVetJ0ePNjXrrzqJE1IPZkKQzm8e5YomNENJoSc9u5hQpYneIhhHesh
	k08JTc9X3hxAyBD1cC53yB+HUGRkhQtPIWzS/Fa4vErwCPWQAQHpsjuovxeAtbrHr5x5
	SPmg==
X-Gm-Message-State: APjAAAUs/J3eZNRBLNNkNtrlCefRYoPg0bLYWC0acpwOnHsI3eiJNYVN
	GPrbNhFe4JDYYRP4khxqFyEhtlLWd073qs8DxRg=
X-Google-Smtp-Source: APXvYqy0OBi2UsjvkuKOklooq8EJCUQsE5LH3J3tf0/vuqv0nqu2DxOkmbOHbegOiFsylp6JTGkksFYv6srLDvj8Y7s=
X-Received: by 2002:a0c:8971:: with SMTP id 46mr23833220qvq.224.1552278935391; 
	Sun, 10 Mar 2019 21:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190309141726.9429-1-oleksandr.kravchuk@pelagicore.com>
	<CAMKF1spUrVb+RA0HLbMN-Gjp71k617mB_iL2P+6Fjmk2WLd3Hg@mail.gmail.com>
	<6d65f745-f096-80f0-493c-822a336a5a96@gmail.com>
In-Reply-To: <6d65f745-f096-80f0-493c-822a336a5a96@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Mar 2019 21:35:09 -0700
Message-ID: <CAMKF1soJs2zMsPCNVC_wZTSHYobKuyDROwHAJ28NTW0w8qj6qQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [meta-networking][PATCH v2] wireshark: upgrade to 3.0.0
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
X-List-Received-Date: Mon, 11 Mar 2019 04:35:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 10, 2019 at 7:47 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 3/9/19 10:00 PM, Khem Raj wrote:
> > Hi Oleksandr
> >
> > I merged v1, can you rebase this on top of master and send the delta in
> > v3?
> Why this patch was taken when there was an objection and the issues did
> not get addresses?
>

patchwork fooled me into reapplying v1 instead of v2, somehow it did
not obsolete it.

> - armin
> >
> > On Sat, Mar 9, 2019 at 6:19 AM Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >>
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  .../0001-Add-libm-to-link-for-fmod-API.patch  | 29 -------------------
> >>  ...{wireshark_2.6.6.bb => wireshark_3.0.0.bb} | 21 +++-----------
> >>  2 files changed, 4 insertions(+), 46 deletions(-)
> >>  delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
> >>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb => wireshark_3.0.0.bb} (71%)
> >>
> >> diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch b/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
> >> deleted file mode 100644
> >> index e65ef9b10..000000000
> >> --- a/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
> >> +++ /dev/null
> >> @@ -1,29 +0,0 @@
> >> -From 1a6a5d2bcb1adec9ba138c2ebee7bbc994620aff Mon Sep 17 00:00:00 2001
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Tue, 12 Jun 2018 23:23:44 -0700
> >> -Subject: [PATCH] Add libm to link for fmod() API
> >> -
> >> -fixes
> >> -ld: CMakeFiles/tshark.dir/ui/cli/tap-comparestat.c.o: undefined reference to symbol 'fmod@@GLIBC_2.2.5'
> >> -| /mnt/a/oe/build/tmp/work/core2-64-bec-linux/wireshark/1_2.6.1-r0/recipe-sysroot/lib/libm.so.6: error adding symbols: DSO missing from command line
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - CMakeLists.txt | 1 +
> >> - 1 file changed, 1 insertion(+)
> >> -
> >> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> >> -index 7950e85..acee140 100644
> >> ---- a/CMakeLists.txt
> >> -+++ b/CMakeLists.txt
> >> -@@ -2494,6 +2494,7 @@ if(BUILD_tshark)
> >> -               ${LIBEPAN_LIBS}
> >> -               ${APPLE_CORE_FOUNDATION_LIBRARY}
> >> -               ${APPLE_SYSTEM_CONFIGURATION_LIBRARY}
> >> -+              m
> >> -       )
> >> -       set(tshark_FILES
> >> -               capture_opts.c
> >> ---
> >> -2.17.1
> >> -
> >> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> >> similarity index 71%
> >> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
> >> rename to meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> >> index 4699f6798..dc55e3de0 100644
> >> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
> >> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> >> @@ -8,26 +8,20 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
> >>
> >>  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
> >>
> >> -SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
> >> -           file://0001-Add-libm-to-link-for-fmod-API.patch \
> >> -          "
> >> +SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
> >>
> >>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
> >>
> >> -SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
> >> -SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
> >> +SRC_URI[md5sum] = "258d62ac7434d126dc497303c8f7961b"
> >> +SRC_URI[sha256sum] = "bc4f30f5b2e94f3a696fef9de44673cdf402db90aac5299966da647f708f009e"
> >>
> >>  PE = "1"
> >>
> >> -inherit cmake pkgconfig pythonnative perlnative upstream-version-is-even
> >> +inherit cmake pkgconfig python3native perlnative upstream-version-is-even
> >>
> >>  ARM_INSTRUCTION_SET = "arm"
> >>
> >> -# Options: gtk+, gtk+3 and qt5
> >> -GTK = "gtk+3"
> >> -
> >>  PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
> >> -PACKAGECONFIG_append_class-target = " ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
> >>
> >>  PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
> >>
> >> @@ -36,8 +30,6 @@ PACKAGECONFIG[libpcap] = "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DE
> >>  PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
> >>  PACKAGECONFIG[libnl] = ",,libnl"
> >>  PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
> >> -PACKAGECONFIG[gtk+] = "-DENABLE_GTK=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK=OFF, gtk+"
> >> -PACKAGECONFIG[gtk+3] = "-DENABLE_GTK3=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK3=OFF, gtk+3"
> >>  PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
> >>  PACKAGECONFIG[ssl] = ",,openssl"
> >>  PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF, krb5"
> >> @@ -79,16 +71,11 @@ do_install_append_class-target() {
> >>  }
> >>
> >>  PACKAGE_BEFORE_PN += "tshark"
> >> -PACKAGE_BEFORE_PN += "${PN}-gtk"
> >>
> >>  FILES_tshark = "${bindir}/tshark ${mandir}/man1/tshark.*"
> >> -FILES_${PN}-gtk = "${bindir}/wireshark-gtk ${datadir}/icons ${datadir}/appdata \
> >> -                   ${datadir}/applications ${datadir}/wireshark ${datadir}/mime \
> >> -                   ${mandir}/man1/wireshark.* "
> >>
> >>  FILES_${PN} += "${datadir}*"
> >>
> >>  RDEPENDS_tshark = "wireshark"
> >> -RDEPENDS_${PN}-gtk = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "${GTK}", "", d)} wireshark"
> >>
> >>  BBCLASSEXTEND = "native"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

