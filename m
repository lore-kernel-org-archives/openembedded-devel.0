Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 40E106017E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 15:18:57 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so731986wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=71I61SJVqFBGF5dXZV0b/NkZUJ/XAi0x99yza2dZvJU=;
	b=Px+K2kj7C208CXJx1mVCQKK5TUGysSzn35mmENqMkVErqxu7bl7itP6twvUA44B4qT
	MT8VqGT2s+9CrrjdRYqUeTchR361oLKf3c3R62VZNtaKbWyEXoE/jznTxVbwpisYBQaO
	LwA3LaQgXMzezaPZFn41EL8fNPGBlw4evFYUi6OADEzufkgbAdL9GDNpZg3ubT0BwYE+
	ij4tZn9jyyuw+YlHmcwVknG6XpmpbVaDFXxmeUEx+cA4ZnltWk3S8XTkdYkrusPwPPfb
	PJDn3UPJTYEZqtKY/Ci0Rk0fErR7K14rjQTAQKUbtlaqzmRCHwZkxm547sYDvPRdGliV
	XB9w==
X-Received: by 10.180.8.73 with SMTP id p9mr5608414wia.32.1412176738706;
	Wed, 01 Oct 2014 08:18:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wk5sm1516755wjb.12.2014.10.01.08.18.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 08:18:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Oct 2014 17:19:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141001151952.GD25706@jama>
References: <cover.1411996185.git.anders@chargestorm.se>
	<c3982a9e7a7182cfb3f0147477202f0c7b15858a.1411996185.git.anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <c3982a9e7a7182cfb3f0147477202f0c7b15858a.1411996185.git.anders@chargestorm.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-oe] [PATCH 1/1] breakpad: install static library
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
X-List-Received-Date: Wed, 01 Oct 2014 15:19:06 -0000
X-Groupsio-MsgNum: 52326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xOS8do0ZRfB5pORP"
Content-Disposition: inline

--xOS8do0ZRfB5pORP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 03:10:30PM +0200, Anders Darander wrote:
> In order to build against breakpad when using an SDK, we need to also pac=
kage
> libbreakpad_client.a.
>=20
> The SDK will then need to add breakpad-staticdev to TOOLCHAIN_TARGET_TASK.

Fails in world builds:
|  ( cd '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gn=
ueabi/breakpad/svn-r0/image/usr/lib' && arm-oe-linux-gnueabi-ranlib libbrea=
kpad.a )
|  ( cd '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gn=
ueabi/breakpad/svn-r0/image/usr/lib' && arm-oe-linux-gnueabi-ranlib libbrea=
kpad_client.a )
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/breakpad/svn-r0/build'
| install: cannot stat `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv=
5te-oe-linux-gnueabi/breakpad/svn-r0/trunk/src/client/linux/libbreakpad_cli=
ent.a': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/breakpad/svn-r0/t=
emp/log.do_install.11600)
NOTE: recipe breakpad-svn-r0: task do_install: Failed

I guess it should be installed from ${B}

Please re-test and re-send.

>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/=
recipes-devtools/breakpad/breakpad_svn.bb
> index 2c5941d..571e1d3 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> @@ -56,6 +56,9 @@ do_install_append() {
> =20
>          install -d ${D}${includedir}/breakpad/third_party/lss
>          install -m 0644 ${S}/src/third_party/lss/linux_syscall_support.h=
 ${D}${includedir}/breakpad/third_party/lss/linux_syscall_support.h
> +
> +        install -d ${D}${libdir}
> +        install -m 0644 ${S}/src/client/linux/libbreakpad_client.a ${D}$=
{libdir}/libbreakpad_client.a
>  }
> =20
>  PACKAGES =3D+ "${PN}-minidump-upload ${PN}-sym-upload"
> --=20
> 2.1.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xOS8do0ZRfB5pORP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQsG5gACgkQN1Ujt2V2gBx/RACfakK/cDioJwa7b3iKJCx8Eu0x
NmEAoI+xW4xDESvdx9pwjdvkIlJgWK/B
=7Tbn
-----END PGP SIGNATURE-----

--xOS8do0ZRfB5pORP--
