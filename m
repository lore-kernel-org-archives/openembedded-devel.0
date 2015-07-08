Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 02A3175D7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:43:19 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so191824512wgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6IQQMY2qDLz5UjvHS6f9hRE+u6Ju+M3oDzSF98jM/e8=;
	b=Eunt05M3+l1nJJwzsJ5U+ks8FTjOALfuHQo3myGIRPc8qVfjSaz8YUHMzw/Bzd2JR7
	cGe1+klpCj4uYidqgNX4lla2Da+WIPPhnpnb1JRF9n1VuSW1VRzoHfjKKNSS+Oz9552X
	z7JjUtodozc46Gq/uiufcqpFBIGHpooxO7giRNEghQSwZzgcZe5qvoy1ayE1frbU2u9u
	GnfikRzA69Ao2XF/YaKN07oB/vELSOsjahI1Pf1chJvX/rUVsfsNleIf19fNuJG2BXDC
	eGJR3HrLTBRph5C4zcqlTyug+0wLQJPJtTa1z55BktVJ/be4409tIT6zKQ/GlnEbNmcd
	3m0A==
X-Received: by 10.180.9.111 with SMTP id y15mr70984434wia.18.1436352199386;
	Wed, 08 Jul 2015 03:43:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id e7sm2209138wib.22.2015.07.08.03.43.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 03:43:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Jul 2015 12:43:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150708104328.GD2398@jama>
References: <1436325795-22322-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1436325795-22322-1-git-send-email-jian.liu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] systemd.bbclass: delete dangling symblink
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
X-List-Received-Date: Wed, 08 Jul 2015 10:43:20 -0000
X-Groupsio-MsgNum: 56188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline

--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 11:23:15AM +0800, Jian Liu wrote:
> If only systemd is enabled, scripts of sysvinit under "/etc/init.d/"
> will be deleted. But there may be some symblinks /etc/rc*/ that
> points to the files under "/etc/init.d/". We need to delete them.

Wrong ML

> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  meta/classes/systemd.bbclass | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index c34884b..ff3e0f8 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -184,6 +184,31 @@ do_install[postfuncs] +=3D "rm_systemd_unitdir "
>  python rm_sysvinit_initddir (){
>      import shutil
>      sysv_initddir =3D oe.path.join(d.getVar("D", True), (d.getVar('INIT_=
D_DIR', True) or "/etc/init.d"))
> +    sysv_rcdirs =3D []
> +    cpath =3D oe.cachedpath.CachedPath()
> +
> +    def check_dangling_sym(file,inst_root):
> +        if not cpath.islink(file):
> +            return False
> +
> +        rtarget =3D cpath.realpath(file, inst_root, True, assume_dir =3D=
 True)
> +        if not cpath.lexists(rtarget):
> +            return True
> +
> +        return False
> +
> +    # delete dangling symblink under rc*
> +    def rm_sysv_rcdirs():
> +        dest =3D d.getVar("D", True)
> +        rcdirs =3D "rc.d rc0.d rc1.d rc2.d rc3.d rc4.d rc5.d rc6.d rcS.d"
> +
> +        for rcdir in rcdirs.split():
> +            path =3D dest + "/etc/" + rcdir
> +            for walk_root, walk_dirs, walk_files in cpath.walk(path):
> +                for file in walk_files:
> +                    file =3D walk_root + "/" + file
> +                    if check_dangling_sym(file, walk_root):
> +                        sysv_rcdirs.append(file)
> =20
>      if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) a=
nd \
>          not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False=
, d) and \
> @@ -193,5 +218,9 @@ python rm_sysvinit_initddir (){
>          # If systemd_unitdir contains anything, delete sysv_initddir
>          if (os.path.exists(systemd_unitdir) and os.listdir(systemd_unitd=
ir)):
>              shutil.rmtree(sysv_initddir)
> +
> +            rm_sysv_rcdirs()
> +            for rcdir in sysv_rcdirs:
> +                os.remove(rcdir)
>  }
>  do_install[postfuncs] +=3D "rm_sysvinit_initddir "
> --=20
> 1.8.5.2.233.g932f7e4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWc/s8ACgkQN1Ujt2V2gBx1/wCdHQt1sS4RmMz8bcU9gC4bePLu
S8UAn2tChcf90TX4J5DJSQRQ5BtxDmHV
=Q2Va
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
