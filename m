Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79F2D6CC2E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2014 13:43:28 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e49so2961076eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2014 05:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MDfL23W4MOzl0EEDXoGFYzW3VeuuNzfyjkDHi5JJ540=;
	b=dxHxWTYc/hHB23rt2yvFp86FwT6ZgLDlsQaOpdi3RP5hOEdi+x3F+ncAvWCu2IqZ5R
	Ts+yrN+d38eO9JDyXw4wz02wNlCOP8iWRM4KQjiAUy7BV1Adzwrntg+tNwVf9RpiJSTL
	UV3jXlKM3cwOlHjiuRi4bYdGnxe3MBfvOyeMiBobEqe+tscQSm+87Ry9yID0/FGvpY0E
	7E5hLSTcScEjz931HEdNrQVOUg0vXl9xXxVS0TWqJxiW7ZUW/T+k79uq+bZiE4efE2Rj
	oFxs8aeMMgbGF/gY6cNUo7if7TRHcHnMiwGT+frLL619OBFfJLElGfrsc25u3+XqN7Mi
	phmQ==
X-Received: by 10.15.24.72 with SMTP id i48mr1831902eeu.74.1390139008806;
	Sun, 19 Jan 2014 05:43:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm43786402eem.15.2014.01.19.05.43.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 05:43:28 -0800 (PST)
Date: Sun, 19 Jan 2014 14:43:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140119134327.GB5565@jama>
References: <1390043044-20352-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1390043044-20352-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][meta-oe][PATCH] jenkins: add 1.547
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
X-List-Received-Date: Sun, 19 Jan 2014 13:43:30 -0000
X-Groupsio-MsgNum: 47819
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2014 at 12:04:04PM +0100, Koen Kooi wrote:
> The package split is based on the debian packages which have -common/-ser=
ver and -slave.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> This introduces a dependency on meta-java, which is of course a big no-no=
 for meta-oe :( That leaves me with a few questions:
>=20
> 1) What's the best place for the jenkins recipe?

That's really hard question, I can only think that meta-java or
completly new layer would fit.

> 2) Do we have a virtual/runtime thing to express a dependency on /usr/bin=
/java without dragging in meta-java?

I think this isn't enough, because it would still show error that
virtual/java-foo isn't provided in included layers.

You can make it PACKAGECONFIG (sort of like RP did with python for
opkg-utils) which means that without PACKAGECONFIG change it won't build
at all.

> 3) Any ideas for the contents and deps of the jenkins-slave package?=20

Just something like jenkins user and runtime dependency on java and leave
slave setup on jenkins master?

>  .../jenkins/jenkins/jenkins-server.service         | 11 +++++++
>  meta-oe/recipes-devtools/jenkins/jenkins_1.547.bb  | 36 ++++++++++++++++=
++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jenkins/jenkins/jenkins-serv=
er.service
>  create mode 100644 meta-oe/recipes-devtools/jenkins/jenkins_1.547.bb

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLb1n8ACgkQN1Ujt2V2gBzwKgCgnQo2P5YIFxoL8Tqp+Gc4+Hix
m24Anj/289yP6LjPWV3yjROVfh8sFU01
=Rl/8
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
