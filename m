Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 15C5465DC4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:25:01 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so3018824eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=yrTFoivnspdsdc0ASvyQG8AuWAizhV1mlOEk1pRj+t4=;
	b=nEMnuEaDjJysjTdxwylF1WGvSBAdgKar+HK5yrQELpKPfE7f0VsA9flyHHZw5mIEqt
	ixn2dep7IhGGp/jfBSQ8+mkD5A331w/G/R3MJpHXY/o+Y71ofLqgMXlUB0wBJxkSFKfY
	7CTt8Dv8Y9ppJXq9hMTPE4QTsVfrPrLNKKv2ddJ9V3AAKFwOXL6u2yzpcPN0g+DDvh8O
	ksPgERe9htvNU6BLqXlldTOCbBOUPG63m3Ye8+hiM73CzzgWNgHx7B7gbp171ISWaBxV
	+734y0T3OQjF6WvoP1efToMeUcEsRgY3+LNH4jVqdJ3iLOqs1fMmxAtigPe30VPLc/su
	MSIQ==
X-Received: by 10.14.218.193 with SMTP id k41mr38892362eep.16.1398003902061;
	Sun, 20 Apr 2014 07:25:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm95011933eep.12.2014.04.20.07.25.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:25:00 -0700 (PDT)
Date: Sun, 20 Apr 2014 16:25:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420142506.GS2486@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: meta-oe patch queue
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
X-List-Received-Date: Sun, 20 Apr 2014 14:25:06 -0000
X-Groupsio-MsgNum: 49356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hH+ZLLRw9aZ7+ob6"
Content-Disposition: inline

--hH+ZLLRw9aZ7+ob6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

test-dependencies run finally finished, please see found issues in
"State of bitbake world, test-dependencies 2014-04-18" thread and
please help with cleaning those.

That unblocked me to do verification builds on jenkins and merge most
pending patches.

patchwork wasn't working correctly for few days so it's possible that
I've missed some patches from ML (I've tried to send replies to merged
patches again).

Please double check if your pending patches are merged or at least in
master-next.

Most master-next patches have some unresolved review e-mails on ML, if
you want to get your patch merged in daisy, please resolve them soon.

Here is my list of pending changes:
hid .. means that the build was hidden by some other failure (e.g. gnuplot =
by failing gd)
verify .. needs to wait for another verification build
      (now I've used only qemuarm + qemux86, qemux86-64 build will run toni=
ght)
review .. unresolved comments
fails .. fails in some configurations - issue was reported on ML

pick 5c73b58 daq: Update from 2.0.1 to 2.0.2
  fails
pick 480d490 gnuplot: upgrade to 4.6.5
  hid
pick cefd609 gnuplot: added upstream license file and updated recipe to mat=
ch
  hid
pick e7bacbc eject: Fix wrong return value
  review
pick c17f754 fbreader: remove old, non-building version
  review
pick f878793 bdftopcf: add recipe
  review
pick 71a7c56 terminus-font: update DEPENDS
  review bdftopcf
pick 4bc7f0d ltrace: update to version 0.7.90
  review
pick de15695 iozone: update version to 414
  fails fetch
pick 8fd92ed mariadb: add perl to RDEPENDS
  review koen
pick d8e24f7 gd: update to version 2.1.0
  review
pick e0759f9 gd: add perl to RDEPENDS
  review
pick e9e94a2 gd: fix the subdir-objects error
  review
pick 5f1593b postgresql: add init script and enable some bindings
  review
pick f396e78 vim: add dependency and selinux and acl support control
  verify
pick c08f3eb vim: don't check acl header if acl support disabled
  verify
pick 64ad76a vim: add knob whether elf.h are checked
  verify
pick 4b1be3a gnome-themes: enables the path to the icon-name-mapping to be =
specified
  verify
c11f2e3 nodejs 0.8.18: update to 0.10.25
  verify
9f30d08 dejagnu: recipe taken from openembedded
  verify
17be66b glcompbench: Create 2012.08 version
  verify

I've sent fix for gd now, so it's possible that gnuplot + 3 from 4 gd patch=
es will be
merged today.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hH+ZLLRw9aZ7+ob6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNT2MIACgkQN1Ujt2V2gBxxOACeK2iKXamDSKNLdVnPCpsuq7ME
vgYAoIhXPl4z14J/cUp4Iox/tgFY6GbP
=DqBc
-----END PGP SIGNATURE-----

--hH+ZLLRw9aZ7+ob6--
