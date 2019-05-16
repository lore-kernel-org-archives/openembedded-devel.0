Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 540977DF0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 07:24:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 454NGl26Nwz7P;
	Thu, 16 May 2019 09:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557991487;
	bh=Ui68PSI7NnWyH4UWHvbLRcyHPUsN40qzk2fffreeWMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROjd0nQs7CWye/hl32Jm8vdNgVQSThtKKbYho/IZN+JKVUGtjW0T88O3FF7+xkv8/
	mkQ/C2vgFCJ0puTHwi6hzhWU2YOJ75ZQd7/ZIj4zOxX5Rr6zhMO2kPEDf5tuTCNwBj
	fVP33J9SnpQre75KNEGRyaXTp+0lUyasIObhZwE6Eion59ISoeHEfqdhXzPWovRNfJ
	NHZqeYqXQ1qVksEYYI76SyECt2S30FtdW4SP4SVyZGfzySab/RUwereDelRDZAY94l
	aVSFupyqtBHWQGcikA6pJYAjneAz8hdP3vsjrQ2CnaZz5eJuMWjM1Rm35kDNoW73l3
	v4bf7Si7tnFDjJkiMzFiwlPgA7igT3D/uThj7nhOB8LuAneXvscABW/vTeWmAwuuXP
	ILJ9ziQGxuwOWmZRSReS8hSKzSYvvba9eM3RoflX5jyUTg03wgePM/8Vxd8zje3SiA
	Pjk0bi8DRH3HMA9wd1Q4oEbpsQZpb+1XJfx0fMPkJTC6cSU4KJEidByhkQFBJAuBvc
	4dInoQaevMUSuGW0ezaDlVi7jK3j/I0DoeMa4p6qwRuW7+NjgE1EnieDRiyB75T+4q
	GS5sw1DUcrasI/jSATSpOt9jU9ujMvZCprrKR4+R773qH+2MAOlQ0QiX8KA1uvmzL1
	99mwi8p+ww6g5CHHhVIDyNlI=
Date: Thu, 16 May 2019 10:24:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190516072441.GA7938@localhost>
References: <20190516070624.27975-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190516070624.27975-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] gtkwave: add distro_features_check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2019 07:24:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 16, 2019 at 07:06:22AM +0000, Martin Jansa wrote:
> * fixes:
> ERROR: Nothing PROVIDES 'gtk+' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
> gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'gtk+']
> 
> and
> 
> ERROR: Nothing PROVIDES 'tk' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
> tk was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'tk']
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> index 60df6f773b..b9aae0f6c8 100644
> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> @@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
>  DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
>  RDEPENDS_${PN} = "tk-lib"
>  
> +# depends on gtk+ which has this restriction
> +inherit distro_features_check
> +ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>...

Shouldn't this be x11 (without the directfb alternative)
due to tk?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


