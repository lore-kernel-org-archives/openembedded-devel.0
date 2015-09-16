Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 15F1C60053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:08:37 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2D5BABcd/lV/5tjdVtdGQEBAYMHgT2FSrdiDodyAoE9OBQBAQEBAQEBgQpBA4NgAQEEeBELGAkWDwkDAgECAUUTBgICiC4ByioBAQgCIIZzhH2FFBeEFQEElV6CSYFdiF6bER8BQ4JDgUA8M4MXhxMBAQE
X-IPAS-Result: A2D5BABcd/lV/5tjdVtdGQEBAYMHgT2FSrdiDodyAoE9OBQBAQEBAQEBgQpBA4NgAQEEeBELGAkWDwkDAgECAUUTBgICiC4ByioBAQgCIIZzhH2FFBeEFQEElV6CSYFdiF6bER8BQ4JDgUA8M4MXhxMBAQE
X-IronPort-AV: E=Sophos;i="5.17,539,1437429600"; 
	d="asc'?scan'208";a="23568561"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 16 Sep 2015 16:08:37 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1ZcDO1-00065d-4b
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:08:37 +0200
Received: from fanzine.local.igalia.com ([192.168.10.13] helo=[10.76.0.26])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZcDO0-0007qA-Sz for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:08:36 +0200
To: openembedded-devel@lists.openembedded.org
references: <1442321402-22469-1-git-send-email-clopez@igalia.com>
	<1442321402-22469-4-git-send-email-clopez@igalia.com>
	<CAMKF1sqRmW0WYzAyusDEW47onz-h9W0tZ-sYWyqp28=u3fbzgQ@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
organization: Igalia S.L.
message-id: <55F977E4.3030202@igalia.com>
Date: Wed, 16 Sep 2015 16:08:36 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <CAMKF1sqRmW0WYzAyusDEW47onz-h9W0tZ-sYWyqp28=u3fbzgQ@mail.gmail.com>
Subject: Re: [meta-browser][PATCH 3/3] chromium: Rework the evaluation of the Wayland feature.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Sep 2015 14:08:38 -0000
X-Groupsio-MsgNum: 57391
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="KFVgwp670tIod9fvCLLH4MbUD7QWrsKOH"

--KFVgwp670tIod9fvCLLH4MbUD7QWrsKOH
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 15/09/15 18:56, Khem Raj wrote:
> On Tue, Sep 15, 2015 at 5:50 AM, Carlos Alberto Lopez Perez
> <clopez@igalia.com> wrote:
>> +    CHROMIUM_BUILD_TYPE =3D d.getVar('CHROMIUM_BUILD_TYPE', True)
>=20
> Lets default to one if its not set by user and set a bb.note about
> what is chosen may be Release as default is good.
>=20

It already defaults to Release. The first patch in the series does that
in chromium.inc


--KFVgwp670tIod9fvCLLH4MbUD7QWrsKOH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJV+XfkAAoJEJZQic5rlfiC8dsP/jcJ2GefPhJhWUEt921lm6eO
XeUIHQ+X1aLeEDZ9Mdglg9oKiHDZSv6MZ1WY0Tt9s9PSIR/pzt5ObZIAxu6yRMnA
RiKFwbVJ5Ph96M7ha42jro/fhh3vBM3BVnaLz0qEVSe4J2kOA6bVMdCGFSJ0jwhO
+8A7gCRuCj7lBWY2KRGQ7YZBVSFCh7ngP5XENmOmPUSAxk6U2ZxyvoLwVbwSBdji
PbvJBx7R/+g7ia4S2EaR910cZa3UpEsBpeJDto28KCvpwQ0Qs49Tv/+p93cnEhr8
t/935iIPzYsygmRbc2MlKJy6CGWIEyMPqwv4SZBDI5sb9GJXPHui5yEadyo/lQGr
6iNchc7ClXRnlri+tbkbtPBaXDl51Qir5cSOpj+3l73iwZqBN1DgzdfB5Em9vfUu
L8KweP229pmJr48V2zmrInFLeB49cKhGBgqzuVbLYp3PuiSlLPottAQ7r4HO+bHr
CjBThBBdsmSYJNoBIZuVqZ/jY6w7pj4/Ha8miGM4POttnFGbpmOHspxU3iTexiFF
B/mMRBMGfVrxuDyyhZ6O2xNUqeaMUx8l0IOX6YkC4d1LGiaW6ZHQ8DqEyNjgtsMZ
FtjKqKdCY3DckADpVYLlShNxA4PHvpKmqZS1weDU+b5ZBUUGMDL5VFTL1S1LjORN
UPAD0/DHskKuqgwbLB21
=pr1z
-----END PGP SIGNATURE-----

--KFVgwp670tIod9fvCLLH4MbUD7QWrsKOH--
