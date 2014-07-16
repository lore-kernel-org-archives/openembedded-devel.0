Return-Path: <joe@deserted.net>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8E97024B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:33:35 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so4123923igq.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Lk7ROrGOZGhQjY4NV736lYo0JRZky047wRzGE7Z7L1s=;
	b=U/N2mdDMIEWejIWVoWasEPqChfLtARbIyPi6AvG/fnudShI9C5vCBb0fU6xGpJwIHs
	OVNEVZ9p//3dBdK4j0sSg5zXzIipGzwtKf6p34S+aYEvTcMJ5Q3WkgmRgdjxaJ/MQpQ9
	13mCo1bBBPjSYujT8m+8EDklroXaJeTSETdCxWBjkzO22ZFUabgXp1xiJbXb8vOaSGwM
	T3gJS2UeUMv4FXDsyNFGJsro8yWjiSH2eNmjRdxbwJnV8tWib9HNTwNG7H0oDm41xuT0
	w3kqiBF/F4lEY6Bs5f/xgEHyXeNobiznKr4cTlizwffTL69NvQIMAtHfM9RwygwZd2YV
	BZiQ==
X-Gm-Message-State: ALoCoQk6BwPakjltJ0NTQvLIkd5JRxut++K6rsMmQbI2Mn2SLCllvaVHWl1/G+iwy185dKphsF/O
X-Received: by 10.50.114.162 with SMTP id jh2mr16425718igb.0.1405517616519;
	Wed, 16 Jul 2014 06:33:36 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id rq5sm44797462igb.0.2014.07.16.06.33.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 06:33:35 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 73EB61685E4; Wed, 16 Jul 2014 09:33:32 -0400 (EDT)
Date: Wed, 16 Jul 2014 09:33:32 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716133302.GB13248@deserted.net>
References: <53C619B3.7050203@mvista.com>
MIME-Version: 1.0
In-Reply-To: <53C619B3.7050203@mvista.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: WIreshark 1.12.x
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
X-List-Received-Date: Wed, 16 Jul 2014 13:33:46 -0000
X-Groupsio-MsgNum: 51002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline

--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] WIreshark 1.12.x] On 14.07.15 (Tue 23:20) akuster wrote:

> Hello all,
>=20
> I have the latest wireshark 1.12.0-rc2 building and working with
> gtk2. Is anyone else working on this? if not I can submit patches.
>=20
> I am not sure which layer wireshark should swim in,  meta-networking
> or meta-security ?
>=20
> - Armin

Hey Armin,

tcpdump lives in meta-networking/recipes-support, that seems like it's
probably a reasonable location for wireshark too.

--=20
-Joe MacDonald.
:wq

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlPGfyQACgkQwFvcllog0XxJNACfV9/OI/k/YtbBkeyINTYZHliM
9B0AnRyzhO2UMp15gGci9i7Tkz82QxPm
=6vmO
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
