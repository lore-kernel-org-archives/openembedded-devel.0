Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7C05377420
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 19:42:47 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a20so80136631wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lPg2n1Iuyn7XfU3d6cZpM8jWYdkpWsh8kh1kRrM90pc=;
	b=aVV7ZTLyoQEEoC5k4cxEeqnr4HyT2QnmrCR1jZGbXDw6YOP7rjsGo4muxJ+4VC7+Q0
	6x6tnxIzXNn/CGFYzvHfKgtHohH+urjyl+bJYnsC2zWDe7iriCtK0pd6r7RExCug0u7r
	Epqisn0cMWJebJQVX6oKVI9EikN+NHz/gUeZP2IuQJ+4N9+x/bhM0l3TThEqiITyI+HL
	4KpKzc9Hh8fjhjgQSn5prWOcCuvsXsna8T9zq2sNQq8AcvcaNbcw6GIQbofp0xRjWbzI
	0CC1FIRQd8F5ip2w2m2VNdPdTclXpM7hIStvwDn0HppRzJleqkt4JvfoorthVY4iI2bT
	cBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lPg2n1Iuyn7XfU3d6cZpM8jWYdkpWsh8kh1kRrM90pc=;
	b=gB3Worp+52OxjFSXz8u5J1SjBWPU4Ft7xVmWjnRWADjAo8+B3ReZy9G2rdB8VtDXSx
	0Kl0TyrFMhqqtLVwIDdbAvjGoLzYpDrT89eCjJXoHmw79gfxWDFsuMYIkANCLmq5SECL
	0kYspGZU4fMHQe0mDGIqUKFgRSQTMKfOTwirpJHi64bMwPDFi43xjZBzuQS9k0uY3PGF
	u58314x9+fadvW9SVKi3sysfMH/Rts35pDbmTxSHtLARKWp21ebRdLvWYJw5qkDb/drJ
	vvEqqSQzDWYy6ZVDBT2ARMI7Q76JVkW7gwJ08eCHTJyn3CxTEpHHGBARKjWDrQUIUBVo
	UQMw==
X-Gm-Message-State: ALyK8tIP57pCmMpYsGIP/NDc8VF51joMXOiUu4a4BWwuanGvinRzqdbhiGnroatqdgGlkA==
X-Received: by 10.28.27.81 with SMTP id b78mr373815wmb.19.1464896568349;
	Thu, 02 Jun 2016 12:42:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x124sm2705295wmg.24.2016.06.02.12.42.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Jun 2016 12:42:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Jun 2016 21:43:13 +0200
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160602194313.GC2571@jama>
References: <20160602182426.GW7939@vctlabs.com>
	<20160602182801.GZ7939@vctlabs.com>
	<20160602185856.GA7939@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20160602185856.GA7939@vctlabs.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-python][PATCHv3 3/3] python-tornado: add missing python2 runtime deps
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
X-List-Received-Date: Thu, 02 Jun 2016 19:42:48 -0000
X-Groupsio-MsgNum: 61698
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline

--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2016 at 11:58:56AM -0700, S. Lockwood-Childs wrote:
> On Thu, Jun 02, 2016 at 11:28:01AM -0700, S. Lockwood-Childs wrote:
> > +RDEPENDS_${PN} +=3D "${PYTHON_PN}-backports-ssl ${PYTHON_P}-backports-=
abc ${PYTHON_PN}-singledispatch"
>=20
> Well that's really fun -- I managed to pick the version of the patch with=
 the
> typo when splitting it up. Do I have to send the whole series again to ad=
d one
> letter (PYTHON_P -> PYTHON_PN) ?

I'll try not to forget to change it when cherry-picking to master-next.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldQjFAACgkQN1Ujt2V2gBwSDQCfcGHab7alE4+vYqtA5sj+5CgC
WmwAoJCtX4dSewNOyzdmyeI0CZgSMUA/
=5+vB
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
