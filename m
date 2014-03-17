Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id A8F806EEEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:22:21 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so3841027eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5GL7H6Vh9uFiI1jS/LIpX3J0Rpzj080dnTeP9ozzPDc=;
	b=Ua4SBVRLv/lrCUwnMS5FTaEYr1u3FpgKy0XZD9F5YCzWRjZK/v+lQmwocHQ1ECNnsq
	kOmEESJatfDNe+pudWK8bC52PZIXqcKc8JPE9klPpXrVB/mYE3p0tj0yjZSsudPuTdaY
	rK3OxlYu/tjwgsWRK/QvXebDLRn6a2HC2pyNo58eh0Lafx6VX+BP3waPBQ4zlddfU/Ao
	vq7n1pY0OC+Bt5OYbKi6rvjWTwYouwsYMzP23dcOkbpnN8aHPmDpBBRqpSxkm0shAtNv
	ElRtOne/H1BQnp9xRS8A3I+QvRFJ9Irhjh8itaytrZRoQ/4SGGnwbi2rA8JHvLREkjvh
	6EEg==
X-Received: by 10.15.22.65 with SMTP id e41mr22352625eeu.5.1395048142466;
	Mon, 17 Mar 2014 02:22:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w12sm9196603eez.36.2014.03.17.02.22.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 02:22:21 -0700 (PDT)
Date: Mon, 17 Mar 2014 10:22:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140317092239.GF3725@jama>
References: <5326BAC9.40201@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <5326BAC9.40201@pseudoterminal.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Avoiding registration as shlib provider
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
X-List-Received-Date: Mon, 17 Mar 2014 09:22:23 -0000
X-Groupsio-MsgNum: 48725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Content-Disposition: inline

--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2014 at 10:05:13AM +0100, Carlos Rafael Giani wrote:
> Hello,
>=20
> I have noticed the problem with GStreamer in current master: the many=20
> "xyz was registered as shlib provider" warnings.
> Actually, it makes no sense to register the plugins, since they are,=20
> well, plugins. No other package must have a hard dependency on any of=20
> them. So, it would make sense to disable registration for the plugins.=20
> Is this possible?

Yes it makes sense and it's possible by listing them in PRIVATE_LIBS
(PRIVATE_LIBS_${PN}-foo)

If you dont want to list them one-by-one than you'll have to wait for
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/shl=
ib-providers&id=3D6bbe2582ecf4a6a8fb667e06b3a7bcbf917597a2

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMmvt8ACgkQN1Ujt2V2gBz9GwCfeOhTXdIoRGSCzT8hxhhb1e6v
FS4An3rOXLrFnMgef7BQMIKWr93OL/Ua
=5X4G
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--
