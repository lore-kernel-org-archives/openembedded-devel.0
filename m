Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9900A77012
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 02:29:37 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so8490271igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=xpHrGtJBTQii0Tkcm2g19E01hQh1IoXjM3hm/tVf6Vw=;
	b=dEuWEKVa+6X3VfdTf4RHP33aEXIsw27LrcqC9pVlqkgjcmTwQAVnX0tBIwGhi6YcBL
	BQ//v/X/vLoroN805ldYWHTfnQ1iCWaXm3XGOQoyX7KM6nODu3qCX9V8C4I2F02E2cMg
	ZeysTgYhNHTOhjRmbkHr/25HB3rCvJvnlKFDHuby5tlyhnygFc3ar3PkxO1geEQIBLkq
	TUXFD4CidzYJ2G5azg+juCfZ2VhxFtpcNyzkG/LjB9HqM3ASsNVlfte2Pq41aDLcTYRO
	C8iq7/Bpd43DzTByNBiB7Z2Sdz+PGWRwMK4ZNcF8JcLZRvEjo3SB4PzmMoI9ibgkTtwZ
	hT9g==
X-Received: by 10.50.55.3 with SMTP id n3mr2063838igp.11.1443752977811; Thu,
	01 Oct 2015 19:29:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 19:29:08 -0700 (PDT)
In-Reply-To: <1443713428-8635-9-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
	<1443713428-8635-9-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 19:29:08 -0700
Message-ID: <CAMKF1sq+tAffSxRenJAX=ecV_F3Vww01Lp80sn+3Wo11ivkvPw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 09/10] gdal: blacklist, fails to build with gcc-5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2015 02:29:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 8:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
> index b181b3e..012806a 100644
> --- a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
> +++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
> @@ -107,3 +107,8 @@ do_configure_prepend () {
>  }
>
>  FILES_${PN} += "${libdir}/gdalplugins"
> +
> +# | gdalserver.c:124:21: error: storage size of 'sHints' isn't known
> +# |      struct addrinfo sHints;

this really is due to glibc 2.21 you need the same fix that I did for boringssl
> +# |                      ^
> +PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5"


> --



> 2.6.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

