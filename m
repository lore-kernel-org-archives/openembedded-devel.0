Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJYDX-0000Bk-79
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 22:10:06 +0100
Received: by pvd12 with SMTP id 12so1157258pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 13:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kdz54Je6EraISJN9k+wGfTP6OG0zVSljeQKcHoeL8rw=;
	b=hzd4mvs2TKTtGty2318QTEn7jrQdzKeFkjnWKrjit+514YuGivVJUrnVcAH9vq6JlX
	Erp9cblvafBlVP0gnkbr587yi26RxdjpvnO2E+lkiU3Zxqg2jcKx9mFUWFBVsRkF8rde
	e6P7bPs7/WdBOFLkgw5kuSzDFD70yxL4SCKcQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AnffSMY9W1rOuPFGOBYZzZ5vgqnfhIItkl15F1/tpxzSigXyvNgoYk1IeM3rN2/4O4
	fhDDCND+Ah48TYnDSMM+cPwf2xLFvN06cbngbWfBQqIu/Cdfpf3HTzfl8ukiCmiBGKaD
	KZYeKq5a5N6YMCLj/BORAJcxoO3V7xWPGxSmk=
Received: by 10.142.128.1 with SMTP id a1mr2225728wfd.282.1290200924307;
	Fri, 19 Nov 2010 13:08:44 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x35sm2335653wfd.13.2010.11.19.13.08.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 13:08:35 -0800 (PST)
Date: Fri, 19 Nov 2010 13:08:01 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119210801.GE8017@gmail.com>
References: <1290185336.3681.13.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1290185336.3681.13.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gsl.inc: Remove `do_stage`.
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
X-List-Received-Date: Fri, 19 Nov 2010 21:10:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/11/10 17:48), Paul Menzel wrote:
> Date: Fri, 19 Nov 2010 17:33:00 +0100
> 
> Inkscape fails to build after commit c2c8fe [1] with the following error.
> 
>     | checking for CAIRO_USER_FONTS... yes
>     | checking for INKSCAPE... configure: error: Package requirements (gdkmm-2.4  glibmm-2.4 giomm-2.4 gtkmm-2.4 >= 2.10.0  gtk+-2.0  libxml-2.0 >= 2.6.11  libxslt >= 1.0.15  cairo  sigc++-2.0 >= 2.0.12    gthread-2.0 >= 2.0 libpng >= 1.2 gsl) were not met:
>     |
>     | No package 'gsl' found
>     |
>     | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>     | installed software in a non-standard prefix.
>     |
>     | Alternatively, you may set the environment variables INKSCAPE_CFLAGS
>     | and INKSCAPE_LIBS to avoid the need to call pkg-config.
>     | See the pkg-config man page for more details.
>     |
>     | ERROR: Function do_configure failed
>     NOTE: package inkscape-0.48.0-r0: task do_configure: Failed
>     ERROR: TaskFailed event exception, aborting
>     ERROR: Build of /home/paul/oe/openembedded/recipes/inkscape/inkscape_0.48.0.bb do_configure failed
> 
> Removing `do_stage` fixes building `inkscape_0.48.0.bb` with `angstrom-2008.1`, `angstrom-2010.x` and `minimal` for `MACHINE = "beagleboard"`.
> 
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> Please note, that I did not test the removal of this function any further, that means I did not compare the package contents before and after, and do not know about the implications. If someone more knowledgeable could check that, it would be very much appreciated.

if you checked what it installed into temp staging install then it should
be ok.

> ---
>  recipes/gsl/gsl.inc |   11 +----------
>  1 files changed, 1 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes/gsl/gsl.inc b/recipes/gsl/gsl.inc
> index bc4865c..10bacc5 100644
> --- a/recipes/gsl/gsl.inc
> +++ b/recipes/gsl/gsl.inc
> @@ -3,17 +3,8 @@ HOMEPAGE = "http://www.gnu.org/software/gsl/"
>  SECTION = "libs"
>  PRIORITY = "optional"
>  LICENSE = "GPL"
> -PR = "r0"
> +PR = "r1"
>  
>  inherit autotools pkgconfig binconfig
>  
>  LEAD_SONAME = "libgsl.so"
> -
> -do_stage() {
> -	oe_runmake DESTDIR=${S}/.install install
> -	oe_libinstall -so -C cblas/.libs/ libgslcblas ${STAGING_LIBDIR}
> -	oe_libinstall -so -C .libs/ libgsl ${STAGING_LIBDIR}
> -
> -	install -d ${STAGING_INCDIR}/gsl
> -	install -m 0644 .install${includedir}/gsl/* ${STAGING_INCDIR}/gsl
> -}
> -- 
> 1.7.2.3



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



