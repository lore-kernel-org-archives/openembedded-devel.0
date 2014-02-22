Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id DE6F26B86F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 13:32:51 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id b15so3468eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 05:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TJrEBZ4IbX8+nvdFqHF7BPL0BkTSOxb0gXIr8X6MaSI=;
	b=VTNdAldqOjoJtdUzdEu72HriLzJ93LYhgS2TtkeYmyQ477jZPkV/dR6kt61UCmOCSv
	8eZQRYM3CRsWKkz4G/sJk+4ATRwoqZii2Wlpd+Kz5CQ8zKxI3WYoxHT6wcdKKBc+CyHp
	Ojt6uWRK0MOclUNJSiioxHorP4sIfsD/56D04TcAVJmASst7gwTKpY7h3S+gsJgd/+s3
	foE+mqC+Js438oGuYckogQtN8ekRKGLdnYDnHEyDMXxdyqPUKSejuzDawnBpq3lbWQ+l
	bEnd78gxtM0dUGird3pBDugL3ByopkmRQvz+hHzyVwYuiA9zg+NG9LS/iB+JY8szMFlO
	I9Zw==
X-Received: by 10.14.225.67 with SMTP id y43mr14296886eep.10.1393075971802;
	Sat, 22 Feb 2014 05:32:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id l4sm3885948eeo.9.2014.02.22.05.32.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 05:32:50 -0800 (PST)
Date: Sat, 22 Feb 2014 14:33:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140222133327.GO3854@jama>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 00/20] EFL 1.8 and friends
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
X-List-Received-Date: Sat, 22 Feb 2014 13:32:55 -0000
X-Groupsio-MsgNum: 48270
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PtLnLSExlPr13a2X"
Content-Disposition: inline

--PtLnLSExlPr13a2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 01, 2014 at 08:33:56AM +0100, Martin Jansa wrote:
> The following changes since commit 6572316557e742c2dc93848e4d560242bf0c39=
95:
>=20
>   yaffs2-utils: Fix formatting, drop PR (2014-01-23 10:04:37 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/efl
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/efl

I would like to merge this soon (and start playing with 1.9.0-beta2)

If nobody shouts this weekend I'll merge it on Sunday.

4 modules aren't compatible with E-18:
   * meta-openembedded/meta-efl/recipes-efl/e17/e-tasks_git.bb, do_compile
   * meta-openembedded/meta-efl/recipes-efl/e17/emprint_svn.bb, do_compile
   * meta-openembedded/meta-efl/recipes-efl/e17/news_svn.bb, do_compile
   * meta-openembedded/meta-efl/recipes-efl/e17/rage_svn.bb, do_compile

Is somebody still using them or can I just move them to nonworking?

http://git.enlightenment.org/enlightenment/modules/news.git/
http://git.enlightenment.org/apps/rage.git/
http://git.enlightenment.org/apps/emprint.git/

I'll probably fix e-tasks, because now I've noticed that it's pointing
to my github account :).

> Martin Jansa (20):
>   efl: upgrade from separate recipes to shared efl-1.8.5
>   efl: Adjust packaging to match more with old 1.7 separate recipes
>   python-efl: upgrade from separate recipes to shared python-efl-1.8.1
>   python-efl: update packaging to match old packages
>   elementary: upgrade to 1.8.4
>   elementary: Add PACKAGECONFIG for ewebkit and disable it by default
>   terminology: upgrade to 0.4.0
>   evas-generic-loaders: upgrade to 1.8.1
>   emotion-generic-players: add recipe for 1.8.1
>   e-wm: Drop evas-.*-loader.* from RDEPENDS
>   e-wm: Add recipe for 0.18.2
>   enjoy: switch from svn to newer git and update dependency from edbus2
>     to eldbus
>   edbus: remove old edbus(1) svn recipe
>   webkit-efl: Add recipe with snapshot from r159807
>   webkit-efl: Try to disable llint/jit to fix armv[45] build
>   eve: bump SRCREV and update dependency from edbus2 to eldbus
>   libeflvala: Fix build of tests
>   elfe: Replace svn with git version
>   packagegroup-efl-sdk: Update SDK-EFL for shared source tree efl
>   expedite: Replace old svn recipe with git version
>=20
>  meta-efl/conf/layer.conf                           |   1 +
>  meta-efl/recipes-devtools/python/python-ecore.inc  |   5 -
>  .../recipes-devtools/python/python-ecore_1.7.0.bb  |   5 -
>  .../recipes-devtools/python/python-ecore_svn.bb    |   8 -
>  meta-efl/recipes-devtools/python/python-edbus.inc  |  50 ++++-
>  .../recipes-devtools/python/python-edbus_1.7.0.bb  |   3 +-
>  .../recipes-devtools/python/python-edbus_svn.bb    |   8 -
>  meta-efl/recipes-devtools/python/python-edje.inc   |   6 -
>  .../python-edje/0001-fix-unicode-conversion.patch  |  38 ----
>  .../recipes-devtools/python/python-edje_1.7.0.bb   |   6 -
>  .../recipes-devtools/python/python-edje_svn.bb     |  10 -
>  meta-efl/recipes-devtools/python/python-efl.inc    |  69 ++++--
>  .../recipes-devtools/python/python-efl_1.8.1.bb    |   4 +
>  .../recipes-devtools/python/python-elementary.inc  |   5 -
>  .../python/python-elementary_1.7.0.bb              |   5 -
>  .../python/python-elementary_svn.bb                |   8 -
>  .../recipes-devtools/python/python-emotion.inc     |   5 -
>  .../python/python-emotion_1.7.0.bb                 |   5 -
>  .../recipes-devtools/python/python-emotion_svn.bb  |   8 -
>  meta-efl/recipes-devtools/python/python-evas.inc   |   4 -
>  .../recipes-devtools/python/python-evas_1.7.0.bb   |   5 -
>  .../recipes-devtools/python/python-evas_svn.bb     |   8 -
>  meta-efl/recipes-efl/e17/e-wm.inc                  |  18 +-
>  meta-efl/recipes-efl/e17/e-wm_0.17.5.bb            |  12 +
>  meta-efl/recipes-efl/e17/e-wm_0.18.3.bb            |  20 ++
>  .../recipes-efl/e17/{elfe_svn.bb =3D> elfe_git.bb}   |  11 +-
>  ...position-as-percent-and-define-a-1-second.patch |  14 +-
>  .../recipes-efl/e17/{enjoy_svn.bb =3D> enjoy_git.bb} |  12 +-
>  meta-efl/recipes-efl/e17/eve_svn.bb                |   4 +-
>  meta-efl/recipes-efl/e17/terminology.inc           |   1 -
>  meta-efl/recipes-efl/e17/terminology_0.3.0.bb      |  10 -
>  meta-efl/recipes-efl/e17/terminology_0.4.0.bb      |   8 +
>  meta-efl/recipes-efl/efl/ecore_1.7.9.bb            | 124 -----------
>  meta-efl/recipes-efl/efl/edbus2.inc                |  11 -
>  meta-efl/recipes-efl/efl/edbus2_svn.bb             |  14 --
>  meta-efl/recipes-efl/efl/edbus_svn.bb              |  13 --
>  meta-efl/recipes-efl/efl/edje_1.7.9.bb             |  72 ------
>  meta-efl/recipes-efl/efl/eet_1.7.9.bb              |  30 ---
>  meta-efl/recipes-efl/efl/eeze_1.7.9.bb             |  23 --
>  meta-efl/recipes-efl/efl/efl.inc                   | 248 +++++++++++++++=
++++++
>  ...igure.ac-Don-t-check-for-Xprint-extension.patch |  27 +++
>  meta-efl/recipes-efl/efl/efl_1.8.5.bb              |  17 ++
>  meta-efl/recipes-efl/efl/efreet_1.7.9.bb           |  22 --
>  meta-efl/recipes-efl/efl/eina_1.7.9.bb             |  19 --
>  meta-efl/recipes-efl/efl/eio_1.7.9.bb              |  15 --
>  meta-efl/recipes-efl/efl/elementary.inc            |  30 ++-
>  ...e-elm_prefs_cc-and-elementary_codegen-def.patch |  61 +++++
>  meta-efl/recipes-efl/efl/elementary_1.7.9.bb       |   8 -
>  meta-efl/recipes-efl/efl/elementary_1.8.4.bb       |  12 +
>  meta-efl/recipes-efl/efl/embryo_1.7.9.bb           |  20 --
>  .../recipes-efl/efl/emotion-generic-players.inc    |  12 +
>  .../efl/emotion-generic-players_1.8.1.bb           |   8 +
>  meta-efl/recipes-efl/efl/emotion_1.7.9.bb          |  22 --
>  meta-efl/recipes-efl/efl/ethumb_1.7.9.bb           |  27 ---
>  meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |  49 +++-
>  .../recipes-efl/efl/evas-generic-loaders_1.7.9.bb  |   8 -
>  .../recipes-efl/efl/evas-generic-loaders_1.8.1.bb  |   8 +
>  ...s_font_load-Fix-build-with-newer-freetype.patch |  26 ---
>  meta-efl/recipes-efl/efl/evas_1.7.9.bb             | 178 ---------------
>  meta-efl/recipes-efl/efl/expedite_git.bb           |  11 +
>  meta-efl/recipes-efl/efl/expedite_svn.bb           |  13 --
>  .../efl/libeflvala/disable.eina.test.patch         |  44 ++++
>  meta-efl/recipes-efl/efl/libeflvala_svn.bb         |   1 +
>  .../packagegroups/packagegroup-efl-sdk.inc         |   9 +-
>  ...lines.h-remove-indexingHeader-preCapacity.patch |  27 +++
>  ...KitHelpers.cmake-Add-Wno-error-cast-align.patch |  29 +++
>  .../webkit/webkit-efl/gcc-4.8.2.fix.patch          |  15 ++
>  .../webkit/webkit-efl_2.3.2+svnr159807.bb          |  51 +++++
>  68 files changed, 801 insertions(+), 879 deletions(-)
>  delete mode 100644 meta-efl/recipes-devtools/python/python-ecore.inc
>  delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_svn.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_svn.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-edje.inc
>  delete mode 100644 meta-efl/recipes-devtools/python/python-edje/0001-fix=
-unicode-conversion.patch
>  delete mode 100644 meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-edje_svn.bb
>  create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-elementary.inc
>  delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.=
7.0.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_sv=
n.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-emotion.inc
>  delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.7.0=
=2Ebb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_svn.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-evas.inc
>  delete mode 100644 meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
>  delete mode 100644 meta-efl/recipes-devtools/python/python-evas_svn.bb
>  create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.18.3.bb
>  rename meta-efl/recipes-efl/e17/{elfe_svn.bb =3D> elfe_git.bb} (41%)
>  rename meta-efl/recipes-efl/e17/{enjoy_svn.bb =3D> enjoy_git.bb} (88%)
>  delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.3.0.bb
>  create mode 100644 meta-efl/recipes-efl/e17/terminology_0.4.0.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.9.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/edbus2.inc
>  delete mode 100644 meta-efl/recipes-efl/efl/edbus2_svn.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/edbus_svn.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.9.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/eet_1.7.9.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.9.bb
>  create mode 100644 meta-efl/recipes-efl/efl/efl.inc
>  create mode 100644 meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-=
check-for-Xprint-extension.patch
>  create mode 100644 meta-efl/recipes-efl/efl/efl_1.8.5.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.9.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.9.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.9.bb
>  create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use=
-elm_prefs_cc-and-elementary_codegen-def.patch
>  delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.9.bb
>  create mode 100644 meta-efl/recipes-efl/efl/elementary_1.8.4.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.9.bb
>  create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players.inc
>  create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.8.=
1.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.9.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
>  create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/evas/0001-evas_font_load-Fix=
-build-with-newer-freetype.patch
>  delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.9.bb
>  create mode 100644 meta-efl/recipes-efl/efl/expedite_git.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/expedite_svn.bb
>  create mode 100644 meta-efl/recipes-efl/efl/libeflvala/disable.eina.test=
=2Epatch
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-Butterfly=
Inlines.h-remove-indexingHeader-preCapacity.patch
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHel=
pers.cmake-Add-Wno-error-cast-align.patch
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.=
patch
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr1598=
07.bb
>=20
> --=20
> 1.8.5.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PtLnLSExlPr13a2X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMIpycACgkQN1Ujt2V2gByCPwCeLcyhwkXB9W/7q2fsp/9IAX8z
pT4An21PilNQT+1gd1xc2ZtNM0n+S0tX
=7RT7
-----END PGP SIGNATURE-----

--PtLnLSExlPr13a2X--
