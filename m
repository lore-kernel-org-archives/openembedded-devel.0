Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A942360EE1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2013 11:06:48 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so1066598eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2013 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=E5oZzmDrYiCq7cPKigfkLyX0dllLn5C7XatmdPJkBec=;
	b=EQLua81uRjUXpqcTQ/zVd2konL+pfJW5fZqDCaw+3jpxSqQqISgrD6Vxkle0P9nJBh
	EQiGRMOR2MIlz+0jCm/8X17dglbznc5JMDMcXkEdQxDYE26lQHp3H0lSH4+0yFWo9H+o
	eLPu0F+jx3DUmnZDRj2bSOZWm4ZThsFu6ttJmpCXVIPP/rymGGgP9CTRghsEesUnRmEL
	wtSqkZ1HWGBNaIskm+hEhQ9JkM3+VObfppl9wxQS45dXBNz3/fu070bjBciqsA9g0L1A
	pP9bG2ONf7gj9PowqSfoT2wAtI0Oh5y7YMhWU8ZDd2ET56oj4bpluUnHhOpp5mVhlMdp
	Uo6g==
X-Received: by 10.15.94.201 with SMTP id bb49mr25814540eeb.23.1379156810163;
	Sat, 14 Sep 2013 04:06:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm23088128eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Sep 2013 04:06:49 -0700 (PDT)
Date: Sat, 14 Sep 2013 13:08:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130914110818.GC30637@jama>
References: <cover.1378998806.git.muhammad_shakeel@mentor.com>
MIME-Version: 1.0
In-Reply-To: <cover.1378998806.git.muhammad_shakeel@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-systemd][PATCH 0/3] Remove systemd support for the packages which already have it in oe-core
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
X-List-Received-Date: Sat, 14 Sep 2013 11:06:49 -0000
X-Groupsio-MsgNum: 46186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 08:28:08PM +0500, Muhammad Shakeel wrote:
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> The following changes since commit a506a9efc86cda9dbf36cd916dbbfb1ae2162c=
45:
>=20
>   log4cplus: add recipe (2013-09-10 22:48:36 +0200)
>=20
> are available in the git repository at:
>=20
>   https://github.com/mshakeel/meta-oe.git master
>   https://github.com//tree/master
>=20
> Muhammad Shakeel (3):
>   openssh: Remove systemd support which is merged in oe-core
>   lighttpd: Remove systemd support which is merged in oe-core
>   rpcbind: Remove systemd support which is merged in oe-core

Thanks!

You cannot remove PRINC unless PV was incremented in oe-core, so I'll
restore PRINC in rpcbind and lighttpd (you don't need to send v2 for
that).

>  .../openssh/openssh/sshd.socket                    |   11 -----------
>  .../openssh/openssh/sshd@.service                  |    9 ---------
>  .../openssh/openssh/sshdgenkeys.service            |   10 ----------
>  .../openssh/openssh_6.2p2.bbappend                 |   16 --------------=
--
>  .../lighttpd/lighttpd/lighttpd.service             |   13 -------------
>  .../lighttpd/lighttpd_1.4.32.bbappend              |   15 ---------------
>  .../rpcbind/rpcbind/rpcbind.service                |   13 -------------
>  .../rpcbind/rpcbind_0.2.0.bbappend                 |   16 --------------=
--
>  8 files changed, 103 deletions(-)
>  delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/ope=
nssh/sshd.socket
>  delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/ope=
nssh/sshd@.service
>  delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/ope=
nssh/sshdgenkeys.service
>  delete mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/lightt=
pd/lighttpd.service
>  delete mode 100644 meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind=
/rpcbind.service
>=20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI0Q6IACgkQN1Ujt2V2gByalgCeLievjikGXpqR0RpB/LOFKnMF
LB4AnRWkxXflViQc8rST2dsDCrdSErMD
=9Hz1
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
