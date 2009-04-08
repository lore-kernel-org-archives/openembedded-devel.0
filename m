Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LrNfW-0005Zy-QF
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 04:37:42 +0200
Received: by wa-out-1112.google.com with SMTP id n7so1466052wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 19:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=+izalOfxXYysvSCCD1Wdqc9z59IyYFVYkVAEtBGkGxU=;
	b=VIk1Eor6+7refIFnR7zUkybbTVwSNeVvl1AKtjVjjqP2ToA5KO/zeAlIhPN1xrKYcz
	24MwSD7FSoa5GldliNQbJpv3T4pBcOeaUNrfi3WukDQwR4gmdj+iNyJWemaiYHdpV6N0
	MZdsR7zvgu47ZgCYN3GffD42MQmIlQZc0vOQY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=oauNzjiTlapQACdm6SLSt3o+zyviz5XOlihrZsfdLbLp7Ue1LUTdoJ0LSXOLexJWGG
	LBgMv0iyLeCwWnIpIHwETWwsiKCr9ZhSM1+7DfGWcpm8PXJkirxlVk7MKEGFpFiq3MwU
	t2wmSsQo2TnenVZO/2njBx+jy8TLTEDVERqcM=
Received: by 10.114.113.16 with SMTP id l16mr431460wac.164.1239158078316;
	Tue, 07 Apr 2009 19:34:38 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id m26sm252468pof.10.2009.04.07.19.34.37
	(version=SSLv3 cipher=RC4-MD5); Tue, 07 Apr 2009 19:34:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Apr 2009 19:34:35 -0700
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <SNT105-W64E92C9061ABE0CC32BA6A90850@phx.gbl>
In-Reply-To: <SNT105-W64E92C9061ABE0CC32BA6A90850@phx.gbl>
MIME-Version: 1.0
Message-Id: <200904071934.36066.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.146.177
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: uClibc and 2.6.12.6 linux headers
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
X-List-Received-Date: Wed, 08 Apr 2009 02:37:42 -0000
X-Groupsio-MsgNum: 9213
Content-Type: multipart/signed; boundary="nextPart1996727.qlcr46VG48";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1996727.qlcr46VG48
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 07 April 2009 10:39:34 Mauri Sandberg wrote:
>=20
> Hi,
>=20
> I have let myself to be told that you need to have matcing kernel headers=
 to your kernel version when you are building uclibc.

yes usually thats best since after kernel 2.6.18+ had support for generatin=
g sanitized kernel headers

>=20
> I would need to build uclibc with 2.6.12.6 linux headers as I am trying t=
o put together a system that is based on a kernel with that same version. I=
 have tried to use PREFERRED_VERSION etc but bitbake always selects newest =
headers and ignores me totally.

if you are using angstrom then you have to make this weak assignment in con=
f/distro/angstrom-2008.1.conf

=2DPREFERRED_VERSION_linux-libc-headers   =3D "2.6.23"
+PREFERRED_VERSION_linux-libc-headers   ?=3D "2.6.23"

then you can override it in you local.conf


Closest to your version in linux-libc-headers_2.6.11.1.bb so may be thats w=
hat you should try first



>=20
> How to proceed here?
>=20
> -- Mauri
>=20
>=20
> _________________________________________________________________
> Drag n=92 drop=97Get easy photo sharing with Windows Live=99 Photos.
>=20
> http://www.microsoft.com/windows/windowslive/products/photos.aspx
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

=2D-=20
Khem Raj

--nextPart1996727.qlcr46VG48
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkncDTwACgkQHnJKy6V6em4SsACfbijQxhS3Qb94ARdEco7BH4QF
bq0AoKKewvMW+ZMh5Khf03VR9Y8D7BLa
=UyQv
-----END PGP SIGNATURE-----

--nextPart1996727.qlcr46VG48--
