Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMqfr-00015t-Fz
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 00:56:36 +0200
Received: by iwn39 with SMTP id 39so496100iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 15:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9TwgLW23S8tMwnJE0XLTZXoWQuhJntJrofvkP0LJaFE=;
	b=epib6ewofrOkHkAG+4brLtA4Gs0kjP0tY0xTHwcyPkNW/wNZPp9pmRY1Mv7gOy22Qs
	1nT7OXi4aLRfHqvQZKfzzpyL72BUjd6TohwrccT54Kj3TleT46W2KL6pJKzRVpxpJaqW
	VXYYJGrVc7HIlH/P2MI+htTy6SbxZ5QTdLxH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=JbL/6ptSkOdn+4XxXn+K5PZRWBEzmXaJZ2mrLa8R3oJfu5YGE4XINo72KbcZMADrno
	nIYhuTqHdv9lv3to+Mlr5Fw+qJzYA5kiaI/lWvnQezQOCOIFMzH68NTco49zI6XyR9Aw
	PQwPRa0P1Kj0wxsdcLlX4LlLtOG6gAojAdkFw=
Received: by 10.231.168.135 with SMTP id u7mr894715iby.125.1276210332361; Thu, 
	10 Jun 2010 15:52:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Thu, 10 Jun 2010 15:51:52 -0700 (PDT)
In-Reply-To: <1276112911-30633-1-git-send-email-khimov@altell.ru>
References: <1276112911-30633-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jun 2010 15:51:52 -0700
Message-ID: <AANLkTinn0XMuK-3ByVHbCdSlSwvz9t_WyZJROC8jbQuL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] shadow: added new package shadow-group. Fix for build with uclibc.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jun 2010 22:56:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2010 at 12:48 PM, Roman I Khimov <khimov@altell.ru> wrote:
> From: Vladimir Sorokin <sorokin@altell.ru>
>
> shadow-group contains utilities (sg, newgrp, gpasswd) for groups manipula=
ting,
> useful when you only need things not provided by busybox.
>
> Signed-off-by: Vladimir Sorokin <sorokin@altell.ru>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
> =A0recipes/shadow/shadow.inc | =A0 32 +++++++++++++++++++++++++++++---
> =A01 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 460930b..97a2e19 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -13,7 +13,7 @@ DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam'=
, 'libpam', '', d)}"
>
> =A0PACKAGE_ARCH_${PN} =3D "${MACHINE_ARCH}"
>
> -INC_PR =3D "r14"
> +INC_PR =3D "r15"
>
> =A0# Additional Policy files for PAM
> =A0PAM_SRC_URI =3D " \
> @@ -42,8 +42,23 @@ EXTRA_OECONF +=3D "\
> =A0 =A0 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--wi=
thout-libpam', d)} \
> =A0"
>
> +EXTRA_OECONF_linux-uclibc +=3D "\
> + =A0 =A0--disable-account-tools-setuid \
> + =A0 =A0--disable-shadowgrp \
> + =A0 =A0--without-audit \
> + =A0 =A0--without-selinux \
> + =A0 =A0--without-libcrack \
> + =A0 =A0--without-nscd \
> + =A0 =A0${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--w=
ithout-libpam', d)} \
> +"
> +

use EXTRA_OECONF_libc-uclibc
current override linux-uclibc will not work for ARM and SPE machines.

> =A0CFLAGS +=3D "-I../include"
>
> +PACKAGES =3D+ "${PN}-group"
> +RDEPENDS_${PN} +=3D "${PN}-group"
> +
> +FILES_${PN}-group =3D "${bindir}/gpasswd ${bindir}/newgrp.shadow ${bindi=
r}/sg"
> +
> =A0do_configure_prepend () {
> =A0 =A0 export CONFIG_SITE=3D"${CONFIG_SITE} ${B}/cachedpaths"
> =A0 =A0 cat <<END >${B}/cachedpaths
> @@ -107,7 +122,6 @@ pkg_postinst_${PN} () {
> =A0 =A0 update-alternatives --install ${bindir}/passwd passwd passwd.${PN=
} 200
> =A0 =A0 update-alternatives --install ${sbindir}/chpasswd chpasswd chpass=
wd.${PN} 200
> =A0 =A0 update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
> - =A0 =A0update-alternatives --install ${bindir}/newgrp newgrp newgrp.${P=
N} 200
> =A0 =A0 update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
> =A0 =A0 update-alternatives --install ${base_bindir}/login login login.${=
PN} 200
> =A0 =A0 update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN=
} 200
> @@ -120,7 +134,19 @@ pkg_postinst_${PN} () {
> =A0}
>
> =A0pkg_prerm_${PN} () {
> - =A0 =A0for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
> + =A0 =A0for i in passwd chpasswd chfn chsh login vipw vigr ; do
> + =A0 =A0 =A0 =A0update-alternatives --remove $i $i.${PN}
> + =A0 =A0done
> +}
> +
> +pkg_postinst_${PN}-group () {
> + =A0 touch /etc/login.defs
> + =A0 update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} =
200
> +}
> +
> +pkg_prerm_${PN}-group () {
> + =A0 =A0for i in newgrp ; do
> =A0 =A0 =A0 =A0 update-alternatives --remove $i $i.${PN}
> =A0 =A0 done
> =A0}
> +
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


