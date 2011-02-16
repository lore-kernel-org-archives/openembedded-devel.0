Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqX8-0003yn-3W
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:11:46 +0100
Received: by yie16 with SMTP id 16so840622yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=m5JY7gCs2uuwleNX2mGQ3p0HHjOw3Zrvgh9tBQWDcJc=;
	b=A3EEK+XI01Ohs3DXTUfn+k6ZiBN6usjHrxiupduvQeWRU/gZMGukHi1c80GTchJqiH
	ZWYYVb3RM8pbGwF/F+BoPahFnvodwgtf2R7sFvtccEN9wD03QYjbMzl+rG30VLjsqsgo
	RJyxKeHfMmXTj8LbtngqCuGZH83Izi5rF9nWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=QBbLzJFgiQHBASVi9hqSK4MfPaRQxYFX120EYMNePqyIkkFPF7OzEAQBk+nCQES518
	wikekK9lxfwP2LK7IhFI1I0FRXcIeN8eHhWuhmIxzAmLtoMRlautByPH8A88wzJl9TJO
	nxZifL3wjhF9LhaJ2R6yAgjqekp1LYffWV9Aw=
Received: by 10.151.155.2 with SMTP id h2mr1475450ybo.170.1297897829620;
	Wed, 16 Feb 2011 15:10:29 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u3sm3568474yba.16.2011.02.16.15.10.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:10:28 -0800 (PST)
Date: Wed, 16 Feb 2011 15:10:31 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216231031.GU14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-10-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1297855134-19216-10-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 10/13] qt4-tools-sdk: use host include headers for dbus
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
X-List-Received-Date: Wed, 16 Feb 2011 23:11:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 11:18), Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/qt4/qt4-tools-sdk.inc |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/qt4/qt4-tools-sdk.inc b/recipes/qt4/qt4-tools-sdk.inc
> index ad896e4..bd70046 100644
> --- a/recipes/qt4/qt4-tools-sdk.inc
> +++ b/recipes/qt4/qt4-tools-sdk.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://www.trolltech.com"
>  PRIORITY = "optional"
>  LICENSE = "LGPLv2.1 GPLv3"
>  
> -INC_PR = "r2"
> +INC_PR = "r3"
>  
>  FILESPATHPKG =. "qt-${PV}:"
>  inherit sdk
> @@ -32,9 +32,9 @@ EXTRA_OECONF = "-prefix ${prefix} \
>                  -verbose -release -fast -static \
>                  -embedded -no-freetype -no-glib -no-iconv \
>                  -qt3support \
> -                -I${STAGING_DIR_NATIVE}/usr/include \
> -                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
> -                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
> +                -I${STAGING_DIR}/${HOST_SYS}${target_includedir} \
> +                -I${STAGING_DIR}/${HOST_SYS}${target_includedir}/dbus-1.0 \
> +                -I${STAGING_DIR}/${HOST_SYS}${target_libdir}/dbus-1.0/include"
>  
>  # yank default -e, otherwise we get the following error:
>  # moc_qbuffer.cpp: No such file or directory
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


