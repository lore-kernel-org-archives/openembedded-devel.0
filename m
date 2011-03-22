Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2Ad5-0001tl-H8
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 00:04:47 +0100
Received: by iyb26 with SMTP id 26so8278946iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=VNnbYX9DTXTeo44kZ6tu6iId8FCF8HUJhB/K9t9xYnM=;
	b=mpNmOTbFoIPbDUwmwHufiALan1RgcOkK+gGuYJZIyYyZiQqJGV3SjUVIkxjjk3/mJu
	swgj6p3JOpk6fJTDO6NopfcNmMkHJfJGf7Ftjc0XPlANeNMy+2IglkSU+iGEBvnl4ltm
	wtOgU6CxHJ36kcFCEidzucYjBKBL1H7fcL4ys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=APse35VD2aXPwnjVeGq1wVpzmwKzWTkAMCpPUMcdvGYJzlwzbi63ux32Y39g/IdIhw
	Fw8gPWKMcCmHYcs9Hyprc0wJ0gxhoXnwJTmSkTQjPusxrlbLNxZsZ9tc1hEigPEDKg06
	32usZJCa3UXjA3QeoOdNuf+BCtaHRAV3PsRS0=
Received: by 10.42.5.81 with SMTP id 17mr9901819icv.130.1300834976743;
	Tue, 22 Mar 2011 16:02:56 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 19sm4670390ibx.52.2011.03.22.16.02.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 16:02:55 -0700 (PDT)
Date: Tue, 22 Mar 2011 16:03:12 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322230312.GC13076@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20110322173359.GB10685@rhein.zuhause.netz>
	<1300832261-14946-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1300832261-14946-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] evas, pango, llvm-native: drop empty PACKAGES_DYNAMIC_virtclass-native as it's in native.bbclass now
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
X-List-Received-Date: Tue, 22 Mar 2011 23:04:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 23:17), Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes/efl1/evas.inc        |    1 -
>  recipes/llvm/llvm-native.inc |    2 --
>  recipes/pango/pango.inc      |    1 -
>  3 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
> index bcb1984..0310667 100644
> --- a/recipes/efl1/evas.inc
> +++ b/recipes/efl1/evas.inc
> @@ -28,7 +28,6 @@ do_install_append() {
>  FILES_${PN}-dev += "${libdir}/evas/modules/*/*/*/*.a ${libdir}/evas/modules/*/*/*/*.la"
>  FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/"
>  
> -PACKAGES_DYNAMIC_virtclass-native = ""
>  PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-*"
>  
>  RRECOMMENDS_${PN} = " \
> diff --git a/recipes/llvm/llvm-native.inc b/recipes/llvm/llvm-native.inc
> index b3cb7a6..216b03d 100644
> --- a/recipes/llvm/llvm-native.inc
> +++ b/recipes/llvm/llvm-native.inc
> @@ -19,8 +19,6 @@ EXTRA_OECMAKE = "\
>  
>  PACKAGES = ""
>  
> -PACKAGES_DYNAMIC = ""
> -
>  do_stage() {
>    cd ${OECMAKE_BUILDPATH}
>  
> diff --git a/recipes/pango/pango.inc b/recipes/pango/pango.inc
> index c54fbad..2e0f199 100644
> --- a/recipes/pango/pango.inc
> +++ b/recipes/pango/pango.inc
> @@ -14,7 +14,6 @@ DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
>  BBCLASSEXTEND = "native"
>  
>  PACKAGES_DYNAMIC = "pango-module-*"
> -PACKAGES_DYNAMIC_virtclass-native = ""
>  
>  RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
>  RRECOMMENDS_${PN}_virtclass-native = ""

Acked-by: Khem Raj <raj.khem@gmail.com>

> -- 
> 1.7.4.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


