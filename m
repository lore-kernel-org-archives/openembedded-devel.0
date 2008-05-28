Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1K1Fit-0003Ya-Jk
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 May 2008 09:05:23 +0200
Received: by wa-out-1112.google.com with SMTP id j37so3169107waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2008 00:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	bh=Z3hxDYPe23wJVsnTtVIqTrGbV7la73XoogX+0xwkmdQ=;
	b=pIb+C6ZHYdEy9NKa59qkTshMQlvEerwkr4UwCgYF98MLQyZh/LYVltzSdjtf4ZSch/tN2tp48lcrAEZVzaHZoynPCnvrB2SdAl4yE6L11pDKPAVeU0wqWbBGcQEB4SlbtcS2fBpJqEFxbBh1H1VniCjmxrOOvPBclIRCMby8Vvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	b=Pg5Ry6tBvPZd5tOCPQhPFuYWqq7XHMOziPMxzJRjXr9dEzsvyOMGgDlBGCO1JEGouZhkDwzNcYQ+xN9hN+zaVBC+Lr0vg/SzrqnxaSpsEi3HRVdXUOl/ppuX5ZVpkKZZ5vyLgBLW0PfKt+T3UvFSo4SE9MlLeIWbtIL/z+Pt8qE=
Received: by 10.114.75.6 with SMTP id x6mr2137421waa.187.1211958111030;
	Wed, 28 May 2008 00:01:51 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.30.173])
	by mx.google.com with ESMTPS id m27sm31533381wag.55.2008.05.28.00.01.49
	(version=SSLv3 cipher=RC4-MD5); Wed, 28 May 2008 00:01:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
Date: Wed, 28 May 2008 00:01:48 -0700
Message-Id: <1211958108.27777.15.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 28 May 2008 07:05:24 -0000
X-Groupsio-MsgNum: 5261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-N4bZ8kiqNHBxnCWAayk1"

--=-N4bZ8kiqNHBxnCWAayk1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-05-22 at 16:11 +0200, Enric Balletb=C3=B2 i Serra wrote:
> Hi,
>=20
> I have the same problem, but at this moment I don't have idea about solut=
ion.

I could reproduce this problem as well. I also tried to reduce the
issue. It is an ICE in GCC and I have made a small testcase which I am
able to reproduce on gcc-4_3-branch I have reported a gcc bug(PR36350)
for it  Meanwhile you can remove -frename-registers optimization pass
and ICE should go away.

Something like this might work around for glibc

Index: libc/iconv/Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- libc.orig/iconv/Makefile	2008-05-27 23:50:05.000000000 -0700
+++ libc/iconv/Makefile	2008-05-27 23:54:43.000000000 -0700
@@ -38,6 +38,8 @@
 CFLAGS-gconv_simple.c =3D -DSTATIC_GCONV
 endif
=20
+CFLAGS-gconv_simple.c +=3D -fno-rename-registers
+
 vpath %.c ../locale/programs ../intl
=20
 iconv_prog-modules =3D iconv_charmap charmap charmap-dir linereader \


Thanks

-Khem

>=20
> Regards,
>  Enric Balletbo i Serra
>=20
> On Wed, May 7, 2008 at 7:33 AM, Matthijs van de Water
> matthijs.van.de.water at gmail.com wrote:
>=20
> > Hi,
> >
> > I'm trying to get an ARM EABI build based on gcc 4.3 working. I'm not
> > having much luck with that so-far.
> >
> > The build fails at glibc-internal (tried both 2.6.1 and 2.7) with an
> > internal compiler error:
> > ../iconv/skeleton.c: In function '__gconv_transform_ucs4_internal':
> > ../iconv/skeleton.c:801: internal compiler error: Segmentation fault
> >
> > Am I missing something? Any ideas?
> >
> > Regards,
> >
> > Matthijs van de Water
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel at lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
>=20
>=20

--=-N4bZ8kiqNHBxnCWAayk1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIPQNcHnJKy6V6em4RAovTAJ9SlTx8GkThXDlPp0x/5X0AGVBeAgCghc+8
5Yi7wjpqhJl4v4jPCKLPBlY=
=is1E
-----END PGP SIGNATURE-----

--=-N4bZ8kiqNHBxnCWAayk1--
