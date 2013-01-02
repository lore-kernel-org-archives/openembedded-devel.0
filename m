Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPk3-0007cD-Sn
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:56:28 +0100
Received: by mail-da0-f41.google.com with SMTP id e20so6541071dak.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DAonncxA4KDr/KzGILkwP5UvEjRV8RsnQ+c2sXwS19g=;
	b=w29AR58B/TXs07mnEQcaBVR1M51MVem+2P6tQI7rmqUT4aEg+5m08EQNva+DOxok39
	vTGbuiedoFTI5LxBRyDYINUFzmevWeiTzu6Rnz1iVqDKkwTg4ECNJG96Wt2I15RvPhyU
	CZBGcdtHu+0RLkxwXczVievPVkaZkAVaw6NMz56R7ArLRe/9X2/IdDPPz2QzervwUvGr
	152bcY+msXKNcuZujkSduCIKlkJyp8fQl78Yg5+0ZWncvWBXHCdwQNAgGbX65cDQo5FW
	pVgATQchaH/xZiO2I2mUxWuJYf6tu7O6I3oK0p4tAP5ITtIKP7p1udV9HW+M57NAplPq
	nEwg==
X-Received: by 10.69.1.73 with SMTP id be9mr146367601pbd.116.1357137684054;
	Wed, 02 Jan 2013 06:41:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o11sm28545989pby.8.2013.01.02.06.41.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:41:22 -0800 (PST)
Date: Wed, 2 Jan 2013 15:41:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130102144129.GC3276@jama>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
	<ea5953df69c35734e4859cb62e345f4767f5b89c.1357135909.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ea5953df69c35734e4859cb62e345f4767f5b89c.1357135909.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-efl][PATCH 6/6] edbus2: fix segfaults in eve/enjoy
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
X-List-Received-Date: Wed, 02 Jan 2013 14:56:28 -0000
X-Groupsio-MsgNum: 42450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 02, 2013 at 03:14:47PM +0100, Martin Jansa wrote:
> * edbus2 is using AC_TRY_RUN in edbus/m4/ac_valist.m4, it does not
>   work for us cross-compiling, so let's define it directly
> * without this change eve/enjoy segfaults:
>   http://sourceforge.net/mailarchive/message.php?msg_id=3D30297875
> * remove HAL from DESCRIPTION, it's from e_dbus
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

ignore this one, it fixes segfault on x86_64 but fails on arm..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDkRxkACgkQN1Ujt2V2gByoAgCdGITuLeWo8ztEbtaxNQhVcQRO
MocAn2byhyOLTbP9v0FNXTjiT9jryoEA
=tqhY
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
