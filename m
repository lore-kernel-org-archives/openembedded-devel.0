Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SvxNd-0001B2-NG
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 23:19:57 +0200
Received: by pbbrq2 with SMTP id rq2so9176201pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=57hbIteYJlF9FOT0rQD3uFioHzw/Cfhqx2gbazl05f4=;
	b=N9vwoAJ0GAokQHn0hpqgA1PrazglYg+QhjHGrQBwNQJ0CokMuOrb4Rr/sFUlfG5JMX
	dQBE07MlOGKroyenm+YVbiV+jZ0dr9wVgdr4sE5PToVqnBKydqqAea9ZfFqSOCWUV2kX
	To95oDQ8AENcEI6Q2mmIGrGPVV7SZISJX/QzDLhnftMzwydRvwD9gLQ0yjN20LLFFkkR
	9sOUiLNLD8cbnTau+dgwh5HvVCgVddjQqc98zQe2De55schzD0cSIPTtLrf51ScjOCmY
	MtvEzPL+Jg48pQXS8ihL2x0gvrJRfybLg7XlncTAY5EFycAov13OR2tosoApyDc5GNyQ
	gBjw==
Received: by 10.68.239.103 with SMTP id vr7mr39252113pbc.0.1343682500642;
	Mon, 30 Jul 2012 14:08:20 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:b058:e4b1:e360:44b4])
	by mx.google.com with ESMTPS id qc5sm8600992pbb.6.2012.07.30.14.08.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 14:08:20 -0700 (PDT)
Date: Mon, 30 Jul 2012 14:08:27 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120730210827.GE9554@bill-the-cat>
References: <cover.1342677797.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 0/9] Pull request 20120719
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
X-List-Received-Date: Mon, 30 Jul 2012 21:19:58 -0000
X-Groupsio-MsgNum: 39935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline

--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 07:20:31PM +0200, Apelete Seketeli wrote:
> Hello,
>=20
> The patches that come as a follow-up of this message fix issues found
> while building muffinman-image on top of the 2011.03-maintenance
> branch.
> These modifications were tested by successfully building
> muffinman-image from scratch on a Debian Squeeze host.
> Please pull into 2011.03-maintenance branch.
>=20
> The following changes since commit f9611c025109a3e0d6cebf12f49ae24c97759c=
09:
>=20
>   psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-07-0=
4 22:34:04 +0200)
>=20
> are available in the git repository at:
>=20
>   git://seketeli.net/~apelete/oe.git muffinman-image-fix
>=20
> Apelete Seketeli (9):
>   mirrors.bbclass: add new GNU_MIRROR
>   mirrors.bbclass: add new KERNELORG_MIRROR
>   libpng: update SRC_URI
>   bluez4_4.84: update checksum values
>   netsurf: update SRC_URI
>   tzcode: update SRC_URI
>   tzdata: update SRC_URI
>   git: update SRC_URI
>   opkg-utils: bump SRCREV to keep python2.6 compatibility
>=20
>  classes/mirrors.bbclass                 |    2 ++
>  recipes/bluez/bluez4_4.84.bb            |    4 ++--
>  recipes/git/git.inc                     |    2 +-
>  recipes/libpng/libpng.inc               |    2 +-
>  recipes/netsurf/hubbub_0.0.2.bb         |    2 +-
>  recipes/netsurf/libcss_0.0.2.bb         |    2 +-
>  recipes/netsurf/libnsbmp_0.0.2.bb       |    2 +-
>  recipes/netsurf/libnsgif_0.0.2.bb       |    2 +-
>  recipes/netsurf/libparserutils_0.0.2.bb |    2 +-
>  recipes/netsurf/libwapcaplet_0.0.2.bb   |    2 +-
>  recipes/netsurf/netsurf_2.6.bb          |    2 +-
>  recipes/opkg-utils/opkg-utils_git.bb    |    4 ++--
>  recipes/tzcode/tzcode-native.inc        |    4 ++--
>  recipes/tzdata/tzdata.inc               |    2 +-
>  14 files changed, 18 insertions(+), 16 deletions(-)

Applied, thanks.

--=20
Tom

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlAW98sACgkQdZngf2G4WwO4rACgiGhI8ShiCKgxoOW4Q3GjmD1w
Kf0AoIuZw5WY6yEoWYPslIhL1nBMMRwH
=bbMp
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
