Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opc64-00023s-S8
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:14:33 +0200
Received: by iwn2 with SMTP id 2so3826538iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6Jq9RsIGSXt6uY5xD0YudmaJlKooLp3zLmydIP6OWys=;
	b=xYMOnWiDv0CmtvTWwgHdufXAwslwP1FwTc+WFxvU1kgKnixD+jl7JmrUFhv4U94W32
	yzDzhftVVN7UYwzjJhFVeIw7ADtU7+rc9WmOpLPeqmILVkxko/iOB1r+igzy93qx0++3
	csto5bWliEIXDANJHW8rPmRVp/07jvus5RrcQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LGv9kK77z6Aq4EI2mjfRlLJGC3Zu+z5DmD1JSm7FHSCM50MiEWiv+6MD72pJCoHoKI
	b5ZXLjRg2Mrl/cJ68LiAi2bvZfx8cbe8eoqKP9CQUQ9IHwSU1iyvNtYwHDFATw6JRNab
	eaMYrXxEigtcaGUb0nNnyXJIkcTLksYjgfG2o=
MIME-Version: 1.0
Received: by 10.231.183.81 with SMTP id cf17mr3483477ibb.32.1283066043247;
	Sun, 29 Aug 2010 00:14:03 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:14:03 -0700 (PDT)
In-Reply-To: <1283027073-12308-22-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-22-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:14:03 +0200
Message-ID: <AANLkTinto0DJo6_PQ+c55fdsn45xfP6RgTHV-CUednpQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 21/23] xqt2_20060509.bb: DEPEND on libxmu instead of xmu
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
X-List-Received-Date: Sun, 29 Aug 2010 07:14:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I think this is very bad that we apparenlty have a recipe from 2006
that has a problem with a lib that is not there:
The DEPENDS is also from 2006.
Was it possible to have broken depends in the past, or was xmu a good
depends in the past?
If not, is it worthwhile to keep recipes from 2006 that are apparently
not maintained and have been kept around for so long ?

Anyway wrt the patch:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>



2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/xqt2/xqt2_20060509.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/xqt2/xqt2_20060509.bb b/recipes/xqt2/xqt2_20060509.b=
b
> index 7634d27..4492bc7 100644
> --- a/recipes/xqt2/xqt2_20060509.bb
> +++ b/recipes/xqt2/xqt2_20060509.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Xqt2 is an X-Server than runs within the Opie environ=
ment"
> =A0HOMEPAGE =3D "http://xqt.sourceforge.jp"
> -DEPENDS =3D "freetype libxi xmu flex-native virtual/libqte2 libqpe-opie"
> +DEPENDS =3D "freetype libxi libxmu flex-native virtual/libqte2 libqpe-op=
ie"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "opie/applications"
> =A0APPTYPE =3D "binary"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


