Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tbv0Q-0006bB-0l
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:17:28 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so5058664eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Il1Wf0BlIBQx5JLPsF25+98bPzK+qG/+e0K/NR5pOO0=;
	b=MIIjo2opFj1qi1g25od02blaz4xGvUGXMkrUPeUsy0Qhh/RhuNyS+riPdi1kqeI9Ed
	7HgjJFiLSzAeJ+4qIuca1j5/+258OSaGUjJdc33qkDKPcHLdCN2u+uf76nppjDkmGD0h
	CdvVFgeF6I7H4oi4YruRcpi9X/ZB0OFL4NP6CwHOZUejE+D5Tppdj9lX/iRGD+h+0OZk
	z+2NYbafcnVVXkhE0ifOgGjqHaCKah+elcisD2XDmfTASWOHJYhtGuml6jcuYBbDenL6
	dM4fd7bA1RdSI7y4SrI1YBJyc/XGEXFkhBuPwK3n0ayPoGz/ueY618EvyWaT82PZj9Eq
	zc4A==
Received: by 10.14.174.194 with SMTP id x42mr14497948eel.22.1353682998345;
	Fri, 23 Nov 2012 07:03:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm13529083eep.16.2012.11.23.07.03.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 07:03:17 -0800 (PST)
Date: Fri, 23 Nov 2012 16:03:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121123150317.GM12637@jama.jama.net>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
	<k8nh49$jq6$1@ger.gmane.org>
	<20121123131256.GB2808@ad.chargestorm.se>
	<20121123143619.7997e637@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20121123143619.7997e637@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: anders@chargestorm.se
Subject: Re: [meta-systemd][PATCH 0/3] Fix ntp bbappends
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
X-List-Received-Date: Fri, 23 Nov 2012 15:17:28 -0000
X-Groupsio-MsgNum: 41675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="It12YA6C1mwhTBLD"
Content-Disposition: inline

--It12YA6C1mwhTBLD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2012 at 02:36:19PM +0100, Eric B=E9nard wrote:
> Hi Anders,
>=20
> Le Fri, 23 Nov 2012 14:12:57 +0100,
> Anders Darander <anders@chargestorm.se> a =E9crit :
>=20
> >=20
> > * Koen Kooi <koen@dominion.thruhere.net> [121123 10:54]:
> >=20
> > > Op 22-11-12 17:54, Paul Eggleton schreef:
> > > > This is the meta-systemd patch series corresponding to the recently=
 sent=20
> > > > out patches for ntp in meta-networking. 1/3 and 2/3 should be appli=
ed=20
> > > > ASAP even if 3/3 is not applied immediately, as the layer is curren=
tly=20
> > > > broken; 3/3 needs to wait until after the meta-networking patches g=
o in.
> >=20
> > > 1/3 and 2/3 have been applied.
> >=20
> > Could you, or Eric, apply them to danny also, or should we do a new pul=
l-request?
> >=20
> please simply provide the commit hash you want to provide so that I can
> easily cherry-pick them

This 2 are needed for me to build from danny branch
pick 7a3884e gypsy: added to meta-oe/recipes-navigation
pick 00c857b samba: update waf-as-source.patch to apply

but they weren't merged to master too yet.

Then we should merge those 3 ntp commits from Paul after they are tested
more in master.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--It12YA6C1mwhTBLD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCvkDUACgkQN1Ujt2V2gBw2ZQCgnfrx2E6Mq2ozU0XpP77mj+Mh
bPEAnRTL9zT9/Wsbrhk7y0YVh8cUV+Oy
=pz5n
-----END PGP SIGNATURE-----

--It12YA6C1mwhTBLD--
