Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE8FC46CD2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 01:29:20 +0000 (UTC)
Subject: coreutils over uutils-coreutils when selinux in DISTRO_FEATURES
To: openembedded-devel@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Detroit, Michigan, US (68.55.8.61)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 30 Dec 2023 17:29:18 -0800
Message-ID: <0nJP.1703986158117153552.ibjv@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6BZFldNFV0juL22RwyTd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 01:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107949

--6BZFldNFV0juL22RwyTd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

Currently using coreutils over busybox and systemd over sysvinit via:

>=20
>=20
>=20
>=20
> SKIP_RECIPE[busybox] =3D "Don't build this"
> DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D " sysvinit"
> VIRTUAL-RUNTIME_syslog =3D ""
> VIRTUAL-RUNTIME_initscripts =3D ""
> VIRTUAL-RUNTIME_init_manager =3D "systemd"
> VIRTUAL-RUNTIME_dev_manager =3D "udev"
> VIRTUAL-RUNTIME_login_manager =3D "shadow-base"
> VIRTUAL-RUNTIME_base-utils =3D "packagegroup-core-base-utils"
> VIRTUAL-RUNTIME_base-utils-hwclock =3D "util-linux-hwclock"
> VIRTUAL-RUNTIME_base-utils-syslog =3D ""
> VIRTUAL-RUNTIME_vim =3D "vim"
> PREFERRED_PROVIDER_udev =3D "systemd"
> PREFERRED_PROVIDER_udev-utils =3D "systemd"
> PREFERRED_PROVIDER_virtual/base-utils =3D "packagegroup-core-base-utils"
> PREFERRED_PROVIDER_coreutils =3D "coreutils"
>=20
>=20

Need help determining how to use coreutils over uutils-coreutils?
uutils-coreutils only gets built when I include "selinux" in *DISTRO_FEATUR=
ES.
* Thus it leads me to

ERROR: Nothing PROVIDES 'clang-native'
ERROR: Nothing RPROVIDES 'uutils-coreutils'

Of course happens because I'm not including meta-clang.

I've bypassed error by including:

SKIP_RECIPE[uutils-coreutils] =3D "Don't build this"
BBMASK +=3D "/meta-oe/recipes-core/uutils-coreutils"

Which builds, but doesn't include required tools into target system image
sed,which.

I have tried removing SKIP_RECIPE,BBMASK and set

PREFERRED_PROVIDER_coreutils =3D "coreutils"

Still wants to build uutils-coreutils over coreutils.

I would like to not include meta-clang and of course not use uutils-coreuti=
ls over coreutils.

--6BZFldNFV0juL22RwyTd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello all,<br /><br />Currently using coreutils over busybox and systemd=
 over sysvinit via:</p>
<blockquote>
<p><br />SKIP_RECIPE[busybox] =3D "Don't build this"<br />DISTRO_FEATURES_B=
ACKFILL_CONSIDERED:append =3D " sysvinit"<br />VIRTUAL-RUNTIME_syslog =3D "=
"<br />VIRTUAL-RUNTIME_initscripts =3D ""<br />VIRTUAL-RUNTIME_init_manager=
 =3D "systemd"<br />VIRTUAL-RUNTIME_dev_manager =3D "udev"<br />VIRTUAL-RUN=
TIME_login_manager =3D "shadow-base"<br />VIRTUAL-RUNTIME_base-utils =3D "p=
ackagegroup-core-base-utils"<br />VIRTUAL-RUNTIME_base-utils-hwclock =3D "u=
til-linux-hwclock"<br />VIRTUAL-RUNTIME_base-utils-syslog =3D ""<br />VIRTU=
AL-RUNTIME_vim =3D "vim"<br />PREFERRED_PROVIDER_udev =3D "systemd"<br />PR=
EFERRED_PROVIDER_udev-utils =3D "systemd"<br />PREFERRED_PROVIDER_virtual/b=
ase-utils =3D "packagegroup-core-base-utils"<br />PREFERRED_PROVIDER_coreut=
ils =3D "coreutils"</p>
</blockquote>
<p><br />Need help determining how to use coreutils over uutils-coreutils?<=
br />uutils-coreutils only gets built when I include "selinux" in <strong>D=
ISTRO_FEATURES.<br /></strong>Thus it leads me to<br /><br />ERROR: Nothing=
 PROVIDES 'clang-native'<br />ERROR: Nothing RPROVIDES 'uutils-coreutils'</=
p>
<p>Of course happens because I'm not including meta-clang.</p>
<p>I've bypassed error by including:</p>
<p>SKIP_RECIPE[uutils-coreutils] =3D "Don't build this"<br />BBMASK +=3D "/=
meta-oe/recipes-core/uutils-coreutils"</p>
<p>Which builds, but doesn't include required tools into target system imag=
e<br />sed,which.<br /><br />I have tried removing SKIP_RECIPE,BBMASK and s=
et<br /><br />PREFERRED_PROVIDER_coreutils =3D "coreutils"</p>
<p>Still wants to build uutils-coreutils over coreutils.<br /><br />I would=
 like to not include meta-clang and of course not use uutils-coreutils over=
 coreutils.</p>

--6BZFldNFV0juL22RwyTd--

