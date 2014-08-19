Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6C242617B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:41:36 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so6386751wgh.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tFrnq+ftRc2uJ731uiTZSSMD/m8dsbz9AXvdzlLEcZ0=;
	b=zD0ipf1Y5yhzEgdIu7UUzSc9Vmx3KkxiXNs9Jp9fcdSkBv2cJRUL+GaYr5QEOBqDU6
	s9ji9SiXvnQ5WLgvWooSbpXyHA+Wfs4+2nJmX9u5Aa+y48jEiMDWiNepzQkKWsgjBNCJ
	4Ulkgj5T0G84mubIF/T4J5l5A5w/Ychv6NgFmDKWR0SMeJdyxOiakguHuDTCb4K3PhSo
	kb1v503I7zt5TW01JB7o1YKpXmNryvER8ZgHUTCh3xJeQ+bIycRylJzhUymvDKfj/dwb
	nDXm8wmgmtGiRLVuEwpaySDWQKPqiDEKQo4BUewkzZvT639F+wxael8fVeu0We19sKC3
	MHvQ==
X-Received: by 10.194.2.12 with SMTP id 12mr48781368wjq.54.1408448497416;
	Tue, 19 Aug 2014 04:41:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m5sm49822631wjx.16.2014.08.19.04.41.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 04:41:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 13:41:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819114136.GQ3660@jama>
References: <53F3215D.6000407@linaro.org>
MIME-Version: 1.0
In-Reply-To: <53F3215D.6000407@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: wget --content-disposition flag
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
X-List-Received-Date: Tue, 19 Aug 2014 11:41:41 -0000
X-Groupsio-MsgNum: 51773
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2qwbT0JTInWqknst"
Content-Disposition: inline

--2qwbT0JTInWqknst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 02:05:17PM +0400, Maxim Uvarov wrote:
> Hello,
>=20
> can we add by default wget --content-disposition flag? Github has=20
> releases feature and creates tarball for certain git tag. And tarball=20
> file name is for example v1.tar.gz.  But for html content right name can=
=20
> be used i.e. project-name-v1.tar.gz.

Aren't those tarballs regenerated from time to time like snapshots are?

In that case we cannot use them, because they change checksums from time
to time.

> If it's possible to add this flag wget will downloads files to right=20
> file names:
>=20
> Example:
> wget --content-disposition=20
> https://github.com/muvarov/daq-odp/archive/v0.1.tar.gz
>=20
> Thank you,
> Maxim.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2qwbT0JTInWqknst
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzN/AACgkQN1Ujt2V2gBwjeQCgiVg0HDkP2mHkiX+45LHoSMqy
Tt0Anj/VTjvHwHtdyv5zPoB7BxCH1SJM
=iLhP
-----END PGP SIGNATURE-----

--2qwbT0JTInWqknst--
