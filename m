Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMLEA-0003IP-G5
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:21:55 +0200
Received: by pwj4 with SMTP id 4so2450740pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ZOSXxCs6Ql74OAalML5+70WF8AMKVb4eCtD3C+xSunQ=;
	b=hoyBZ+myg+8yEKxnud8WaP1JJLskheaxMpFs+lEnaLDsdE+TvXCS1HgKPQ0nHMHxxH
	JlA4N4h8XeS6Hxeb9P/oMbwa/oqFAtj8p9QH5IOHEU0h3W5r19qLJuVKyEKX2V27SQMY
	yPyQtEHiCGDPutLHEpJSmLzcaHYGqxNh1AplM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=M7kZu6tAR41pJJtxKBvclSJx1/+K+aNSgldHUgUkIqwdcNAoYeb86j3mxopUFxRFSH
	ZoLFUKkhF3k8Fywm0TU+BStXeVJgRmll6FyoqRwPpNnSUSWDlIc9dz7Ld+uEsuHiPquk
	HsE5FJGMdo7t4PrGnYioadjQhnEffS5oXyI5M=
Received: by 10.115.116.5 with SMTP id t5mr983991wam.77.1276089451432;
	Wed, 09 Jun 2010 06:17:31 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f11sm64239484wai.11.2010.06.09.06.17.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 06:17:28 -0700 (PDT)
Date: Wed, 9 Jun 2010 06:17:37 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609131737.GA29724@gmail.com>
References: <alpine.LNX.2.00.1006072115450.5274@asterix.crazy-teaparty.dyndns.org>
	<1276085639-26941-1-git-send-email-vjensen@gmx.de>
MIME-Version: 1.0
In-Reply-To: <1276085639-26941-1-git-send-email-vjensen@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: Re: [PATCH][STABLE] gcc-pacpake-cross.inc: Clean up do_install function massively (from Poky)
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
X-List-Received-Date: Wed, 09 Jun 2010 13:21:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/06/10 14:13), Vitus Jensen wrote:
> This fixes floating-point problems on machine n1200 and others caused by
> installing softfloat libraries while the toolchain creates hardfloat
> programs.
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>

looks ok.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/gcc/gcc-package-cross.inc |   81 +++++++++++++-----------------------
>  1 files changed, 29 insertions(+), 52 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
> index 77da3fe..b205b8c 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -18,58 +18,35 @@ FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
>  do_install () {
>  	oe_runmake 'DESTDIR=${D}' install
>  
> -	# Move libgcc_s into /lib
> -        mkdir -p ${D}${target_base_libdir}
> -        if [ -f ${D}${target_base_libdir}/libgcc_s.so.? ]; then
> -                # Already in the right location
> -                :
> -        elif [ -f ${D}${prefix}/lib/libgcc_s.so.? ]; then
> -                mv -f ${D}${prefix}/lib/libgcc_s.so* ${D}${target_base_libdir} || true
> -
> -        elif [  -f ${D}${prefix}/*/lib/nof/libgcc_s.so.? ]; then
> -                mv -f ${D}${prefix}/*/lib/nof/libgcc_s.so* ${D}${target_base_libdir}
> -        else
> -                mv -f ${D}${prefix}/*/lib/libgcc_s.so* ${D}${target_base_libdir} || true 
> -        fi
> -
> -
> -
> -	# Move libstdc++ and libg2c into libdir (resetting our prefix to /usr
> -        mkdir -p ${D}${target_libdir}
> -
> -        if [ -f ${D}${prefix}/*/lib/nof/libstdc++.so ]; then
> -
> -           mv -f ${D}${prefix}/*/lib/nof/libstdc++.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/nof/libg2c.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/nof/libgfortran*.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/nof/libssp*.so* ${D}${target_libdir} || true 	
> -
> -        else
> -           mv -f ${D}${prefix}/*/lib/libstdc++.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/libg2c.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/libgfortran*.so* ${D}${target_libdir} || true
> -           mv -f ${D}${prefix}/*/lib/libssp*.so* ${D}${target_libdir} || true
> -        fi
> -
> -
> +	install -d ${D}${target_base_libdir}
> +	install -d ${D}${target_libdir}
> +
> +	for d in ${TARGET_SYS}/lib/nof ${TARGET_SYS}/lib64 ${TARGET_SYS}/lib; do
> +		if [ -d ${D}${prefix}/$d/ ]; then
> +			mv -f ${D}${prefix}/$d/libgcc* ${D}${target_base_libdir} || true
> +			mv -f ${D}${prefix}/$d/* ${D}${target_libdir} || true
> +		fi
> +	done
> +
> +	# Manually run the target stripper since we won't get it run by
> +	# the packaging.
> +	if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
> +		${TARGET_PREFIX}strip ${D}${target_libdir}/libstdc++.so.*
> +		${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
> +		${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
> +		${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.so* || true
> +	fi
>  
> -       # Manually run the target stripper since we won't get it run by
> -       # the packaging.
> -       if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
> -               ${TARGET_PREFIX}strip ${D}${target_libdir}/libstdc++.so.*
> -               ${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
> -               ${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
> -               ${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.so* || true
> +	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
> +	# gfortran is fully backwards compatible. This is a safe and practical solution.
> +	if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
> +		currdir="$PWD"
> +		cd ${CROSS_DIR}/bin/
> +		ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
> +		if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then
> +			cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> +			ln -sf gfortran g77 || true
> +		fi
> +		cd $currdir
>  	fi
> -     
> -       # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
> -       # gfortran is fully backwards compatible. This is a safe and practical solution.
> -       if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
> -              currdir="$PWD"
> -              cd ${CROSS_DIR}/bin/
> -              ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
> -              cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> -              ln -sf gfortran g77 || true
> -              cd $currdir
> -       fi
>  }
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


