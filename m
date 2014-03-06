Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id B7EEC6F589
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 19:21:15 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h14so1909477eaj.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 11:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6sr52DfsCMSei6WfaNzeMMnxIiz2CaDf+k0pffdIc2k=;
	b=yg/7g1j7ZgqEcE7Qk/hDxu4C3JKUXUO3GYxiXikFgOPbvu22X/7ToL75tAxQW+OS2l
	Law7MdcZQh+5zaIF3jpL67s54u0GjEngSeWUoEDKZjn+ashIQM03gUdEIVoE12ozwo3+
	lVksAOxNNf7kJFywWzOgYoOVonPPOkjPWwyyPKyuM+YihCI+0g2OcRyXkIZwBs6+xf/Z
	yZ0hlIqDC2mtLoZWmz25m2FYf0IGHFTZ24vJNHXVgq+mCASoNJO7IMhRy5LU8gNMAJmd
	iMnEoiuzbBnZHQQzWDva9fYdGGpCUYCFDaqCOrrZFDtfVUuM3JhzLzuy1zQOzpTFBOLk
	XVcw==
X-Received: by 10.15.21.2 with SMTP id c2mr14495760eeu.77.1394133675945;
	Thu, 06 Mar 2014 11:21:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q44sm25151766eez.1.2014.03.06.11.21.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 11:21:14 -0800 (PST)
Date: Thu, 6 Mar 2014 20:21:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140306192122.GJ26981@jama>
References: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
	<2403049.xWs40izQYL@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2403049.xWs40izQYL@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] bash-completion: remove allarch
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
X-List-Received-Date: Thu, 06 Mar 2014 19:21:16 -0000
X-Groupsio-MsgNum: 48551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ggaE+NbZN3iv6/Hi"
Content-Disposition: inline

--ggaE+NbZN3iv6/Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2014 at 05:59:29PM +0000, Paul Eggleton wrote:
> On Thursday 06 March 2014 18:04:50 Martin Jansa wrote:
> > * it has runtime dependency on TUNE_PKGARCH bash, so it cannot be allar=
ch
>=20
> As we've already discussed this is not universally true. There are other =
ways=20
> to solve this.

Like making it special case like packagegroups? That is still making me
headaches when some library (for some reason) included in packagegroup
is renamed thanks to debian.bbclass and packagegroup isn't rebuilt, so
it breaks do_rootfs..

I would rather build bash-completion only once per architecture than
rebuilding it as "allarch" every time I'm building for MACHINE with
different TUNE_PKGARCH.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ggaE+NbZN3iv6/Hi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMYyrIACgkQN1Ujt2V2gBxHywCfTbTuG9VQalZBTCkhv/gSH4k2
basAoKKcerDSTCDJoi5dtAgHBxAdpOBl
=8Gkr
-----END PGP SIGNATURE-----

--ggaE+NbZN3iv6/Hi--
