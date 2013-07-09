Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 551776AD1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2013 12:20:41 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so3655433eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2013 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K/aR7l4zBnyACI2W1sxCaRXzkxb/nmkyy5AquNQ7WcM=;
	b=0M2K6My/jwZ1NImT4mS1J73la8wtu5oThJDtMg2CuO3P5Qapnu80rY/DegTSelxSvR
	4P/HS/ddhU2jc0Vb0MNF8wK6T/Ym9ltXsYdnQjuWqpPbLwlzRShp/ecClNTFCuWqpbGJ
	is8NNZdEljXKzFa2txmrjkSW9aiEW2ZbTRL4Qq/T//TefRnmm/QMP8Sc8I7TlwKJJZ72
	vV8tSc1NgxoSdfaw6xGz50y2ngqqe4J1eEpwZy5aXR/cBcjucizoHc964LxN9EIBG88B
	G8E85XOiCV0tl0Y9g4iSvGLdcDRIHbByIF7j85cO+p4g7y172nadbHivqb5NDUmnnSMB
	uOig==
X-Received: by 10.15.36.133 with SMTP id i5mr30601287eev.52.1373372440355;
	Tue, 09 Jul 2013 05:20:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm50622725eed.9.2013.07.09.05.20.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 05:20:39 -0700 (PDT)
Date: Tue, 9 Jul 2013 14:20:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130709122049.GT3288@jama>
References: <1371467502-9395-1-git-send-email-noor_ahsan@mentor.com>
	<365E1805BC95084CBE82381A0B869994DE4D3DB2@EU-MBX-01.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B869994DE4D3DB2@EU-MBX-01.mgc.mentorg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome][PATCH V2] gvfs: Handle samba dependency based on GPLv3 license.
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
X-List-Received-Date: Tue, 09 Jul 2013 12:20:41 -0000
X-Groupsio-MsgNum: 45348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FT/vNgDLxVq4t/AU"
Content-Disposition: inline

--FT/vNgDLxVq4t/AU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2013 at 10:48:21AM +0000, Ahsan, Noor wrote:
> Hello,
>=20
> Kindly apply this patch. Thanks.
>=20
> Noor

Somehow it got lost from my in-test queue, now it's back on track again,
sorry.

Your patch was also based on very old meta-oe, we have 1.10.1 since
2013-05-03:
http://git.openembedded.org/meta-openembedded/commit/?id=3D985fb27d51ecb948=
a195af5b27a3a3f6b5ab3f45

Please rebase before sending patches.

Regards,

> -----Original Message-----
> From: Ahsan, Noor=20
> Sent: Monday, June 17, 2013 4:12 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Ahsan, Noor
> Subject: [meta-gnome][PATCH V2] gvfs: Handle samba dependency based on GP=
Lv3 license.
>=20
> From: Noor <noor_ahsan@mentor.com>
>=20
> * Samba is GPLv3. In GPLv3 free environment one was not able to
>   build gvfs. Add PACKAGECONFIG for samba and enable is when GPLv3
>   is not present in INCOMPATIBLE_LICENSE.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta-gnome/recipes-gnome/gvfs/gvfs.inc      |    4 +---
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb |    7 ++++++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-=
gnome/gvfs/gvfs.inc
> index 0e1c69c..ba52fe7 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
> @@ -10,9 +10,7 @@ SRC_URI[archive.md5sum] =3D "402f94b187b197b403d25c85ca=
eb9562"
>  SRC_URI[archive.sha256sum] =3D "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04=
fdb66db665d684355ef89345"
>  SRC_URI +=3D "file://0001-gvfsfusedaemon.c-fix-glib-build.patch"
> =20
> -EXTRA_OECONF =3D "--with-samba-includes=3D${STAGING_INCDIR} \
> -                --with-samba-libs=3D${STAGING_LIBDIR} \
> -                --with-archive-includes=3D${STAGING_INCDIR} \
> +EXTRA_OECONF =3D "--with-archive-includes=3D${STAGING_INCDIR} \
>                  --with-archive-libs=3D${STAGING_LIBDIR} \  "
> =20
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/rec=
ipes-gnome/gvfs/gvfs_1.8.2.bb
> index 7f86151..5274280 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
> @@ -1,6 +1,6 @@
>  require gvfs.inc
> =20
> -DEPENDS =3D "samba libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gc=
onf libgphoto2"
> +DEPENDS =3D "libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf li=
bgphoto2"
>  # optional: obexftp libcdio libimobiledevice=20
> =20
>  PR =3D "${INC_PR}.1"
> @@ -21,3 +21,8 @@ FILES_gvfsd-trash =3D "${libexecdir}/gvfsd-trash ${data=
dir}/gvfs/mounts/trash.moun
> =20
>  RDEPENDS_${PN} =3D "gvfs-gdu-volume-monitor"
>  RRECOMMENDS_gvfsd-ftp +=3D "openssh-sftp openssh-ssh"
> +
> +PACKAGECONFIG ?=3D "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', ''=
, 'samba', d)}"
> +
> +PACKAGECONFIG[samba] =3D "--enable-samba --with-samba-includes=3D${STAGI=
NG_INCDIR} \
> +                        --with-samba-libs=3D${STAGING_LIBDIR}, --disable=
-samba, samba"
> --
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FT/vNgDLxVq4t/AU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHcACEACgkQN1Ujt2V2gBxfkQCdEjIG2MdNu8b9noiV0AjFC5ZT
K70AnRJTYZscOH8ao+w8JY+VgEcMGLZZ
=oecf
-----END PGP SIGNATURE-----

--FT/vNgDLxVq4t/AU--
