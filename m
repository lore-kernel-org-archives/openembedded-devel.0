Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AD8D11185
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 17:13:27 +0000 (UTC)
Subject: Re: coreutils over uutils-coreutils when selinux in DISTRO_FEATURES
To: openembedded-devel@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Hamtramck, Michigan, US (68.49.9.200)
X-Originating-Platform: Linux Firefox 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 09:13:22 -0800
References: <13199.1728590787704780404@lists.openembedded.org>
In-Reply-To: <13199.1728590787704780404@lists.openembedded.org>
Message-ID: <22763.1730654002300290010@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1bDXTb3xLBxGa44Crdzt"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 17:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113397

--1bDXTb3xLBxGa44Crdzt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey Clayton, Thanks for post append! Forgot I wanted to append more info to=
 post.
I added bellow into distro config

# Replaces busybox,uutils-coreutils with coreutils
SKIP_RECIPE[uutils-coreutils] =3D "Don't build this"
SKIP_RECIPE[busybox] =3D "Don't build this"
VIRTUAL-RUNTIME_syslog =3D ""
VIRTUAL-RUNTIME_login_manager =3D "shadow-base"
VIRTUAL-RUNTIME_base-utils =3D "packagegroup-core-base-utils"
VIRTUAL-RUNTIME_base-utils-hwclock =3D "util-linux-hwclock"
VIRTUAL-RUNTIME_base-utils-syslog =3D ""
VIRTUAL-RUNTIME_vim =3D "vim"
PREFERRED_PROVIDER_virtual/base-utils =3D "packagegroup-core-base-utils"
PREFERRED_PROVIDER_coreutils =3D "coreutils"
PREFERRED_PROVIDER_uutils-coreutils =3D "coreutils"
RDEPENDS:packagegroup-core-base-utils:remove =3D " parted"

--1bDXTb3xLBxGa44Crdzt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hey Clayton, Thanks for post append! Forgot I wanted to append more in=
fo to post.<br />I added bellow into distro config<br /><br />
<div># Replaces busybox,uutils-coreutils with coreutils<br />SKIP_RECIPE[uu=
tils-coreutils] =3D "Don't build this"<br />SKIP_RECIPE[busybox] =3D "Don't=
 build this"<br />VIRTUAL-RUNTIME_syslog =3D ""<br />VIRTUAL-RUNTIME_login_=
manager =3D "shadow-base"<br />VIRTUAL-RUNTIME_base-utils =3D "packagegroup=
-core-base-utils"<br />VIRTUAL-RUNTIME_base-utils-hwclock =3D "util-linux-h=
wclock"<br />VIRTUAL-RUNTIME_base-utils-syslog =3D ""<br />VIRTUAL-RUNTIME_=
vim =3D "vim"</div>
<div>PREFERRED_PROVIDER_virtual/base-utils =3D "packagegroup-core-base-util=
s"<br />PREFERRED_PROVIDER_coreutils =3D "coreutils"<br />PREFERRED_PROVIDE=
R_uutils-coreutils =3D "coreutils"</div>
<div>RDEPENDS:packagegroup-core-base-utils:remove =3D " parted"</div>
</div>

--1bDXTb3xLBxGa44Crdzt--

