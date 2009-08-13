Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MbciT-0003LV-FS
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:59:50 +0200
Received: by pzk31 with SMTP id 31so679777pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RRfciSvOu/6uNfZg6941hri0uUrfbmU3D6C7rZfWrlY=;
	b=S2McCv0ibWoux+RbJ4lzK6OYZsPOsWyRDGmY2faUyQ6nZaGp4B6j3Zq5Iww9XIFJah
	oXtC2zQMjcTdqdpmAUQ5QOJui0OYm41+ItJyXG24iyxM52eZvgDzmm0U6/AmZdWxLsfY
	Wo7VsnCFGf13WTmi7KtVYdZinfN5wlmLB8U7o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=eYVxPOyemlSW6c1VsTQPlxgucFu/SPOLi7cgHMoNyzst2ZfivHBTlfo0E2RwVR2E0m
	h132HdmPUar5ZQM4rq7al3k3+uaKo/eE5rCkvct4pl1mXJf65fY0jHKAA9MIuXNc+BuD
	Y84AKbF0Tea12FNe0ziJe5N4m7IesH9BG48V8=
Received: by 10.115.18.16 with SMTP id v16mr1068128wai.84.1250178194841;
	Thu, 13 Aug 2009 08:43:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id m28sm703910waf.2.2009.08.13.08.43.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Aug 2009 08:43:14 -0700 (PDT)
Date: Thu, 13 Aug 2009 08:43:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090813154310.GB8906@gmail.com>
References: <1250175641-4869-1-git-send-email-msmith@cbnco.com>
	<1250175641-4869-2-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1250175641-4869-2-git-send-email-msmith@cbnco.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/4] gcc: fix libstdc/libgcc packaging on x86_64
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
X-List-Received-Date: Thu, 13 Aug 2009 15:59:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (13/08/09 11:00), Michael Smith wrote:
> do_install was looking under ${D}/some long cross path/*/lib;
> needs to be lib64 on x86_64. On x86_64 base_libdir would be set to
> /lib64, so we can go by that.

this one looks ok. you need to install same for 4.3.4 atleast.

> 
> Bump INC_PR for recent gccs (4.3.3, 4.4.1). Hopefully no one is using
> older gcc for x86_64.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/gcc/gcc-4.3.3.inc         |    2 +-
>  recipes/gcc/gcc-4.4.1.inc         |    2 +-
>  recipes/gcc/gcc-package-cross.inc |   13 ++++++++-----
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index 5802492..4a3cb49 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>  
>  DEPENDS = "mpfr gmp"
>  
> -INC_PR = "r5"
> +INC_PR = "r6"
>  
>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
> diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
> index a5b9d91..2759ab9 100644
> --- a/recipes/gcc/gcc-4.4.1.inc
> +++ b/recipes/gcc/gcc-4.4.1.inc
> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>  
>  DEPENDS = "mpfr gmp"
>  
> -INC_PR = "r1"
> +INC_PR = "r2"
>  
>  FILESPATHPKG .= ":gcc-$PV"
>  
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
> index fa1f47f..6c4f9bb 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -29,7 +29,9 @@ do_install () {
>          elif [  -f ${D}${prefix}/*/lib/nof/libgcc_s.so.? ]; then
>                  mv -f ${D}${prefix}/*/lib/nof/libgcc_s.so* ${D}${target_base_libdir}
>          else
> -                mv -f ${D}${prefix}/*/lib/libgcc_s.so* ${D}${target_base_libdir} || true 
> +                # Look for .../${TARGET_SYS}/lib/libgcc_s*
> +                # (or /lib64/, on x86_64)
> +                mv -f ${D}${prefix}/*/${target_base_libdir}/libgcc_s.so* ${D}${target_base_libdir} || true 
>          fi
>  
>  
> @@ -45,10 +47,11 @@ do_install () {
>             mv -f ${D}${prefix}/*/lib/nof/libssp*.so* ${D}${target_libdir} || true 	
>  
>          else
> -           mv -f ${D}${prefix}/*/lib/libstdc++.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/libg2c.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/libgfortran*.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/libssp*.so* ${D}${target_libdir} || true
> +           # Look for .../${TARGET_SYS}/lib/lib* (or /lib64/ on x86_64)
> +           mv -f ${D}${prefix}/*/${target_base_libdir}/libstdc++.so* ${D}${target_libdir} || true
> +           mv -f ${D}${prefix}/*/${target_base_libdir}/libg2c.so* ${D}${target_libdir} || true
> +           mv -f ${D}${prefix}/*/${target_base_libdir}/libgfortran*.so* ${D}${target_libdir} || true
> +           mv -f ${D}${prefix}/*/${target_base_libdir}/libssp*.so* ${D}${target_libdir} || true
>          fi
>  
>  
> -- 
> 1.6.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


