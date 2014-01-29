Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 285476E791
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 10:15:53 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h10so798596eak.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 02:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LSsNrcHDRMh+YUpwLu/cG6etM9PW1dPDgU9/kimx2F4=;
	b=zj5ExUuO3EjMFgvvtlCqRxEHbItdrmpZ0Is427kSEFdK8vEa9mh3gaU9YEQrbwl+CC
	FV/n1KHdNErmEa1dVUUB+ma9H69kLhMiRSoZ9DYNLEu8GqD2rOhwWe7U3E3QxYJiuUST
	he7tvC1sBit9BeZGztCId4UAn0f1uD2Efd6QwR19b6ZWXEQOotl7uuANYGnVJLEdqkkM
	HMgbPw+MvjQGKsknVLB3L1fmzxo/ctZGApFBNQb6UR57A16DxdGJKv2+pmRds6SmBGz9
	UT/K/L5NnZnwkdKcwVBP5LLGtlmA+VQlU8lhhZs66b59W/frkmaxTtbvnUKZntf8aYa/
	HsBA==
X-Received: by 10.15.21.2 with SMTP id c2mr1450112eeu.77.1390990554852;
	Wed, 29 Jan 2014 02:15:54 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b41sm6622760eef.16.2014.01.29.02.15.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 02:15:53 -0800 (PST)
Date: Wed, 29 Jan 2014 11:15:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140129101553.GP3718@jama>
References: <1390943894-18907-1-git-send-email-Martin.Jansa@gmail.com>
	<lcac4m$c5i$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <lcac4m$c5i$2@ger.gmane.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-systemd][PATCH] connman: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 29 Jan 2014 10:15:55 -0000
X-Groupsio-MsgNum: 47939
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FWibJpkbnkY6rrXF"
Content-Disposition: inline

--FWibJpkbnkY6rrXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2014 at 08:55:50AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Martin Jansa schreef op 28-01-14 22:18:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > .../connman/{connman_1.20.bbappend =3D> connman_%.bbappend}
> > | 0 1 file changed, 0 insertions(+), 0 deletions(-) rename
> > meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.20.bbappend
> > =3D> connman_%.bbappend} (100%)
> >=20
> > diff --git
> > a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappe=
nd
> > b/meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend=
=20
> > similarity index 100% rename from
> > meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend=
=20
> > rename to
> > meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
>=20
> Can we come up with a plan to drop these packaging bbappends? We've alrea=
dy
> had more than one OE (well yoctoproject) release so distros have had ample
> time to adjust to the new packaging system.

I have already updated SHR as distro, but that doesn't fix upgrade-path
on target (for crazy folks who would try to opkg upgrade themselves from
dylan to master).

So as long as they are applied with %.bbappend I wouldn't mind keeping
them.

I don't want to rename them all to %.bbappend at once, because version
upgrades are good opportunity to drop PRINCs.

> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFS6LQGMkyGM64RGpERAuYSAJ9s0a8ZiO46TgHYEeU847dYSbJ0fgCeM7ZY
> ksC7lfMtsOUETerxdMBX3h8=3D
> =3Dx7iV
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FWibJpkbnkY6rrXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLo1NkACgkQN1Ujt2V2gBzx2QCeJC96rBTAjsxAdKhYu8wEk5+X
aLEAnijmv/tCouNvVCb/4KR950md33hB
=foz5
-----END PGP SIGNATURE-----

--FWibJpkbnkY6rrXF--
