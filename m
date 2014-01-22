Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 92CB86002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:40:47 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id i4so832573oah.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=2YG+29xOlGDeAmHjBXNqsrHX7gOLy8NU/tNt+NWVygU=;
	b=SPZ5Oj0Bav1BNUb/KjnlsUCa0KW0U6sU4+2uqWErbHMThQ4uDmML9FetO32YHtb9AT
	PBwI+AC0NuSMBMO8otU77AdhPQ21fcmuZM1tbKZTbtqwgcyUgGNms/rWEyd1opmffUvI
	tvChgJ+x4BOW1skIazgchJFijNlLkgNteM8eCv+7G8uzcB/MS7vABC+Dg/8LT5qL01z9
	hGtdsQ51qiqnj2gd4LxDn5VO6mKZ9lA+LAx08L9d5LTeGADMrOYL60JTgfZEvFCk3fjs
	LyYVeLwvzL42xuy9Wojgtdr2yiNik6JBRDxCjnjyBeDSLXXD0OIARMVBK4XEtV+ymXVx
	hMxA==
X-Gm-Message-State: ALoCoQlhajS2h/jhukyB9WlHELuUoJOjT6g+cpQv7Z49S7wuzACqemm2KmybWBU3eGIjjuLpi+MM
X-Received: by 10.182.157.114 with SMTP id wl18mr2445877obb.52.1390412448139; 
	Wed, 22 Jan 2014 09:40:48 -0800 (PST)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id h4sm42396628oel.3.2014.01.22.09.40.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 09:40:47 -0800 (PST)
Message-ID: <52E0029D.2000507@felipetonello.com>
Date: Wed, 22 Jan 2014 09:40:45 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1390230519-21756-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1390230519-21756-1-git-send-email-obi@opendreambox.org>
Subject: Re: [meta-oe][PATCH] libconnman-qt: update to 1.0.46, add recipe for qte
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
X-List-Received-Date: Wed, 22 Jan 2014 17:40:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 01/20/2014 07:08 AM, Andreas Oberritter wrote:
> * Use _git version suffix, because it really is a Git recipe.
> * Create an inc file to be shared between qt4x11 and qt4e.
> * Use CONFIG+=notests, because CONFIG+=notest has no effect now.
> * Reorder some variables according to style guide.
> * Remove unneeded PROVIDES for ${PN}-plugin, which is already listed
>    in PACKAGES.
> * Hardcode branch to master, because no other branch exists upstream.
> * Simplify do_install.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>   .../{libconnman-qt_1.0.7.bb => libconnman-qt.inc}  | 61 +++++++++-------------
>   .../recipes-qt/libconnman-qt/libconnman-qt_git.bb  |  3 ++
>   .../recipes-qt/libconnman-qt/libconnman-qte_git.bb |  3 ++
>   3 files changed, 30 insertions(+), 37 deletions(-)
>   rename meta-oe/recipes-qt/libconnman-qt/{libconnman-qt_1.0.7.bb => libconnman-qt.inc} (65%)
>   create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_git.bb
>   create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
>
> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> similarity index 65%
> rename from meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> rename to meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> index 2288c4f..e4f68db 100644
> --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> @@ -1,66 +1,53 @@
>   DESCRIPTION = "Qt Library for ConnMan"
>   HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
> +SECTION = "qt/lib"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
> +SRCREV = "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
> +PV = "1.0.46+git${SRCPV}"
>
> -SECTION = "qt/lib"
> -
> -
> -inherit qt4x11 pkgconfig
> -
> -RDEPENDS_${PN} = "connman"
> -RDEPENDS_${PN}-plugin = "${PN}"
> -
> -PROVIDES += "${PN}-plugin"
> -
> -PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
> -RRECOMMENDS_${PN} = "${PN}-plugin"
> -
> -BRANCH = "master"
> -SRCREV = "6a5e4f981112a90a8c19d82bd671da389d2af993"
> -
> -SRC_URI = " \
> -    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
> -"
> +SRC_URI = "git://github.com/nemomobile/libconnman-qt.git;branch=master"
>
>   S = "${WORKDIR}/git"
>
> -QT_IMPORTS_DIR = "${libdir}/qt4/imports"
> -# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
> -PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
> +inherit pkgconfig
>
> -EXTRA_QMAKEVARS_PRE = " \
> -    CONFIG+=notest \
> -"
> +EXTRA_QMAKEVARS_PRE = "CONFIG+=notests"
>
>   do_configure_prepend() {
>       # Hack *.pro variables
>       find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
>   }
> -
>   do_install() {
> -    export INSTALL_ROOT=${D}
> -    oe_runmake install
> +    oe_runmake install INSTALL_ROOT=${D}

Are you sure this works with dash? Because the reason why I did the 
previous was to work in dash as well.

>   }
>
> +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
> +
> +RDEPENDS_${PN} = "connman"
> +RDEPENDS_${PN}-plugin = "${PN}"
> +
> +RRECOMMENDS_${PN} = "${PN}-plugin"
> +
>   FILES_${PN} = " \
> -    ${libdir}/libconnman-qt4${SOLIBS} \
> +    ${libdir}/libconnman-qt*${SOLIBS} \
>   "
> -
>   FILES_${PN}-dev = " \
> -    ${includedir}/connman-qt/* \
> -    ${libdir}/libconnman-qt4${SOLIBSDEV} \
> -    ${libdir}/libconnman-qt4.prl \
> -    ${libdir}/pkgconfig/connman-qt4.pc \
> -    ${libdir}/connman-qt4.pc \
> +    ${includedir}/connman-qt*/* \
> +    ${libdir}/libconnman-qt*${SOLIBSDEV} \
> +    ${libdir}/libconnman-qt*.prl \
> +    ${libdir}/pkgconfig/connman-qt*.pc \
> +    ${libdir}/connman-qt*.pc \
>   "
> -
>   FILES_${PN}-plugin = " \
>       ${PLUGINS_TARGET}/qmldir \
>       ${PLUGINS_TARGET}/lib*.so \
>   "
> -
>   FILES_${PN}-plugin-dbg = " \
>       ${PLUGINS_TARGET}/.debug \
>       ${PLUGINS_TARGET}/.debug/* \
>   "
> +
> +QT_IMPORTS_DIR = "${libdir}/qt4/imports"

Doesn't Qt4 Embedded uses ${libdir}/qte/imports?

Felipe

