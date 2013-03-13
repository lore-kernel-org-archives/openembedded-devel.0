Received: from mail-ye0-f178.google.com ([209.85.213.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFoz3-00087K-08
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:57:34 +0100
Received: by mail-ye0-f178.google.com with SMTP id q7so208040yen.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iqN0G06YW9ZCDM5QXslblYZUDvvVuWy5DYQLC7cUIuU=;
	b=iOVUBXGpGPd6jEyQibl4WfBLL4XPe0doCALIWJi5bh3x0D15cErZhOu048FfBXN7En
	ns2U4Ard/KWgZ8xGjvWAinOo6ZPQceA2woXpztkL+rN0/g+z+efKiVi7DjVoGGGncUej
	qcnQ/rJBdupcBQ0NuRn9BJPQOlt+xlilsUzL6u4lXaosa2L5cRqzmLZ1rDQji6NGt9tx
	2gyZj9CFmv30i2Q4dcO4cquYko5MQtcBMHP5FRoFTGDpmuwD+/5Xz8LglJUVGBwQsJcs
	Y6grT+iBXbQZjucyKLmu1oiolx6g8aznpDnSD9n/1BffVCljrp8Cpn4VjwD73aS81ifd
	tNeQ==
X-Received: by 10.236.120.101 with SMTP id o65mr12707860yhh.57.1363192815673; 
	Wed, 13 Mar 2013 09:40:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q26sm36328695yhl.22.2013.03.13.09.40.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:40:14 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:40:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313164007.GY3260@jama>
References: <cover.1362053187.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1362053187.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/3] Additions from oe-core
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
X-List-Received-Date: Wed, 13 Mar 2013 16:57:53 -0000
X-Groupsio-MsgNum: 43538
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JjNtGRvLZqzR8wa5"
Content-Disposition: inline

--JjNtGRvLZqzR8wa5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2013 at 12:08:59PM +0000, Ross Burton wrote:
> Hi,
>=20
> Recently libgdata, clutter-box2d and gthumb were removed from oe-core.  T=
hese
> are all still useful, so this series adds them to meta-oe.

Applied, thanks!

>=20
> gthumb and libgdata are in meta-gnome, clutter-box2d is in meta-oe.
>=20
> Ross
>=20
> The following changes since commit 84ea5433739ddc2551216902f6053d5c2368e7=
55:
>=20
>   macchanger: added 1.5.0 recipe (2013-02-25 09:59:56 -0500)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib ross/from-core
>=20
> for you to fetch changes up to ff4c100c5e51ac6227325ea1ea319c902bf554bf:
>=20
>   libgdata: add, from oe-core (2013-02-28 11:56:21 +0000)
>=20
> ----------------------------------------------------------------
> Ross Burton (3):
>       gthumb: add, taken from oe-core
>       clutter-box2d: add, from oe-core
>       libgdata: add, from oe-core
>=20
>  .../recipes-gnome/gthumb/files/parallel.patch      |  158 ++++++++++++++=
++++++
>  meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   27 ++++
>  .../recipes-gnome/libgdata/libgdata_0.7.1.bb       |   15 ++
>  meta-oe/recipes-graphics/clutter/clutter-box2d.inc |   15 ++
>  .../recipes-graphics/clutter/clutter-box2d_git.bb  |   14 ++
>  5 files changed, 229 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gthumb/files/parallel.patch
>  create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
>  create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
>  create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d.inc
>  create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
>=20
> Ross Burton (3):
>   gthumb: add, taken from oe-core
>   clutter-box2d: add, from oe-core
>   libgdata: add, from oe-core
>=20
>  .../recipes-gnome/gthumb/files/parallel.patch      |  158 ++++++++++++++=
++++++
>  meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   27 ++++
>  .../recipes-gnome/libgdata/libgdata_0.7.1.bb       |   15 ++
>  meta-oe/recipes-graphics/clutter/clutter-box2d.inc |   15 ++
>  .../recipes-graphics/clutter/clutter-box2d_git.bb  |   14 ++
>  5 files changed, 229 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gthumb/files/parallel.patch
>  create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
>  create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
>  create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d.inc
>  create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
>=20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JjNtGRvLZqzR8wa5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAq+cACgkQN1Ujt2V2gByqMwCdENGHJsVf41wjCrXa9vR8XgGR
B2QAnjW/uCcbhb1rsb4W5JnGslKf4UMG
=USkE
-----END PGP SIGNATURE-----

--JjNtGRvLZqzR8wa5--
