Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2F27D13E
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 16:35:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w10so19368590wrm.4
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TyzrkRq15QFXrM/mAPm4FJ4Qy8lFpc2YsPM5fMSJOF0=;
	b=S8LEK7mE7Ys4g0fT/h0sloa35Ih1pQuawCYDShU8+uCZ/ggUxQ/cwW7u9Pi51Kfhck
	iw3nGO1yv6yfh2KzFjjk6pP8/zNrWprHEeHcS/q//vPmHc8KbthJiZWdgDhoNuEN6Y96
	YKjwPdDnRQvPeD/oJTDkWU7h4XGDmocRqpd57L+Ks7ohWm6/Akl7FgECr7a0oVxviWqM
	k4/NM00vO3HZYtH/mcT4v92qBW1MX57DLiUbls84ZJdT+0B+VLk48QKmahtfF5+o706m
	KXpJ8pfQUzCLRhw6+4YEeq4IaervqD243vBbtQhkfAhYKM/J6gsqXw0u2LtrdRNAYzBO
	bejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TyzrkRq15QFXrM/mAPm4FJ4Qy8lFpc2YsPM5fMSJOF0=;
	b=f5ENQOt300w/e4XjysYq7XeHRlOCJ2Y3ybr9nlDqwNMWglB9McRNBjG5VmAgzVPDx+
	f6lbuPBM2IH5DvuiRQQTGF2Cog99ZCoW3/1SV/DWg1QAr3l5WZO9ZQX8VirHLonlaTbR
	kvZf83Loen6xiQN2lRYdhlxkW6WjkX+OqeoxxJskJZS97uHNIJRMDLs7anvI7Q8N6ueN
	xDU76H0oU/JjyB8k4/sGUGAvobTxTQNaTac6KvoXHfCJ2Zy5yAOYCSQzOgZanumqXsDx
	wwTAVpQkHmX78B991Uz8Bo5i8FnQlC5+j5I+PVcBTkIkiDDU/S8noJaLEtVTiH+UGiQd
	4eRA==
X-Gm-Message-State: APjAAAVo3oX85OL5C9EKY1jnKZP8tZRf86RbJSkAcOgIshDADJg9Hip6
	Ct8z1CxddcYS8gLH4FmXCbY=
X-Google-Smtp-Source: APXvYqycY3slDs4uctYkkuZkFVUjI4RqnX2GLOTTYfyK0qryq0uVnpD19kFNvhgoUWutBhetZNM/Mg==
X-Received: by 2002:adf:fd88:: with SMTP id d8mr18292439wrr.320.1553704507910; 
	Wed, 27 Mar 2019 09:35:07 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	61sm43903043wre.50.2019.03.27.09.35.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 09:35:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Mar 2019 17:35:07 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190327163507.GE1598@jama>
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
	<20190327161754.GD1598@jama>
MIME-Version: 1.0
In-Reply-To: <20190327161754.GD1598@jama>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of OE World, 2019-03-16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2019 16:35:07 -0000
X-Groupsio-MsgNum: 76868
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Content-Disposition: inline

--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2019 at 05:17:54PM +0100, Martin Jansa wrote:
> On Sun, Mar 17, 2019 at 08:26:37AM -0700, Khem Raj wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >=20
> > =3D=3D Failed tasks 2019-03-16 =3D=3D
> >=20
> > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190=
317_082308.log
> >=20
> >     * sources/openembedded-core/meta/recipes-gnome/gobject-introspectio=
n/gobject-introspection_1.58.3.bb:do_compile
>=20
> I was hit by this one as well on some arm targets.
>=20
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.=
20190321_215508.log/bitbake.log
>=20
> shows that it's actually from qemu-arm segfault inside g-ir-scanner-qemuw=
rapper
>=20
> | qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> | /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf-neon-yoe-linux-=
gnueabi/gobject-introspection/1.58.3-r0/build/g-ir-scanner-qemuwrapper: lin=
e 6:  1959 Segmentation fault      (core dumped) PSEUDO_UNLOAD=3D1 qemu-arm=
 -r 3.2.0 -L /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf-neon-y=
oe-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-sysroot -E LD_LIBRA=
RY_PATH=3D$GIR_EXTRA_LIBS_PATH:.libs:/home/jenkins/oe/world/yoe/build/tmpfs=
/work/armv7vet2hf-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/re=
cipe-sysroot//usr/lib:/home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2=
hf-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-sysroot//l=
ib "$@"
>=20
> The interesting part is that this happens only when glibc is built with g=
old enabled.
>=20
> I've put a bit more details in temporary work-around here:
> https://github.com/shr-distribution/meta-smartphone/commit/8f06eb355ead85=
464b1a1bbaa82584504df15743
>=20
> I'm comparing qemuarm glibc build with bfd and gold to see if there is so=
me
> significant difference which might cause this and I plan to flash some sm=
all
> image on my targets to see if libc is broken in runtime as well or only w=
hen
> running inside qemu-arm.
>=20
> Is anyone else seeing this as well?

Checking older world status on the wiki shows that this issue was
introduced somewhere around christmas

This is last world build before the issue:
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20181219_=
112425.log
=2E..
=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
14c291e1fb gcc-runtime: Add missing libc dependency
not included in master yet:=20
7e2ab991fa python/python3: use cc_basename to replace CC for checking compi=
ler
ced915026d python-native: fix one do_populate_sysroot warning
aee47f3e82 netbase: add entry to /etc/hosts according to /etc/hostname
a09e2db43a sstate: add support for caching shared workdir tasks
c104a34166 grub2: Fix passing null to printf formats
6f364ff8c4 gnupg: Upgrade to 2.2.12 release
0224fec86b glibc: Upgrade towards 2.29 release
2486349782 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
b3ab29bdbb gcc-runtime: Drop building libmpx

and this is the first which reported qemu-arm segfault:
=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
95659bed3f populate_sdk_ext.bbclass: Include site.conf in parsing for conte=
nts for local.conf
not included in master yet:=20
0c9db0ae7d python/python3: use cc_basename to replace CC for checking compi=
ler
bb3eb6bc41 python-native: fix one do_populate_sysroot warning
08a205f872 netbase: add entry to /etc/hosts according to /etc/hostname
b81c8650d0 sstate: add support for caching shared workdir tasks
702be42dc9 glibc: Remove site_config and glibc-initial
fc230822d8 gcc: Drop gcc-cross-initial and use gcc-cross instead
8652df3a0d gcc: Drop the -initial versions of the compiler
0c2f6dfa2f recipes: Drop virtual/libc-for-gcc
c64531600d newlib: Move away from gcc-initial dependency
0d5fb4428f libssp: Remove dependency on gcc-initial
7dd8829d3e musl: Move away from gcc-initial dependency
9abdb4d6ca tcmode-default: Drop pinnings for gcc-initial based recipes
e02724e8f8 base.bbclass, classextend.py: Drop catering to gcc-initial
7756cb7d17 oeqa/concurrencytest: fix for locating meta-selftest
f4c68c39e7 crosssdk/cross-canadian: Set LIBCOVERRIDE correctly
6fc9bb5698 glibc: Enable --with-default-link
d4cb282bc6 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
6efe313b46 glibc: Upgrade towards 2.29 release
dac5dc5067 grub2: Fix passing null to printf formats
bb36d9dc8c gnupg: Upgrade to 2.2.12 release
81059437a5 gnupg: Do not apply -Woverride-init guard for gcc >=3D 9
6fa05e5ace nfs-utils: Disable format-overflow as Werror
8fab7b23ef musl: Update to latest master
a5641cac42 libxcrypt: Upgrade to 4.4.2
c90ec03d07 gdb: Backport a fix to build with gcc9
1adae92573 valgrind: Fix x86_64 build failure with gcc9
38e9e09104 ffmpeg: Backport patch to fix build with gcc9
4e1fa57743 binutils: Upgrade to latest on 2.31 release branch
5cce276d4a binutils: Upgrade to upcoming 2.32 release

and the changes introduced in oe-core between these are:
docker-shr @ ~/openembedded-core $ git log --oneline 14c291e1fb..95659bed3f
95659bed3f populate_sdk_ext.bbclass: Include site.conf in parsing for conte=
nts for local.conf
085530e8ff i2c-tools: upgrade 4.0 -> 4.1
673c2dcf10 common-licenses: update Libpng license text
099aecfaa3 libpng: upgrade 1.6.35 -> 1.6.36
6574bb7523 harfbuzz: upgrade 2.1.3 -> 2.2.0
8286e9d79d sqlite3: upgrade 3.25.3 -> 3.26.0
a33170ff9a libatomic-ops: upgrade 7.6.6 -> 7.6.8
6a10ff0bcd gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.1
dd2c4d9d85 eudev: upgrade 3.2.5 -> 3.2.7
0860216a81 icecc: patchelf is needed by icecc-create-env
d2fcaeb153 icecc: Don't generate recipe-sysroot symlinks at recipe-parsing =
time
4455c46bf7 icecc: Syntax error meant that we weren't waiting for tarball ge=
neration
fa6bae80bc icecc: Trivial simplification
6d6788a3ea icecc: readlink -f on the recipe-sysroot gcc/g++
1ee90ec89a libxcrypt: Fix nativesdk build with gcc9
547174fc83 gcc-runtime: Drop building libmpx

It's possible that it's not caused by one of these oe-core changes, but one=
 of the pending
yoe changes (like those 2 binutils upgrades) which were merged to oe-core i=
n some form a bit
later.

I'll verify if the issue is reproducible with oe-core 95659bed3f and contin=
ue the bisect from there.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJumOQAKCRA3VSO3ZXaA
HOJpAJ4zdMU5KF0baEMp3RdY4tXtt8Ml/ACfUunvFXLXOcbQxdqIbabend8GLbI=
=yAjM
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
