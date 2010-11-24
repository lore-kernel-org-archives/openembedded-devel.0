Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PLIFf-000141-69
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 17:31:24 +0100
Received: by gwb11 with SMTP id 11so414564gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 08:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9u8TcRiV4Rt/2Nhr4h9wEVWOaZH2jWj8ACau6JCJGrM=;
	b=HCTCDXROSBsg4JfOuS6yO2Ad6EfxPLBkupwYBth9GZa1Z3b1bRShwNajYSnm8CH/Yp
	I3TEd+dLFcqCgfRSI477cIzwZAH9C8sj6GB2EgBmOZ+BDewngaz2OPiCGwJFbJH8415c
	AvQcpKd6lzDK2R+94xktbxCDdCeQR0f4FV2tA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=HgPjmadRHs6HbPXAcSREsY6mQFLNJGcMA0i7Vqt3I/MPAYhe4R0QzyA4fb4+BVCYOR
	smDby5gsI1vouM4EctG/Mmz330DPeC28m6mVGne8KK+Uaofk67P10Aaik+dxkbiTaCLX
	hqUugrA3LX4iF3Tq1OpdME/lDORQqVkPDOJb4=
Received: by 10.91.12.18 with SMTP id p18mr1112122agi.48.1290616208190; Wed,
	24 Nov 2010 08:30:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 24 Nov 2010 08:29:47 -0800 (PST)
In-Reply-To: <1290584184-19331-1-git-send-email-Martin.Jansa@gmail.com>
References: <1289914206-29909-1-git-send-email-Martin.Jansa@gmail.com>
	<1290584184-19331-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Nov 2010 08:29:47 -0800
Message-ID: <AANLkTimBhoRpWx6KmKq345=FJvUF99=X8jzn2tByYQAw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2][RFC] binconfig: use / instead empty prefix/exec_prefix in get_binconfig_mangle
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
X-List-Received-Date: Wed, 24 Nov 2010 16:31:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

seems fine to me.

On Tue, Nov 23, 2010 at 11:36 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> * 952e5e2b7a5c1deefc939594d40b81a71fb16a54 appends / in sed call,
> =C2=A0but it breaks ie =3D/usr replacement ie in libmikmod
> * using at least / in SLASH_PREFIX/SLASH_EXEC_PREFIX is needed ie for mic=
ro
> =C2=A0distribution where prefix/exec_prefix are empty (/usr collapsed to =
/)
> * prefix and exec_prefix are expanded only in shell environment (after
> =C2=A0get_binconfig_mangle is returned so to check if it's empty we have =
to
> =C2=A0pass them expanded as params)
> * don't push this patch it fixes libmikmod with !micro, but in micro
> =C2=A0it's still broken, because libmikmod-config has empty 'prefix=3D' w=
hich
> =C2=A0is the case when we normaly don't want to add OEPREFIX (whole point=
 of
> =C2=A0this patch), but in this case it's needed (let's just fix libmikmod=
.in)
> * thanks to GNUtoo!
> ---
> =C2=A0classes/binconfig.bbclass | =C2=A0 14 ++++++++++----
> =C2=A01 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/classes/binconfig.bbclass b/classes/binconfig.bbclass
> index b3b2236..e462083 100644
> --- a/classes/binconfig.bbclass
> +++ b/classes/binconfig.bbclass
> @@ -1,15 +1,21 @@
> =C2=A0FILES_${PN}-dev +=3D "${bindir}/*-config"
>
> =C2=A0# The namespaces can clash here hence the two step replace
> -def get_binconfig_mangle(d):
> +def get_binconfig_mangle(d, env_prefix, env_exec_prefix):
> + =C2=A0 =C2=A0 =C2=A0 SLASH_PREFIX =3D env_prefix
> + =C2=A0 =C2=A0 =C2=A0 if SLASH_PREFIX is "":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SLASH_PREFIX =3D "/"
> + =C2=A0 =C2=A0 =C2=A0 SLASH_EXEC_PREFIX =3D env_exec_prefix
> + =C2=A0 =C2=A0 =C2=A0 if SLASH_EXEC_PREFIX is "":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SLASH_EXEC_PREFIX =3D =
"/"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D "-e ''"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if not bb.data.inherits_class('native', d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optional_quote =3D=
 r"\(\"\?\)"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s +=3D " -e 's:=3D=
%s${libdir}:=3D\\1OELIBDIR:;'" % optional_quote
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s +=3D " -e 's:=3D=
%s${includedir}:=3D\\1OEINCDIR:;'" % optional_quote
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s +=3D " -e 's:=3D=
%s${datadir}:=3D\\1OEDATADIR:'" % optional_quote
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D " -e 's:=3D%s${=
prefix}/:=3D\\1OEPREFIX/:'" % optional_quote
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D " -e 's:=3D%s${=
exec_prefix}/:=3D\\1OEEXECPREFIX/:'" % optional_quote
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D " -e 's:=3D%s%s=
:=3D\\1OEPREFIX:'" % (optional_quote, SLASH_PREFIX)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D " -e 's:=3D%s%s=
:=3D\\1OEEXECPREFIX:'" % (optional_quote, SLASH_EXEC_PREFIX)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s +=3D " -e 's:-L$=
{libdir}:-LOELIBDIR:;'"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s +=3D " -e 's:-I$=
{includedir}:-IOEINCDIR:;'"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s +=3D " -e 's:OEL=
IBDIR:${STAGING_LIBDIR}:;'"
> @@ -52,7 +58,7 @@ binconfig_sysroot_preprocess () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for config in `find ${S} -name '${BINCONFIG_GL=
OB}'`; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configname=3D`base=
name $config`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${SYSRO=
OT_DESTDIR}${STAGING_BINDIR_CROSS}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $config | sed ${@g=
et_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$config=
name
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $config | sed ${@g=
et_binconfig_mangle(d, "${prefix}", "${exec_prefix}")} > ${SYSROOT_DESTDIR}=
${STAGING_BINDIR_CROSS}/$configname
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod u+x ${SYSROO=
T_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> =C2=A0}
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


