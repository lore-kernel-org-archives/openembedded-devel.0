Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id C0C3360B60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:48:15 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so3931344ead.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NIA6ENKU+o0/YBvS/8alwZprQtJf7dyIIWPldhyaKKs=;
	b=Lqc7ldDmZDEFQTc5XwPS4GDVMpO+yVORVH6fUjnNAdMgdDYWZlWdgQ9q6rbddCZ95e
	xoDkMUiu6l0v8YUC8TFJBboYjbcnrS8MOcQ82RU7o3DT9yUnlJRLJfrxLSdWMgnKhtn/
	/l2RetvmNEKEuznLRIVkFZikCY/5yAmI3pvASwBTelnXpNWbo3mS1rG9SP846WU6T8m/
	8NEAkDkczFJyBvg7FXuuPQT5tADy2Mw23hkWWeVlPmWUV+f9AetIDhbANmjBT3gSkmDB
	6Nlo4P697YQvSDIcv8SamsZrJx64+YeS6AOYkz8m1xluClLWAn3Arj2P816FKWFFVixE
	UdhA==
X-Received: by 10.14.102.66 with SMTP id c42mr160391eeg.47.1381837697084;
	Tue, 15 Oct 2013 04:48:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm165675018eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:48:16 -0700 (PDT)
Date: Tue, 15 Oct 2013 13:48:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131015114818.GC3703@jama>
References: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome/meta-systemd 0/2] fixes for latest oe-core
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
X-List-Received-Date: Tue, 15 Oct 2013 11:48:17 -0000
X-Groupsio-MsgNum: 46725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 02:03:12AM +0200, Andreas M=FCller wrote:
> Andreas M=FCller (2):
>   orbit2: fix build after automake 1.13.4 update
>   connman: follow oe-core to 1.18
>=20
>  ...LAGS-instead-of-INCLUDES-and-fix-problem-.patch | 42 ++++++++++++++++=
++++++
>  meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb  |  1 +
>  ...connman_1.17.bbappend =3D> connman_1.18.bbappend} |  0
>  3 files changed, 43 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CP=
PFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
>  rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.17.b=
bappend =3D> connman_1.18.bbappend} (100%)

Both are for oe-core/master, so I've created dora branch in meta-oe
repo, we need to find maintainer for dora release (I'll send separate
e-mail).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJdK4IACgkQN1Ujt2V2gBzRiACfWbXS39dN17S5ioRVo71KXQAI
D8UAoKuX153pB3gry0e9f8CwnmF9aqKS
=A9PQ
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
