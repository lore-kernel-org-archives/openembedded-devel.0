Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LnJDr-0005tU-Nf
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 22:04:15 +0100
Received: by gxk18 with SMTP id 18so2504444gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GAE4mHFKH6f0x06VdrmKavxGe3Aun1LgjWw/9U5/KVU=;
	b=cyExk1X2e7RBunuwfBHnvRygY5Z1oBw5h8LVcTISKis2SQbml6NlVQKUaoONr7fVQj
	p3dTVFeMRjhwUatjs67fsOYwdX6uV2XebkeNMLwGdis1eKQ+BkIjsUNhxWzLh0PEw2G1
	3v1uKZCtgl9d/V9ocmH1+BIiMDCQ2uvG20UwE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=YbjTb6qwo3TWDqRvlQrxSGIQ07EQ3IZUYASAtIsNV/NXYOGlX+8bgBTpO4RBuugdcL
	eDTL4xw5R8Imd+bEa2ddqe2Ezkxlflo8KJfeYZqIRSG3VDI59FT4ShaV1PnKSoqamhtu
	Fyr3LRUm0h4y8u5D49GnmVO8tBFY7zvRCQT2Y=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.150.211.4 with SMTP id j4mr4838690ybg.97.1238187743385; Fri, 
	27 Mar 2009 14:02:23 -0700 (PDT)
In-Reply-To: <49CD3BFF.2030902@irobot.com>
References: <49CD3BFF.2030902@irobot.com>
Date: Fri, 27 Mar 2009 14:02:23 -0700
X-Google-Sender-Auth: 2e851fd844abad73
Message-ID: <b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bash: add alternative configuration for bin/sh -> /bin/bash
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
X-List-Received-Date: Fri, 27 Mar 2009 21:04:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Be very careful with this.  Specifically, be sure to thoroughly test
installing bash onto a system that currently has busybox, and the
upgrade paths for both busybox and bash.  You never want to get into a
state, due to pre/post rm/install script execution order, where
/bin/sh doesn't exist.  If that happens, you won't be able to execute
the next script to fix it :)

On Fri, Mar 27, 2009 at 1:50 PM, Tim Harvey <tharvey@irobot.com> wrote:
> Add alternative configuration for /bin/sh -> /bin/bash so that for exampl=
e
> bash can exist (and override) as shell if busybox is also installed
>
> diff --git a/recipes/bash/bash.inc b/recipes/bash/bash.inc
> index 4eba689..7c6122b 100644
> --- a/recipes/bash/bash.inc
> +++ b/recipes/bash/bash.inc
> @@ -4,7 +4,7 @@ DEPENDS =3D "ncurses"
> SECTION =3D "base/shell"
> LICENSE =3D "GPL"
>
> -inherit autotools gettext
> +inherit autotools gettext update-alternatives
>
> PARALLEL_MAKE =3D ""
>
> @@ -33,3 +33,8 @@ pkg_postinst () {
> =C2=A0 =C2=A0 =C2=A0 grep -q "bin/bash" $D${sysconfdir}/shells || echo /b=
in/bash >>
> $D${sysconfdir}/shells
> =C2=A0 =C2=A0 =C2=A0 grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin=
/sh >>
> $D${sysconfdir}/shells
> }
> +
> +ALTERNATIVE_NAME =3D "sh"
> +ALTERNATIVE_LINK =3D "${base_bindir}/sh"
> +ALTERNATIVE_PATH =3D "${base_bindir}/bash"
> +ALTERNATIVE_PRIORITY =3D "90"
> diff --git a/recipes/bash/bash_3.0.bb b/recipes/bash/bash_3.0.bb
> index e23887a..8165d07 100644
> --- a/recipes/bash/bash_3.0.bb
> +++ b/recipes/bash/bash_3.0.bb
> @@ -1,5 +1,5 @@
> require bash.inc
> -PR =3D "r11"
> +PR =3D "r12"
>
> SRC_URI +=3D "\
> =C2=A0file://bash-3.0-fixes.patch;patch=3D1 \
> diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
> index 6a48a4b..e175467 100644
> --- a/recipes/bash/bash_3.2.bb
> +++ b/recipes/bash/bash_3.2.bb
> @@ -1,6 +1,6 @@
> require bash.inc
>
> -PR =3D "r7"
> +PR =3D "r8"
>
> SRC_URI +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://builtins.patch;patch=3D1 \
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


