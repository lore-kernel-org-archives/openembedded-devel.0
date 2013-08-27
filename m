Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 689EB61F47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:31:45 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so2316070eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4BfqKMF0lNdGkF4HmosYr/mN4aaC1FRpHqDV95GFqCM=;
	b=TG8uwqmuyRv3d5GDH7XkIxXBGqhTcNSnsOpPSAMG0d6rm1KluIkH5r7hz+K4MaumSy
	EnALNR+Y7n+A8rOAJJrqZjuxnchiTEhbZLkQJVLzpuauXaqT3hki2NaCI8E0yMKedOaw
	5TL+DHquMfoFu1aP0eIX04oQfKT2/IyQDiBeQyiik21KFzXp4HtmQHDPoNhgGoDs4bzU
	4ZvnJxtfYF/POCsC2GyDRUShCyNLrd8b04dsS8qMeNxJwANbojM5knt74PrUb8lc+sYR
	fRJKRerh8rEZAgN6qy2pijqvnodBUv9x+7e8Q/eYodXXKeDn0q0+ev4J3sLqHg/3mhW0
	/S5A==
X-Received: by 10.14.246.11 with SMTP id p11mr35875853eer.9.1377617505011;
	Tue, 27 Aug 2013 08:31:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm30088863eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 08:31:44 -0700 (PDT)
Date: Tue, 27 Aug 2013 17:32:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130827153252.GY3544@jama>
References: <521C514F.1000405@pseudoterminal.org> <20130827075443.GW3544@jama>
	<CA+AhUGwh7dX=6Cw98xzdmgr=W9=J2h7y7iuQjmDTM_HOW1hUCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+AhUGwh7dX=6Cw98xzdmgr=W9=J2h7y7iuQjmDTM_HOW1hUCw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: How can I make recipes conditionally enabled?
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
X-List-Received-Date: Tue, 27 Aug 2013 15:31:45 -0000
X-Groupsio-MsgNum: 45872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rmLdANEyqdgxlbgR"
Content-Disposition: inline

--rmLdANEyqdgxlbgR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 03:56:40PM +0200, Erik Bot=F6 wrote:
> Hi,
>=20
> On Tue, Aug 27, 2013 at 9:54 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Tue, Aug 27, 2013 at 09:12:15AM +0200, Carlos Rafael Giani wrote:
> >> Hello,
> >>
> >> I have a question about a problem I've had several times in the past:
> >>
> >> if I write a layer, and add .bbappends, then the layers with the
> >> corresponding .bb files become hard dependencies.
> >> But lets say I want to write a BSP layer, and I add some machine
> >> specific Qt5 patches. Now everybody who wants to use
> >> my layer must also include meta-qt5, even when they don't really want =
to
> >> use Qt5 anywhere. This is made even worse
> >> if I have a dependency on meta-oe, which itself brings in a lot of
> >> modifications.
> >>
> >> In short, I'd like to be able to make .bbappends and .bb files depende=
nd
> >> on whether or not a layer is available. The hard
> >> dependency is fine if it concerns things that are essential in my laye=
r.
> >> But if its about optional things, it shouldn't cause
> >> a build failure.
> >
> > BB_DANGLINGAPPENDS_WARNONLY is the magic word.
>=20
> I also saw some nice use of inspecting BBFILE_COLLECTIONS in the layer
> configuration done by Mentor, see
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/tree/conf/layer.con=
f#n9
>=20
> Then you would place the files you only want to enable for e.g.
> meta-qt5 in a qt5-layer directory in your layer. Those files would
> then just be used if BBFILE_COLLECTIONS contains qt5-layer, which is
> only the case if you have added meta-qt5.
>=20
> I know meta-fsl-arm uses this for meta-qt5 bbappends.

Something similar was also used in meta-systemd layer (you need to check
older revision than 8b465f791a5ef3d9ef138a206c6fb9c3bbcb55b1)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rmLdANEyqdgxlbgR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIcxqQACgkQN1Ujt2V2gBxNCACfQ4aou/b8aD4xqyaDiSYLq6JM
NP8AnjDRgJ88AfmlDkGX3qjuIfHG6Qcm
=zrba
-----END PGP SIGNATURE-----

--rmLdANEyqdgxlbgR--
