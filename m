Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MmDf1-00049O-ML
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 23:28:06 +0200
Received: by qw-out-1920.google.com with SMTP id 4so491534qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 14:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=G314Ztm1ObvSIO1ZM+A4QUPsF5nIrim5OgICyk/G+uc=;
	b=drI2s7QeKoGlV4A+wTBxhwciGvEtxCKSr0IHNKm2tR0m3sg7nXoOH7TrjKD3mh83UT
	lBY8sEicFvZnhfuie+drARqDVXrU7mer2/xVHerPOr4LHq+smAEZxm41zV1/L+2N1cIU
	nG3corYhyYa31WiqmEWk9fHEdqg13QUBL9ocA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mCZen7c079Q+fE0i7KQ8zRABBbhzAEPLj30whxL0/i8WnRkndi6UJzngPtzVSnkn0d
	y6sctlzPzmEdOIlSox9INgv37Z9V2JpyxnduQCQfFn+NpYjVMuKOTo2FxDUg6iRYE+yT
	jq6R/FrBpaTP6F5C704junuDREMfvJpGKk7xw=
MIME-Version: 1.0
Received: by 10.229.39.201 with SMTP id h9mr1505265qce.4.1252704456201; Fri, 
	11 Sep 2009 14:27:36 -0700 (PDT)
In-Reply-To: <4AA9C54B.5050707@gmail.com>
References: <4AA9C54B.5050707@gmail.com>
Date: Fri, 11 Sep 2009 14:27:36 -0700
Message-ID: <19c1b8a90909111427w476f1e78xcf4f553889d22f65@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix lesstif compilation.
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
X-List-Received-Date: Fri, 11 Sep 2009 21:28:06 -0000
Content-Type: text/plain; charset=UTF-8

On 9/10/09, Graham Gower <graham.gower@gmail.com> wrote:
> Failed like this:
>
> | /bin/sh ../mipsel-angstrom-linux-libtool --tag=CC   --mode=link
> mipsel-angstrom-linux-gcc
> -isystem/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
>  -L/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/lib
> -Wl,-rpath-link,/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/lib
> -Wl,-O1 -o man2html man2html.o
> -L/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/lib -lfreetype -L -lXft
> -lXrender
> | mipsel-angstrom-linux-libtool: link: require no space between `-L' and
> `-lXft'
> | make[2]: *** [man2html] Error 1
> | make[2]: Leaving directory
> `/home/grg/oe/tmp/work/mipsel-angstrom-linux/lesstif-0.95.0-r1/lesstif-0.95.0/scripts'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/grg/oe/tmp/work/mipsel-angstrom-linux/lesstif-0.95.0-r1/lesstif-0.95.0/scripts'
> | make: *** [all-recursive] Error 1
> | FATAL: oe_runmake failed
>
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/lesstif/lesstif_0.95.0.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/lesstif/lesstif_0.95.0.bb
> b/recipes/lesstif/lesstif_0.95.0.bb
> index cb348e7..5af87e3 100644
> --- a/recipes/lesstif/lesstif_0.95.0.bb
> +++ b/recipes/lesstif/lesstif_0.95.0.bb
> @@ -1,7 +1,7 @@
>  SECTION = "libs"
>  DESCRIPTION = "Free OSM/Motif implementation."
>  LICENSE = "LGPL"
> -PR = "r1"
> +PR = "r2"
>
>  SRC_URI = "\
>  	${SOURCEFORGE_MIRROR}/lesstif/${BP}.tar.bz2 \
> @@ -40,7 +40,7 @@ addtask preconfigure after do_patch before do_configure
>  EXTRA_OECONF = "\
>  	--with-gnu-ld --disable-verbose --disable-build-12 --disable-build-20 \
>  	--enable-build-21 --enable-xrender --enable-production --without-motif \
> -	--x-includes=. \
> +	--x-includes=. --x-libraries=. \
>  "
>
>  PACKAGES += "${PN}-bin"
> --
> 1.6.0.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


