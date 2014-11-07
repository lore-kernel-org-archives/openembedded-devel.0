Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4A46017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:36:16 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so4685242wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RKT/QvlXfh40eRbt53cjpe+lnx3zcj/Q16tAQ5q03Uk=;
	b=IYOBhe4YuWMcnVqJxfZQdpPsZPQPldxVvxZ/1MuDAKz9e9BWcs8t1npBysDrg37ni1
	jCaj+UfHLDAgL5s8DATuNvkLW7nLnpOjR2uuiJ08e689AzAcK6wNWQYPONBwRYI/kN0n
	Ovrd0dbtCZxjM43gBXkAhtAtxr3ji9tZ+JU9MgfF4x9MjcS0RCdDIDKbG9LSPQdRG4xg
	s+KUiWYj8YXdLhVaU17HcxGg7mFIb1XuW9RgNZI91mSguL0EmRTB3NQCy7jZXyPTN+uc
	vknVjtMp2eg48n8UwptZ7HHVhHaVP7WzlDjauMwQSSjMvSpsrOsf6eDhthRC7TraQyoi
	3tNw==
X-Received: by 10.180.9.196 with SMTP id c4mr5728528wib.66.1415370973244;
	Fri, 07 Nov 2014 06:36:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ny6sm2249219wic.22.2014.11.07.06.36.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 06:36:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Nov 2014 15:36:18 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141107143618.GE2444@jama>
References: <e111da9e0a424a2eac00f684ba4da94f@BY2PR05MB048.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <e111da9e0a424a2eac00f684ba4da94f@BY2PR05MB048.namprd05.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Fri, 07 Nov 2014 14:36:17 -0000
X-Groupsio-MsgNum: 52771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Content-Disposition: inline

--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 01:31:02PM +0000, Bryan Evenson wrote:
> All,
>=20
> I am on poky/dylan and have not yet started using the PR server.  I reall=
y do want to start using the PR server and stop using PRINC.  However, even=
 more so I really don't want to break my package feeds.  I want to make sur=
e I do my migration correctly and I don't do something that looks like it w=
orks okay only to find out it causes problems later.  With that in mind, I =
am looking for advice on the proper way to migrate away from using PRINC.
>=20
> Let's say I have a .bbappend in my private layer with the line:
>=20
> PRINC :=3D "${@int(PRINC) + 4}"
>=20
> The mainline layer's .bb has the line:
>=20
> PR =3D "${INC_PR}.0"
>=20
> And the mainline layer's .inc has the line:
>=20
> INC_PR =3D "r8"
>=20
> In this scenario, the resulting PR will be "r12.0".  Now let's say I want=
 to start using the PR server and get rid of PRINC in this recipe.  The res=
ulting package contents are to be the same, so I want the resulting PR to b=
e "r12.0".  From some limited testing, if I start the PR server and remove =
the PRINC line from my .bbappend the resulting PR is "r8.0".  So in my .bba=
ppend should I change the PRINC line to:
>=20
> INC_PR =3D "r12"
>=20
> Or should I change it to something else?  If I change it to a hardcoded v=
alue, then I'll have to be careful about what to do if the mainline recipe =
changes INC_PR.  How have other people handled this situation?

PR service won't you help at all with this (it adds another .N to PR
value, so it cannot fix when the level of .N goes backwards).

The only really working solution is to increment INC_PR/PR values in upstre=
am
recipes atomically with PRINC drop in your layers.

For PR service migration the more important part is to correctly migrate
LOCALCOUNT numbers (used in SRCPVs), especially if you're also changing
package architecture (e.g. t2 suffix added in daisy or selecting
different DEFAULTTUNE and all your LOCALCOUNTs in PR server DB will
reset to 0, because of different db key to find them. Luckily you can
pre-populate them with single SQL command if you realize this situation
before first build.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRc2OIACgkQN1Ujt2V2gBytCwCglJbGCbWmv1zducHQucSVSpP/
6ZAAnj++O/3U4PDLBLOetyNfq6PTDifH
=TN32
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
