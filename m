Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6B21609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:39:55 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so9821828wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XVRmBfmv1SsBVU5Kqu+M+BPyLzglSmGSYynF7F1AIb8=;
	b=iHpKaLhfR4L+hHBahMltMV7yXbjnUTNfXcmMSjWrY92QRGHcsmDpfSD8oRX9cve0Wi
	2+dkgTYCl+4QzSyxhdMm8c+pYs4b8r3sw+VW7b7ryeD0vaLgq5tPHYil7E04dhrlv6vO
	t37uuiTBQk4Z/1mtp/P53LSJDLMl0iwGRP1Z4TiqkLGQ3WfMCGn1gy4OxylIigqUUrc4
	hl5hpWr4QBWZryGULiYCwvnE9pK6kCV+E3tJxxGt4mT/YYAXOg3mFEjXKyMDdIhEH21V
	zEYB1VsuYFG40uFr3o4VO9marlVrVnT3WhIIiDSUUUD3dEGcEcwJUU2VO7YpQwPoili+
	y9lA==
X-Received: by 10.180.20.40 with SMTP id k8mr32770208wie.54.1407843596158;
	Tue, 12 Aug 2014 04:39:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm55282440wie.21.2014.08.12.04.39.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:39:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:40:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140812114031.GI14848@jama>
References: <cover.1407773390.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH v2 0/5] Various dnsmasq fixes/improvements
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
X-List-Received-Date: Tue, 12 Aug 2014 11:40:02 -0000
X-Groupsio-MsgNum: 51615
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eS1VfoAplU8hbCPA"
Content-Disposition: inline

--eS1VfoAplU8hbCPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 09:12:21AM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> This is rebased on current master. The parallel make fix's commit message=
 is
> adjusted to match what it does, and the lua patch is fixed.. It seems
> something inadvertantly trimmed trailing whitespace out of the patch, oop=
s.
>=20
> The following changes since commit 4d4ab8fd320b58323033c12cf705e7b3ce10d6=
59:
>=20
>   integrate fcgi-2.4.0 and add OML license file (2014-08-10 17:23:22 +010=
0)
>=20
> are available in the git repository at:

Thanks for v2, it looks like some trailing spaces were lost in v1, so
hopefully it will apply now:

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
index 63dd71a..aac7b97 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -1,15 +1,16 @@
 Upstream-status: Inappropriate [OE specific]
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
=20
---- dnsmasq-2.68.orig/Makefile
-+++ dnsmasq-2.68/Makefile
-@@ -57,8 +57,8 @@ idn_cflags =3D  `echo $(COPTS) | $(top)/bl
- idn_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CO=
NFIG) --libs libidn`
+--- dnsmasq-2.68.orig/Makefile       2014-08-11 09:05:17.000000000 -0700
++++ dnsmasq-2.68/Makefile    2014-08-11 09:05:51.930648617 -0700
+@@ -57,8 +57,8 @@
+ idn_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_CO=
NFIG) --libs libidn`=20
  ct_cflags =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(=
PKG_CONFIG) --cflags libnetfilter_conntrack`
  ct_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(=
PKG_CONFIG) --libs libnetfilter_conntrack`
--lua_cflags =3D  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(=
PKG_CONFIG) --cflags lua5.1`
--lua_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(=
PKG_CONFIG) --libs lua5.1`
+-lua_cflags =3D  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(=
PKG_CONFIG) --cflags lua5.1`=20
+-lua_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(=
PKG_CONFIG) --libs lua5.1`=20
 +lua_cflags =3D  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(=
PKG_CONFIG) --cflags lua`
 +lua_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(=
PKG_CONFIG) --libs lua`
  sunos_libs =3D  `if uname | grep SunOS >/dev/null 2>&1; then echo -lsocke=
t -lnsl -lposix4; fi`
  version =3D     -DVERSION=3D'\"`$(top)/bld/get-version $(top)`\"'
+=20


>=20
>   https://github.com/kergoth/meta-openembedded dnsmasq-fixes
>=20
> for you to fetch changes up to 2e84f59401a5ce57ba17841ff4ddb01cffeb1145:
>=20
>   dnsmasq: add packageconfigs for idn, conntrack, lua (2014-08-11 09:07:1=
4 -0700)
>=20
> ----------------------------------------------------------------
> Christopher Larson (5):
>       dnsmasq: add missing inherit pkgconfig
>       dnsmasq: obey CFLAGS & LDFLAGS
>       dnsmasq: move parallel make patch to .bb, add upstream-status
>       dnsmasq: look for lua.pc, not lua5.1.pc
>       dnsmasq: add packageconfigs for idn, conntrack, lua
>=20
>  meta-networking/recipes-support/dnsmasq/dnsmasq.inc   | 19 +++++++++++++=
+-----
>  .../recipes-support/dnsmasq/dnsmasq/lua.patch         | 16 +++++++++++++=
+++
>  .../dnsmasq/{files =3D> dnsmasq}/parallel-make.patch    |  1 +
>  .../recipes-support/dnsmasq/dnsmasq_2.68.bb           |  5 +++++
>  4 files changed, 36 insertions(+), 5 deletions(-)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.p=
atch
>  rename meta-networking/recipes-support/dnsmasq/{files =3D> dnsmasq}/para=
llel-make.patch (96%)
>=20
> --=20
> 1.8.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eS1VfoAplU8hbCPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp/S8ACgkQN1Ujt2V2gByw0ACfa1/Rm/jiDVMaL3ym5tZtBJH0
nvMAn3D3zabOZ4wmS+NVWhA/CMZ6FZS6
=JIv2
-----END PGP SIGNATURE-----

--eS1VfoAplU8hbCPA--
