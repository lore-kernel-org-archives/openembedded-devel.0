Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D39D37067B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 06:35:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s836ZPRb001027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Sep 2014 23:35:25 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 2 Sep 2014 23:35:25 -0700
Message-ID: <5406B6A9.7000706@windriver.com>
Date: Wed, 3 Sep 2014 14:35:21 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1409725382-16488-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1409725382-16488-1-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-virtualization][PATCH] lxc: fix RDEPENDS on bash
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
X-List-Received-Date: Wed, 03 Sep 2014 06:35:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one, I will resend.

//Chong

On 09/03/2014 02:23 PM, Chong Lu wrote:
> Split a ${PN}-template pkg to put ${datadir}/lxc/templates/, and debash in
> ${datadir}/lxc/hooks/*
>
> Bash scripts:
> lxc/usr/share/lxc/hooks/mountcgroups:#!/bin/bash
> lxc/usr/share/lxc/hooks/ubuntu-cloud-prep:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-debian:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-openmandriva:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-archlinux:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-centos:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-plamo:1:#!/bin/bash -eu
> lxc/usr/share/lxc/templates/lxc-ubuntu-cloud:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-opensuse:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-gentoo:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-altlinux:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-sshd:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-ubuntu:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-cirros:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-busybox:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-fedora:1:#!/bin/bash
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   recipes-containers/lxc/lxc_1.0.5.bb |   11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.5.bb b/recipes-containers/lxc/lxc_1.0.5.bb
> index bea1ad0..7c83bc7 100644
> --- a/recipes-containers/lxc/lxc_1.0.5.bb
> +++ b/recipes-containers/lxc/lxc_1.0.5.bb
> @@ -37,10 +37,11 @@ S = "${WORKDIR}/${BPN}-${PV}"
>   PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
>   EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>   
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "templates"
>   PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
>   PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
>   PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> +PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>   
>   inherit autotools pkgconfig ptest
>   
> @@ -48,6 +49,9 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
>   # For LXC the docdir only contains example configuration files and should be included in the lxc package
>   FILES_${PN} += "${docdir}"
>   FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> +PACKAGES =+ "${PN}-templates"
> +FILES_${PN}-templates += "${datadir}/lxc/templates"
> +RDEPENDS_${PN}-templates += "bash"
>   
>   PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
>   
> @@ -57,8 +61,9 @@ do_install_append() {
>   	rm -rf ${D}${localstatedir}/cache
>   	install -d ${D}${sysconfdir}/default/volatiles
>   	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
> -	     > ${D}${sysconfdir}/default/volatiles/99_lxc
> -
> +	    > ${D}${sysconfdir}/default/volatiles/99_lxc
> +	for i in `grep -l "bash" ${D}${datadir}/lxc/hooks/*`; do \
> +	    sed -e 's|bash|sh|' -i $i; done
>   }
>   
>   EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"


