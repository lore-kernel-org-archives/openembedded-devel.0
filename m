Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pu5eC-0003PH-ET
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 17:08:32 +0100
Received: by fxm8 with SMTP id 8so3650779fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=y14fdmINEH87nna0diQ0VsPqml8E38qezAtL+Q4beSc=;
	b=xLJKGc3PEhdAEZfkjQRpsjIIICARvu9qAtwzXe7X6FDCgNZhWa9B6/3bV6h9YjH+AN
	fl/bjAQZWh7J0WK7Qag1+pXJwWaY/3hVTsc77mSxPSzB0Kyhtpi3uojF76HiVdbJiApD
	0dINZmLJydIOZzUFt5ZEfU+KvwWepPJoofKKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iY43cmm+2RgNDSBchpQP7dOk8mkdSwjFghqL24W9z1etQtULaPvCSgkV8A90BBi1Zv
	pGqDsRIMm3q5j/v4moXpUqefjkiRPH91s8wwUiznUE03Zf7IKt99SF3J1kLwnl3r5SJp
	sP1hfOdpqQbfRYq7dlrk9lAoo60HPnrXy2d4w=
Received: by 10.223.29.28 with SMTP id o28mr2524601fac.61.1298909227347;
	Mon, 28 Feb 2011 08:07:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n2sm1634415fam.4.2011.02.28.08.07.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 08:07:05 -0800 (PST)
Date: Mon, 28 Feb 2011 17:06:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110228160659.GG5886@jama.jama.net>
References: <4D6BC0EA.4000207@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D6BC0EA.4000207@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: shr-image failure
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
X-List-Received-Date: Mon, 28 Feb 2011 16:08:32 -0000
X-Groupsio-MsgNum: 29766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Content-Disposition: inline

--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 08:36:10AM -0700, Tom Rini wrote:
> Hey all,
>=20
> Trying to build shr/shr-image/nokia900 fails with the following:=20
> http://pastebin.com/Z13aYd2Z which seems odd in that we're building:
>=20
> NOTE: Running task 5802 of 10948 (ID: 2141,=20
> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/shr-image/DISTRO=
/shr/MACHINE/nokia900/label/sb-u804/recipes/efl1/elementary_svn.bb,=20
> do_setscene)
> NOTE: package elementary-2_0.7.0+svnr56372-r11: task do_setscene: Started
>=20
> And it's already past do_populate_sysroot before this starts.  I do see=
=20
> some svn complaining (and not doing something...) earlier on in the=20
> do_configure here.

This looks like related to
http://www.mail-archive.com/bitbake-dev@lists.berlios.de/msg00880.html

which was resolved later with scmdata=3Dkeep param
http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3D05cbc1d1a01c667c7=
7688f36fbc5b61c5f452a3a

but that patch didn't make it to bitbake-1.10.2 release, but neither did
patch causing this in master/1.12
http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3Df264cb6d43472525a=
d787b0887764ea696ec52ba

Can you try that svnversion call in your checkout to get thath svn
error? It seems to be working here fine.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1ryCMACgkQN1Ujt2V2gByXAwCePfWjAdRsqTtqEQNxtp9q7/XJ
IpYAnRtrAgJEQPrOtM/+cqIsBX3j9yV1
=jB+f
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--
