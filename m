Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfIHu-0003mS-9W
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 21:36:22 +0100
Received: by iyj18 with SMTP id 18so35521iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 12:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=jgQ0R6s5aslOgFARx0okW7z7E/b0BUT61nL+wGcfd/k=;
	b=ZX/+Y8mBpt4MKW7LzAK6h0TlhZcGe+dujK1qXa0MccRyMa25jVvuSt96AXJ1oGaukm
	d1KcjZtpzy/W593ohUyBaIf3EpmRzdQAxvMDoNSaCol/WC08icJ2iFZ53HS9He2CCYxi
	rdRxf5wHpVNP31aYRtkeBbG+Y+l9vxcepQiVM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Q591aDDNI3U4gxr0+XOWBCC4MTcotxC784UQQFQhuDLaual7XV6+kVPMrlQW8zkkYf
	9fy9sRDfJ/r9Ou3w6kvEw92jDSUA0AOV0y9nmg8V2bKsZ1aT8WiNRRkEoY+K4s2CwjYf
	WFoVyuGSgUBTjjvOZQgIc0hOpyoboOkdHzLME=
Received: by 10.42.176.129 with SMTP id be1mr6924003icb.139.1295382942656;
	Tue, 18 Jan 2011 12:35:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 18 Jan 2011 12:35:22 -0800 (PST)
In-Reply-To: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 12:35:22 -0800
Message-ID: <AANLkTikoW_ex-tWz8fLj2P6a8kLRrwEvpFVFYf=bVXGW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/4] bitbake.conf: include bin dirs from BBPATH in PATH
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
X-List-Received-Date: Tue, 18 Jan 2011 20:36:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 7:18 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0bin/{ =3D> darwin}/cp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0bin/{ =3D> darwin}/sed =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +++--
> =C2=A0conf/build/Power Macintosh-darwin.conf | =C2=A0 =C2=A02 +-
> =C2=A0conf/build/i386-darwin.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A02 +-
> =C2=A05 files changed, 5 insertions(+), 4 deletions(-)
> =C2=A0rename bin/{ =3D> darwin}/cp (100%)
> =C2=A0rename bin/{ =3D> darwin}/sed (100%)
>
> diff --git a/bin/cp b/bin/darwin/cp
> similarity index 100%
> rename from bin/cp
> rename to bin/darwin/cp
> diff --git a/bin/sed b/bin/darwin/sed
> similarity index 100%
> rename from bin/sed
> rename to bin/darwin/sed
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f1dc0ff..d03d7e3 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -421,8 +421,9 @@ EXTRA_IMAGEDEPENDS =3D ""
>
> =C2=A0LIBTOOL_HAS_SYSROOT ?=3D "no"
>
> -PATH_prepend =3D "${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir=
_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_nativ=
e}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
> -export PATH
> +BBPATH_BIN =3D "${@':'.join('%s/bin' % path for path in '${BBPATH}'.spli=
t(':'))}"
> +PATH =3D. "${BBPATH_BIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${=
sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindi=
r_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
> +PATH[export] =3D "1"
>
> =C2=A0##################################################################
> =C2=A0# Build utility info.
> diff --git a/conf/build/Power Macintosh-darwin.conf b/conf/build/Power Ma=
cintosh-darwin.conf
> index effddbf..b42051b 100644
> --- a/conf/build/Power Macintosh-darwin.conf
> +++ b/conf/build/Power Macintosh-darwin.conf
> @@ -1,4 +1,4 @@
> -PATH =3D. "${@bb.which('${BBPATH}', 'bin')}:"
> +PATH =3D. "${@bb.which('${BBPATH}', 'bin')}/darwin:"
> =C2=A0BUILD_ARCH =3D "powerpc"
>
> =C2=A0require conf/build/darwin/utilities.inc
> diff --git a/conf/build/i386-darwin.conf b/conf/build/i386-darwin.conf
> index c9e81b9..bdcb075 100644
> --- a/conf/build/i386-darwin.conf
> +++ b/conf/build/i386-darwin.conf
> @@ -1,4 +1,4 @@
> -PATH =3D. "${@bb.which('${BBPATH}', 'bin')}:"
> +PATH =3D. "${@bb.which('${BBPATH}', 'bin')}/darwin:"
> =C2=A0BUILD_CC_ARCH +=3D "-m32"
>
> =C2=A0require conf/build/darwin/utilities.inc
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


