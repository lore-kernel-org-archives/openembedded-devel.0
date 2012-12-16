Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkHwp-0004pd-3B
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 18:24:19 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1952995eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W8rIWxeTkVfNrHevnWhRpBIW9JH3jNaq6LPSpgu38lk=;
	b=boeTjkSqIKIFxYCL8kgt0MipA531/xLaFyOQrw5BwjwbmSr9tC80OF9pn2Qdx1OATC
	BzYRvtqmJrhrAdZCWF0YO3zM5jr9+0sl8kDA2F3+I1D+rcXqYjeoBByGn4YEg1+jb6O7
	YbrzpHOsuT+LKP+f/MB/SEgQ8kjdIMnxYTE54+5PAXuEvL/R+gKmRxUpc1fGepoHBRRs
	qoHC3cPDvGNA4/2ccwrm7w4gXzC44MKMlRVsXnDZP81cxk8aVv8CFo6lDRVIqzmN/0go
	pfiABQ1y8wH42HEejfwYGNgQglj5OG48QxBWIoDqix7buWov5WyMjMuMHOlON7bLKWyA
	+PTg==
Received: by 10.14.194.199 with SMTP id m47mr33716728een.11.1355677780076;
	Sun, 16 Dec 2012 09:09:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w44sm23611877eep.6.2012.12.16.09.09.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:09:39 -0800 (PST)
Date: Sun, 16 Dec 2012 18:09:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121216170939.GB3448@jama>
References: <20121216105611.7746c440@eb-e6520>
 <20121216170809.GA3448@jama>
MIME-Version: 1.0
In-Reply-To: <20121216170809.GA3448@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Liu Ting-B28495 <B28495@freescale.com>
Subject: Re: Denzil updates
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
X-List-Received-Date: Sun, 16 Dec 2012 17:24:19 -0000
X-Groupsio-MsgNum: 42184
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2012 at 06:08:09PM +0100, Martin Jansa wrote:
> On Sun, Dec 16, 2012 at 10:56:11AM +0100, Eric B=E9nard wrote:
> > Hi Koen, Hi Liu,
> >=20
> > as per your requests the following patches were applied to
> > denzil-next :
> > 35f92b4 systemd: use system variables instead of hardcoded paths
> > 6e0ddd4 systemd: update to v189 66e169f gdm: do not rely on
> > dev-tty7.device
> > 0f17a3f meta-systemd: systemd-systemctl-native: Also add support for
> > WantedBy=3D*.service
> > d6dd53c systemd-systemctl-native: handle ALIAS tag
> > e5b3091 systemd-systemctl-native: extend systemctl wrapper to support
> > mask action
> > f713db3 systemd-systemctl-native: Add additional messages for better
> > debugging
> >=20
> > patchwork # : 36615 36613 36609 36611 36605 36607 36535 (with manual
> > rework for the last one).
> >=20
> > Please don't forget to cc me for patches for denzil or danny.
>=20
> did git push show some errors/warnings when searching for patchwork
> commits to mark as applied? interestingly none was marked by hook
>=20
> http://patches.openembedded.org/bundle/jama/denzil/

nvm, I haven't noticed that it's only in denzil-next

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDOAFMACgkQN1Ujt2V2gBwXlACfcUzubjhSyJvuT0ivHs4mOmdN
GC8AoJij9vMuc+nRWFOR2nj+Lxsw6siy
=lNJ/
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
