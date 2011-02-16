Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqQD-0003SR-NW
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:04:34 +0100
Received: by pwi8 with SMTP id 8so314548pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=+7T5DYQPxec0VnFb3pM/5xyHbyPIgxfstPAkGF+fCaA=;
	b=bJLYcGDN4CNQlLAQt1d6mhw26u3Zrie8H4xl5WEICX77E+P+uAOYtMyTIEGTKknL/v
	H24AHdgpw4PVdSwBxMuoKW3ca8NFivDfrTqsyxcJK5ug+VnVPSWU7wuh5bHNDXHRpoYo
	J3kPotdYPPBJ4oVPzI27IBz2tKg9dHl/aWoJY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=WYceq8+x4ZLzuCBOEAK3jnt2vhJ0o0+FIPgWSRJKWNg1RtL0ZdqSrIGHqM5V5EHNpf
	XTo7hGy6indldsn5AgIyHXISmNUDYZ5zDLYFO/JxCV1iIiZPrjE+fL9C8yx9cRtHWkDB
	Ah8rAXYTfHVdRZaM+spwzsaBISNn93ygb6W3c=
Received: by 10.142.51.8 with SMTP id y8mr924048wfy.183.1297897398837;
	Wed, 16 Feb 2011 15:03:18 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm331902wfh.18.2011.02.16.15.03.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:03:17 -0800 (PST)
Date: Wed, 16 Feb 2011 15:03:20 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216230320.GP14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 01/13] xkeyboard-config: avoid recipe code duplication and depends on intltool-native
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
X-List-Received-Date: Wed, 16 Feb 2011 23:04:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 11:18), Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes/xkeyboard-config/xkeyboard-config.inc    |   18 ++++++++++++++++++
>  recipes/xkeyboard-config/xkeyboard-config_1.4.bb |   18 +++---------------
>  recipes/xkeyboard-config/xkeyboard-config_1.8.bb |   18 +++---------------
>  recipes/xkeyboard-config/xkeyboard-config_git.bb |   17 +++--------------
>  4 files changed, 27 insertions(+), 44 deletions(-)
>  create mode 100644 recipes/xkeyboard-config/xkeyboard-config.inc
> 
> diff --git a/recipes/xkeyboard-config/xkeyboard-config.inc b/recipes/xkeyboard-config/xkeyboard-config.inc
> new file mode 100644
> index 0000000..a236cd5
> --- /dev/null
> +++ b/recipes/xkeyboard-config/xkeyboard-config.inc
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Common X11 Keyboard layouts"
> +LICENSE = "MIT"
> +DEPENDS = "intltool-native xkbcomp-native"
> +RDEPENDS_${PN} = "xkbcomp"
> +INC_PR = "r6"
> +
> +SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools
> +
> +do_install_append () {
> +    install -d ${D}/usr/share/X11/xkb/compiled

whynot use meta vars for datadir instead of hardcoding /usr/share ?
like below :)

> +    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> +}
> +
> +FILES_${PN} += "${datadir}/X11/xkb"
> diff --git a/recipes/xkeyboard-config/xkeyboard-config_1.4.bb b/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
> index 3bca763..d8b9e3f 100644
> --- a/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
> +++ b/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
> @@ -1,20 +1,8 @@
> -DESCRIPTION = "Common X11 Keyboard layouts"
> -LICENSE = "MIT"
> -DEPENDS = "intltool xkbcomp-native"
> -RDEPENDS_${PN} = "xkbcomp"
> -PR = "r5"
> +require xkeyboard-config.inc
>  
> -SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2 \
> -           file://abnt2-fixes.patch"
> +PR = "${INC_PR}.0"
>  
> -inherit autotools
> -
> -do_install_append () {
> -    install -d ${D}/usr/share/X11/xkb/compiled
> -    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> -}
> -
> -FILES_${PN} += "${datadir}/X11/xkb"
> +SRC_URI += "file://abnt2-fixes.patch"
>  
>  SRC_URI[md5sum] = "a9fe7efbc67a6966c4d4501f0cf88073"
>  SRC_URI[sha256sum] = "921a857dcf90a59df7feb26da5aabcf0bbfb749c46e2a46c3bc7a0280b83b0e1"
> diff --git a/recipes/xkeyboard-config/xkeyboard-config_1.8.bb b/recipes/xkeyboard-config/xkeyboard-config_1.8.bb
> index fbf4f1d..fdeb667 100644
> --- a/recipes/xkeyboard-config/xkeyboard-config_1.8.bb
> +++ b/recipes/xkeyboard-config/xkeyboard-config_1.8.bb
> @@ -1,20 +1,8 @@
> -DESCRIPTION = "Common X11 Keyboard layouts"
> -LICENSE = "MIT"
> -DEPENDS = "intltool xkbcomp-native"
> -RDEPENDS_${PN} = "xkbcomp"
> -PR = "r0"
> +require xkeyboard-config.inc
>  
> -SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2 \
> -           file://abnt2-fixes.patch"
> +PR = "${INC_PR}.0"
>  
> -inherit autotools
> -
> -do_install_append () {
> -    install -d ${D}/usr/share/X11/xkb/compiled
> -    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> -}
> -
> -FILES_${PN} += "${datadir}/X11/xkb"
> +SRC_URI += "file://abnt2-fixes.patch"
>  
>  SRC_URI[md5sum] = "37ae41628cd2ce35d202d30b1820c8ba"
>  SRC_URI[sha256sum] = "7dc3e6ca00adb105f46e40f8382e83d50b3fcd626bc8654293dae8b1e80506ce"
> diff --git a/recipes/xkeyboard-config/xkeyboard-config_git.bb b/recipes/xkeyboard-config/xkeyboard-config_git.bb
> index b92bdc1..ac8d03f 100644
> --- a/recipes/xkeyboard-config/xkeyboard-config_git.bb
> +++ b/recipes/xkeyboard-config/xkeyboard-config_git.bb
> @@ -1,20 +1,9 @@
> -DESCRIPTION = "Common X11 Keyboard layouts"
> -LICENSE = "MIT"
> -DEPENDS = "intltool xkbcomp-native"
> -RDEPENDS_${PN} = "xkbcomp"
> +require xkeyboard-config.inc
> +
>  SRCREV = "547ae8589afb208d7b44ffe1e0ff7aba466c2ee3"
>  PV = "2.0+gitr${SRCPV}"
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI = "git://anongit.freedesktop.org/xkeyboard-config;protocol=git;branch=master"
>  
>  S = "${WORKDIR}/git"
> -
> -inherit autotools
> -
> -do_install_append () {
> -    install -d ${D}/usr/share/X11/xkb/compiled
> -    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> -}
> -
> -FILES_${PN} += "${datadir}/X11/xkb"
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


