Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2E34A736BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 05:59:39 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so18788968qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 22:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=iCH5VJSuzBeSw2Ymu5cSYuc6jQ77+70f8H0bUiP4AC4=;
	b=foTOOmy7VosqNZbWfIprTkTq6S8x/nVhtIemcomsE/Ci6PslB+fq+NVEtuQKKxSOPj
	w9G2lKxSC6Gw8Bjo8hxmCzWWFY8bt/cUaL03mwFTOClPf7T9gvROVKetjn0+h4CKMh5M
	U05aqxWX1zurgLyMDzOmTl684sOpptdgCq0AQSk+5VsOoAVkrmfP0qHRI9zLyxAtJzk8
	hYBav6+vqNWkHkKW31rsAFOLic/PRbDo4rVBExRxk+jEzV8JxuluPUqzV+90jRvMzTuk
	kF/MShwIdAJ3bw1GmHe69jA9/pgcrn2VEnxOqW3WA9TndHstI90/dY7Y6sgsYKdiM5En
	m1Og==
X-Received: by 10.140.38.167 with SMTP id t36mr40073219qgt.69.1433397580677;
	Wed, 03 Jun 2015 22:59:40 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:243b:97d2:82f:b7e8?
	([2601:9:3580:84c:243b:97d2:82f:b7e8])
	by mx.google.com with ESMTPSA id w67sm1836464qgw.41.2015.06.03.22.59.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 22:59:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1433387388-7660-5-git-send-email-armccurdy@gmail.com>
Date: Wed, 3 Jun 2015 22:59:38 -0700
Message-Id: <8EDB3E74-B2A0-40AD-A815-8234BD64BFCE@gmail.com>
References: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
	<1433387388-7660-5-git-send-email-armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-oe][PATCH 5/5] mariadb.inc: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 05:59:45 -0000
X-Groupsio-MsgNum: 55760
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3DA6803B-E5AD-4C92-8695-0CA909B83B3F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3DA6803B-E5AD-4C92-8695-0CA909B83B3F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 3, 2015, at 8:09 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta-oe/recipes-support/mysql/mariadb.inc | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc =
b/meta-oe/recipes-support/mysql/mariadb.inc
> index 00fa965..3ee1b75 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -175,6 +175,7 @@ FILES_libmysqlclient-dbg =3D =
"${libdir}/plugin/.debug/ \
> # which are intentionally non-PIC on 32-bit x86 (see e.g.
> # storage/xtradb/plug.in in the source)
> INSANE_SKIP_libmysqlclient_append_i586 =3D " textrel"
> +INSANE_SKIP_libmysqlclient_append_i686 =3D " textrel=E2=80=9D
>=20

use x86 override


> FILES_libmysqlclient-r =3D "${libdir}/libmysqlclient_r.so.*"
> FILES_libmysqlclient-r-dev =3D "\
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3DA6803B-E5AD-4C92-8695-0CA909B83B3F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVv6UoACgkQuwUzVZGdMxR3jgCghyNIz4NFQLSrg3dnJrUQh7W4
mTgAoIWgO2HbYGJOgtUl8xAyMCw2tJ3T
=ZqLF
-----END PGP SIGNATURE-----

--Apple-Mail=_3DA6803B-E5AD-4C92-8695-0CA909B83B3F--
