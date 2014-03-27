Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2484D6EA13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 11:33:40 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so2786309eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 04:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gHgXCWvotjqC9ewNqQTHzqZotA2JfcwyWhy27NELamE=;
	b=ODUHRt/Y3G9T3IDiVB7S6CtMtLqytv39QPSTXqFCfMA0PhN8idY7qWHjfHy58kOfN+
	eVirhqv6tfU4zCTp791Svx6uvjLuN3v6yMQYh4z1fI+AwmRT5eKSF7Tm7r7D+aNzTMvc
	GTcHgyoOsAOdUefs6LzAhzT4PepSwtyTWJ5zZ//a2MVoCvSFEyY7CwdJzSTFVKgA+jOo
	st06IG7pqrMch+0f/Ct2HCY6Cy/oNfYoQ8QxXUC3Xl/SLNwMiIN2T8kJ86s8Srbcrj/r
	pxt0PQZnNviEMfaUJwLxalaO9FXkDqCMbSRtPnLtG8OcRtQwjatCt3tTimQd1AHSHAVm
	hU/w==
X-Received: by 10.14.94.5 with SMTP id m5mr1280976eef.23.1395920020839;
	Thu, 27 Mar 2014 04:33:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q49sm3751174eem.34.2014.03.27.04.33.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Mar 2014 04:33:38 -0700 (PDT)
Date: Thu, 27 Mar 2014 12:33:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140327113339.GO3709@jama>
References: <5333F1AC.4060807@nedap.com>
MIME-Version: 1.0
In-Reply-To: <5333F1AC.4060807@nedap.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: transitional packages
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
X-List-Received-Date: Thu, 27 Mar 2014 11:33:43 -0000
X-Groupsio-MsgNum: 48859
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="96dIhm/ZjrNld+BP"
Content-Disposition: inline

--96dIhm/ZjrNld+BP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2014 at 10:38:52AM +0100, Jaap de Jong wrote:
> Hi All,
>=20
> for one project I'm still using oe-classic.
> Would like to upgrade that!
> I know a simple update will not work because (among others?) package=20
> names are changed.
> Is there any effort made to create transitional packages?

I don't know about any.

> If not, would it be a tough job?

Yes, maybe not so bad if you have exactly one starting point and one
final, but to provide upgrade path from "some" state of binary feeds in
oe-core to "some" state of binary feeds built with oe-core is very close
to impossible (as you cannot test every combination).

Some versions went backwards, you need to migrate LOCALCOUNTs to PRSERV
db a lot of packages were renamed or removed without replacement (so
they will be stuck in your target image unless you explicitly RCONFLICT
RREPLACE them from your transitional package), there are upgrade path
issues even between oe-core revisions.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--96dIhm/ZjrNld+BP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM0DJMACgkQN1Ujt2V2gBwnKQCgrtoiCKAJUfnjOgVCDLan30Cz
+icAn36e4imG3lGRT4msjO3n05s8rb8p
=F4yi
-----END PGP SIGNATURE-----

--96dIhm/ZjrNld+BP--
