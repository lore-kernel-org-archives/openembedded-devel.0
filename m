Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id A01C465DDE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:42:36 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so2925096eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Fa4Cbo+rPy20CjfTRG56JbNQNe/ErMtXZm9DlcIOOzw=;
	b=xvB5bBV/H9QAyiR5W5aYA2LomVuvxSCvpWxbFw5XaKukfpsB6D5DCklXmRdKc52O5E
	WADkovZTPT62qTiGDXxjnSTgu7fnKPAexI1kfTB232Okt1372C7AWj0Y7fiFJRQdnwVC
	0WsMdKuHK9qOZf0x2CmET61LzplFpuOl+xIObefPBSlK2Pv7SOFHiuagmA++p04+tvTg
	t6sKFP7VuD21r73Z+j57W7wXVAJhKju62Nc77lCCja+0qjq71FIeoiIAL5T7nbiG+WyS
	2By157B/Go8tkjms8jWE71JiF0BqIU+bRCEMjxb7OE93EnUB4XseecZ0KSGRqJ8t0A0O
	ltAQ==
X-Received: by 10.14.193.201 with SMTP id k49mr38110348een.50.1397994156870;
	Sun, 20 Apr 2014 04:42:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm93918306eeu.0.2014.04.20.04.42.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:42:35 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:42:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420114240.GX2486@jama>
References: <1396031009-15874-1-git-send-email-adam.yh.lee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396031009-15874-1-git-send-email-adam.yh.lee@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-gnome][PATCH] gvfs-gdu-volume-monitor: Define build dependency on libgnome-keyring
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
X-List-Received-Date: Sun, 20 Apr 2014 11:42:42 -0000
X-Groupsio-MsgNum: 49331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5LZCLy8Sy7WgNZQM"
Content-Disposition: inline

--5LZCLy8Sy7WgNZQM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2014 at 11:23:29AM -0700, Adam YH Lee wrote:
> Build fails due to missing libgnome-keyring static library
> (libgnome-keyring.la). libgnome-keyring has to be
> explicitly listed as one of the dependencies.

Merged, thanks!

>=20
> Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
> ---
>  .../gvfs/gvfs-gdu-volume-monitor_1.10.1.bb         |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1=
=2Ebb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
> index bd6d9de..cf0ab0c 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
> @@ -2,8 +2,7 @@ require gvfs.inc
> =20
>  BPN =3D "gvfs"
> =20
> -DEPENDS =3D "gvfs gnome-disk-utility"
> -
> +DEPENDS =3D "gvfs gnome-disk-utility libgnome-keyring"
>  PR =3D "${INC_PR}.0"
> =20
>  # we need gdu files only: reduce files to delete in libexecdir
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5LZCLy8Sy7WgNZQM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTsrAACgkQN1Ujt2V2gBz4nwCgjy1MRU/0CHBrgimCZqqTD++e
adoAnRSgNd3RIy1+QPq7dgMVx/YtwaIg
=RvaM
-----END PGP SIGNATURE-----

--5LZCLy8Sy7WgNZQM--
