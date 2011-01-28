Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PigVQ-0001Q7-VF
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 06:04:21 +0100
Received: by yie16 with SMTP id 16so923918yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 21:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=WDzdoVur6mpJaD7NvwWxq8Gn2j/avxfMeQJO4JpzNbA=;
	b=G1gOnRXLvuPF6CchP+IkZQhEM8UYMwW0kJ5YXDShqfboYTv19ciNTxH+E/rxWg0nMs
	PoOjwdJ+4TgWeGrnVcP2GMJ7M6Oz+wHZ2rcU/cJ0j3bEGqcWZiKpqxUTLNhE1pvXfnui
	y8jLexv1DWiawCLfve82XqHTOYSaHexMkF+ps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ksf7LJV12TKyFzCEEnDZzPgyg4oXAmUFkrOt4DUhu2Xn26HZkIktg8nBz+lpuIadcv
	R/evEToSIqNlggB64PFCG8XtTJ3Mp//lOecpL583WltajA21RlpxcuzQ3w2Ja70E4G/d
	so4zqsw5so0S0okHnd5Oiy/iJEjNsdh5KtL4Y=
Received: by 10.90.81.19 with SMTP id e19mr4246420agb.7.1296191011096; Thu, 27
	Jan 2011 21:03:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 27 Jan 2011 21:03:10 -0800 (PST)
In-Reply-To: <1296167465.14370.7.camel@utx.lan>
References: <1296167465.14370.7.camel@utx.lan>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2011 21:03:10 -0800
Message-ID: <AANLkTimuDyVCbR7r+0=euudK3YBmGq5T4P+e5a4XKS2b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][PATCH] binconfig.bbclass: search configs in PKGD instead of S
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
X-List-Received-Date: Fri, 28 Jan 2011 05:04:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2011 at 2:31 PM, Stanislav Brabec <utx@penguin.cz> wrote:
> Hallo.
>
> It seems that searching for binconfig in S makes more problems than it
> brings benefits. It breaks for example ncurses - it populates
> ncurses-config instead of ncurses5-config and ncursesw5-config).
>
> Searching in the installed root seems to be more logical.
>
> Most packages don't need to be ported to this change, as they install
> config file with the same name as it exists in sources. But probably
> several will need porting.

Yes this patch looks sane to me.

>
> --- a/classes/binconfig.bbclass
> +++ b/classes/binconfig.bbclass
> @@ -49,7 +49,7 @@
> =C2=A0SYSROOT_PREPROCESS_FUNCS +=3D "binconfig_sysroot_preprocess"
>
> =C2=A0binconfig_sysroot_preprocess () {
> - =C2=A0 =C2=A0 =C2=A0 for config in `find ${S} -name '${BINCONFIG_GLOB}'=
`; do
> + =C2=A0 =C2=A0 =C2=A0 for config in `find ${PKGD} -name '${BINCONFIG_GLO=
B}'`; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configname=3D`base=
name $config`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${SYSRO=
OT_DESTDIR}${STAGING_BINDIR_CROSS}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat $config | sed =
${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$co=
nfigname
>
> --
>
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


