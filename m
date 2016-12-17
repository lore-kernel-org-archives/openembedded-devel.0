Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 17CD26025E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 15:46:19 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1cIHBk-0003eS-Vy from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Dec 2016 07:46:21 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 17 Dec 2016 07:46:20 -0800
Received: by burninator (Postfix, from userid 1000)	id CCC3B5802CD; Sat, 17
	Dec 2016 10:46:19 -0500 (EST)
Date: Sat, 17 Dec 2016 10:46:19 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20161217154619.GB16746@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481940923-12914-4-git-send-email-joe_macdonald@mentor.com>
	<20161217030519.GA16746@mentor.com>
	<ce2313d2-20ad-6ca7-be1a-c7a5bb7aa9f4@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <ce2313d2-20ad-6ca7-be1a-c7a5bb7aa9f4@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 03/11] samba: remove unused variable DISABLE_STATIC
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2016 15:46:20 -0000
X-Groupsio-MsgNum: 64378
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline

--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 03/11] samba: remove unused variable DISA=
BLE_STATIC] On 16.12.17 (Sat 14:12) Andreas Oberritter wrote:

> On 17.12.2016 04:05, Joe MacDonald wrote:
> > Oh, I just realized this one sneaked back in despite my having thrown it
> > out at least twice now.  I've already rejected it in patchwork, but if
> > anyone is picking this up off the mailing list, DISABLE_STATIC is very
> > much still needed AFAICT.
>=20
> Sorry, I didn't recognize it as a global variable.

No worries, honest mistake, it does look a little odd when you first
encounter it.  :-)

-J.

>=20
> Regards,
> Andreas
>=20
> >=20
> > -J.
> >=20
> > [[oe] [meta-networking][PATCH 03/11] samba: remove unused variable DISA=
BLE_STATIC] On 16.12.16 (Fri 21:15) Joe MacDonald wrote:
> >=20
> >> From: Andreas Oberritter <obi@opendreambox.org>
> >>
> >> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> >> ---
> >>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb=
 b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> >> index aabc043..c9e0953 100644
> >> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> >> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> >> @@ -93,7 +93,6 @@ EXTRA_OECONF +=3D "--enable-fhs \
> >>                   --with-libiconv=3D${STAGING_DIR_HOST}${prefix} \
> >>                   --with-pam --with-pammodulesdir=3D${base_libdir}/sec=
urity \
> >>                  "
> >> -DISABLE_STATIC =3D ""
> >> =20
> >>  LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATUR=
ES', 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> >> =20
> >> --=20
> >> 1.9.1
> >>
> >>
> >>
>=20
--=20
-Joe MacDonald.
:wq

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYVV3LAAoJEEn8ffcsOfaW180H/RcBdNMTEkUtzISEFnu/GlpN
Sq+ByDDpjKOenS4fbDAw1zFLA2sUg68coqTuoo6n1sm1DuixK648NLewcbOKBBJL
lhpM2P+EInzeUBTYE71OetzP30XJT2GtiBJboEQ4+t8Vi0Dfpgb1VABzlV7w2NLk
Nnz3v7SZibvrgXKVLgNQRoDl0YxnLUN73UjDpiGJo0lcxVS7kkua2bASaC/u4lcX
+576RR8b1G4QhMsAiZowgtaVGcc8rY7K6ryUfnVN/zGY1E3rsYBDbO5aZBCueJ40
G6HupO6/oIar0UAo39B57kZlrm6AxLFdz9oMa3Gj4xmuDF5oa2BFEU7r4qnsKn0=
=dZ8d
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
