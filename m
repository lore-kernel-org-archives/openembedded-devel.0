Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id A6D4E71C5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:04:59 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id 92so9090448uad.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 04:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=W3x/uIAk/vB4upbzYFahZ5D5HldWucpM1y3+AR90sYI=;
	b=eqd63j4a8voACV2+nb/yIDAofHRGDufxyaK17zGcchDCNoubGTv83qSV5GmcSK5Ysu
	Jeity3rwKgOnZmV2WB+uygwwwPiHqxfsFnFc0njkUaznASLR3vShKT0gKOIRdJsAR52H
	RGDu1xt7XtX1dxQtuYBOpJKkrj6E7aPyuLZXdU6BNmy7tMi7RDG45DgWclRI7wBGGr3X
	u2eTIMvY1T8Wg9HObac7eCA3Z5Xpo5hW3bc+u8Ys88iwVUAA/ZVxTLAwPAt+Ff4mdErM
	MNc7oAoISSGgah1kDqAcZZR66tDLcKTYrPrl88kAah8LU42imEyYRXzclb3brNFPjAZu
	zFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=W3x/uIAk/vB4upbzYFahZ5D5HldWucpM1y3+AR90sYI=;
	b=DAaofj54YzCxfXUQ9Lqn+W5JhIvrMOolG6aFLRXoSWB45N4EsjcDiqcu/Zn06Eu3M3
	vne5GAEEFlFOnY/+e8aSBkqsbsCf8CwSUHDL3WVPQqzUpEged4i6Trt4U2jdVt1wnMyC
	7MuXYcC8DXZkijgRrwKfx42BhYpycXfPHkeTpSZ+DnwNB/Y2eBcTpr/hMuTq9Vg8ozwQ
	cPq4/Fn1z5n5d292Y8u4N5cSvX+89C7dRaPEI16ugK+X/AIYtZMRbcROdDfrJ70bBhEq
	XMIdqDW/CHK+sOgtpemsbMPNB1zMMa0XUozAooTfKeb2NKhI/ttFTS1H90g/dJfN5Iut
	PZ5A==
X-Gm-Message-State: AMke39lq12KzOph9FWZj+A6XxazdrZjhsHtyfldYaQzdm729L6TM1F2MwaVvyAkAjtQ/BXiNDD5Cl9nlEaV7gw==
X-Received: by 10.176.82.136 with SMTP id v8mr7947159uav.123.1487592299284;
	Mon, 20 Feb 2017 04:04:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.72 with HTTP; Mon, 20 Feb 2017 04:04:58 -0800 (PST)
In-Reply-To: <20170211141745.3380-1-gyurco@freemail.hu>
References: <20170211141745.3380-1-gyurco@freemail.hu>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 20 Feb 2017 13:04:58 +0100
Message-ID: <CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Mon, 20 Feb 2017 12:05:00 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 11, 2017 at 3:17 PM, Gyorgy Szombathelyi <gyurco@freemail.hu> wrote:
> Since Samba uses libtevent-internal.h in some places, it is
> incompatible with external libtevent versions if they're not
> the same as the built-in, and just crashes.
>
> Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index 0ba59c7..754455e 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -33,7 +33,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
>  # remove default added RDEPENDS on perl
>  RDEPENDS_${PN}_remove = "perl"
>
> -DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
> +DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libldb krb5 libbsd libaio libpam"
>  DEPENDS_append_libc-musl = " libtirpc"
>  CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
>  LDFLAGS_append_libc-musl = " -ltirpc"
> @@ -74,7 +74,7 @@ SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pd
>  SAMBA4_AUTH_MODULES="auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
>  SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
>
> -SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
> +SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
>
>  EXTRA_OECONF += "--enable-fhs \
>                   --with-piddir=/run \
> --
> 2.9.3
>
This one causes conflict with libldb. Unfortunately these kind of
conflicts remain undetected (I had error with gvfs but that isn't
build in Martins's world - I guess) [1]. Without RSS I get:

ERROR: samba-4.4.5-r0 do_populate_sysroot: The recipe samba is trying
to install files into a shared area when those files already exist.
Those files and their manifest location are:
   /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python2.7/site-packages/_ldb_text.py
 Matched in b'manifest-raspberrypi2-libldb.populate_sysroot'
 /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python2.7/site-packages/ldb.so
 Matched in b'manifest-raspberrypi2-libldb.populate_sysroot'
 /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python2.7/site-packages/_tevent.so
 Matched in b'manifest-raspberrypi2-libtevent.populate_sysroot'
 /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python2.7/site-packages/tevent.py
 Matched in b'manifest-raspberrypi2-libtevent.populate_sysroot'
Please verify which recipe should provide the above files.
The build has stopped as continuing in this scenario WILL break
things, if not now, possibly in the future (we've seen builds fail
several months later). If the system knew how to recover from this
automatically it would however there are several different scenarios
which can result in this and we don't know which one this is. It may
be you have switched providers of something like virtual/kernel (e.g.
from linux-yocto to linux-yocto-dev), in that case you need to execute
the clean task for both recipes and it will resolve this error. It may
be you changed DISTRO_FEATURES from systemd to udev or vice versa.
Cleaning those recipes should again resolve this error however
switching DISTRO_FEATURES on an existing build directory is not
supported, you should really clean out tmp and rebuild (reusing sstate
should be safe). It could be the overlapping files detected are
harmless in which case adding them to SSTATE_DUPWHITELIST may be the
correct solution. It could also be your build is including two
different conflicting versions of things (e.g. bluez 4 and bluez 5 and
the correct solution for that would be to resolve the conflict. If in
doubt, please ask on the mailing list, sharing the error and filelist
above.
ERROR: samba-4.4.5-r0 do_populate_sysroot: If the above message is too
much, the simpler version is you're advised to wipe out tmp and
rebuild (reusing sstate is fine). That will likely fix things in most
(but not all) cases.
ERROR: samba-4.4.5-r0 do_populate_sysroot: Function failed: sstate_task_postfunc

[1] http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132938.html

Andreas

