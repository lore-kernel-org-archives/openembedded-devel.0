Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 832E3719D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:37:22 +0000 (UTC)
Received: from nbhjo (111-250-195-39.dynamic.hinet.net [111.250.195.39])
	by msfrf2627.sfr.fr (SMTP Server) with ESMTP id 2C92D1C000408
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 05:37:19 +0200 (CEST)
Received: from nbhjo (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2627.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 05:37:17 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
References: <1476778230-105764-1-git-send-email-herve.jourdain@neuf.fr>
	<1476778230-105764-2-git-send-email-herve.jourdain@neuf.fr>
	<CAMKF1sp5KNDqbgzvqKp0D3JHFMTdqc_ovbMRoD1ve30z5upshw@mail.gmail.com>
In-Reply-To: <CAMKF1sp5KNDqbgzvqKp0D3JHFMTdqc_ovbMRoD1ve30z5upshw@mail.gmail.com>
Date: Thu, 20 Oct 2016 05:37:11 +0200
Message-ID: <004401d22a83$41aaf150$c500d3f0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQI3c7hyZNQItEghW7KuPxLN7yfbqQF+Ks07AXDu5wOfzqWuoA==
X-sfr-mailing: LEGIT
Subject: Re: ***SPAM*** Re: [meta-oe][PATCH 1/1] v4l-utils: add support for "native"	build
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
X-List-Received-Date: Thu, 20 Oct 2016 03:37:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi Khem,

Well, I guess I didn't really have the time then, so I went for the fastest
solution available...
But you're right, I'll try fixing the makefile, and post a V2. I believe I
should have time for that in 1 or 2 days.

Cheers,
Herve

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Khem
Raj
Sent: mercredi 19 octobre 2016 07:44
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: ***SPAM*** Re: [oe] [meta-oe][PATCH 1/1] v4l-utils: add support for
"native" build

On Tue, Oct 18, 2016 at 1:10 AM, Herve Jourdain <herve.jourdain@neuf.fr>
wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
> index 6148695..b9732fe 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
> @@ -43,3 +43,6 @@ FILES_libv4l-dbg += "${libdir}/libv4l/.debug
${libdir}/libv4l/plugins/.debug"
>  FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
>                       ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
>                       ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la
${libdir}/libv4l/plugins/*.la"
> +
> +PARALLEL_MAKE_class-native = ""

you seem to have root casued it. Then why not fix the Makefile instead

> +BBCLASSEXTEND = "native"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
-- 
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


