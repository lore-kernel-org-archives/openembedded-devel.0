Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614E4C636FD
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web12.6877.1649513976105217919
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id DC2D41B30F
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  9 Apr 2022 16:19:20 +0200 (CEST)
Received: from [192.168.178.83] ([79.219.227.42]) by fwd76.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ndBvr-359juL0; Sat, 9 Apr 2022 16:19:19 +0200
Message-ID: <37869a91-c271-17b5-d3cf-19d28fa02255@t-online.de>
Date: Sat, 9 Apr 2022 16:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-gnome][PATCHv4] gparted: update to v1.4.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <16E44013E1B9491D.4406@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <16E44013E1B9491D.4406@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1649513959-0001619A-57E054C4/0/0 CLEAN NORMAL
X-TOI-MSGID: b9f6043b-5848-48f3-acb5-16a32f71cacd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96498

Upstream told me, that using g_path_get_basename will create a memleak=20
and i should use posix basename instead.

Am 09.04.22 um 16:16 schrieb Markus Volk:
> - remove x11 features-check because there aren't dependencies that woul=
d
>    explicilty require x11 as a DISTRO_FEATURE
> - use POSIX basename() to fix up musl build
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> GParted 1.4.0   (2022-03-28)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Release Notes
> -------------
>    This release of GParted includes enhancements, bug fixes and
>    language translation updates.
>
>    * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems
>    * Fix detection of mount points for encrypted file systems
>    * Fix crash scrolling quickly in the drive selection combobox
>    * Add bcache detection
>    * Add JBD external EXT3/4 journal detection
>
> Bug Fixes
> ---------
>    * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems (#16=
3, !87)
>    * Fix detection of mount points for encrypted file systems (#162, !8=
8)
>    * Fix unmount error when unmounting below a bind mount point (!89)
>    * Fix crash scrolling quickly in the drive selection combobox (#165,=
 !91)
>    * Add initial Indonesian translation of help (!90)
>    * Add accessibility relations for screen readers like Orca (!92)
>    * Fix partition creation at sector 2048 if partition before it (#172=
, !93)
>    * Make more getter methods use return-by-constant-reference (!94)
>    * Check copy destination instead of source (!95)
>    * Add bcache detection (#183, !96)
>    * Add JBD external EXT3/4 journal detection (#89, !97)
>    * Fix translation of DocBook markup tag of the GParted Manual (!98)
>
> Code Credits
> ------------
>    Code enhancements are courtesy of Movie Ma, Pascal Eng=C3=A9libert, =
and
>    Mike Fleetwood.
>
> Translations (new/updated)
> --------------------------
>    cs(Marek =C4=8Cernock=C3=BD), da(Alan Mortensen), eu(Asier Sarasua G=
armendia),
>    fur(Fabio Tomat), he(Yaron Shahrabani), hr(Goran Vidovi=C4=87),
>    hu(Bal=C3=A1zs =C3=9Ar), id(Andika Triwidada), it(Milo Casagrande),
>    ko(Seong-ho Cho), lt(Aurimas =C4=8Cernius), lv(R=C5=ABdolfs Mazurs),
>    nb(Kjell Cato Heskjestad), nl(Nathan Follens), pa(A S Alam),
>    pt(Hugo Carvalho), ru(Aleksandr Melman, Sergej A), sk(Du=C5=A1an Kaz=
ik),
>    sl(Matej Urban=C4=8Di=C4=8D), sr(=D0=9C=D0=B8=D1=80=D0=BE=D1=81=D0=BB=
=D0=B0=D0=B2 =D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B8=D1=9B), zh_CN(Luming Zh=
)
>
> Dependencies (new/updated)
> --------------------------
>    * n/a
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../files/0001-use-posix-basename.patch       | 30 ++++++++++++++++++=
+
>   .../{gparted_1.3.1.bb =3D> gparted_1.4.0.bb}    |  6 ++--
>   2 files changed, 33 insertions(+), 3 deletions(-)
>   create mode 100644 meta-gnome/recipes-extended/gparted/files/0001-use=
-posix-basename.patch
>   rename meta-gnome/recipes-extended/gparted/{gparted_1.3.1.bb =3D> gpa=
rted_1.4.0.bb} (83%)
>
> diff --git a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-b=
asename.patch b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-=
basename.patch
> new file mode 100644
> index 000000000..aae200e27
> --- /dev/null
> +++ b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename=
.patch
> @@ -0,0 +1,30 @@
> +Subject: [PATCH] BCache_Info.cc: use posix basename
> +
> +gnu 'basename' is undeclared for cplusplus if using musl. Use posix ba=
sename instead.
> +
> +fdebug-prefix-map=3DTOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/gpa=
rted/1.4.0-r0/
> +recipe-sysroot-native=3D-fvisibility-inlines-hidden  -c -o Dialog_Disk=
label.o ../../
> +gparted-1.4.0/src/Dialog_Disklabel.cc ../../gparted-1.4.0/src/BCache_I=
nfo.cc:52:33:
> +
> +error: use of undeclared identifier 'basename'; did you mean 'g_basena=
me'?
> +        return "/dev/" + Glib::ustring(basename(buf));
> +                                       ^~~~~~~~
> +                                       g_basename
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Submitted
> +
> +https://gitlab.gnome.org/GNOME/gparted/-/merge_requests/99
> +
> +--- a/src/BCache_Info.cc	2022-03-02 22:04:17.000000000 +0100
> ++++ b/src/BCache_Info.cc	2022-04-09 15:02:56.932218665 +0200
> +@@ -17,7 +17,7 @@
> +
> + #include "BCache_Info.h"
> +
> +-#include <string.h>  // GNU version of basename()
> ++#include <libgen.h>  // POSIX version of basename()
> + #include <unistd.h>
> + #include <glibmm/ustring.h>
> + #include <glibmm/fileutils.h>
> diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/met=
a-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> similarity index 83%
> rename from meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
> rename to meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> index d1a975930..6f774904b 100644
> --- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
> +++ b/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> @@ -3,16 +3,16 @@ HOMEPAGE =3D "http://gparted.org/index.php"
>   LICENSE =3D "GPL-2.0-only"
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f"
>  =20
> -inherit features_check autotools pkgconfig python3native gnome-help gt=
k-icon-cache
> +inherit autotools pkgconfig python3native gnome-help gtk-icon-cache
>  =20
> -REQUIRED_DISTRO_FEATURES =3D "x11"
>  =20
>   SRC_URI =3D " \
>       ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-$=
{PV}.tar.gz \
>       file://0001-Install-polkit-action-unconditionally-executable-pke.=
patch \
>       file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \
> +    file://0001-use-posix-basename.patch \
>   "
> -SRC_URI[sha256sum] =3D "5eee2e6d74b15ef96b13b3a2310c868ed2298e03341021=
e7d12a5a98a1d1e109"
> +SRC_URI[sha256sum] =3D "e5293a792e53fdbeba29c4a834113cd9603d0d639330da=
931a468bf3687887be"
>  =20
>   UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gparted/file=
s/gparted/"
>   UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96497): https://lists.openembedded.org/g/openembedd=
ed-devel/message/96497
> Mute This Topic: https://lists.openembedded.org/mt/90356496/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

