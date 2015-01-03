Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 052D77277A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 10:12:07 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so1617952wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 02:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XVK/a79ngFCmNEEz7rSxvY0BkEqXHwCCPTERJpfnHbQ=;
	b=rMfz1W8AEqHXUp0sSVsm9lFmeFltOyOEdmP1DD/bbc1PoTq45xRw4qxIXky3uqvoh9
	k9Y+y6G3SQsxBpTYwiTIK76kKPuQQT0EM/6A+omoKiYGMWE3JYKkspq3SFdhltxEVJOv
	RoCY60L4RO9EFHUlU8Xsrk7rx+4qZDp8Hah/SSLU5ngC5+NzWExM8x15XD0im7OMOm+1
	gvoKVmHjHb/MmPKoeWkBFJp/Lx4bpYV+N+Ise9pMexTIMYUhvVIauYJ9XUNDhBEfKGEq
	mQ4WlSb4ESaBTdzlWe5b5+eU9IBf67sizUbpgluOzC1o6SCd7wt6WDF078btAkg7l1FL
	dXJg==
X-Received: by 10.194.200.1 with SMTP id jo1mr161850505wjc.64.1420279927032;
	Sat, 03 Jan 2015 02:12:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r3sm2049414wic.10.2015.01.03.02.12.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Jan 2015 02:12:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 3 Jan 2015 11:12:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150103101211.GA24032@jama>
References: <1417563094-28889-1-git-send-email-akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1417563094-28889-1-git-send-email-akuster@mvista.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] strongswan: update package to 5.2.1
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
X-List-Received-Date: Sat, 03 Jan 2015 10:12:11 -0000
X-Groupsio-MsgNum: 53571
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2014 at 03:31:34PM -0800, Armin Kuster wrote:
> see https://wiki.strongswan.org/projects/strongswan/wiki/Changelog52

Triggered ICE in world build, lets see if it fail repeatedly

| i586-oe-linux-gcc  -m32 -march=3Di586 --sysroot=3D/home/jenkins/oe/world/=
shr-core/tmp-glibc/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I/home/jenkins/oe/=
world/shr-core/tmp-glibc/work/i586-oe-linux/strongswan/5.2.1-r0/strongswan-=
5.2.1/src/pki -I../..  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i58=
6-oe-linux/strongswan/5.2.1-r0/strongswan-5.2.1/src/libstrongswan -DPLUGINS=
=3D\""aes des rc2 sha1 sha2 md5 random x509 revocation pkcs1 pkcs7 pkcs8 pk=
cs12 dnskey sshkey pem openssl gmp curl\""   -O2 -pipe -g -feliminate-unuse=
d-debug-types -include /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-=
oe-linux/strongswan/5.2.1-r0/build/config.h -c -o commands/req.o /home/jenk=
ins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/strongswan/5.2.1-r0/stro=
ngswan-5.2.1/src/pki/commands/req.c
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/strongswan/5.2.1-r0/strongswan-5.2.1/src/libstrongswan/utils/prin=
tf_hook/printf_hook.h:25:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/strongswan/5.2.1-r0/strongswan-5.2.1/src/libstrongswan/library.h:=
97,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/strongswan/5.2.1-r0/strongswan-5.2.1/src/pki/pki.h:28,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/strongswan/5.2.1-r0/strongswan-5.2.1/src/pki/command.c:17:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/st=
dlib.h: In function 'atoll':
| i586-oe-linux-gcc  -m32 -march=3Di586 --sysroot=3D/home/jenkins/oe/world/=
shr-core/tmp-glibc/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I/home/jenkins/oe/=
world/shr-core/tmp-glibc/work/i586-oe-linux/strongswan/5.2.1-r0/strongswan-=
5.2.1/src/pki -I../..  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i58=
6-oe-linux/strongswan/5.2.1-r0/strongswan-5.2.1/src/libstrongswan -DPLUGINS=
=3D\""aes des rc2 sha1 sha2 md5 random x509 revocation pkcs1 pkcs7 pkcs8 pk=
cs12 dnskey sshkey pem openssl gmp curl\""   -O2 -pipe -g -feliminate-unuse=
d-debug-types -include /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-=
oe-linux/strongswan/5.2.1-r0/build/config.h -c -o commands/self.o /home/jen=
kins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/strongswan/5.2.1-r0/str=
ongswan-5.2.1/src/pki/commands/self.c
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/st=
dlib.h:293:1: internal compiler error: Segmentation fault
|  {
|  ^
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[4]: *** [command.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
| make[4]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/i586-oe-linux/strongswan/5.2.1-r0/build/src/pki'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/i586-oe-linux/strongswan/5.2.1-r0/build/src/pki'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/i586-oe-linux/strongswan/5.2.1-r0/build/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/i586-oe-linux/strongswan/5.2.1-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../strongswan/{strongswan_5.2.0.bb =3D> strongswan_5.2.1.bb}           =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/strongswan/{strongswan_5.2.0.bb =
=3D> strongswan_5.2.1.bb} (92%)
>=20
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.2.0.=
bb b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> similarity index 92%
> rename from meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb
> rename to meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> index 0997fd0..6b91319 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> @@ -11,8 +11,8 @@ SRC_URI =3D "http://download.strongswan.org/strongswan-=
${PV}.tar.bz2 \
>          file://fix-funtion-parameter.patch \
>  "
> =20
> -SRC_URI[md5sum] =3D "5cee4ee1a6ccb74400758b3ace54d46e"
> -SRC_URI[sha256sum] =3D "b00c30bd2e60ff2e5fc85f54bbad54fe246585812fdf212d=
be777a5258da26ce"
> +SRC_URI[md5sum] =3D "dd3717c0aa59ab4591ca1812941ebb82"
> +SRC_URI[sha256sum] =3D "ea51ab33b5bb39fecaf10668833a9936583b42145948ae9d=
a1ab98f74e939215"
> =20
>  EXTRA_OECONF =3D "--enable-gmp \
>          --enable-openssl \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSnwHsACgkQN1Ujt2V2gBxpPgCff60HkIcvL/PXxmNQYuggacC4
F/AAn3Pw/K7XsA3ImOGsg3r39KAowsw/
=N7Y8
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
