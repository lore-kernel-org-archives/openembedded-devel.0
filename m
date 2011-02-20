Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pqxqx-0004VM-FT
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 02:12:48 +0100
Received: by iyj8 with SMTP id 8so4715870iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 17:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=o9lA6s2O5ySCqXMYKM7iNfAl6U+AYO+xtRTIr30hs5Q=;
	b=tST/vfUSnd2UEmz46xmyL6w5eWY5U7fZaAnZMSSJfFLuaLgOB8ZfEWgdQ/qsEBzVNM
	daiC4MYazdB8GusYtNICGyhULopMTX9ygbiAkik3+zx5LgoAdD0nsPyEWRJ573wMxB8S
	uH27jjP3DHpeyp8p6fOMwdh8Ns0tKlknvVQmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=rCd/scULiaCEWBVWnbO7JdU8ftMC8ehvJR1IB9y9YugSusuWOt7wl1zZIycEGpHI+L
	LQM+hqqMRSieBgWwD23zbyf03qJ0HMpZ8BInsMyMidQF/GWcaGuyn5EJozSIK1kmLJo/
	Ye2hkEYHzt7mVlZ9wY1lCdraAqbwSYaWmJFmQ=
Received: by 10.231.169.208 with SMTP id a16mr1783001ibz.45.1298164291487;
	Sat, 19 Feb 2011 17:11:31 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id gy41sm3401698ibb.5.2011.02.19.17.11.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Feb 2011 17:11:30 -0800 (PST)
Date: Sat, 19 Feb 2011 17:11:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110220011124.GA3451@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
	<1298158249-10217-1-git-send-email-filip.zyzniewski@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1298158249-10217-1-git-send-email-filip.zyzniewski@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv2] package_deb.bbclass/apt: armel architecture name for eabi systems.
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
X-List-Received-Date: Sun, 20 Feb 2011 01:12:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/02/11 00:30), Filip Zyzniewski wrote:
> For dpkg EABI system architecture is called armel, not arm.
> Reference: http://wiki.debian.org/ArmEabiPort
> 
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
> ---
>  classes/package_deb.bbclass |    2 ++
>  recipes/apt/apt_0.7.20.2.bb |   13 ++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
> index 60e759d..87f31fa 100644
> --- a/classes/package_deb.bbclass
> +++ b/classes/package_deb.bbclass
> @@ -15,6 +15,8 @@ DPKG_ARCH_i486 ?= "i386"
>  DPKG_ARCH_i586 ?= "i386"
>  DPKG_ARCH_i686 ?= "i386"
>  DPKG_ARCH_pentium ?= "i386"
> +DPKG_ARCH_linux-gnueabi ?= "armel"
> +DPKG_ARCH_linux-uclibceabi ?= "armel"

this seems ok 

>  
>  python package_deb_fn () {
>      bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
> diff --git a/recipes/apt/apt_0.7.20.2.bb b/recipes/apt/apt_0.7.20.2.bb
> index 5c932a5..c8a3516 100644
> --- a/recipes/apt/apt_0.7.20.2.bb
> +++ b/recipes/apt/apt_0.7.20.2.bb
> @@ -7,12 +7,23 @@ SRC_URI += "file://no-doxygen.patch \
>              file://no-ko-translation.patch \
>              file://fix-gcc-4.4-compile.patch \
>              file://use-host.patch "
> -PR = "r3"
> +PR = "r4"
>  
>  require apt-package.inc
>  
>  FILES_${PN} += "${bindir}/apt-key"
>  
> +do_configure_append_linux-gnueabi() {
> +	sed -i \
> +	's:^#define COMMON_ARCH "arm"$:#define COMMON_ARCH "armel":' \
> +		${S}/include/config.h
> +}
> +
> +do_configure_append_linux-uclibceabi() {
> +	do_configure_append_linux-gnueabi()
> +}
> +
> +

did you test the above calls ? I think these append should be defined
individually i.e. duplicate them

>  do_stage() {
>  	install -d ${STAGING_LIBDIR} ${STAGING_INCDIR}/apt-pkg
>  	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`

while at it please get rid of do_stage
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


