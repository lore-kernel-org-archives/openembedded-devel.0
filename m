Received: from 14.mo1.mail-out.ovh.net ([178.32.97.215]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TsCyi-0004Vo-4e
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 14:43:06 +0100
Received: from mail435.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 540CAFF9E8D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jan 2013 12:15:27 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2013 13:02:00 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Jan 2013 13:01:59 +0200
Date: Mon, 7 Jan 2013 12:01:49 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Message-ID: <20130107120149.78479591@e6520eb>
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 12332826105804074313
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Cc: martin.jansa@gmail.com
Subject: Re: [meta-oe][danny][PATCH 0/6] fixes for world build
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
X-List-Received-Date: Mon, 07 Jan 2013 13:43:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Fri,  4 Jan 2013 13:20:30 +0100,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> The following changes since commit f026e96295da101bb715858bc8705de7e4a339=
92:
>=20
>   xinput-calibrator: remove hardcoded path from xinput_calibrator.desktop=
 (2012-12-10 20:43:34 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny2
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/for-danny2
>=20
> Marcin Juszkiewicz (6):
>   python-phoneutils: drop due to lack of libphone-utils
>   fbreader: move to meta-gpe due to libgpewidget dependency
>   devilspie2: move to meta-gnome (libwnck is there)
>   mplayer2: move lame into ENTERPRISE_DISTRO check
>   midori: move to meta-gnome due to libnotify
>   packagegroup-cli-tools: remove mdbus2, mterm2, mkdump, mioctl
>=20
>  .../recipes-connectivity/midori/midori_0.4.6.bb           |  0
>  .../recipes-gnome}/devilspie/devilspie2_0.24.bb           |  0
>  .../recipes-gnome}/devilspie/files/default.lua            |  0
>  .../recipes-gnome}/devilspie/files/devilspie2.desktop     |  0
>  .../fbreader/fbreader-0.12.10/Makefile.patch              |  0
>  .../recipes-support/fbreader/fbreader-0.12.10/gcc45.patch |  0
>  .../recipes-support/fbreader/fbreader_0.12.10.bb          |  0
>  .../recipes-support/fbreader/fbreader_git.bb              |  0
>  ...installation-of-the-icons-when-RESOLUTION-is-set.patch |  0
>  .../recipes-core/packagegroups/packagegroup-cli-tools.bb  |  6 +-----
>  meta-oe/recipes-devtools/python/python-phoneutils_git.bb  | 15 ---------=
------
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb        |  2 +-
>  12 files changed, 2 insertions(+), 21 deletions(-)
>  rename {meta-oe =3D> meta-gnome}/recipes-connectivity/midori/midori_0.4.=
6.bb (100%)
>  rename {meta-oe/recipes-graphics =3D> meta-gnome/recipes-gnome}/devilspi=
e/devilspie2_0.24.bb (100%)
>  rename {meta-oe/recipes-graphics =3D> meta-gnome/recipes-gnome}/devilspi=
e/files/default.lua (100%)
>  rename {meta-oe/recipes-graphics =3D> meta-gnome/recipes-gnome}/devilspi=
e/files/devilspie2.desktop (100%)
>  rename {meta-oe =3D> meta-gpe}/recipes-support/fbreader/fbreader-0.12.10=
/Makefile.patch (100%)
>  rename {meta-oe =3D> meta-gpe}/recipes-support/fbreader/fbreader-0.12.10=
/gcc45.patch (100%)
>  rename {meta-oe =3D> meta-gpe}/recipes-support/fbreader/fbreader_0.12.10=
.bb (100%)
>  rename {meta-oe =3D> meta-gpe}/recipes-support/fbreader/fbreader_git.bb =
(100%)
>  rename {meta-oe =3D> meta-gpe}/recipes-support/fbreader/files/0001-Fix-i=
nstallation-of-the-icons-when-RESOLUTION-is-set.patch (100%)
>  delete mode 100644 meta-oe/recipes-devtools/python/python-phoneutils_git=
.bb
>=20

merged danny-next, test build in progress.

Thanks,
Eric


