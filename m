Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 04BFF77080
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 18:21:04 +0000 (UTC)
Received: by wikq8 with SMTP id q8so224343613wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=im7wE6J5OY6EC4D1Qmt4sQlyTcB6xCvNnElznnx9/wQ=;
	b=OiwMK0EnRQ01YtYn1JraCi0ZETyZULUKLtf3xdB5n36ensE6FBn1BT/mU/yQY6840s
	M3yCDhfZXfJOwVn+41VpLpLW3UUxikgg1/jaMRQH7AWXn5dNbnk8GhHn3DqupFl8U0nK
	wEXSsjtxT/QxmGYhsmc5ABv04wLMQtwPCFDshxmfIXkBXnyDyGyFiXNyA4fDqUjT+Ybx
	6IYcabhCdE6m7k4XRqw+7nf8o7LZ0klQFJFzcg5dc4b3/fiJEMDHJwiOU9g+K9t3puva
	J5qZOswQEaDM7l3M2DyHdAxFAEj8mWiYtgFYu78UNO2I844kvzlVorUyLlQcaIy92WoT
	2YzQ==
X-Received: by 10.180.11.237 with SMTP id t13mr3344013wib.42.1445970064092;
	Tue, 27 Oct 2015 11:21:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ee1sm18628952wic.17.2015.10.27.11.21.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 11:21:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 19:21:21 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027182121.GF2577@jama>
References: <55EAE272.5010904@topic.nl>
MIME-Version: 1.0
In-Reply-To: <55EAE272.5010904@topic.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: "krb" fails to build, suspect GCC bug
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
X-List-Received-Date: Tue, 27 Oct 2015 18:21:07 -0000
X-Groupsio-MsgNum: 58071
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline

--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05, 2015 at 02:39:14PM +0200, Mike Looijmans wrote:
> I got this weird build failure from the "krb" package:
>=20
> | make[3]: Entering directory=20
> '/TOPDIR/build/tmp/work/mips32el-oe-linux/krb5/1.13.2-r0/krb5-1.13.2/src/=
lib/krb5/ccache'
> | mipsel-oe-linux-gcc  -mel -mabi=3D32 -mhard-float -march=3Dmips32=20
> --sysroot=3D/TOPDIR/build/tmp/sysroots/formuler1 -fPIC -DSHARED=20
> -DHAVE_CONFIG_H  -I../../../include -I../../../include -I./ccapi -I. -I.=
=20
>   -DKRB5_DEPRECATED=3D1 -DKRB5_PRIVATE  -Os -pipe -g=20
> -feliminate-unused-debug-types -DDESTRUCTOR_ATTR_WORKS=3D1=20
> -I/TOPDIR/build/tmp/sysroots/formuler1/usr/include/et -Wall -Wcast-align=
=20
> -Wshadow -Wmissing-prototypes -Wno-format-zero-length -Woverflow=20
> -Wstrict-overflow -Wmissing-format-attribute -Wmissing-prototypes=20
> -Wreturn-type -Wmissing-braces -Wparentheses -Wswitch -Wunused-function=
=20
> -Wunused-label -Wunused-variable -Wunused-value -Wunknown-pragmas=20
> -Wsign-compare -Werror=3Duninitialized -Werror=3Dpointer-arith=20
> -Werror=3Ddeclaration-after-statement=20
> -Werror-implicit-function-declaration -pthread -c cc_file.c -o=20
> cc_file.so.o && mv -f cc_file.so.o cc_file.so
> | cc_file.c: In function 'fcc_next_cred':
> | cc_file.c:368:9: error: 'maxsize' may be used uninitialized in this=20
> function [-Werror=3Dmaybe-uninitialized]
> |      ret =3D load_data(context, id, maxsize, buf);
> |          ^
> | cc_file.c:1091:12: note: 'maxsize' was declared here
> |      size_t maxsize;
> |             ^
> | cc1: some warnings being treated as errors
>=20
> Looking at the source, this doesn't make any sense at all. The=20
> declaration of the variable isn't even in the same method body. And the=
=20
> line it complains about is about the fifth time it passes that variable=
=20
> to another method.
>=20
> And working around it by initializing maxsize=3D0 just makes the compiler=
=20
> choke on a similar situation elsewhere:
> | packet.c:50:67: error: 'id' may be used uninitialized in this function
>=20
>=20
> I suspect the problem here is GCC and not the krb code. Anyone seen this?

I've seen it today in my world builds, It seems to fail only when building =
with -Os.

I've seen similar issue in mdadm, also only with -Os.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYvwKAACgkQN1Ujt2V2gBwJmQCbBCxMc01RJbs+TPmAF6CKRulk
yQ0AoLSQIZwltteLd9r+ETlA6oE6rYPK
=HhWB
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
