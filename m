Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv0VW-0001mm-UC
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 05:51:23 +0100
Received: by pvc30 with SMTP id 30so102260pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 20:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=Qwi8aAIO/5zBbj1kJCj+Kcgt6cTwOmsDvO52q6KcwhU=;
	b=kQHFZy9yCbgWRFSQ+fgWSVuErw+xiwvA9S1Umri0MT66HRS5Kueo0VDwWgGKnYk8Z6
	plkL5SKdXpRV1OHbF9Nyr2CYa/u8sQUZugUz+idJw16HSPPFSem3qRwbatlWMRlsKgOW
	bHZb4Ep6hXmFIEl39YMYvgKSRclyp4/mNooa4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=Q67tyj4nDNvE+JLvgZ12dnko5wLmiAKCWPbasMayP/p4jeStZU0UdENqOz4tnQSEH8
	Z0cbkAEsGaDjNcw1FITfuFp+unwgisfk59AMOk2FtHinXaIq3ZkSZHRvoD4bwOr+VmAT
	BvGtyaNlYY8zoMC+3lmfonden8i1dt44hnzkA=
Received: by 10.142.44.17 with SMTP id r17mr490933wfr.223.1299127793457;
	Wed, 02 Mar 2011 20:49:53 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm890257wfl.23.2011.03.02.20.49.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 20:49:52 -0800 (PST)
Date: Wed, 2 Mar 2011 20:49:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110303044949.GE2692@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299108818-9224-1-git-send-email-tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1299108818-9224-1-git-send-email-tom_rini@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] samba: Add avahi to DEPEND / EXTRA_OECONF
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
X-List-Received-Date: Thu, 03 Mar 2011 04:51:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/03/11 16:33), Tom Rini wrote:
> avahi is currently an 'auto' thing so we should spell it out to
> be clear, set to on.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/samba/samba-ads_3.2.15.bb       |    2 +-
>  recipes/samba/samba-ads_3.3.9.bb        |    2 +-
>  recipes/samba/samba-ads_3.5.6.bb        |    2 +-
>  recipes/samba/samba-essential_3.0.20.bb |    2 +-
>  recipes/samba/samba.inc                 |    3 ++-
>  recipes/samba/samba_3.0.23c.bb          |    2 +-
>  recipes/samba/samba_3.0.34.bb           |    2 +-
>  recipes/samba/samba_3.2.15.bb           |    2 +-
>  recipes/samba/samba_3.3.0.bb            |    2 +-
>  recipes/samba/samba_3.3.9.bb            |    2 +-
>  recipes/samba/samba_3.5.6.bb            |    2 +-
>  11 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes/samba/samba-ads_3.2.15.bb b/recipes/samba/samba-ads_3.2.15.bb
> index 002bed7..1579f2c 100644
> --- a/recipes/samba/samba-ads_3.2.15.bb
> +++ b/recipes/samba/samba-ads_3.2.15.bb
> @@ -2,7 +2,7 @@ require samba.inc
>  require samba-ads.inc
>  LICENSE = "GPLv3"
>  
> -PR = "r2"
> +PR = "r3"
>  SRC_URI += "file://config-lfs.patch \
>              file://quota.patch;striplevel=0 \
>              file://configure-3.2.8.patch \
> diff --git a/recipes/samba/samba-ads_3.3.9.bb b/recipes/samba/samba-ads_3.3.9.bb
> index a498918..d28b0c9 100644
> --- a/recipes/samba/samba-ads_3.3.9.bb
> +++ b/recipes/samba/samba-ads_3.3.9.bb
> @@ -2,7 +2,7 @@ require samba.inc
>  require samba-ads.inc
>  LICENSE = "GPLv3"
>  
> -PR = "r3"
> +PR = "r4"
>  SRC_URI += "file://config-lfs.patch \
>              file://quota.patch;striplevel=0 \
>              file://configure-3.3.0.patch \
> diff --git a/recipes/samba/samba-ads_3.5.6.bb b/recipes/samba/samba-ads_3.5.6.bb
> index 1119c1b..cbbd7ac 100644
> --- a/recipes/samba/samba-ads_3.5.6.bb
> +++ b/recipes/samba/samba-ads_3.5.6.bb
> @@ -2,7 +2,7 @@ require samba.inc
>  require samba-ads.inc
>  LICENSE = "GPLv3"
>  
> -PR = "r3"
> +PR = "r4"
>  SRC_URI += "file://config-lfs.patch \
>              file://quota.patch;striplevel=0 \
>              file://configure-3.3.0.patch \
> diff --git a/recipes/samba/samba-essential_3.0.20.bb b/recipes/samba/samba-essential_3.0.20.bb
> index b775080..7b169e0 100644
> --- a/recipes/samba/samba-essential_3.0.20.bb
> +++ b/recipes/samba/samba-essential_3.0.20.bb
> @@ -1,7 +1,7 @@
>  require samba-essential.inc
>  inherit update-rc.d
>  
> -PR = "r8"
> +PR = "r9"
>  
>  SRC_URI = "file://config-lfs.patch \
>  	   file://init-essential \
> diff --git a/recipes/samba/samba.inc b/recipes/samba/samba.inc
> index e5fa06e..3c38de9 100644
> --- a/recipes/samba/samba.inc
> +++ b/recipes/samba/samba.inc
> @@ -1,6 +1,6 @@
>  SECTION = "console/network"
>  LICENSE = "GPL"
> -DEPENDS = "readline virtual/libiconv talloc"
> +DEPENDS = "readline virtual/libiconv talloc avahi"
>  
>  SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
>             file://volatiles.03_samba \
> @@ -28,6 +28,7 @@ EXTRA_OECONF='--disable-cups \
>                --with-readline=${STAGING_LIBDIR}/.. \
>                --with-libiconv=${STAGING_LIBDIR}/.. \
>                --without-automount \
> +              --enable-avahi \
>                --with-configdir=${sysconfdir}/samba \
>                --with-privatedir=${sysconfdir}/samba/private \
>                --with-lockdir=${localstatedir}/lock \
> diff --git a/recipes/samba/samba_3.0.23c.bb b/recipes/samba/samba_3.0.23c.bb
> index 27ff058..7c5d738 100644
> --- a/recipes/samba/samba_3.0.23c.bb
> +++ b/recipes/samba/samba_3.0.23c.bb
> @@ -4,7 +4,7 @@ require samba-basic.inc
>  SRC_URI += "file://configure.patch \
>              file://cifs.patch"
>  
> -PR = "r7"
> +PR = "r8"
>  
>  EXTRA_OECONF += "\
>  	--with-smbmount \
> diff --git a/recipes/samba/samba_3.0.34.bb b/recipes/samba/samba_3.0.34.bb
> index a5f9b26..05a4159 100644
> --- a/recipes/samba/samba_3.0.34.bb
> +++ b/recipes/samba/samba_3.0.34.bb
> @@ -5,7 +5,7 @@ SRC_URI += "file://configure.patch \
>              "
>  SRC_URI_append_libc-uclibc        = "file://uclibc-strlcpy-strlcat.patch"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  PACKAGES =+ " smbfs smbfs-doc"
>  
> diff --git a/recipes/samba/samba_3.2.15.bb b/recipes/samba/samba_3.2.15.bb
> index 214de58..fb35fe9 100644
> --- a/recipes/samba/samba_3.2.15.bb
> +++ b/recipes/samba/samba_3.2.15.bb
> @@ -9,7 +9,7 @@ SRC_URI += "file://configure-3.2.8.patch \
>  SRC_URI[md5sum] = "5a3bcc4927c9643b9f42970d0815b18f"
>  SRC_URI[sha256sum] = "84281fd1faeffee8558e49dff865dd382abbf78bc1be00f8cb5aa70aeea67d46"
>  
> -PR = "r4"
> +PR = "r5"
>  
>  EXTRA_OECONF += "\
>  	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
> diff --git a/recipes/samba/samba_3.3.0.bb b/recipes/samba/samba_3.3.0.bb
> index 6fab7dd..6385227 100644
> --- a/recipes/samba/samba_3.3.0.bb
> +++ b/recipes/samba/samba_3.3.0.bb
> @@ -13,7 +13,7 @@ SRC_URI += "file://configure-3.3.0.patch \
>              file://mtab.patch \
>              file://tdbheaderfix.patch "
>  
> -PR = "r3"
> +PR = "r4"
>  
>  EXTRA_OECONF += "\
>  	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
> diff --git a/recipes/samba/samba_3.3.9.bb b/recipes/samba/samba_3.3.9.bb
> index f8870ac..73c4cc9 100644
> --- a/recipes/samba/samba_3.3.9.bb
> +++ b/recipes/samba/samba_3.3.9.bb
> @@ -13,7 +13,7 @@ SRC_URI += "file://configure-3.3.0.patch \
>              file://mtab.patch \
>              file://tdbheaderfix.patch "
>  
> -PR = "r4"
> +PR = "r5"
>  
>  EXTRA_OECONF += "\
>  	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
> diff --git a/recipes/samba/samba_3.5.6.bb b/recipes/samba/samba_3.5.6.bb
> index 72bada9..23134a0 100644
> --- a/recipes/samba/samba_3.5.6.bb
> +++ b/recipes/samba/samba_3.5.6.bb
> @@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
>  SRC_URI += "file://config-h.patch \
>              file://tdbheaderfix.patch;apply=no"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  EXTRA_OECONF += "\
>  	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


