Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4ECCDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 10:27:07 +0000 (UTC)
Subject: Re: [meta-oe][master/wrynose][PATCH 1/2] kernel-selftest: add libcap to build and runtime dependencies
To: openembedded-devel@lists.openembedded.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Chrome 149
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 Jun 2026 03:27:00 -0700
References: <20260604123907.3597697-1-j-sahu@ti.com>
In-Reply-To: <20260604123907.3597697-1-j-sahu@ti.com>
Message-ID: <79924.1782383220861846663@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CpGck6BpxKf5YvB6dvVk"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 10:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127780

--CpGck6BpxKf5YvB6dvVk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thanks for accepting this patch series in master branch[0][1]. But it i=
s not backported into wrynose yet.
As per release notes[2], wrynose is based on linux kernel 6.18 and these pa=
tches adds kernel-selftests upto
the tests added till 6.18 kernel.

Can we backport these to wrynose as well ? Let me know if there are any con=
cerns.

[0]: https://git.openembedded.org/meta-openembedded/commit/?id=3D447405d1ff=
7db1478e7d5db5dda7eb0545d5520b
[1]: https://git.openembedded.org/meta-openembedded/commit/?id=3Dd56e22f0d6=
8cf99b052793c80fd9509677e89cea
[2]: https://docs.yoctoproject.org/6.0/migration-guides/release-notes-6.0.h=
tml#new-features-enhancements-in-yocto-ver

- Jeevan

On Thu, Jun 4, 2026 at 06:09 PM, Jeevan wrote:

>=20
> libcap is needed unconditionally for capability-aware tests such as
> breakpoints, cgroup, clone3, futex, ptrace, and seccomp. Add it to
> DEPENDS so it is always available at build time and to RDEPENDS so the
> installed tests can call cap_get_proc() and friends at runtime.
>=20
> bash and libgcc are also added to RDEPENDS: bash is required by several
> test shell scripts, and libgcc provides libgcc_s.so needed by tests
> that use GCC-emitted unwinding stubs.
>=20
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
> meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 5c001696d0..ab544859d8 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
>=20
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b88=
14"
>=20
> -DEPENDS =3D "rsync-native llvm-native"
> +DEPENDS =3D "rsync-native llvm-native libcap"
>=20
> S =3D "${UNPACKDIR}"
>=20
> @@ -161,7 +161,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> FILES:${PN} +=3D "/usr/kernel-selftest"
>=20
> -RDEPENDS:${PN} +=3D "python3 perl perl-module-io-handle"
> +RDEPENDS:${PN} +=3D "python3 perl perl-module-io-handle bash libcap libg=
cc"
>=20
>=20
> INSANE_SKIP:${PN} +=3D "libdir"
>=20
> --
> 2.34.1

--CpGck6BpxKf5YvB6dvVk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, Thanks for accepting this patch series in master branch[0][1]. But=
 it is not backported into wrynose yet.</div>
<div>As per release notes[2], wrynose is based on linux kernel 6.18 and the=
se patches adds kernel-selftests upto</div>
<div>the tests added till 6.18 kernel.</div>
<div>&nbsp;</div>
<div>Can we backport these to wrynose as well ? Let me know if there are an=
y concerns.</div>
<div>&nbsp;</div>
<div>[0]: <a href=3D"https://git.openembedded.org/meta-openembedded/commit/=
?id=3D447405d1ff7db1478e7d5db5dda7eb0545d5520b" target=3D"_blank" rel=3D"no=
opener">https://git.openembedded.org/meta-openembedded/commit/?id=3D447405d=
1ff7db1478e7d5db5dda7eb0545d5520b</a></div>
<div>[1]: <a href=3D"https://git.openembedded.org/meta-openembedded/commit/=
?id=3Dd56e22f0d68cf99b052793c80fd9509677e89cea" target=3D"_blank" rel=3D"no=
opener">https://git.openembedded.org/meta-openembedded/commit/?id=3Dd56e22f=
0d68cf99b052793c80fd9509677e89cea</a></div>
<div>[2]: <a href=3D"https://docs.yoctoproject.org/6.0/migration-guides/rel=
ease-notes-6.0.html#new-features-enhancements-in-yocto-ver" target=3D"_blan=
k" rel=3D"noopener">https://docs.yoctoproject.org/6.0/migration-guides/rele=
ase-notes-6.0.html#new-features-enhancements-in-yocto-ver</a></div>
<div>&nbsp;</div>
<div>- Jeevan</div>
<div>&nbsp;</div>
<div>On Thu, Jun 4, 2026 at 06:09 PM, Jeevan wrote:</div>
<div>
<blockquote>libcap is needed unconditionally for capability-aware tests suc=
h as<br />breakpoints, cgroup, clone3, futex, ptrace, and seccomp. Add it t=
o<br />DEPENDS so it is always available at build time and to RDEPENDS so t=
he<br />installed tests can call cap_get_proc() and friends at runtime.<br =
/><br />bash and libgcc are also added to RDEPENDS: bash is required by sev=
eral<br />test shell scripts, and libgcc provides libgcc_s.so needed by tes=
ts<br />that use GCC-emitted unwinding stubs.<br /><br />Signed-off-by: Tel=
ukula Jeevan Kumar Sahu &lt;j-sahu@ti.com&gt;<br />---<br />meta-oe/recipes=
-kernel/kernel-selftest/kernel-selftest.bb | 4 ++--<br />1 file changed, 2 =
insertions(+), 2 deletions(-)<br /><br />diff --git a/meta-oe/recipes-kerne=
l/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selfte=
st/kernel-selftest.bb<br />index 5c001696d0..ab544859d8 100644<br />--- a/m=
eta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb<br />+++ b/meta-oe=
/recipes-kernel/kernel-selftest/kernel-selftest.bb<br />@@ -4,7 +4,7 @@ LIC=
ENSE =3D "GPL-2.0-only"<br /><br />LIC_FILES_CHKSUM =3D "file://COPYING;md5=
=3Dbbea815ee2795b2f4230826c0c6b8814"<br /><br />-DEPENDS =3D "rsync-native =
llvm-native"<br />+DEPENDS =3D "rsync-native llvm-native libcap"<br /><br /=
>S =3D "${UNPACKDIR}"<br /><br />@@ -161,7 +161,7 @@ PACKAGE_ARCH =3D "${MA=
CHINE_ARCH}"<br />INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"<br />FILES:${PN} +=3D=
 "/usr/kernel-selftest"<br /><br />-RDEPENDS:${PN} +=3D "python3 perl perl-=
module-io-handle"<br />+RDEPENDS:${PN} +=3D "python3 perl perl-module-io-ha=
ndle bash libcap libgcc"<br /><br />INSANE_SKIP:${PN} +=3D "libdir"<br /><b=
r />-- <br />2.34.1</blockquote>
</div>

--CpGck6BpxKf5YvB6dvVk--

