Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 47D1465DB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 19:48:50 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so9224907wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 12:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=bYqdDalQ/2LSqMf3wRipBV0Mpc0VgAIH5dqHZBxMv5g=;
	b=frbZ9KzOARE9Hl7lcVNIM5LSVichF+b92JHfnxdQTOPICjruWXCy1FDMyNNgefzqHA
	nnN0v+UDZg7MBtCI5GELVJEW3YO6+pfh+lw6LiSu/GT4hCRpj1PwLEyNeObwddoHi+Bq
	1kjRcz5XU97veZwM1k0RzDlMJLM+Hsv1hHUbbTD5REcrYRTKP0K8UD56f/zl5ACi/AaH
	aRm5o/BDpAqRsMIk9EtFyXp0GU3jbnCzoa3Lfig5otxBV4H13KJITOgWaa6HhPig61aa
	Ln1mhkHCoNcKDfkbXbZHlKp8BhGXR9KgLulChIryTSt2UkrvaLJbxLJNiuPsO3mn5Thv
	CR8A==
X-Received: by 10.194.58.244 with SMTP id u20mr720900wjq.36.1408650531616;
	Thu, 21 Aug 2014 12:48:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pe6sm69041117wjb.38.2014.08.21.12.48.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 12:48:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Aug 2014 21:48:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140821194854.GC3660@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Patchwork almost clean again, but please check this list for your own changes
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
X-List-Received-Date: Thu, 21 Aug 2014 19:49:01 -0000
X-Groupsio-MsgNum: 51814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CLLB+19uC8aeq76E"
Content-Disposition: inline

--CLLB+19uC8aeq76E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Following changes are still pending in master-next with unresolved
review comments:
pick d7060f9 mplayer2: Inherit python3native
pick 9fdb2f2 tcpslice: add recipe under tcpdump
pick 00f8bee openldap: upgrade to 2.4.39
pick bf9eb0b add support for opendataplane
pick a086815 Revert "add support for opendataplane"
pick 8cf585c xbmc: Update to v13.1

These are just new and waiting for verification build:
pick 64ee587 ltp-ddt: update to the latest rev, bump the version
pick f921a54 webmin: uprev from 1.620 to 1.700
pick ac6f3ef samba: upgrade to 3.6.24
pick ee32750 lmbench: use BPN instead of PN
pick 77a10b9 oscam: fixed QA issue where binary was being stripped
pick 5881aa5 python-pyparted: Add recipe
pick 6272b4d lmbench: remove debianutils from RDEPENDS and add perl

Few more are in master-next bundle on patchwork
http://patchwork.openembedded.org/bundle/jama/master-next/?archive=3Dboth

Old reviews also with unresolved review comments:
[meta-multimedia,1/2] xbmc: first try at making it build for non-GLES platf=
orms	2013-03-11	Koen Kooi		New
[meta-multimedia,2/2] xbmc: add patch to make 'ld-is-gold' work with config=
ure	2013-03-11	Koen Kooi		New
[meta-gnome,2/2] libnotify: update to 0.7.5 and drop libnotify3 2013-04-17	=
Andreas M=FCller		New
[v2] packagekit: Updated to 0.8.13	2013-12-16 eu@felipetonello.com		New
[meta-oe,2/2] libsdl-image: Add support for libsdl-image-native=20

If you recognize one of these, please update its status.

Just to refresh the memory, here is how the patches are maintained in
patchwork, I would appreciate more people updating status of their own
changes:

On Wed, Jan 16, 2013 at 12:49:02AM +0100, Martin Jansa wrote:
> On Fri, Dec 14, 2012 at 12:05:07PM +0100, Martin Jansa wrote:
> > On Fri, Dec 14, 2012 at 12:20:58AM +0100, Martin Jansa wrote:
> >=20
> > Can we fix patchwork to show bundles marked as public to public users?
> >=20
> > I've few bundles
> > Name	Project	Public Link	Patches	Download	Delete
> > in-test		oe	http://patches.openembedded.org/bundle/jama/in-test/	21	=09
> > oe-classic	oe 	http://patches.openembedded.org/bundle/jama/oe-classic/	=
61	=09
> > oe-classic-lic	oe 	http://patches.openembedded.org/bundle/jama/oe-class=
ic-lic/	70	=09
> > 2011.03-maintenance oe	http://patches.openembedded.org/bundle/jama/2011=
=2E03-maintenance/	1	=09
> > denzil		oe	http://patches.openembedded.org/bundle/jama/denzil/	6	=09
> > danny		oe	http://patches.openembedded.org/bundle/jama/danny/	5	=09
> > meta-handheld	oe	http://patches.openembedded.org/bundle/jama/meta-handh=
eld/	1	=09
> > meta-java	oe	http://patches.openembedded.org/bundle/jama/meta-java/	15	=
=09
> > meta-opie	oe	http://patches.openembedded.org/bundle/jama/meta-opie/	1	=
=09
> >=20
> > But without sharing link to bundle, nobody will find it (AFAIK) maybe
> > there is newer version of Patchwork which shows public bundles
> > somewhere?
> >=20
> > oe-classic bundle is now marked as archived - so not listed by default.
> > oe-classic-lic also marked as archived and I'll apply it later today.
> >=20
> > It would be great if we agree to mark patches as archived when they get=
 assigned=20
> > to some bundle to keep main patchwork list relatively clean and layer/r=
elease=20
> > maintainers can still see all patches with "New" state in corresponding=
 bundle.
> >=20
> > I've also marked some patches with review comments without reply as
> > "Changes requested" + archived. Pity that some patches had rather
> > trivial issues, but submitter never responded with v2..
> >=20
> > And there were some patches for oe-core already applied in oe-core.. so
> > marked as "Not applicable" + archived.
>=20
> Andrea just asked about this, so if someone missed this information:
>=20
> There are some bundles:
> 2011.03-maintenance oe	http://patches.openembedded.org/bundle/jama/2011.0=
3-maintenance/	1	=09
> danny		oe	http://patches.openembedded.org/bundle/jama/danny/			9	=09
> denzil		oe	http://patches.openembedded.org/bundle/jama/denzil/			10	=09
> in-test		oe	http://patches.openembedded.org/bundle/jama/in-test/			161	=
=09
> meta-browser	oe	http://patches.openembedded.org/bundle/jama/meta-browser/=
		7	=09
> meta-handheld	oe	http://patches.openembedded.org/bundle/jama/meta-handhel=
d/		2	=09
> meta-initramfs	oe	http://patches.openembedded.org/bundle/jama/meta-initra=
mfs/		1	=09
> meta-java	oe	http://patches.openembedded.org/bundle/jama/meta-java/			15	=
=09
> meta-kde	oe	http://patches.openembedded.org/bundle/jama/meta-kde/			1	=09
> meta-networking	oe	http://patches.openembedded.org/bundle/jama/meta-netwo=
rking/		12	=09
> meta-opie	oe	http://patches.openembedded.org/bundle/jama/meta-opie/			2	=
=09
> meta-systemd	oe	http://patches.openembedded.org/bundle/jama/meta-systemd/=
		25	=09
> meta-webserver	oe	http://patches.openembedded.org/bundle/jama/meta-webser=
ver/		2	=09
> oe-classic	oe	http://patches.openembedded.org/bundle/jama/oe-classic/			6=
2	=09
> oe-classic-lic	oe	http://patches.openembedded.org/bundle/jama/oe-classic-=
lic/		70	=09
>=20
> I'm adding patches to right bundle when I'm sorting patches to=20
> test them on jenkins (in-test bundle, contrib/jansa/in-test branch).
>=20
> In the process I'm marking them as "Archived" (to see what's not sorted i=
n main page),=20
> but because their state stays "New" you can still find them in bundles, e=
=2Eg.
> http://patches.openembedded.org/bundle/jama/meta-webserver/?archive=3Dboth
>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CLLB+19uC8aeq76E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP2TSYACgkQN1Ujt2V2gBznVgCfbcV7rSGYWl32Yntp7NcRu8mc
iOcAnjHfqzwjJa9nJSTBMdGGi1aZ2qLV
=oISL
-----END PGP SIGNATURE-----

--CLLB+19uC8aeq76E--
