Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NAi3d-0007Ja-0y
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:46:44 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 75145140B0; Wed, 18 Nov 2009 11:45:17 +0100 (CET)
Date: Wed, 18 Nov 2009 11:45:17 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091118104517.GA17441@zlo.nu>
References: <1258540671-652-1-git-send-email-zlo@zlo.nu>
MIME-Version: 1.0
In-Reply-To: <1258540671-652-1-git-send-email-zlo@zlo.nu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: iproute2: Remove undocumented bash runtime dependency, move to INC_PR and rework dir layout
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
X-List-Received-Date: Wed, 18 Nov 2009 10:46:44 -0000
X-Groupsio-MsgNum: 14413
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2009 at 11:37:48AM +0100, Marc Olzheim wrote:
> I noticed that iproute2 has a runtime dependency on bash in two of its sc=
ripts.
> Those dependencies are unneeded, so I removed them.
>=20
> Before doing that though, I moved the recipes to INC_PR and changed the
> directory layout to prevent useless duplication of the patches in the
> directories.

For some reason the commit messages of patch 1 and 2 are not in the
output of git send-email...

They were:

---
Move to INC_PR.
---

and

---
Move all patches to one directory to avoid duplication.
---

Marc

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksD0D0ACgkQezjnobFOgrFDigCgspUcv1xznUJIvx5eONl8llUT
7akAoIp4GuDhcropuOnW0OXT1E09xqxY
=Sr07
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
