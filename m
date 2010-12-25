Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWSGC-0007dT-Sy
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 12:26:05 +0100
Received: by gyh20 with SMTP id 20so3303817gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 03:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=4HYyAmw8PUgy5h+QELd/MfE0mIZW/Fu4P+AZF049rG8=;
	b=Oa529PtKc6Hmw4a6jY0mhPLvHTYCyW4El74ts72BJOvO6Lj7z/gN0GW3cTjtJYfJn1
	+MlZj9az8qjg+7fXpm/UqvAinq3EumRjCQ7HHI+EuI4r5EyKan36bm1ZjhsvN7BHGJuw
	Ze+nn7L3jtPvTQq0aT6jFIzbIR7tLW29S1Dzw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=agyLmmG8QZhUHHFrMOgWP5Xr7gvv/gzcXzRDL4fyKdutI8Ndy/q/mlRojpsXCeGBD5
	3dBdzmoI8WhROcfyntJINEpKivXBIe6rF2Z+Mcrajq0zatMhRxUMEj/kFfuBT9f8W5wK
	UHzK86XEm4lTM4TI/mcuClcmMLwmpEJ71v3n4=
Received: by 10.90.98.11 with SMTP id v11mr1603570agb.58.1293276345036; Sat,
	25 Dec 2010 03:25:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 25 Dec 2010 03:25:24 -0800 (PST)
In-Reply-To: <1293232419.4027.53.camel@mattotaupa>
References: <1293217389.4027.39.camel@mattotaupa>
	<1293232419.4027.53.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Dec 2010 03:25:24 -0800
Message-ID: <AANLkTi=BJKBab7h_oi4SwMVFuDdDFwW_AsJ8YpCsx9X6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] xbmc: add `zlib` to `DEPENDS`
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
X-List-Received-Date: Sat, 25 Dec 2010 11:26:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul

Can you rebase your patches and send them as a single patch for xbmc please

Thx
-Khem

On Fri, Dec 24, 2010 at 3:13 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Date: Wed, 1 Dec 2010 17:27:33 +0100
>
> XBMC depends on `zlib` [1] which is indirectly provided by other dependen=
cies like `ffmpeg.inc` [2]. Add `zlib` to `DEPENDS` to avoid possible futur=
e breakage.
>
> [1] http://trac.xbmc.org/browser/trunk/README.linux?rev=3D35279#L54
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/ffmpe=
g/ffmpeg.inc?h=3Dorg.openembedded.dev&id=3D5316c5b1416391f15277ce867489e525=
b7eccd6e#n12
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> v2: Updated commit message.
>
> The build still fails with `angstrom-2010.x` with the error message in v1=
.
> ---
> =C2=A0recipes/xbmc/xbmc_svn.bb | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
> index ad95a8a..3ca90e0 100644
> --- a/recipes/xbmc/xbmc_svn.bb
> +++ b/recipes/xbmc/xbmc_svn.bb
> @@ -1,13 +1,13 @@
> =C2=A0DESCRIPTION =3D "XBMC Media Center"
> =C2=A0LICENSE =3D "xbmc"
>
> -DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmod=
plug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer vi=
rtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi=
 libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper z=
ip-native"
> +DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmod=
plug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer vi=
rtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi=
 libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper z=
ip-native zlib"
> =C2=A0require recipes/egl/egl.inc
>
> =C2=A0SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
>
> =C2=A0PV =3D "10.05"
> -PR =3D "r9"
> +PR =3D "r10"
> =C2=A0PR_append =3D "+gitr${SRCPV}"
>
> =C2=A0SRC_URI =3D "git://xbmc.git.sourceforge.net/gitroot/xbmc/xbmc;proto=
col=3Dgit;branch=3Dmaster \
> --
> 1.7.2.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


