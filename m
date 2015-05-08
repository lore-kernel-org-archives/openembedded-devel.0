Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C8B1360034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 17:18:44 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YqlvB-00068I-NT from Joe_MacDonald@mentor.com ;
	Fri, 08 May 2015 10:18:45 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Fri, 8 May 2015
	10:18:44 -0700
Received: by burninator (Postfix, from userid 1000)	id 1AF555806FD; Fri,  8
	May 2015 13:18:49 -0400 (EDT)
Date: Fri, 8 May 2015 13:18:49 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150508171848.GD7280@mentor.com>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150508151207.GA7280@mentor.com> <554CEC31.3000809@gmail.com>
MIME-Version: 1.0
In-Reply-To: <554CEC31.3000809@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
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
X-List-Received-Date: Fri, 08 May 2015 17:18:46 -0000
X-Groupsio-MsgNum: 55408
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline

--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on=
 polkit] On 15.05.08 (Fri 10:02) akuster808 wrote:

> Joe,
>=20
>=20
> On 05/08/2015 08:12 AM, Joe MacDonald wrote:
> >Hi Armin,
> >
> >I don't know if you've noticed, but it looks like this caused an issue
> >with the current world build:
>=20
> You mean the Galaxy build Martin does? no I have not.

I noticed it because the commit log was updated when I was cherry
picking out of master-next, that's how I found it.  :)

> >commit 00ea492451d221fcc4af5613732035184b8ee43a
> >Author: Armin Kuster <akuster808@gmail.com>
> >Date:   Sat Apr 4 14:52:03 2015 -0700
> >
> >     networkmanger: meta-oe world build failes
> >
> >     ERROR: Nothing RPROVIDES 'dnsmasq' (but /home/akuster/oss/clean/met=
a-openembedded/meta-oe/recipes-connectivity/networkmanager/networkmanager_0=
=2E9.8.10.bb RDEPENDS on or otherwise requires it)
> >     NOTE: Runtime target 'dnsmasq' is unbuildable, removing...
> >     Missing or unbuildable dependency chain was: ['dnsmasq']
> >     ERROR: Required build target 'networkmanager' has no buildable prov=
iders.
> >     Missing or unbuildable dependency chain was: ['networkmanager', 'dn=
smasq']
> >
> >     move networkmanager from meta-oe to meta-networking.
> >
> >     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >
> >I'll see if I can reproduce it, it's not obvious to me on the surface
> >why this would be an issue with your patch.
>=20
> maybe it prefers to live in meta-oe ; )

Maybe it's freaked out being moved closer to dnsmasq or something.
We'll see.

-J.

> thanks.
> >
> >-J.
> >
> >[[meta-networking][PATCH] networkingmanager: QA warning for rdepends on =
polkit] On 15.05.04 (Mon 20:18) Armin Kuster wrote:
> >
> >>WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a bu=
ild dependency? [build-deps]
> >>
> >>Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >>---
> >>  .../recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb   =
  | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager_0.9.8.10.bb b/meta-networking/recipes-connectivity/networkmanager/=
networkmanager_0.9.8.10.bb
> >>index 8d37c98..36a4a7e 100644
> >>--- a/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_0.9.8.10.bb
> >>+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_0.9.8.10.bb
> >>@@ -37,11 +37,12 @@ PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATU=
RES','systemd','systemd','conso
> >>  PACKAGECONFIG[systemd] =3D " \
> >>      --with-systemdsystemunitdir=3D${systemd_unitdir}/system --with-se=
ssion-tracking=3Dsystemd --enable-polkit, \
> >>      --without-systemdsystemunitdir, \
> >>-    polkit \
> >>+    polkit, polkit \
> >>  "
> >>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
> >>  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,=
consolekit,consolekit"
> >>  PACKAGECONFIG[concheck] =3D "--enable-concheck,--disable-concheck,lib=
soup-2.4"
> >>+PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, , polkit"
> >>
> >>  # Work around dbus permission problems since we lack a proper at_cons=
ole
> >>  do_install_prepend() {

--=20
-Joe MacDonald.
:wq

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVTO/4AAoJEEn8ffcsOfaWAzcIALwRR+1gRVTtsnBafuV3Gfpi
rjmepdx2gNoGpY6F9HT5I0Md2ovqUUMl3CEmClAKzXGwjICXyog5q/ZubjzL6jur
vYzVk3F43M7czhZeQgQMemJ9Ex4KtSUnrG9b51TyYCdzd/TWgmUBRPmOkNeFDT45
lGpra+jqbwebH7cT6nIrjlc8gb48bGClbL3bOtzmjkwddNBnb22F19qrTIRQIceY
1sfkZu144HWQSsq8MYtia/XStcLjZRmjyq6j7GVuAaJMPPsmfSzJRsA8kxRi4lEn
cRSS1NErooiaYgHd+sWs+n5mevUrouUezSqO3taP/5iaLk7LjkemFmyZ8FtqRCY=
=XefH
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
