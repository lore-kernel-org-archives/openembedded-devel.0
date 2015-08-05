Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 59EDC60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 17:15:24 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so76489083wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wdr5ECKONSdwcVpdr/rpYy78WrY+fseOC8ya/ePvjbw=;
	b=KiPnibM0LpYSrbXnxuylQQ0PZOlhoGhN7tgDP+AzA3xISzn0+R+3TaBMbwB6d3HX1d
	fvf29xD/CaRIy/WFdTl3YXTIr26xc+WrfS5qRIyZHreGw4JCBx4bDKgRYETc+rEdCVze
	sU5v7v5DPqRY1sFn5KPHbBmSjUXdNspkdeco9m9dAb5jzGIpSeK8gOhosP6vklWdj9c7
	sca3xEpzOFLsWSTLnyScKTbDfdpHTJLPvb9m1q8KoNsISzZWXGWJ1ooe5boXsd8tsE08
	4FNjOIEVetL369/HGixKr6PYcYeSiE28SJvgALS4/e6KA2kaQkMVjTYPYyddoisI87I+
	UHdg==
X-Received: by 10.180.39.65 with SMTP id n1mr481904wik.59.1438794922240;
	Wed, 05 Aug 2015 10:15:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cw8sm5021217wjb.49.2015.08.05.10.15.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 10:15:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Aug 2015 19:15:38 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150805171538.GD2452@jama>
References: <1438787621-12632-1-git-send-email-Martin.Jansa@gmail.com>
	<5725889.eDmdfnME8h@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <5725889.eDmdfnME8h@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH] dhcp: fix parsing warning
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
X-List-Received-Date: Wed, 05 Aug 2015 17:15:29 -0000
X-Groupsio-MsgNum: 56552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline

--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2015 at 04:28:00PM +0100, Paul Eggleton wrote:
> On Wednesday 05 August 2015 17:13:41 Martin Jansa wrote:
> > * fixes:
> >   WARNING: Variable key FILES_-client (/dhclient /dhclient-script
> > /dhcp/dhclient.conf) replaces original key FILES_dhcp-client (
> > /system/dhclient.service).
>=20
> Yuck - is that really what it's printing, i.e. all variable references bl=
ank?

Sorry, will fix that.. don't copy&paste bitbake error messages in
bash...

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXCRLkACgkQN1Ujt2V2gBzs1wCePeL5Oo2CnPXXBD+uqanpfjeY
l90AnRhSZgD3lNav/yV9Ij5RPxK5iwQA
=yWKY
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
