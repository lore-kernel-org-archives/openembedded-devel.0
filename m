Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSUhu-0000dh-EE
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 14:42:04 +0200
Received: by fxm1 with SMTP id 1so2849456fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=AduWV0RbS7vNuDp1BHEERDysztVsyB8GtT/F7l0Uhi0=;
	b=jphAvgVm4/rzxJVv1dn49AB5Y1XeXyA7vVjbS5ZOgBP8XrqxJi+J2CG6kHJ0Gs87RV
	pPGkZJZnQPcG0gApBH0YCKS3kmDrsOkHyJ55OUr52u7+RRPRJG+3m7y33fCXIJEXW0SK
	feTYCcHx4TmkhwRb01nYrnMqaQvf/IOd8l8dk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=khk6Iu997QD5xMiZtFrxCElLTE2opNoN3Ama1iyHcWeJnOfwM7rxD0pC34b0MjRmEY
	0zc77doNsrG4PjvJY1pN79ug7J2wb7Xs7drSmTMyUCy4EvfrVKGKamnFT4tfwCU3w1mh
	UUJ/LXYh9J+kv70jjd060dLP5BNH7I5w93iY8=
Received: by 10.223.143.20 with SMTP id s20mr1664991fau.38.1277555843056;
	Sat, 26 Jun 2010 05:37:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o11sm40345444fal.19.2010.06.26.05.37.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Jun 2010 05:37:22 -0700 (PDT)
Date: Sat, 26 Jun 2010 14:37:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100626123700.GM17650@jama>
References: <E1OSU21-0002Hi-E6@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OSU21-0002Hi-E6@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : libdrm.inc: fix packaging regression that cause ${PN} to go from libdrm2 to libdrm
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
X-List-Received-Date: Sat, 26 Jun 2010 12:42:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 26, 2010 at 11:58:45AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 5f8da0c97cb5200d83483d4bbe1dc867e133dbbc
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=5f8da0c97cb5200d83483d4bbe1dc867e133dbbc
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Sat Jun 26 13:55:22 2010 +0200
> 
> libdrm.inc: fix packaging regression that cause ${PN} to go from libdrm2 to libdrm
> 
> ---
> 
>  recipes/dri/libdrm.inc |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/dri/libdrm.inc b/recipes/dri/libdrm.inc
> index eebd6b2..487eae6 100644
> --- a/recipes/dri/libdrm.inc
> +++ b/recipes/dri/libdrm.inc
> @@ -3,6 +3,11 @@ LICENSE = "MIT"
>  SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
>  PROVIDES = "drm"
>  
> -INC_PR = "r3"
> +INC_PR = "r4"
>  
>  inherit autotools pkgconfig
> +
> +PACKAGES =+ "${PN}-drivers"
> +FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
> +
> +LEAD_SONAME_${PN} = "libdrm.so"

Hi,

Just noticed the problem too and seems like this solution wasn't enough,
would you add ${PN}-kms package? Or do you have an idea why it ignored
LEAD_SONAME?

NOTE: Multiple libraries (libkms.so.1, libdrm.so.2) found and LEAD_SONAME not defined

Packaged contents of libdrm-drivers into
/home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm-glamo1_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk
Packaged contents of libdrm-dbg into
/home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm-dbg_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk
Packaged contents of libdrm into
/home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk
Packaged contents of libdrm-dev into
/home/shr/shr-unstable/tmp/deploy/ipk/armv4t/libdrm-dev_2.4.20+gitr4566+9411b0ca002b34d2d13a132038170c2e7b08945c-r4.0.5_armv4t.ipk

Regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


