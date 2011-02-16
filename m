Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PpihP-0003DX-Df
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 15:49:47 +0100
Received: by iwn8 with SMTP id 8so1363824iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 06:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=V4CBjhvhjJlEl3UrpRhFUiBFeg1Do2ppOTZT8jgK2vA=;
	b=nTpzfO21lWUXxCvpn+o0qZJWuaN7Hpu+0sKB6CIS59rCfq3k6cO8h74rNIN8HFLeX0
	Z6aLByk64DmIECo0TC/644o0t7BrcniQjZPcd/fLjBjXPIFOWdM/hoJ5o+xmtXswDKdm
	W83P5DO8cEvIO1ubrptDp7FAcHn0vrRWTkxCE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cDCcov0TEaZ5WxBpC3UWrgp4Y6nqeq2djlNQd7ixcURSXMlhm709qsHQO4hRpR35xM
	W4BRXEdhCVPRf/kLW/uWouYI3BP2mJSLcjGbIMrgWdICWqlJPvxxgAHj1fPjxINsPD5A
	WEQriuTVww2aulMt9DzjI/vWVNR0MLdzVVxx4=
MIME-Version: 1.0
Received: by 10.231.10.200 with SMTP id q8mr530696ibq.122.1297867715496; Wed,
	16 Feb 2011 06:48:35 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 16 Feb 2011 06:48:35 -0800 (PST)
In-Reply-To: <1297855134-19216-8-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-8-git-send-email-otavio@ossystems.com.br>
Date: Wed, 16 Feb 2011 15:48:35 +0100
Message-ID: <AANLkTim7Ra8AMGXAvVH-v5biPJqE1tFCuVuWyMOmnZdr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 08/13] cdparanoia (svn): use build variables to fix packaging when using empty prefix
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
X-List-Received-Date: Wed, 16 Feb 2011 14:49:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/16 Otavio Salvador <otavio@ossystems.com.br>:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =A0recipes/cdparanoia/cdparanoia_svn.bb | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/cdparanoia/cdparanoia_svn.bb b/recipes/cdparanoia/cd=
paranoia_svn.bb
> index c40d979..a845e49 100644
> --- a/recipes/cdparanoia/cdparanoia_svn.bb
> +++ b/recipes/cdparanoia/cdparanoia_svn.bb
> @@ -4,7 +4,7 @@
>
> =A0HOMEPAGE =3D "http://www.xiph.org/paranoia/"
> =A0DESCRIPTION =3D "Audio CD digital audio extraction application"
> -PR =3D "r0"
> +PR =3D "r1"
> =A0LICENSE =3D "GPLv2"
>
> =A0PV =3D "10.2+svnr${SRCPV}"
> @@ -37,8 +37,8 @@ FILES_libcdparanoia-dev =3D "${includedir} ${libdir}/li=
b*${SOLIBSDEV}"
> =A0FILES_libcdparanoia-static =3D "${libdir}/*.a"
>
> =A0do_install() {
> - =A0 =A0 =A0 oe_runmake BINDIR=3D"${D}/usr/bin" MANDIR=3D"${D}/usr/share=
/man/" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0INCLUDEDIR=3D"${D}/usr/include/" LIB=
DIR=3D"${D}/usr/lib" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PKGCONFIGDIR=3D"${D}/usr/lib/pkgconf=
ig" \
> + =A0 =A0 =A0 oe_runmake BINDIR=3D"${D}${bindir}" MANDIR=3D"${D}${datadir=
}/man/" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0INCLUDEDIR=3D"${D}${includedir}" LIB=
DIR=3D"${D}${libdir}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PKGCONFIGDIR=3D"${D}${libdir}/pkgcon=
fig" \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 install
> =A0}
> --
> 1.7.2.3
>

Thanks!
Pushed.

Did a quick check. We have 24 other recipes that refer to ${D}/usr/bin:

frans@frans-desktop:~/workspace/openembedded/recipes$ grep '${D}/usr/bin' *=
/* -l
bt-gps/bt-gps.bb
cdparanoia/cdparanoia_10.2.bb
ctorrent/ctcs_1.4.1.bb
cxcrypt/cxcrypt_1.0.bb
dvd+rw-tools/dvd+rw-tools_7.1.bb
elvis/elvis_2.2.0.bb
emelfm2/emelfm2_0.0.8.bb
fortune-mod/fortune-mod_1.99.1.bb
gphoto2/ptp-gadget_git.bb
gstreamer/gst-player_svn.bb
mokoeightball/mokoeightball_svn.bb
mped/mped_5.1.3.bb
networkmanager/networkmanager-0.7.inc
networkmanager/networkmanager.inc
networkmanager/networkmanager-pre0.7.inc
openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb
pmtools/pmtools_20050926.bb
podget/podget_0.5.8.bb
postmark/postmark_1.51.bb
rox/rox-filer_2.5.bb
skype/skype_2.0.0.72.bb
sms-sentry/sms-sentry.bb
ttyrec/ttyrec_1.0.8.bb
vnc/vnc_3.3.7.bb

Guess ideally these should all be fixed

Frans


