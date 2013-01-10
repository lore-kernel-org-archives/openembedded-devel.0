Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGBi-0001pY-5h
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:20:46 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so194507dad.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B1MZno+6sCxtERyJTSK/d3xV2CqhDsFvcyr9wr5zRm4=;
	b=SFAP8BF5RzxeVUG45o26F+dCKtoqzVicgUbE5ysaC+adU1VORIC9btCAP8jlu93IOL
	PXb3qoShfkXnV/MB5hz7xMI4Zi0QGkD3N9xuPd0aVPen+gluPb+lORsNUQ8ntdtRnO/l
	3H8123/2WjD19EPS7es28/Hw8JeDTPcOL5jfbmKU5PezO34/lB2S/twNy6fWrhVtzNcI
	xUqWWcIC9ryoyaIM9aLUdPbJ0gVB5cInZQ7G1E6YfoRLpFylN6YncJVn52nq7ML0ZMH0
	1gP2Rvn2T4exVNYUnxwmEoYii+OyFWha2M96HL/sjxedrHkzC0THISFzvljMkx8NgPBg
	vMVQ==
X-Received: by 10.68.239.232 with SMTP id vv8mr216829512pbc.53.1357815930719; 
	Thu, 10 Jan 2013 03:05:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ou3sm637006pbb.46.2013.01.10.03.05.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:05:29 -0800 (PST)
Date: Thu, 10 Jan 2013 12:05:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110110535.GW3722@jama.palm1.palmone.com>
References: <CAGiJk9d25RWg6UB-wO5Eg3M80MWjBhu6Kk=pVKbMzAaS440WKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9d25RWg6UB-wO5Eg3M80MWjBhu6Kk=pVKbMzAaS440WKg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Disabling sstate cache generation
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
X-List-Received-Date: Thu, 10 Jan 2013 11:20:48 -0000
X-Groupsio-MsgNum: 42623
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zqkt5x/gGOIVPcL0"
Content-Disposition: inline

--Zqkt5x/gGOIVPcL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 11:59:53AM +0100, Samuel Stirtzel wrote:
> Hi,
>=20
> what is the preferred way to disable sstate cache generation?
>=20
> In my use-case the build machine doesn't do incremental builds (e.g.
> it only does builds from scratch)

http://patchwork.openembedded.org/patch/17039/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Zqkt5x/gGOIVPcL0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDuoH8ACgkQN1Ujt2V2gBzBOQCfbHHb6hQ3JwEWuBt+t/Jr1Ov5
LvQAnAiqVSSMM7I96i8nWCX0lHKeAn5P
=V0/i
-----END PGP SIGNATURE-----

--Zqkt5x/gGOIVPcL0--
