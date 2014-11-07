Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6922F65CA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 23:20:40 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so5109136wgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 15:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NolS4FZWDwvR0sIosNWDEPwkCLsxbl0+naTgzZbY5Gk=;
	b=tvLQb+rSZn3WAYCEYUap0Mj4KqFJAeOsg9Le0fQ6QdO7iZyNQXW782GiYGV0C8TNap
	G5ainkqWT1xQXer6rhemnDNHtEtxYpnfsOIEKi/YYsCyqLmOg4dBqyEJJLHVEbatAunC
	CAJlptuEbksJ9v7tZBPKdiR3iiZTHI350zpYY4Qa5AZ8MEzgHUtRmSOhurc314nMhO4L
	EzdfYU0QtCBAX/rdp6LZeulwR/fKSMmkcfW+jVYvLzFmJzJO5SFshLbbSCyplmNIaWS2
	+AkhUG2HSinIwL3j9TlLsHyd3afKDVEciUYsZbGfdLmp9oyUgumkCgjkrK475WTFA1xZ
	KZ4w==
X-Received: by 10.180.109.17 with SMTP id ho17mr3094198wib.4.1415402440626;
	Fri, 07 Nov 2014 15:20:40 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r2sm3729685wif.23.2014.11.07.15.20.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 15:20:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 8 Nov 2014 00:20:46 +0100
To: Bryan Evenson <bevenson@melinkcorp.com>
Message-ID: <20141107232046.GI2444@jama>
References: <e111da9e0a424a2eac00f684ba4da94f@BY2PR05MB048.namprd05.prod.outlook.com>
	<20141107143618.GE2444@jama>
	<63ce226621b249b89737c73d94150d68@BY2PR05MB048.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <63ce226621b249b89737c73d94150d68@BY2PR05MB048.namprd05.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: PRINC migration questions
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
X-List-Received-Date: Fri, 07 Nov 2014 23:20:43 -0000
X-Groupsio-MsgNum: 52776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zOcTNEe3AzgCmdo9"
Content-Disposition: inline

--zOcTNEe3AzgCmdo9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 03:36:14PM +0000, Bryan Evenson wrote:
> Martin,
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > Behalf Of Martin Jansa
> > Sent: Friday, November 07, 2014 9:36 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] PRINC migration questions
> >=20
> > On Fri, Nov 07, 2014 at 01:31:02PM +0000, Bryan Evenson wrote:
> > > All,
> > >
> > > I am on poky/dylan and have not yet started using the PR server.  I r=
eally do
> > want to start using the PR server and stop using PRINC.  However, even =
more
> > so I really don't want to break my package feeds.  I want to make sure =
I do
> > my migration correctly and I don't do something that looks like it work=
s okay
> > only to find out it causes problems later.  With that in mind, I am loo=
king for
> > advice on the proper way to migrate away from using PRINC.
> > >
> > > Let's say I have a .bbappend in my private layer with the line:
> > >
> > > PRINC :=3D "${@int(PRINC) + 4}"
> > >
> > > The mainline layer's .bb has the line:
> > >
> > > PR =3D "${INC_PR}.0"
> > >
> > > And the mainline layer's .inc has the line:
> > >
> > > INC_PR =3D "r8"
> > >
> > > In this scenario, the resulting PR will be "r12.0".  Now let's say I =
want to start
> > using the PR server and get rid of PRINC in this recipe.  The resulting=
 package
> > contents are to be the same, so I want the resulting PR to be "r12.0". =
 From
> > some limited testing, if I start the PR server and remove the PRINC lin=
e from
> > my .bbappend the resulting PR is "r8.0".  So in my .bbappend should I c=
hange
> > the PRINC line to:
> > >
> > > INC_PR =3D "r12"
> > >
> > > Or should I change it to something else?  If I change it to a hardcod=
ed value,
> > then I'll have to be careful about what to do if the mainline recipe ch=
anges
> > INC_PR.  How have other people handled this situation?
> >=20
> > PR service won't you help at all with this (it adds another .N to PR va=
lue, so it
> > cannot fix when the level of .N goes backwards).
> >=20
> > The only really working solution is to increment INC_PR/PR values in
> > upstream recipes atomically with PRINC drop in your layers.
> >=20
>=20
> Thanks for the information.  Just a few more questions to make sure I get=
 this right.  We have a local Git server which has clones of all the Yocto/=
oe layers that we are using.  So your suggestion for the example scenario w=
ould be to:
> 1. Remove PRINC reference from our .bbappend
> 2. Change .inc in mainline recipe to INC_PR =3D "r12"
> 3. Push changes to our local Git repositories.
>=20
> Then if later I were to merge in updates from the official layers, there =
would be a merge conflict and I would know at merge time that I need to ins=
pect INC_PR for being the correct value.  Does that sound right?

Yes that's possible, a bit of pain to maintain it, but as you say, at
least you get the warning in form of merge conflict. Just keep in mind
that you can drop these PR, INC_PR bumps when the upstream recipe
increments PE or PV so you can at least drop some of them in time.

> > For PR service migration the more important part is to correctly migrate
> > LOCALCOUNT numbers (used in SRCPVs), especially if you're also changing
> > package architecture (e.g. t2 suffix added in daisy or selecting differ=
ent
> > DEFAULTTUNE and all your LOCALCOUNTs in PR server DB will reset to 0,
> > because of different db key to find them. Luckily you can pre-populate =
them
> > with single SQL command if you realize this situation before first buil=
d.
> >=20
>=20
> OK, now I'm confused.  I see no reference to LOCALCOUNT anywhere in the Y=
octo Project Mega Manual.  The only reference I see to LOCALCOUNT is on the=
 PR Service wiki which states that you can call "bitbake-prserv-tool migrat=
e_localcount" to migrate LOCALCOUNTs to AUTOINCs (and AUTOINC is another va=
riable I cannot find mentioned anywhere else).  So I don't fully understand=
 how to recognize if I need to migrate LOCALCOUNT numbers or what the SQL c=
ommand would be to perform the migration.  But it sounds like this is a pre=
tty important piece to get right during migration.  Could you explain this =
piece for PR service migration in more detail, or point me to the proper pl=
ace in the documentation that describes this part of migration?

The important question is if you're using SRCPV in some recipes you care
about upgrade-path (e.g. linux-yocto is using it).

LOCALCOUNT was name of variable which had the N number in SRCPV
(e.g. "gitrN+<hash>"), originally it was stored in separate sqlite
database cache/bb_persist_data.sqlite3 and maintenance of this number
was moved also to PR service, that's why it's not referenced in current
documentation anymore.

AUTOINC has the same meaning, basically the fetcher will ask PR service:
"do you have AUTOINC number for revision "deadcafe1234", recipe "abc",
architecture "cortexa9t2-neon" and PR service will reply either with
already stored number or max+1 for given recipe+architecture tuple and
store the returned number.

It's important for the migration, because if you depend on N numbers in
gitrN to be from always increasing sequence you'll get zero for all
recipes if you don't migrate your old cache/bb_persist_data.sqlite3 to
PR service's sqlite db.

Honestly I did that all and it was sort of working after few manual
fixes, but I've already gave up on trusting and testing upgrade paths :/.

It's possible to use public PR service with multiple builders, but there
are some cases where the current design wont work and other cases where
it just isn't reliable enough to trust it - if you want reliable images
on target you have to reflash them from time to time (or really know
what you're doing and what you're expecting to get every time you type
"opkg update && opkg upgrade" and most end-users don't know).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zOcTNEe3AzgCmdo9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRdU84ACgkQN1Ujt2V2gByTLACdGXIK9tjEJXSktgSFoHAVVPb2
8VMAn0FYYQRANtlT/NfNFuR1Bx/QcSqI
=IAJn
-----END PGP SIGNATURE-----

--zOcTNEe3AzgCmdo9--
