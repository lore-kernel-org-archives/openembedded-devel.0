Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0A560017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:16:26 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u188so195876238wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 10:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7aNGncKCIau5tLAR1E0GqIzcGgxE+E2ZJ8uCjxhYM0s=;
	b=ypWjv3JJGBKC2KpNrCX/INGr+JiI7c0/WWgCl40vMjS7cHrIzECG3JEyEKySKnWZfJ
	OM/0YFiI4fQ3gwglC1XL3QzZ0AyAukovmU5O9UUocII3qXWtDUs6c5OByYVmGo5r5EVP
	2rggntlZx/m3hUOHcx8njoHC+fOERm0JGwY0rh9m0nMaBCWMrI3DkZxruveXZS8NMG7/
	fEGGfB5PbKolsJMEAlpBOYw3jZsK3nb/WtCxU8pD7PKjg6LtQv0AiqOoO8HXOfVtXhJk
	OZ8mj5zU4fIi0/g0sBktgw4rZuDiL5kOh3zj1RkGwhVRGNmWgCuYYCh5HB8bSu1f0AnW
	qTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=7aNGncKCIau5tLAR1E0GqIzcGgxE+E2ZJ8uCjxhYM0s=;
	b=FNIpz0YIiqduXlD5zCtt0hmRbh1WWKH5N8MGSyTImMwfAoPDAUBNRMPcp6vQ3BVWjy
	B2kRGfsgxZ17iCmqbXLnPjJQ0lZJD7JhreVMuXWXmSNM5samwwOlraw3AKwYRTzjwSGO
	sbC+cSP6EcW3m13OmIVoM18dSg8msQJpjdG/wugT7ZddpSKz9PVTdnKQm/lesKRqj+dW
	Da/dIMlMkG6PQ4tpUHJUVfkPsEH9MoUeSYWMw8galF0zN40vH9cpHi0EHuhT5NgNCGJ1
	WOaDVpRwG8BwNFBwPBGy/yIhEH2Wh10x2WUwlk6FbO6iHyb3OugaZ1q27J0mV3AKLFiR
	06Aw==
X-Gm-Message-State: ALoCoQkm8trs5IoTlcCgIbyhZO3vUPJ3laCfZvNTaLCVHIQS+Q7cSOPTQ2S3lI/Q7tiDGh8GIXDRAjQKSb64UHUGt+EE5gTsnw==
X-Received: by 10.194.110.106 with SMTP id hz10mr37706798wjb.135.1453313786198;
	Wed, 20 Jan 2016 10:16:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg1sm30017850wjc.27.2016.01.20.10.16.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jan 2016 10:16:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Jan 2016 19:17:57 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20160120181757.GA2610@jama>
References: <1451304855-1444-1-git-send-email-Martin.Jansa@gmail.com>
	<569F5292.5010506@windriver.com> <20160120175821.GD5068@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160120175821.GD5068@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for libcap-ng
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
X-List-Received-Date: Wed, 20 Jan 2016 18:16:28 -0000
X-Groupsio-MsgNum: 59618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 12:58:22PM -0500, Joe MacDonald wrote:
> [Re: [oe] [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for=
 libcap-ng] On 16.01.20 (Wed 17:25) Rongqing Li wrote:
>=20
> >=20
> >=20
> > On 2015=E5=B9=B412=E6=9C=8828=E6=97=A5 20:14, Martin Jansa wrote:
> > >From: Roy Li <rongqing.li@windriver.com>
> > >
> > >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > >Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> >=20
> > Hi Martin:
> >=20
> > Could you cherry-pick this patch to master?
> > or merge it from master-next to master, it stay in master-next
> > two month.
>=20
> It looks like you're talking about http://patchwork.openembedded.org/patc=
h/106295/
>=20
> The reason it hasn't been merged yet is it is marked 'accepted /
> archived' it patchwork, so it's not even showing up on my radar.
>=20
> Please don't hesitate to ask about these if the state seems to not match
> what you're seeing in the tree.

Joe:

what about these?
They are all (except waf-samba which should probably be moved) in
meta-networking and some of them are waiting in master-next for long
time.

pick ed1468e postfix: premission of /var/spool/mail seems incorrect
pick 7b10fc4 wireshark: update SRC_URI link to sources
pick 406208e nbd: use BPN in Files
pick e9f8f88 cim-schema-exper: fix host-user-contaminated
pick 7dc6531 ctdb: add PACKAGECONFIG for libtdb
pick db009ba netkit-ftp: fixed invalid symlink
pick 0d52cfe iscsitarget: split the kernel module into separate package
pick 4e844c5 iscsitarget: skip the arch test for kernel modules
pick 2b52016 ncftp: fix build failures with ccdv
pick bf0d1ae postfix: fix clean broken issue
pick 4d64758 lowpan-tools: add missing flex/bison deps
pick 07847fa samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
pick 757422e dnsmasq: Listen only on loopback and disable DHCP
pick d57cf3c rp-pppoe: 3.11 -> 3.12
pick 513d01e postfix: 3.0.2 -> 3.0.3
pick c7f66db stunnel: 5.21 -> 5.28
pick 3dd8ad0 libtdb: upgrade to 1.3.7
pick 3a30f23 libldb: upgrade to 1.1.21
pick 6a714ad libtevent: upgrade to 0.9.25
pick 43c0e27 libtalloc: upgrade to 2.1.3
pick c777835 samba: fix the incorrect tmpfiles installed directory
pick 40b09a6 samba: backport patches for cross-compiling
pick a3ab6ca waf-samba.bbclass: add cross-answers option and files
pick 03da6a8 dovecot: 2.2.18 -> 2.2.21
pick 9c85f1f xl2tpd: modify recipes to avoid forced internet access
pick adbc64f recipes-connectivity/samba: Only rmdir directories that exist
pick 6569323 openvpn: 2.3.7 -> 2.3.8
pick 92c55d9 geoip: add ptest functionality
pick 49660e0 opensaf: 4.6.0 -> 4.7.0
pick 311d79c ctdb: Fix rootfs creation errors
pick b866e0a dhcpcd: add recipe for dhcpcd

>=20
> -J.
>=20
> >=20
> > thanks
> >=20
> > -Roy
> >=20
> > >---
> > >  meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > >diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb =
b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> > >index 0ffe589..150e55f 100644
> > >--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> > >+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> > >@@ -23,6 +23,7 @@ PACKAGECONFIG ??=3D "openssl ipv6"
> > >  PACKAGECONFIG[openssl] =3D "--with-crypto=3Dyes, --without-openssl -=
-without-crypto, openssl"
> > >  PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> > >  PACKAGECONFIG[smi] =3D "--with-smi, --without-smi,libsmi"
> > >+PACKAGECONFIG[libcap-ng] =3D "--with-cap-ng=3Dyes,--with-cap-ng=3Dno,=
libcap-ng"
> > >
> > >  EXTRA_AUTORECONF +=3D " -I m4"
> > >
> > >
> >=20
> > --=20
> > Best Reagrds,
> > Roy | RongQing Li
> --=20
> -Joe MacDonald.
> :wq



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlafztgACgkQN1Ujt2V2gByy9QCeKxVsXFUJBkfyt5PIkyVnyQNb
v/kAn1kZ85HrPx/xa/aP81q6F7BgZna2
=nWaY
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
