Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PhJbx-0006f1-Nn
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 11:25:25 +0100
Received: by bwz10 with SMTP id 10so3596039bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=axT/b6gWLF6NnMu7drEDh2LcqfLv0EBfJ+wBz3MfotA=;
	b=d8WWwE0m43ZUPU2wDeePuIlcxR+G2FYEyjLa83YAF4czxQ5845degPMzX+kMaZa7BC
	KeVvKXNoncuPNzhSxwkldgn+t1E7J0k9l6nldbz6Rbs3FJ9FPs0uYlrWDOyoIrgrlRcp
	NVDIWJegGybC/v5KQOGWZDVVEMRSmNLwlK1O0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FX5l3B4vtasAcO/HbZpGjw469Al8EsKgQxRYyERHYK2aVh3Sd4IY4PHJOUqLtftmUx
	uvKfAARckJ0iM2NiRSmBjPb99ElqAmJeHW7modtyTc0AdwoLYu2k3tMcRsb5YnAJvcB8
	JWPrB4dmq68AwlWe8G6b64ke32T6l1PNyPZUs=
Received: by 10.204.81.218 with SMTP id y26mr3317894bkk.146.1295864681842;
	Mon, 24 Jan 2011 02:24:41 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v25sm5986243bkt.18.2011.01.24.02.24.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 02:24:39 -0800 (PST)
Date: Mon, 24 Jan 2011 11:24:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110124102441.GA3616@jama>
References: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
	<4D2DF2BA.6040000@gmail.com> <20110113073157.GO3244@jama>
	<4D2FBF32.30402@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4D2FBF32.30402@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libvpx: force arm mode to be able to link with ffmpeg where arm mode already is forced
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
X-List-Received-Date: Mon, 24 Jan 2011 10:25:26 -0000
X-Groupsio-MsgNum: 28357
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2011 at 07:12:50PM -0800, Khem Raj wrote:
> On 1/12/2011 11:31 PM, Martin Jansa wrote:
> > On Wed, Jan 12, 2011 at 10:28:10AM -0800, Khem Raj wrote:
> >> On 1/12/2011 3:48 AM, Martin Jansa wrote:
> >>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> >>
> >> hmmm what issues do u see if you build it with thumb mode.
> >
> > +# ffmpeg links with this and fails
> > +# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.=
text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@=
GLIBC_2.4'
> >
> > and full log is here
> > http://tinderbox.openembedded.org/packages/1398033/
>=20
> Its not clear in the logs but is libvpx using -fPIE compiler option ? if=
=20
> yes then you should remove it and then it will work.

only -fPIC and even with added -fno-PIE it still fails here (only with
binutils-2.21, haven't seen it with 2.20)

> >
> >>> ---
> >>>    recipes/webm/libvpx.inc |    6 +++++-
> >>>    1 files changed, 5 insertions(+), 1 deletions(-)
> >>>
> >>> diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
> >>> index 9913d5b..9d40945 100644
> >>> --- a/recipes/webm/libvpx.inc
> >>> +++ b/recipes/webm/libvpx.inc
> >>> @@ -1,11 +1,15 @@
> >>>    DESCRIPTION =3D "vpx Multi-Format Codec SDK"
> >>>    LICENSE =3D "BSD"
> >>>
> >>> -INC_PR =3D "r5"
> >>> +INC_PR =3D "r6"
> >>>
> >>>    SRC_URI =3D "git://review.webmproject.org/libvpx.git;protocol=3Dgi=
t;tag=3Dv${PV}"
> >>>    S =3D "${WORKDIR}/git"
> >>>
> >>> +# ffmpeg links with this and fails
> >>> +# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)=
(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy=
@@GLIBC_2.4'
> >>> +ARM_INSTRUCTION_SET =3D "arm"
> >>> +
> >>>    CFLAGS +=3D "-fPIC"
> >>>
> >>>    export CC
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk09U2kACgkQN1Ujt2V2gBwZ/wCfUpw7sPb9VuIKrWXq6ygCN8hu
DrkAn25nL7/T2n0uJAnCkeXFIapDlaRz
=H5Hf
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
