Received: from [209.85.216.197] (helo=mail-px0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MgM0y-0003zr-Bz
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 19:10:28 +0200
Received: by pxi35 with SMTP id 35so254276pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OJsfONLrCdBPWm6L4By/yFEbK+EgX5PG3B7O+a4UZRo=;
	b=OGARuEDvIjryo0fAIgd8gPbD6E8vGcHoJoXerhYQflMdo/Wchx1ZlgRgiCiLBckx3Z
	I17yi3pxVT7nImnjENPl8DS+BPUXo6voPeCEf61cjKTE3bnsJ/mpGe5Zg0o+rTh8k9XX
	UgHnJYzsfZIqfWOY8QvtQv/XI3IrTlLpXLq+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=S/egeXcMSJbk0MmEiRY83B5lQOBAvuXBRhMA3pDHSRuX9ua+6FB+plHZGCL2Zp3ohc
	fa2Pln/a7bla/rDMhvmfWkr3aPYlLCMNhY0AIAlUI+xnkIX66bwoTGDipE0k4KEZbQB/
	4k59Dqy+qKHkewA1CuF82z8xK3qt4doUGfd8E=
Received: by 10.114.50.17 with SMTP id x17mr9208740wax.168.1251305546259;
	Wed, 26 Aug 2009 09:52:26 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id c26sm1231289waa.15.2009.08.26.09.52.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 09:52:24 -0700 (PDT)
Date: Wed, 26 Aug 2009 09:52:20 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826165220.GB31371@gmail.com>
References: <4A94E1CC.2090404@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4A94E1CC.2090404@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] enca_1.9.bb: remove unused configure test which is bound to fail.
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
X-List-Received-Date: Wed, 26 Aug 2009 17:10:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/08/09 16:48), Graham Gower wrote:
> Enca's configure will fail on everything not arm or ix86.
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> recipes/enca/enca_1.9.bb |    7 ++++++-
> site/arm-linux           |    3 ---
> site/ix86-common         |    3 ---
> 3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes/enca/enca_1.9.bb b/recipes/enca/enca_1.9.bb
> index 548a824..dbffe1e 100644
> --- a/recipes/enca/enca_1.9.bb
> +++ b/recipes/enca/enca_1.9.bb
> @@ -3,7 +3,7 @@ SECTION = "libs"
> PRIORITY = "optional"
> LICENSE = "GPLv2"
> HOMEPAGE = "http://trific.ath.cx/software/enca/"
> -PR = "r3"
> +PR = "r4"
> 
> SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}.tar.bz2 \
> 	file://configure-hack.patch;patch=1 \
> @@ -15,6 +15,11 @@ inherit autotools
> 
> EXTRA_OECONF="--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
> 
> +do_configure_prepend() {
> +	# remove failing test which checks for something that isn't even used
> +	sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' configure.ac
> +}

you may not require this hunk. see below

> +
> do_configure_append() {
> 	sed -i s:-I/usr/include::g Makefile
> 	sed -i s:-I/usr/include::g */Makefile
> diff --git a/site/arm-linux b/site/arm-linux
> index 4212728..18dfb38 100644
> --- a/site/arm-linux
> +++ b/site/arm-linux
> @@ -148,9 +148,6 @@ samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
> samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
> samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
> 
> -# enca
> -yeti_cv_func_scanf_modif_size_t=yes
> -

set this to 'no'

> # clamav
> clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
> clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
> diff --git a/site/ix86-common b/site/ix86-common
> index a5c4b60..b7a503f 100644
> --- a/site/ix86-common
> +++ b/site/ix86-common
> @@ -104,9 +104,6 @@ ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
> dpkg_cv_va_copy=${ac_cv_va_copy=no}
> dpkg_cv___va_copy=${ac_cv___va_copy=yes}
> 
> -# enca
> -yeti_cv_func_scanf_modif_size_t=yes
> -

same here.

> # ettercap
> ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
> 
> -- 
> 1.6.0.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


