Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3yKU-0001jt-Rs
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 23:48:49 +0200
Received: by iwn37 with SMTP id 37so358629iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 14:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=1bEuCqwGfXI/pDvsu0xh+n9dOM+WNFGaokfXRkvjguc=;
	b=cKPxMzBa+IOzyLBHQwf/RS/8XEjh0AHsOPd5e5pcmJSVS2rUVbv4eVikl29a+kdZk1
	NIOMx8h9eapCNEkEyyu5tAAriUmB/YHJEozOxAsLo/9NyfUjglDVePeALtJ4DERhrlfb
	RopHF5W23azCLKUhY2yg4khxatG1z+m0SiIk4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=GOemAVQPCbd9o4Ob5u22+1JExBB3VaL2AAW5bQcfqj1s99yEmPB//6wXzBF8QwXx0x
	10WmBsIXOhwhYz9ZXKLZRn+BEg4oAKu/0Hn2C17TH+6gORUh2J2YpJc86QYk9oPvxS1v
	foRLvcIfjeF61BOmNkkvE3e6jlMiyHSCUoI3A=
Received: by 10.231.35.138 with SMTP id p10mr1559542ibd.33.1286488105545; Thu,
	07 Oct 2010 14:48:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Thu, 7 Oct 2010 14:48:05 -0700 (PDT)
In-Reply-To: <1286480697-28494-1-git-send-email-Martin.Jansa@gmail.com>
References: <1286480697-28494-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Oct 2010 14:48:05 -0700
Message-ID: <AANLkTimK3s37SU5Rp14niH2Tb=7oHXTtSvACTOcr0J_y@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc-package.bbclass: fix missing RPROVIDES for virtual-locale-*
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
X-List-Received-Date: Thu, 07 Oct 2010 21:48:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2010 at 12:44 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

seems fine
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/eglibc/eglibc-package.bbclass | =C2=A0 =C2=A04 +++-
> =C2=A0recipes/eglibc/eglibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglib=
c-package.bbclass
> index 5871be0..dbca1ab 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -351,7 +351,9 @@ python package_do_split_gconvs () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glib=
c_name =3D name
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('RD=
EPENDS_%s' % pkgname, legitimize_package_name('eglibc-binary-localedata-%s'=
 % glibc_name), d)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('RPROVI=
DES_%s' % pkgname, 'glibc-binary-localedata-%s' % glibc_name, d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rprovides =3D bb.data.=
getVar("RPROVIDES_%s" % pkgname, d, 1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rprovides +=3D ' glibc=
-binary-localedata-%s' % glibc_name
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('RPROVI=
DES_%s' % pkgname, rprovides, d)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0def output_locale_binary(name, pkgname, locale=
, encoding):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This is a hack t=
ill linux-libc-headers gets patched for the missing arm syscalls and all ar=
m device kernels as well
> diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
> index a68f343..754a12b 100644
> --- a/recipes/eglibc/eglibc.inc
> +++ b/recipes/eglibc/eglibc.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.eglibc.org/home"
> =C2=A0SECTION =3D "libs"
> =C2=A0PRIORITY =3D "required"
> =C2=A0LICENSE =3D "LGPL"
> -INC_PR =3D "r14"
> +INC_PR =3D "r15"
> =C2=A0# nptl needs unwind support in gcc, which can't be built without gl=
ibc.
> =C2=A0DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-he=
aders"
> =C2=A0#this leads to circular deps, so lets not add it yet
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


