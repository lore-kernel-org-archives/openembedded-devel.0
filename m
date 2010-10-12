Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <frederik.sdun@googlemail.com>) id 1P6DqY-00038F-PR
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 04:47:12 +0200
Received: by bwz9 with SMTP id 9so96160bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 19:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer;
	bh=DWmcK+BKujZwEb5LYx4HbyMgU53kEDoUmGK0kZOdPAI=;
	b=hQ9mI4VMzpaVFLRb+csIrq2pWgPP3D3bN4iKDaArLclTmK18CgWMyDDwHSoB6cqgJg
	IAKNKRGR+hYIXPmb0Iw4Xni2FTzbk90VmqbqD/Ium+sZUsRFfX9Gza5ronrHDm3204Ej
	pzQVTIBGCmhcBSNk2uRmbvxFM18wXqBfZdea4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer;
	b=Fd2SuDoHcpvr3VXoU2Rr0Zt+lYS+1nBAjzTLrtw0fnCu1xf2BMJUBmbWbnSS+f1SWh
	6ubtjXW6eN6s20jcgVA7GI/h2WCdc2xJcyr+g0s5wgrkTmgCzD/KNmFoOeWhp/WhLgdQ
	tunSI/e+BmGg1CLtGYkj9F4QtfgQ0q+lz9Npo=
Received: by 10.204.54.196 with SMTP id r4mr8048013bkg.5.1287024403002;
	Wed, 13 Oct 2010 19:46:43 -0700 (PDT)
Received: from [192.168.2.150] ([93.216.254.93])
	by mx.google.com with ESMTPS id g12sm9724496bkb.2.2010.10.13.19.46.40
	(version=SSLv3 cipher=RC4-MD5); Wed, 13 Oct 2010 19:46:41 -0700 (PDT)
From: Frederik Sdun <frederik.sdun@googlemail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286730733.3808.92.camel@mattotaupa>
References: <1286728355.3808.55.camel@mattotaupa>
	<1286730733.3808.92.camel@mattotaupa>
Date: Tue, 12 Oct 2010 19:43:15 +0200
Message-ID: <1286905395.13585.14.camel@brain>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: frederik.sdun@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_24_48,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: environment variable `PKG_CONFIG` not set
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
X-List-Received-Date: Thu, 14 Oct 2010 02:47:12 -0000
X-Groupsio-MsgNum: 24823
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-O6XfJmODWiRCjMtjePo6"

--=-O6XfJmODWiRCjMtjePo6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 19:12 +0200 schrieb Paul Menzel:
> Am Sonntag, den 10.10.2010, 18:32 +0200 schrieb Paul Menzel:
> > Dear OE folks,
> >=20
> >=20
> > looking at `run.do_compile.xxxxx` I noticed that `PKG_CONFIG` is not
> > set. Several other pkg-config related environment variable get set, so =
I
> > am quite surprised.
> >=20
> > Does this have to be added to `classes/{native,nativesdk,sdk}.bbclass`?
>=20
> This would also be the =E2=80=9Ccorrect=E2=80=9D fix for [1] and [2] if I=
 am not wrong.
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/0=
23029.html
> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-Septembe=
r/024217.html
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

It already uses the correct pkg-config because ${SYSROOT_NATIVE} is in
$PATH. But pkg-config --variable doesn't prefix $PKG_CONFIG_SYSROOT_DIR

--=-O6XfJmODWiRCjMtjePo6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky0njMACgkQvbwBzXsbjyqZhgCdGgDNeeb5D4MN11Ly+p8o8JgA
4sUAoJ1Ch0dvhXbJUZN21UF9RMzZxSJ8
=G2Td
-----END PGP SIGNATURE-----

--=-O6XfJmODWiRCjMtjePo6--
