Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id C278065E94
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2014 11:17:21 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so2439812wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2014 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0pL66fzwIUigtzVOi4ujsHJPhfTrkGjzcLBD6ys0ezs=;
	b=qrTeVfaduiKLyv+WXtf1QjJd6kTFMpgbpeLXc7JZtZX9u/Kn8s2RvvcUF49Iky3EDz
	DGgcQX/UgMJYZIZ3hhSOj8ikRApl2ZGK9eqZnmWoLTjAMK6YAerGsLbCyQ1FsxRlvFOT
	C4piI/PY0RdBb/QCSQHpjTR0GY77cQ0XYv/M3DATdtVKWUoZhErKaQNevP8q9ZSD+Z7A
	GoUXEE5sNhkqwE6/CyFDzdUp/5vo+cjJpR7I/IT0N9KgpAiQBMVeLulRXI70AnpNWKle
	lbuI67fykhhSVv5kcvKF9StPizRt14+Iv/pB6YX8/vqm5jXRQu99E9kKCLbHcXbXuucF
	WUkg==
X-Received: by 10.194.209.180 with SMTP id mn20mr17484632wjc.49.1413631041712; 
	Sat, 18 Oct 2014 04:17:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l10sm2658543wif.20.2014.10.18.04.17.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Oct 2014 04:17:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 18 Oct 2014 13:17:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141018111721.GH2437@jama>
References: <1413434645-13943-1-git-send-email-net147@gmail.com>
	<20141018090624.GC2437@jama>
MIME-Version: 1.0
In-Reply-To: <20141018090624.GC2437@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qtwebengine: backport patches to fix ARM build failures
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
X-List-Received-Date: Sat, 18 Oct 2014 11:17:24 -0000
X-Groupsio-MsgNum: 52550
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline

--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2014 at 11:06:24AM +0200, Martin Jansa wrote:
> On Thu, Oct 16, 2014 at 03:44:05PM +1100, Jonathan Liu wrote:
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> >  ...ix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch | 30 ++++++++++++++=
+++++
> >  ...QMAKE_CC-when-extracting-C-compiler-flags.patch | 34 ++++++++++++++=
++++++++
> >  recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |  2 ++
> >  recipes-qt/qt5/qtwebengine_git.bb                  |  2 ++
> >  4 files changed, 68 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detect=
ion-for-mfpu-neon-vfpv4.patch
> >  create mode 100644 recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-wh=
en-extracting-C-compiler-flags.patch
>=20
> This seems to break qemuarm build:
>=20
> | No external chromium sources were found, falling back to /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2=
-r0/git/sr
> c/3rdparty/chromium
> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-glibc/=
work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qmake_extra=
s.gypi
> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-glibc/=
work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qtwebengine=
_extras.gy
> pi                                                                       =
                                                                  =20
> | Updating projects from gyp files...                                    =
                                                                  =20
> | gyp: name 'arm_tune' is not defined while evaluating condition 'arm_tun=
e!=3D""' in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux=
-gnueabi/qtw
> ebengine/5.3.2-r0/git/src/core/core.gyp
> | Project ERROR: -- running gyp_qtwebengine failed --                    =
                                                                  =20
> | WARNING: exit code 3 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/jenk=
ins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5=
=2E3.2-r0/te
> mp/log.do_configure.30039)
> NOTE: recipe qtwebengine-5.3.2-r0: task do_configure: Failed

Probably fixed in

commit 1cbb91b4a06d6e6626c5345d5a9d7d0fbe9e1bbb
Author: Andras Becsi <andras.becsi@digia.com>
Date:   Thu Sep 18 18:22:37 2014 +0200

    Set arm_tune to empty string if mtune flag is not set by toolchain

which needs to be backported to qtwebengine_5.3.2+git.bb

Please re-test and re-send, I'm upgrading _git recipes to 5.4-beta in
the mean time so the backport won't be needed in qtwebengine_git.bb.

> > diff --git a/recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for=
-mfpu-neon-vfpv4.patch b/recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detec=
tion-for-mfpu-neon-vfpv4.patch
> > new file mode 100644
> > index 0000000..f0b8d1a
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for-mfpu-n=
eon-vfpv4.patch
> > @@ -0,0 +1,30 @@
> > +From 6b64f42363308a80044cc85ae8ba6c9bf1aac8a7 Mon Sep 17 00:00:00 2001
> > +From: Jonathan Liu <net147@gmail.com>
> > +Date: Wed, 15 Oct 2014 17:02:16 +1100
> > +Subject: [PATCH 1/2] Fix ARM NEON detection for -mfpu=3Dneon-vfpv4
> > +
> > +Upstream-Status: Backport
> > +
> > +Change-Id: I972d3560d6aa2640a2702f219cf802d2476b1c6e
> > +Reviewed-by: Andras Becsi <andras.becsi@digia.com>
> > +Signed-off-by: Jonathan Liu <net147@gmail.com>
> > +---
> > + src/core/gyp_run.pro | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/core/gyp_run.pro b/src/core/gyp_run.pro
> > +index f79972a..026e3a2 100644
> > +--- a/src/core/gyp_run.pro
> > ++++ b/src/core/gyp_run.pro
> > +@@ -69,7 +69,7 @@ cross_compile {
> > +             # If the toolchain does not explicitly specify to use NEO=
N instructions
> > +             # we use arm_neon_optional for ARMv7 and newer and let ch=
romium decide
> > +             # about the mfpu option.
> > +-            contains(MFPU, "neon"): GYP_ARGS +=3D "-D arm_fpu=3D\"$$M=
FPU\" -D arm_neon=3D1"
> > ++            contains(MFPU, "neon")|contains(MFPU, "neon-vfpv4"): GYP_=
ARGS +=3D "-D arm_fpu=3D\"$$MFPU\" -D arm_neon=3D1"
> > +             else:!lessThan(MARMV, 7): GYP_ARGS +=3D "-D arm_neon=3D0 =
-D arm_neon_optional=3D1"
> > +             else: GYP_ARGS +=3D "-D arm_fpu=3D\"$$MFPU\" -D arm_neon=
=3D0 -D arm_neon_optional=3D0"
> > +         }
> > +--=20
> > +2.1.2
> > +
> > diff --git a/recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extr=
acting-C-compiler-flags.patch b/recipes-qt/qt5/qtwebengine/0002-Include-QMA=
KE_CC-when-extracting-C-compiler-flags.patch
> > new file mode 100644
> > index 0000000..01f8d2e
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extracting-=
C-compiler-flags.patch
> > @@ -0,0 +1,34 @@
> > +From 98a079fcf7e12d17414ef27289a03cfb923be7a5 Mon Sep 17 00:00:00 2001
> > +From: Jonathan Liu <net147@gmail.com>
> > +Date: Wed, 15 Oct 2014 17:01:06 +1100
> > +Subject: [PATCH 2/2] Include QMAKE_CC when extracting C compiler flags
> > +
> > +This fixes cross-compile settings detection for cross-compilation
> > +environments where the C compiler cross-compilation flags are set in
> > +CC/QMAKE_CC instead of CFLAGS/QMAKE_CFLAGS (e.g. OpenEmbedded).
> > +
> > +Upstream-Status: Backport
> > +
> > +Change-Id: I0a7b0f6c47a00775ec18073a16359c8351363285
> > +Reviewed-by: Andras Becsi <andras.becsi@digia.com>
> > +Signed-off-by: Jonathan Liu <net147@gmail.com>
> > +---
> > + tools/qmake/mkspecs/features/functions.prf | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/=
mkspecs/features/functions.prf
> > +index 789af9a..06713d4 100644
> > +--- a/tools/qmake/mkspecs/features/functions.prf
> > ++++ b/tools/qmake/mkspecs/features/functions.prf
> > +@@ -35,7 +35,7 @@ defineReplace(getChromiumSrcDir) {
> > + }
> > +=20
> > + defineReplace(extractCFlag) {
> > +-    CFLAGS =3D $$QMAKE_CFLAGS
> > ++    CFLAGS =3D $$QMAKE_CC $$QMAKE_CFLAGS
> > +     !isEmpty(ANDROID_TARGET_CFLAGS): CFLAGS =3D $$ANDROID_TARGET_CFLA=
GS
> > +     OPTION =3D $$find(CFLAGS, $$1)
> > +     OPTION =3D $$split(OPTION, =3D)
> > +--=20
> > +2.1.2
> > +
> > diff --git a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb b/recipes-qt/qt5/q=
twebengine_5.3.2+git.bb
> > index c9a6ea4..57469d0 100644
> > --- a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
> > +++ b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
> > @@ -21,6 +21,8 @@ SRC_URI =3D " \
> >      file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.p=
atch \
> >      file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.p=
atch \
> >      file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc=
=2Ecc-whe.patch \
> > +    file://0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch \
> > +    file://0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patc=
h \
> >  "
> >  SRCREV_qtwebengine =3D "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
> >  SRCREV_chromium =3D "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
> > diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtweben=
gine_git.bb
> > index 360a1c8..ee7a83c 100644
> > --- a/recipes-qt/qt5/qtwebengine_git.bb
> > +++ b/recipes-qt/qt5/qtwebengine_git.bb
> > @@ -16,6 +16,8 @@ SRC_URI =3D " \
> >      file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.p=
atch \
> >      file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.p=
atch \
> >      file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc=
=2Ecc-whe.patch \
> > +    file://0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch \
> > +    file://0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patc=
h \
> >  "
> >  SRCREV_qtwebengine =3D "4ffc07ddb8739da9e94a2b23b03c63fd7b74c09a"
> >  SRCREV_chromium =3D "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
> > --=20
> > 2.1.2
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRCTEEACgkQN1Ujt2V2gBwsPACdHBN1B8GZ7c5Dgdpltir4b826
93wAn0KvKftWcIRe0oRiazTqn7RZE/X4
=7aMd
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--
