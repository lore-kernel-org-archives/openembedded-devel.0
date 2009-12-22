Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNAoo-0008KN-7x
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 20:54:57 +0100
Received: by iwn32 with SMTP id 32so4155132iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 11:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZC1CU9G5Eit4x87J0CGQI/AqtAc7GjAW1Wp8v/RXEQQ=;
	b=NoMSpa2fI+rMbffj/DTYFbGk5tC/GskFtsgKZWyBiRf6dKE/C2Qi7ylLKpjIV7F1rX
	3gbmHIZeGKYOH53h1dUI4swzsOH8uqztknKuzfR8WJoJoTV4vZco+4exfCik0mJK5pH4
	g+rgVhYKKEzydfAE/au0ATyftxurFo5Yfi6Zs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=b74IA27igmw758jHjULnh+OmJK9AmIb+8bWgu28VnZA3wh0B6adPn7Kx2d8y3AeM7Z
	KPWef9k6SO6ztEsWCwSmabm1xkcV2dSfNbWfYJjx4dYiDXzw5/x66eM9eIPFxHyCtZ2D
	RZJ7lDxGpLQTZ300CfsP8VN01Xa8BvPEY8ejM=
MIME-Version: 1.0
Received: by 10.231.169.197 with SMTP id a5mr1864545ibz.56.1261511581473; Tue, 
	22 Dec 2009 11:53:01 -0800 (PST)
In-Reply-To: <1261448680-12334-2-git-send-email-camelguo@gmail.com>
References: <1261448680-12334-1-git-send-email-camelguo@gmail.com>
	<1261448680-12334-2-git-send-email-camelguo@gmail.com>
Date: Tue, 22 Dec 2009 11:53:01 -0800
Message-ID: <19c1b8a90912221153l67cf16act91731ae32f6eb478@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] change uclibc to eglibc on comments
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
X-List-Received-Date: Tue, 22 Dec 2009 19:54:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2009 at 6:24 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> ---
> =C2=A0conf/distro/minimal-eglibc.conf | =C2=A0 14 +++++++-------
> =C2=A0conf/distro/minimal.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0=
2 +-
> =C2=A02 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/conf/distro/minimal-eglibc.conf b/conf/distro/minimal-eglibc=
.conf
> index 5ab275b..10f271b 100644
> --- a/conf/distro/minimal-eglibc.conf
> +++ b/conf/distro/minimal-eglibc.conf
> @@ -1,7 +1,7 @@
> =C2=A0#------------------------------------------------------------------=
-----------
> =C2=A0#@TYPE: Distribution
> -#@NAME: Minimal uClibc
> -#@DESCRIPTION: uClibc based Embedded Linux Distribution Configuration (m=
inimal)
> +#@NAME: Minimal eglibc
> +#@DESCRIPTION: eglibc based Embedded Linux Distribution Configuration (m=
inimal)
> =C2=A0#
> =C2=A0#@COMMENT: This distribution configuration serves as a starting poi=
nt for
> =C2=A0#@COMMENT: the integration of new target platforms, machines, or di=
stributions.
> @@ -24,13 +24,13 @@ require conf/distro/minimal.conf
> =C2=A0#
> =C2=A0# We get the DISTRO_FEATURES defined in minimal.conf here but
> =C2=A0# however there are some features like mips -mplt support which
> -# is not supported on uclibc yet so we need to disable that
> -# feature for uclibc based distributions, therefore we redefine
> -# the DISTRO_FEATURES for minimal-uclibc and notably leave mplt
> +# is not supported on eglibc yet so we need to disable that
> +# feature for eglibc based distributions, therefore we redefine
> +# the DISTRO_FEATURES for minimal-eglibc and notably leave mplt
> =C2=A0# out. Make sure that if there is a new DISTRO_FEATURE thats added
> -# to minimal.conf will not get included in minimal-uclibc.conf
> +# to minimal.conf will not get included in minimal-eglibc.conf
> =C2=A0# it has to be added to the below selection if it should also be
> -# enabled for minimal-uclibc
> +# enabled for minimal-eglibc
>
> =C2=A0# FEATURE SELECTION
> =C2=A0###################################################################=
##########
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 00397db..d0ec876 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -86,7 +86,7 @@ OVERRIDES =3D "local:${MACHINE}:${MACHINE_CLASS}:${DIST=
RO}:${TARGET_OS}:${TARGET_A
> =C2=A0###################################################################=
##########
> =C2=A0# TOOLCHAIN
> =C2=A0###################################################################=
##########
> -LIBC ?=3D "eglibc"
> +LIBC ?=3D "glibc"

We have intentionally switched to use eglibc as default C library for
minimal. As you can see its a weak assignment which means
you can still override it in you local.conf but the default is to stay as i=
t is

Thanks

-Khem


