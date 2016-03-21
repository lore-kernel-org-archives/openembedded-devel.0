Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1533060722
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 13:06:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r129so9877847wmr.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 06:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mjuZ+PPPexvrLDr+vO9ouHe6VwMXv4QenpQl7vvss4c=;
	b=1B9W16+0MJlLlRQCzBcANZyQkvppLJGc7kZhld/Yt2q6GMcjOKzYEA+lH8vB9b3alo
	P0l6A8KP332uWOa4kJ+/vMemGZxDEU4x/yMDFxicdbECCFhFtXDFBTAbt/OilHMyouNh
	VQfxKF4U2CnjeBqkXdK+XFkWc8xgdEW6eH7V1lb03JdLE5n1qL6VUVLMPz2/8hy1cxrs
	AyXqw5WvAApRO8o4B0MY5lYTZkl9FIYLt/5V2i9ZO3szSXRUUhcsPgkm8iFo3ZGEDCTN
	WH8CSWeb4cxysSY5k3no3Q2QJT1o+CUzdg7y6vx5QerLUEs4X0KeQNxJISGq4wlU6E64
	mJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mjuZ+PPPexvrLDr+vO9ouHe6VwMXv4QenpQl7vvss4c=;
	b=I5IvQTlIBt3P/9B0AI1azc2IqFZ/6s4+6zCV4ip3OKodGw3AL85HLqhaMMVaze3uPo
	j7ZUSkbJ0liUMvs6Xy8EQ6v6xBf+TNvZzOnSc6/O3OecXGWRrFyBBAd/QBjTgjnWeOca
	tQis3flT7UqcQwsJ8rOps0E4QGZzMHv6Sun4J2S+nwHILCAAdtGg8DBsdPSExrAZSu1e
	Q4BIGKXIKMOylTSbAxadkqG7NjMbqhv7zWekf4kCtwCP/U0W9gTQ2JBebvYVtcMgGzSv
	yERjed9M+PXMfs4Iz1wcHoLmplRZDRtg9tLZF/1OTe1IkdvdkUzsDE8CILtbx2Y5E/Dr
	yIuQ==
X-Gm-Message-State: AD7BkJLMTe+wRbhRWEVRAL1jtUaAqmQYYyf/uaXtamtzG9zBtPhw/YoKtEfARglIjzyFAg==
X-Received: by 10.28.212.19 with SMTP id l19mr13212486wmg.97.1458565564239;
	Mon, 21 Mar 2016 06:06:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	73sm12416556wmy.22.2016.03.21.06.06.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 06:06:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Mar 2016 14:10:20 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160321131020.GC2562@jama>
References: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
	<51386.10.252.7.138.1458328003.squirrel@linux.intel.com>
	<56EFEC56.3090406@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56EFEC56.3090406@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/2] gnome-bluetooth: fix compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Mar 2016 13:06:11 -0000
X-Groupsio-MsgNum: 60596
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 02:43:02PM +0200, Alexander Kanavin wrote:
> On 03/18/2016 09:06 PM, alexander.kanavin@linux.intel.com wrote:
> >> fixes error series starting with
> >> | Caught exception: <type 'exceptions.TypeError'> TypeError('expected a
> >> string or other character buffer object',)
> >> | >
> >> /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/python=
2.7/distutils/sysconfig.py(22)<module>()
> >> | -> PREFIX =3D os.path.normpath(sys.prefix).replace(
> >> os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> >
> > Both this patch and the second one should be replaced with a patch that
> > simply adds
> >
> > inherit gobject-introspection
> >
> > to the recipe. For some reason I forgot to do that in my g-i fixes patc=
hset.
>=20
> Martin, can you drop these patches from master-next please? Just want to=
=20
> make sure they don't make it to the master branch.

After someone sends the patch with the inherit, then yes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbv8roACgkQN1Ujt2V2gBwEhQCfbgv7TY6BvvSUmTZk0RL0nApp
5MsAoI/I7AQEV4LleNQVfGJo5BvHpGtH
=K84T
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
