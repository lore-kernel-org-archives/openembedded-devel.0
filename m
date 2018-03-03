Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 36C5378433
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 16:25:13 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 188so8191764wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3pPahT6syagLOjhFSlAEl+EhLs/h/QM5MunfjAYdS2s=;
	b=owknQjTy2CHOJ+cEJPn/MBXKfbsaBwkUirUEYGwXvh9OqkGXlxq6xzkqHTEXJjP8Ih
	No3Re3UGePLN09Hv6ZyOMDRH07RvS3DnaUGSVJZyVfjGxa1S/RmerPT7kpSgsvVDKro3
	kvbHX/P6gpxItJkPTkhP8SLXYdSTnfj7b/5XD54EEqSsYZYcB+Gq70JWTXYAC4x6ELyb
	AJPxvA19qj8utBZmEdlM9MZ+rn+yVMtEBXo1PaqqSzowicKN0mOisGcVlUu3tsWpHOxg
	jIgmI3rNuvFpOYEEWDMZc0jhUlG0vIULgluPz23sGcfS7tIoeqBuISiflY50YnH9QQ4N
	3UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3pPahT6syagLOjhFSlAEl+EhLs/h/QM5MunfjAYdS2s=;
	b=d/Gr101W6oCAFqPJnEtQK4XCKQViaoykSmCfQmkHCYYbpO41tfZl+LedmGgXitMZew
	/R+2tFNaPH62OPuEqNMZ67gdz2vDEUcX75TTCw6WbPLe28BvUmupHikkb9+N6ES5wCJH
	3iN+35xQuvwk20sZf5eMZfTOVh4+cq5NJhZAJbBjPCZtcQoAFyOHlk+DPpHUq8+I2PVf
	/Y6mvgjzpCZPbf6ufWKoOjszJ8JlqyHyqodlj5ihX1gICSTVHDO9Bs3soCcYpYuAaioX
	QFmnHQUYVgEnngXnlzJhbIj68RrOwjG2zP/5eUBqMBlSrEDLqhzubSgtjNEiJOQ3Mzod
	rA7Q==
X-Gm-Message-State: APf1xPAKXG6f3Vej8nfo2TiwUwUGsvQ2PM6oyR1toFfv1SuIpURTepVp
	DnlvoyG/a887/qxXo1Ur49QKSIBgLVxwmm3hZ1w=
X-Google-Smtp-Source: AG47ELszw/qVgHkd2GhVgYO3ahx9qfxvIy4bm/WcyE4TgoU6oJeJA89r/di0lQuGuV8E3WaHYh/9C62nrbw3+X7ip1A=
X-Received: by 10.80.195.7 with SMTP id a7mr11984389edb.178.1520094313030;
	Sat, 03 Mar 2018 08:25:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.168.1 with HTTP; Sat, 3 Mar 2018 08:25:12 -0800 (PST)
In-Reply-To: <c6d3abbb-841a-7f24-4b82-474992493bec@gmail.com>
References: <c6d3abbb-841a-7f24-4b82-474992493bec@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 3 Mar 2018 17:25:12 +0100
Message-ID: <CAAQYJAvnmosr9TP5ieytDOt-W48ix+yw-Z_aobYpvxZaGx=XXg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the World, Failed tasks 2018-02-26
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
X-List-Received-Date: Sat, 03 Mar 2018 16:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2018 at 12:37 AM, akuster808 <akuster808@gmail.com> wrote:
> Several of the new failures popped up after 4.15 kernel update.
>
>
>
> =3D=3D Failed tasks 2018-02-26 =3D=3D
>
> INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20180228_061518.log
>
> =3D=3D=3D common (8) =3D=3D=3D
>     * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscs=
itarget_1.4.20.3+svn502.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
.8beta5.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.8-1=
.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb=
:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/tipcutils/tipcutils_git.=
bb:do_compile
>     * meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_gi=
t.bb:do_packagedata
>     * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_gi=
t.bb:do_compile
>
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>
> =3D=3D=3D qemuarm (10) =3D=3D=3D
>     * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-uti=
l_git.bb:do_compile
>     * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/=
gstd_1.0.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepal=
ived_1.3.5.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-filter/ebtables/ebtables_=
2.0.10-4.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_2=
0110206.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtgraphicaleffects_git.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtquickcontrols_git.bb:do_compile
>     * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_c=
ompile
>
> =3D=3D=3D qemuarm64 (4) =3D=3D=3D
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
>     * meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
>     * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:d=
o_compile
>

I am about upgrading kexec-tools-klibc to newer release supporting aarch64.

Strangely I see the oe-core recipe failing in your builder.
I build here with musl and have seen the differences are basically
about security flags:

autobuilder

| aarch64-oe-linux-gcc  -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2
-Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/jenkins/oe/world/shr-core/tmpfs/work/aarch64-oe-linux/kex=
ec-tools/2.0.16-r1/recipe-sysroot
 -mcmodel=3Dlarge ...

musl:
aarch64-oe-linux-musl-gcc
--sysroot=3D/tmp/build/tmp-musl/work/aarch64-oe-linux-musl/kexec-tools/2.0.=
16-r1/recipe-sysroot
 -mcmodel=3Dlarge ...

Here the recipe builds just fine.

Cheers
Andrea


> =3D=3D=3D qemux86 (25) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium-x11_64.0.3282.167.bb=
:do_patch
>     * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
>     * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
.18.02.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
.3.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-support/wireshark/wiresha=
rk_2.4.5.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-=
glib_0.24.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/polkit/polkit_0.113.bb:d=
o_compile
>     * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb:d=
o_compile
>     * meta-openembedded/meta-oe/recipes-gnome/libunique/libunique_1.1.6.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compil=
e
>     * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_configure
>     * openembedded-core/meta/recipes-connectivity/avahi/avahi_0.7.bb:do_c=
ompile
>     * openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.6.bb:do_compil=
e
>     * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.4.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa
>     * openembedded-core/meta/recipes-support/atk/at-spi2-core_2.26.2.bb:d=
o_compile
>
> =3D=3D=3D qemux86_64 (3) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb:do_co=
mpile
>     * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa
>     * virtual:native:meta-openembedded/meta-oe/recipes-support/uim/uim_1.=
8.6.bb:do_install
>
> =3D=3D=3D Number of failed tasks (84) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 18    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemuarm.20180225_125116.log/ ||
> |-
> || qemuarm64    || 17    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemuarm64.20180226_174752.log/ || http://errors.yoctoproje=
ct.org/Errors/Build/54703/
> |-
> || qemux86      || 33    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemux86.20180225_125126.log/ || http://errors.yoctoproject=
.org/Errors/Build/54478/
> |-
> || qemux86_64   || 16    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemux86-64.20180226_123856.log/ || http://errors.yoctoproj=
ect.org/Errors/Build/54702/
> |}
>
> =3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D
>
> =3D=3D=3D QA issues (730) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||compile-host-path
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||ldflags
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||qa_pseudo
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||1     ||installed-vs-shipped
> |-
> ||1     ||unknown-configure-option
> |-
> ||2     ||host-user-contaminated
> |-
> ||2     ||textrel
> |-
> ||724   ||version-going-backwards
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20180228_021751.log/
>
>
>     * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEP=
ENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmpfs/stamps
>     * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEP=
ENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps
>     * ERROR: Nothing PROVIDES 'libpam' (but /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb DEPENDS on =
or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-qt5:
> PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation=
 which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads =
directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 2        issue: textrel
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264' has=
 relocations in .text [textrel]
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.15=
2' has relocations in .text [textrel]
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
>
> count: 724      issue: version-going-backwards
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-dbg went backwards which would break package feeds from (0:5.10.1+git=
0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-goi=
ng-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-dev went backwards which would break package feeds from (0:5.10.1+git=
0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-goi=
ng-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-doc went backwards which would break package feeds from (0:5.10.1+git=
0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-goi=
ng-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-examples-dbg went backwards which would break package feeds from (0:5=
.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [ve=
rsion-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-examples-dev went backwards which would break package feeds from (0:5=
.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [ve=
rsion-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-examples-staticdev went backwards which would break package feeds fro=
m (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.=
0) [version-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-examples went backwards which would break package feeds from (0:5.10.=
1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [versio=
n-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-locale went backwards which would break package feeds from (0:5.10.1+=
git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-=
going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-mkspecs went backwards which would break package feeds from (0:5.10.1=
+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version=
-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-plugins-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [ver=
sion-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-plugins went backwards which would break package feeds from (0:5.10.1=
+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version=
-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-qmldesigner went backwards which would break package feeds from (0:5.=
10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [ver=
sion-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-qmlplugins-dbg went backwards which would break package feeds from (0=
:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [=
version-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-qmlplugins went backwards which would break package feeds from (0:5.1=
0.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [vers=
ion-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-staticdev went backwards which would break package feeds from (0:5.10=
.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [versi=
on-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-tools-dbg went backwards which would break package feeds from (0:5.10=
.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [versi=
on-going-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d-tools went backwards which would break package feeds from (0:5.10.1+g=
it0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-g=
oing-backwards]
> qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package=
 qt3d went backwards which would break package feeds from (0:5.10.1+git0+31=
f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-b=
ackwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-dbg went backwards which would break package feeds from (0:5.10.1=
+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version=
-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-dev went backwards which would break package feeds from (0:5.10.1=
+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version=
-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-doc went backwards which would break package feeds from (0:5.10.1=
+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version=
-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-examples-dbg went backwards which would break package feeds from =
(0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0)=
 [version-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-examples-dev went backwards which would break package feeds from =
(0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0)=
 [version-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-examples-staticdev went backwards which would break package feeds=
 from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b=
-r0.0) [version-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-examples went backwards which would break package feeds from (0:5=
.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [ve=
rsion-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-locale went backwards which would break package feeds from (0:5.1=
0.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [vers=
ion-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-mkspecs went backwards which would break package feeds from (0:5.=
10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [ver=
sion-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-plugins-dbg went backwards which would break package feeds from (=
0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) =
[version-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-plugins went backwards which would break package feeds from (0:5.=
10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [ver=
sion-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-ptest went backwards which would break package feeds from (0:5.10=
.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [versi=
on-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-qmldesigner went backwards which would break package feeds from (=
0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) =
[version-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-qmlplugins-dbg went backwards which would break package feeds fro=
m (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.=
0) [version-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-qmlplugins went backwards which would break package feeds from (0=
:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [=
version-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-staticdev went backwards which would break package feeds from (0:=
5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [v=
ersion-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-tools-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [v=
ersion-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase-tools went backwards which would break package feeds from (0:5.10=
.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [versi=
on-going-backwards]
> qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for packa=
ge qtbase went backwards which would break package feeds from (0:5.10.1+git=
0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-goi=
ng-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-dbg went backwards which would break package feeds from (=
0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) =
[version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-dev went backwards which would break package feeds from (=
0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) =
[version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-doc went backwards which would break package feeds from (=
0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) =
[version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-examples-dbg went backwards which would break package fee=
ds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b=
96-r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-examples-dev went backwards which would break package fee=
ds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b=
96-r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-examples-staticdev went backwards which would break packa=
ge feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80=
d7f92b96-r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-examples went backwards which would break package feeds f=
rom (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r=
0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-locale went backwards which would break package feeds fro=
m (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.=
0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-mkspecs went backwards which would break package feeds fr=
om (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0=
.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-plugins-dbg went backwards which would break package feed=
s from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b9=
6-r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-plugins went backwards which would break package feeds fr=
om (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0=
.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-qmldesigner went backwards which would break package feed=
s from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b9=
6-r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-qmlplugins-dbg went backwards which would break package f=
eeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f9=
2b96-r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-qmlplugins went backwards which would break package feeds=
 from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96=
-r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-staticdev went backwards which would break package feeds =
from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-=
r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-tools-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-=
r0.0) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d-tools went backwards which would break package feeds from=
 (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0=
) [version-going-backwards]
> qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for p=
ackage qtcanvas3d went backwards which would break package feeds from (0:5.=
10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [ver=
sion-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [ver=
sion-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-dev went backwards which would break package feeds from (0:5.=
10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [ver=
sion-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-doc went backwards which would break package feeds from (0:5.=
10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [ver=
sion-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-examples-dbg went backwards which would break package feeds f=
rom (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r=
0.0) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-examples-dev went backwards which would break package feeds f=
rom (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r=
0.0) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-examples-staticdev went backwards which would break package f=
eeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a6=
9f4f-r0.0) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-examples went backwards which would break package feeds from =
(0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0)=
 [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-locale went backwards which would break package feeds from (0=
:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [=
version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-mkspecs went backwards which would break package feeds from (=
0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) =
[version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-plugins-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0=
.0) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-plugins went backwards which would break package feeds from (=
0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) =
[version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-qmldesigner went backwards which would break package feeds fr=
om (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0=
.0) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-qmlplugins-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f=
-r0.0) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-qmlplugins went backwards which would break package feeds fro=
m (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.=
0) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-staticdev went backwards which would break package feeds from=
 (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0=
) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-tools-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0=
) [version-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts-tools went backwards which would break package feeds from (0:=
5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [v=
ersion-going-backwards]
> qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for pac=
kage qtcharts went backwards which would break package feeds from (0:5.10.1=
+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version=
-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-dbg went backwards which would break package feed=
s from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac4=
7-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-dev went backwards which would break package feed=
s from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac4=
7-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-doc went backwards which would break package feed=
s from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac4=
7-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-examples-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+=
d70fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-examples-dev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+=
d70fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-examples-staticdev went backwards which would bre=
ak package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha=
+git0+d70fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-examples went backwards which would break package=
 feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70f=
e2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-locale went backwards which would break package f=
eeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2=
ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-mkspecs went backwards which would break package =
feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe=
2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-plugins-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d=
70fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-plugins went backwards which would break package =
feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe=
2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-qmldesigner went backwards which would break pack=
age feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d=
70fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-qmlplugins-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git=
0+d70fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-qmlplugins went backwards which would break packa=
ge feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d7=
0fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-staticdev went backwards which would break packag=
e feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70=
fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-tools-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70=
fe2ac47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity-tools went backwards which would break package fe=
eds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2a=
c47-r0.0) [version-going-backwards]
> qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version f=
or package qtconnectivity went backwards which would break package feeds fr=
om (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0=
.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0=
) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-dev went backwards which would break package feeds from=
 (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0=
) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-doc went backwards which would break package feeds from=
 (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0=
) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-examples-dbg went backwards which would break package f=
eeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45=
ca25-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-examples-dev went backwards which would break package f=
eeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45=
ca25-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-examples-staticdev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+=
be7e45ca25-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-examples went backwards which would break package feeds=
 from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25=
-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-locale went backwards which would break package feeds f=
rom (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r=
0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-mkspecs went backwards which would break package feeds =
from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-=
r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-plugins-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45c=
a25-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-plugins went backwards which would break package feeds =
from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-=
r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-qmldesigner went backwards which would break package fe=
eds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45c=
a25-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-qmlplugins-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e=
45ca25-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-qmlplugins went backwards which would break package fee=
ds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca=
25-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-staticdev went backwards which would break package feed=
s from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca2=
5-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-tools-dbg went backwards which would break package feed=
s from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca2=
5-r0.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d-tools went backwards which would break package feeds fr=
om (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0=
.0) [version-going-backwards]
> qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for =
package qtdatavis3d went backwards which would break package feeds from (0:=
5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [v=
ersion-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-=
r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-dev went backwards which would break package feeds =
from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-=
r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-doc went backwards which would break package feeds =
from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-=
r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-examples-dbg went backwards which would break packa=
ge feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+09=
75a9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-examples-dev went backwards which would break packa=
ge feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+09=
75a9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-examples-staticdev went backwards which would break=
 package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+0975a9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-examples went backwards which would break package f=
eeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9=
c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-locale went backwards which would break package fee=
ds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c8=
92-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-mkspecs went backwards which would break package fe=
eds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c=
892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-plugins-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+097=
5a9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-plugins went backwards which would break package fe=
eds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c=
892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-ptest went backwards which would break package feed=
s from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c89=
2-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-qmldesigner went backwards which would break packag=
e feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+097=
5a9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-qmlplugins-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+=
0975a9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-qmlplugins went backwards which would break package=
 feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975=
a9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-staticdev went backwards which would break package =
feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a=
9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-tools-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a=
9c892-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative-tools went backwards which would break package feed=
s from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c89=
2-r0.0) [version-going-backwards]
> qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version fo=
r package qtdeclarative went backwards which would break package feeds from=
 (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0=
) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [v=
ersion-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-dev went backwards which would break package feeds from (0:=
5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [v=
ersion-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-doc went backwards which would break package feeds from (0:=
5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [v=
ersion-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-examples-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08=
-r0.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-examples-dev went backwards which would break package feeds=
 from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08=
-r0.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-examples-staticdev went backwards which would break package=
 feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+2360=
3a3b08-r0.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-examples went backwards which would break package feeds fro=
m (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.=
0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-locale went backwards which would break package feeds from =
(0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0)=
 [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-mkspecs went backwards which would break package feeds from=
 (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0=
) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-plugins-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-=
r0.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-plugins went backwards which would break package feeds from=
 (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0=
) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-qmldesigner went backwards which would break package feeds =
from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-=
r0.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b=
08-r0.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-qmlplugins went backwards which would break package feeds f=
rom (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r=
0.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-staticdev went backwards which would break package feeds fr=
om (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0=
.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-tools-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0=
.0) [version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio-tools went backwards which would break package feeds from (=
0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) =
[version-going-backwards]
> qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for pa=
ckage qtenginio went backwards which would break package feeds from (0:5.10=
.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [versi=
on-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [v=
ersion-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-dev went backwards which would break package feeds from (0:=
5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [v=
ersion-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-doc went backwards which would break package feeds from (0:=
5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [v=
ersion-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-examples-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381=
-r0.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-examples-dev went backwards which would break package feeds=
 from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381=
-r0.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-examples-staticdev went backwards which would break package=
 feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f=
221381-r0.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-examples went backwards which would break package feeds fro=
m (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.=
0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-locale went backwards which would break package feeds from =
(0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0)=
 [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-mkspecs went backwards which would break package feeds from=
 (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0=
) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-plugins-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-=
r0.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-plugins went backwards which would break package feeds from=
 (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0=
) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-qmldesigner went backwards which would break package feeds =
from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-=
r0.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f2213=
81-r0.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-qmlplugins went backwards which would break package feeds f=
rom (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r=
0.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-staticdev went backwards which would break package feeds fr=
om (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0=
.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-tools-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0=
.0) [version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad-tools went backwards which would break package feeds from (=
0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) =
[version-going-backwards]
> qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for pa=
ckage qtgamepad went backwards which would break package feeds from (0:5.10=
.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [versi=
on-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3=
e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-dev went backwards which would break pack=
age feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3=
e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-doc went backwards which would break pack=
age feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3=
e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples-dbg went backwards which would b=
reak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples-dev went backwards which would b=
reak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples-staticdev went backwards which w=
ould break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.=
11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples went backwards which would break=
 package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-locale went backwards which would break p=
ackage feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git=
0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-mkspecs went backwards which would break =
package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-plugins-dbg went backwards which would br=
eak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alph=
a+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-plugins went backwards which would break =
package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-qmldesigner went backwards which would br=
eak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alph=
a+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-qmlplugins-dbg went backwards which would=
 break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-a=
lpha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-qmlplugins went backwards which would bre=
ak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha=
+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-staticdev went backwards which would brea=
k package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+=
git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-tools-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+=
git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-tools went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0=
+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects went backwards which would break package =
feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d=
47cea-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-dbg went backwards which would break package feed=
s from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a8=
2-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-dev went backwards which would break package feed=
s from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a8=
2-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-doc went backwards which would break package feed=
s from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a8=
2-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-examples-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+=
f878323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-examples-dev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+=
f878323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-examples-staticdev went backwards which would bre=
ak package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha=
+git0+f878323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-examples went backwards which would break package=
 feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878=
323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-locale went backwards which would break package f=
eeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f87832=
3a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-mkspecs went backwards which would break package =
feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f8783=
23a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-plugins-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f=
878323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-plugins went backwards which would break package =
feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f8783=
23a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-qmldesigner went backwards which would break pack=
age feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f=
878323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-qmlplugins-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git=
0+f878323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-qmlplugins went backwards which would break packa=
ge feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f8=
78323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-staticdev went backwards which would break packag=
e feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f87=
8323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-tools-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f87=
8323a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats-tools went backwards which would break package fe=
eds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323=
a82-r0.0) [version-going-backwards]
> qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version f=
or package qtimageformats went backwards which would break package feeds fr=
om (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0=
.0) [version-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-dbg went backwards which would break package feeds from (0:5.10.1+g=
it0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-g=
oing-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-dev went backwards which would break package feeds from (0:5.10.1+g=
it0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-g=
oing-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-doc went backwards which would break package feeds from (0:5.10.1+g=
it0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-g=
oing-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-examples-dbg went backwards which would break package feeds from (0=
:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [=
version-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-examples-dev went backwards which would break package feeds from (0=
:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [=
version-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-examples-staticdev went backwards which would break package feeds f=
rom (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r=
0.0) [version-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-examples went backwards which would break package feeds from (0:5.1=
0.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [vers=
ion-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-locale went backwards which would break package feeds from (0:5.10.=
1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [versio=
n-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-mkspecs went backwards which would break package feeds from (0:5.10=
.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [versi=
on-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-plugins-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [v=
ersion-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-plugins went backwards which would break package feeds from (0:5.10=
.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [versi=
on-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-qmldesigner went backwards which would break package feeds from (0:=
5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [v=
ersion-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-qmlplugins-dbg went backwards which would break package feeds from =
(0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0)=
 [version-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-qmlplugins went backwards which would break package feeds from (0:5=
.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [ve=
rsion-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-staticdev went backwards which would break package feeds from (0:5.=
10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [ver=
sion-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-tools-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [ver=
sion-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx-tools went backwards which would break package feeds from (0:5.10.1=
+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version=
-going-backwards]
> qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for packag=
e qtknx went backwards which would break package feeds from (0:5.10.1+git0+=
29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going=
-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-dbg went backwards which would break package f=
eeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+=
git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-dev went backwards which would break package f=
eeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+=
git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-doc went backwards which would break package f=
eeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+=
git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.=
11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples-dev went backwards which would break =
package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.=
11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples-staticdev went backwards which would =
break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.1=
0.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples went backwards which would break pack=
age feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-a=
lpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-locale went backwards which would break packag=
e feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-mkspecs went backwards which would break packa=
ge feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-al=
pha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-plugins-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.1=
1-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-plugins went backwards which would break packa=
ge feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-al=
pha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-qmldesigner went backwards which would break p=
ackage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.1=
1-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-qmlplugins-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+=
5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-qmlplugins went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11=
-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-staticdev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-=
alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-tools-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-=
alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-tools went backwards which would break package=
 feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alph=
a+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation went backwards which would break package feeds=
 from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0=
+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-dbg went backwards which would break package feeds from (0:5.10.1=
+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version=
-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-dev went backwards which would break package feeds from (0:5.10.1=
+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version=
-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-doc went backwards which would break package feeds from (0:5.10.1=
+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version=
-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-examples-dbg went backwards which would break package feeds from =
(0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0)=
 [version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-examples-dev went backwards which would break package feeds from =
(0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0)=
 [version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-examples-staticdev went backwards which would break package feeds=
 from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318=
-r0.0) [version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-examples went backwards which would break package feeds from (0:5=
.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [ve=
rsion-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-locale went backwards which would break package feeds from (0:5.1=
0.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [vers=
ion-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-mkspecs went backwards which would break package feeds from (0:5.=
10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [ver=
sion-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-plugins-dbg went backwards which would break package feeds from (=
0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) =
[version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-plugins went backwards which would break package feeds from (0:5.=
10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [ver=
sion-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-qmldesigner went backwards which would break package feeds from (=
0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) =
[version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-qmlplugins-dbg went backwards which would break package feeds fro=
m (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.=
0) [version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-qmlplugins went backwards which would break package feeds from (0=
:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [=
version-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-staticdev went backwards which would break package feeds from (0:=
5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [v=
ersion-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-tools-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [v=
ersion-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt-tools went backwards which would break package feeds from (0:5.10=
.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [versi=
on-going-backwards]
> qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for packa=
ge qtmqtt went backwards which would break package feeds from (0:5.10.1+git=
0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-goi=
ng-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0=
.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-dev went backwards which would break package feeds fr=
om (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0=
.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-doc went backwards which would break package feeds fr=
om (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0=
.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-examples-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354=
fdda8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-examples-dev went backwards which would break package=
 feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354=
fdda8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-examples-staticdev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git=
0+0354fdda8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-examples went backwards which would break package fee=
ds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda=
8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-locale went backwards which would break package feeds=
 from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b=
-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-mkspecs went backwards which would break package feed=
s from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8=
b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-plugins-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354f=
dda8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-plugins went backwards which would break package feed=
s from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8=
b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-qmldesigner went backwards which would break package =
feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354f=
dda8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-qmlplugins-dbg went backwards which would break packa=
ge feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+03=
54fdda8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-qmlplugins went backwards which would break package f=
eeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fd=
da8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-staticdev went backwards which would break package fe=
eds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdd=
a8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-tools-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdd=
a8b-r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia-tools went backwards which would break package feeds =
from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-=
r0.0) [version-going-backwards]
> qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for=
 package qtmultimedia went backwards which would break package feeds from (=
0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) =
[version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-=
r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-dev went backwards which would break package feeds =
from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-=
r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-doc went backwards which would break package feeds =
from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-=
r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-examples-dbg went backwards which would break packa=
ge feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8=
552ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-examples-dev went backwards which would break packa=
ge feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8=
552ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-examples-staticdev went backwards which would break=
 package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+e8552ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-examples went backwards which would break package f=
eeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552d=
daf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-locale went backwards which would break package fee=
ds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552dda=
f1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-mkspecs went backwards which would break package fe=
eds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552dd=
af1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-plugins-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e85=
52ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-plugins went backwards which would break package fe=
eds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552dd=
af1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-qmldesigner went backwards which would break packag=
e feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e85=
52ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-qmlplugins-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+=
e8552ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-qmlplugins went backwards which would break package=
 feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e855=
2ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-staticdev went backwards which would break package =
feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552=
ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-tools-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552=
ddaf1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth-tools went backwards which would break package feed=
s from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf=
1-r0.0) [version-going-backwards]
> qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version fo=
r package qtnetworkauth went backwards which would break package feeds from=
 (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0=
) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [ver=
sion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-dev went backwards which would break package feeds from (0:5.=
10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [ver=
sion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-doc went backwards which would break package feeds from (0:5.=
10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [ver=
sion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples-dbg went backwards which would break package feeds f=
rom (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r=
0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples-dev went backwards which would break package feeds f=
rom (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r=
0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples-staticdev went backwards which would break package f=
eeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa0227=
1a18-r0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples went backwards which would break package feeds from =
(0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0)=
 [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-locale went backwards which would break package feeds from (0=
:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [=
version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-mkspecs went backwards which would break package feeds from (=
0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) =
[version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-plugins-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0=
.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-plugins went backwards which would break package feeds from (=
0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) =
[version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-ptest went backwards which would break package feeds from (0:=
5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [v=
ersion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-qmldesigner went backwards which would break package feeds fr=
om (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0=
.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-qmlplugins-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18=
-r0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-qmlplugins went backwards which would break package feeds fro=
m (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.=
0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-staticdev went backwards which would break package feeds from=
 (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0=
) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-tools-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0=
) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-tools went backwards which would break package feeds from (0:=
5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [v=
ersion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1 went backwards which would break package feeds from (0:5.10.1=
+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version=
-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d2=
73e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-dev went backwards which would break package =
feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d2=
73e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-doc went backwards which would break package =
feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d2=
73e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples-dbg went backwards which would break=
 package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples-dev went backwards which would break=
 package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples-staticdev went backwards which would=
 break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-a=
lpha+git0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples went backwards which would break pac=
kage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+=
e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-locale went backwards which would break packa=
ge feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e8=
0d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-mkspecs went backwards which would break pack=
age feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e=
80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-plugins-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-plugins went backwards which would break pack=
age feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e=
80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-qmldesigner went backwards which would break =
package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-qmlplugins-dbg went backwards which would bre=
ak package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha=
+git0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-qmlplugins went backwards which would break p=
ackage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git=
0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-staticdev went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0=
+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-tools-dbg went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0=
+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-tools went backwards which would break packag=
e feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80=
d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2 went backwards which would break package feed=
s from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6=
f-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bf=
cc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-dev went backwards which would break package fe=
eds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bf=
cc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-doc went backwards which would break package fe=
eds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bf=
cc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git=
0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples-dev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git=
0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples-staticdev went backwards which would b=
reak package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples went backwards which would break packa=
ge feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c=
9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-locale went backwards which would break package=
 feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f=
0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-mkspecs went backwards which would break packag=
e feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9=
f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-plugins-dbg went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0=
+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-plugins went backwards which would break packag=
e feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9=
f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-qmldesigner went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0=
+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-qmlplugins-dbg went backwards which would break=
 package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-qmlplugins went backwards which would break pac=
kage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+=
6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-staticdev went backwards which would break pack=
age feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6=
c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-tools-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6=
c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-tools went backwards which would break package =
feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0=
bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols went backwards which would break package feeds =
from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-=
r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b=
4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-dev went backwards which would break package fe=
eds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b=
4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-doc went backwards which would break package fe=
eds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b=
4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-examples-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git=
0+db6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-examples-dev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git=
0+db6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-examples-staticdev went backwards which would b=
reak package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+db6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-examples went backwards which would break packa=
ge feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db=
6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-locale went backwards which would break package=
 feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d=
07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-mkspecs went backwards which would break packag=
e feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6=
d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-plugins-dbg went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0=
+db6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-plugins went backwards which would break packag=
e feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6=
d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-qmldesigner went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0=
+db6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-qmlplugins-dbg went backwards which would break=
 package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+db6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-qmlplugins went backwards which would break pac=
kage feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+=
db6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-staticdev went backwards which would break pack=
age feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+d=
b6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-tools-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+d=
b6d07b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects-tools went backwards which would break package =
feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d0=
7b4a5-r0.0) [version-going-backwards]
> qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version =
for package qtremoteobjects went backwards which would break package feeds =
from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-=
r0.0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [ver=
sion-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-dev went backwards which would break package feeds from (0:5.=
10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [ver=
sion-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-doc went backwards which would break package feeds from (0:5.=
10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [ver=
sion-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-examples-dbg went backwards which would break package feeds f=
rom (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r=
0.0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-examples-dev went backwards which would break package feeds f=
rom (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r=
0.0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-examples-staticdev went backwards which would break package f=
eeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c74=
5277-r0.0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-examples went backwards which would break package feeds from =
(0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0)=
 [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-locale went backwards which would break package feeds from (0=
:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [=
version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-mkspecs went backwards which would break package feeds from (=
0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) =
[version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-plugins-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0=
.0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-plugins went backwards which would break package feeds from (=
0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) =
[version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-qmldesigner went backwards which would break package feeds fr=
om (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0=
.0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-qmlplugins-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277=
-r0.0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-qmlplugins went backwards which would break package feeds fro=
m (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.=
0) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-staticdev went backwards which would break package feeds from=
 (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0=
) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-tools-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0=
) [version-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript-tools went backwards which would break package feeds from (0:=
5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [v=
ersion-going-backwards]
> qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for pac=
kage qtscript went backwards which would break package feeds from (0:5.10.1=
+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version=
-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-dbg went backwards which would break package feeds from (0:5.10=
.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [versi=
on-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-dev went backwards which would break package feeds from (0:5.10=
.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [versi=
on-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-doc went backwards which would break package feeds from (0:5.10=
.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [versi=
on-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-examples-dbg went backwards which would break package feeds fro=
m (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.=
0) [version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-examples-dev went backwards which would break package feeds fro=
m (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.=
0) [version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-examples-staticdev went backwards which would break package fee=
ds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4e=
f7-r0.0) [version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-examples went backwards which would break package feeds from (0=
:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [=
version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-locale went backwards which would break package feeds from (0:5=
.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [ve=
rsion-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-mkspecs went backwards which would break package feeds from (0:=
5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [v=
ersion-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-plugins-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0=
) [version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-plugins went backwards which would break package feeds from (0:=
5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [v=
ersion-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-qmldesigner went backwards which would break package feeds from=
 (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0=
) [version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-qmlplugins-dbg went backwards which would break package feeds f=
rom (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r=
0.0) [version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-qmlplugins went backwards which would break package feeds from =
(0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0)=
 [version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-staticdev went backwards which would break package feeds from (=
0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) =
[version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-tools-dbg went backwards which would break package feeds from (=
0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) =
[version-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml-tools went backwards which would break package feeds from (0:5.=
10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [ver=
sion-going-backwards]
> qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for pack=
age qtscxml went backwards which would break package feeds from (0:5.10.1+g=
it0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-g=
oing-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [v=
ersion-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-dev went backwards which would break package feeds from (0:=
5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [v=
ersion-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-doc went backwards which would break package feeds from (0:=
5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [v=
ersion-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-examples-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f=
-r0.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-examples-dev went backwards which would break package feeds=
 from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f=
-r0.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-examples-staticdev went backwards which would break package=
 feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e858=
8efb2f-r0.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-examples went backwards which would break package feeds fro=
m (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.=
0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-locale went backwards which would break package feeds from =
(0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0)=
 [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-mkspecs went backwards which would break package feeds from=
 (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0=
) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-plugins-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-=
r0.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-plugins went backwards which would break package feeds from=
 (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0=
) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-qmldesigner went backwards which would break package feeds =
from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-=
r0.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb=
2f-r0.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-qmlplugins went backwards which would break package feeds f=
rom (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r=
0.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-staticdev went backwards which would break package feeds fr=
om (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0=
.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-tools-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0=
.0) [version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors-tools went backwards which would break package feeds from (=
0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) =
[version-going-backwards]
> qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for pa=
ckage qtsensors went backwards which would break package feeds from (0:5.10=
.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [versi=
on-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0=
) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-dev went backwards which would break package feeds from=
 (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0=
) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-doc went backwards which would break package feeds from=
 (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0=
) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-examples-dbg went backwards which would break package f=
eeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d=
8f29-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-examples-dev went backwards which would break package f=
eeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d=
8f29-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-examples-staticdev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+=
7c6e9d8f29-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-examples went backwards which would break package feeds=
 from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29=
-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-locale went backwards which would break package feeds f=
rom (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r=
0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-mkspecs went backwards which would break package feeds =
from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-=
r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-plugins-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8=
f29-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-plugins went backwards which would break package feeds =
from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-=
r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-qmldesigner went backwards which would break package fe=
eds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8=
f29-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-qmlplugins-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e=
9d8f29-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-qmlplugins went backwards which would break package fee=
ds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f=
29-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-staticdev went backwards which would break package feed=
s from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f2=
9-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-tools-dbg went backwards which would break package feed=
s from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f2=
9-r0.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus-tools went backwards which would break package feeds fr=
om (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0=
.0) [version-going-backwards]
> qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for =
package qtserialbus went backwards which would break package feeds from (0:=
5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [v=
ersion-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0=
.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-dev went backwards which would break package feeds fr=
om (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0=
.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-doc went backwards which would break package feeds fr=
om (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0=
.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-examples-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee0=
27f581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-examples-dev went backwards which would break package=
 feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee0=
27f581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-examples-staticdev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git=
0+aee027f581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-examples went backwards which would break package fee=
ds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f5=
81-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-locale went backwards which would break package feeds=
 from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581=
-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-mkspecs went backwards which would break package feed=
s from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f58=
1-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-plugins-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee02=
7f581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-plugins went backwards which would break package feed=
s from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f58=
1-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-qmldesigner went backwards which would break package =
feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee02=
7f581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-qmlplugins-dbg went backwards which would break packa=
ge feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+ae=
e027f581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-qmlplugins went backwards which would break package f=
eeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027=
f581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-staticdev went backwards which would break package fe=
eds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f=
581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-tools-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f=
581-r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport-tools went backwards which would break package feeds =
from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-=
r0.0) [version-going-backwards]
> qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for=
 package qtserialport went backwards which would break package feeds from (=
0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) =
[version-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-dbg went backwards which would break package feeds from (0:5.10.1+g=
it0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-g=
oing-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-dev went backwards which would break package feeds from (0:5.10.1+g=
it0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-g=
oing-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-doc went backwards which would break package feeds from (0:5.10.1+g=
it0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-g=
oing-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-examples-dbg went backwards which would break package feeds from (0=
:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [=
version-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-examples-dev went backwards which would break package feeds from (0=
:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [=
version-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-examples-staticdev went backwards which would break package feeds f=
rom (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r=
0.0) [version-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-examples went backwards which would break package feeds from (0:5.1=
0.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [vers=
ion-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-locale went backwards which would break package feeds from (0:5.10.=
1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [versio=
n-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-mkspecs went backwards which would break package feeds from (0:5.10=
.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [versi=
on-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-plugins-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [v=
ersion-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-plugins went backwards which would break package feeds from (0:5.10=
.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [versi=
on-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-qmldesigner went backwards which would break package feeds from (0:=
5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [v=
ersion-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-qmlplugins-dbg went backwards which would break package feeds from =
(0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0)=
 [version-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-qmlplugins went backwards which would break package feeds from (0:5=
.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [ve=
rsion-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-staticdev went backwards which would break package feeds from (0:5.=
10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [ver=
sion-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-tools-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [ver=
sion-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg-tools went backwards which would break package feeds from (0:5.10.1=
+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version=
-going-backwards]
> qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for packag=
e qtsvg went backwards which would break package feeds from (0:5.10.1+git0+=
af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going=
-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [v=
ersion-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-dev went backwards which would break package feeds from (0:=
5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [v=
ersion-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-doc went backwards which would break package feeds from (0:=
5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [v=
ersion-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-examples-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5=
-r0.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-examples-dev went backwards which would break package feeds=
 from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5=
-r0.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-examples-staticdev went backwards which would break package=
 feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e4=
5676f5-r0.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-examples went backwards which would break package feeds fro=
m (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.=
0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-locale went backwards which would break package feeds from =
(0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0)=
 [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-mkspecs went backwards which would break package feeds from=
 (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0=
) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-plugins-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-=
r0.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-plugins went backwards which would break package feeds from=
 (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0=
) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-qmldesigner went backwards which would break package feeds =
from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-=
r0.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676=
f5-r0.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-qmlplugins went backwards which would break package feeds f=
rom (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r=
0.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-staticdev went backwards which would break package feeds fr=
om (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0=
.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-tools-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0=
.0) [version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems-tools went backwards which would break package feeds from (=
0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) =
[version-going-backwards]
> qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for pa=
ckage qtsystems went backwards which would break package feeds from (0:5.10=
.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [versi=
on-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-dbg went backwards which would break package feeds from (0:5.10=
.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [versi=
on-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-dev went backwards which would break package feeds from (0:5.10=
.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [versi=
on-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-doc went backwards which would break package feeds from (0:5.10=
.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [versi=
on-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-examples-dbg went backwards which would break package feeds fro=
m (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.=
0) [version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-examples-dev went backwards which would break package feeds fro=
m (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.=
0) [version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-examples-staticdev went backwards which would break package fee=
ds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03=
fd-r0.0) [version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-examples went backwards which would break package feeds from (0=
:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [=
version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-locale went backwards which would break package feeds from (0:5=
.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [ve=
rsion-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-mkspecs went backwards which would break package feeds from (0:=
5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [v=
ersion-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-plugins-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0=
) [version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-plugins went backwards which would break package feeds from (0:=
5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [v=
ersion-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-ptest went backwards which would break package feeds from (0:5.=
10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [ver=
sion-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-qmldesigner went backwards which would break package feeds from=
 (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0=
) [version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-qmlplugins-dbg went backwards which would break package feeds f=
rom (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r=
0.0) [version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-qmlplugins went backwards which would break package feeds from =
(0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0)=
 [version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-staticdev went backwards which would break package feeds from (=
0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) =
[version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-tools-dbg went backwards which would break package feeds from (=
0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) =
[version-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools-tools went backwards which would break package feeds from (0:5.=
10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [ver=
sion-going-backwards]
> qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for pack=
age qttools went backwards which would break package feeds from (0:5.10.1+g=
it0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-g=
oing-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-assistant went backwards which would break packag=
e feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c=
17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-dbg went backwards which would break package feed=
s from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060=
d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-designer went backwards which would break package=
 feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c1=
7f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-dev went backwards which would break package feed=
s from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060=
d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-doc went backwards which would break package feed=
s from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060=
d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-examples-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+=
f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-examples-dev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+=
f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-examples-staticdev went backwards which would bre=
ak package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha=
+git0+f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-examples went backwards which would break package=
 feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c1=
7f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-linguist went backwards which would break package=
 feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c1=
7f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-locale went backwards which would break package f=
eeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f=
060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-mkspecs went backwards which would break package =
feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17=
f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-plugins-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f=
1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-plugins went backwards which would break package =
feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17=
f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qmldesigner went backwards which would break pack=
age feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f=
1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qmlplugins-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git=
0+f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qmlplugins went backwards which would break packa=
ge feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1=
c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qmlviewer went backwards which would break packag=
e feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c=
17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtbase went backwards which would break package f=
eeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f=
060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtconfig went backwards which would break package=
 feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c1=
7f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtconnectivity went backwards which would break p=
ackage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git=
0+f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtdeclarative went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0=
+f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qthelp went backwards which would break package f=
eeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f=
060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtlocation went backwards which would break packa=
ge feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1=
c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtmultimedia went backwards which would break pac=
kage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+=
f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtquick1 went backwards which would break package=
 feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c1=
7f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtquickcontrols2 went backwards which would break=
 package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtquickcontrols went backwards which would break =
package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtscript went backwards which would break package=
 feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c1=
7f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtserialport went backwards which would break pac=
kage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+=
f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtwebengine went backwards which would break pack=
age feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f=
1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtwebsockets went backwards which would break pac=
kage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+=
f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qt went backwards which would break package feeds=
 from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d=
-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-qtxmlpatterns went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0=
+f1c17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-staticdev went backwards which would break packag=
e feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c=
17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-tools-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c=
17f060d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations-tools went backwards which would break package fe=
eds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f0=
60d-r0.0) [version-going-backwards]
> qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version f=
or package qttranslations went backwards which would break package feeds fr=
om (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0=
.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+905=
5bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-dev went backwards which would break packag=
e feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+905=
5bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-dictionaries went backwards which would bre=
ak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha=
+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-doc went backwards which would break packag=
e feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+905=
5bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples-dbg went backwards which would bre=
ak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha=
+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples-dev went backwards which would bre=
ak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha=
+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples-staticdev went backwards which wou=
ld break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11=
-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples went backwards which would break p=
ackage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git=
0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-locale went backwards which would break pac=
kage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+=
9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-mkspecs went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0=
+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-plugins-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+=
git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-plugins went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0=
+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-qmldesigner went backwards which would brea=
k package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+=
git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-qmlplugins-dbg went backwards which would b=
reak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-qmlplugins went backwards which would break=
 package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-staticdev went backwards which would break =
package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-tools-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-tools went backwards which would break pack=
age feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9=
055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard went backwards which would break package fe=
eds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5=
665-r0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [v=
ersion-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-dev went backwards which would break package feeds from (0:=
5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [v=
ersion-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-doc went backwards which would break package feeds from (0:=
5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [v=
ersion-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-examples-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818=
-r0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-examples-dev went backwards which would break package feeds=
 from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818=
-r0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-examples-staticdev went backwards which would break package=
 feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec49=
5c9818-r0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-examples went backwards which would break package feeds fro=
m (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.=
0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-locale went backwards which would break package feeds from =
(0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0)=
 [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-mkspecs went backwards which would break package feeds from=
 (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0=
) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-plugins-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-=
r0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-plugins went backwards which would break package feeds from=
 (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0=
) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-qmldesigner went backwards which would break package feeds =
from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-=
r0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c98=
18-r0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-qmlplugins went backwards which would break package feeds f=
rom (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r=
0.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-staticdev went backwards which would break package feeds fr=
om (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0=
.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-tools-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0=
.0) [version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland-tools went backwards which would break package feeds from (=
0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) =
[version-going-backwards]
> qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for pa=
ckage qtwayland went backwards which would break package feeds from (0:5.10=
.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [versi=
on-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0=
.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-dev went backwards which would break package feeds fr=
om (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0=
.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-doc went backwards which would break package feeds fr=
om (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0=
.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-examples-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+0124=
1eb370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-examples-dev went backwards which would break package=
 feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+0124=
1eb370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-examples-staticdev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git=
0+01241eb370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-examples went backwards which would break package fee=
ds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb3=
70-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-locale went backwards which would break package feeds=
 from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370=
-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-mkspecs went backwards which would break package feed=
s from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb37=
0-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-plugins-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241=
eb370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-plugins went backwards which would break package feed=
s from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb37=
0-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-qmldesigner went backwards which would break package =
feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241=
eb370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-qmlplugins-dbg went backwards which would break packa=
ge feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01=
241eb370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-qmlplugins went backwards which would break package f=
eeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241e=
b370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-staticdev went backwards which would break package fe=
eds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb=
370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-tools-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb=
370-r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel-tools went backwards which would break package feeds =
from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-=
r0.0) [version-going-backwards]
> qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for=
 package qtwebchannel went backwards which would break package feeds from (=
0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) =
[version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alph=
a+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-dev went backwards which would break package=
 feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alph=
a+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-doc went backwards which would break package=
 feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alph=
a+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-examples-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+=
5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-examples-dev went backwards which would brea=
k package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+=
5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-examples-staticdev went backwards which woul=
d break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5=
.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-examples went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11=
-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-locale went backwards which would break pack=
age feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-a=
lpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-mkspecs went backwards which would break pac=
kage feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-=
alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-plugins-dbg went backwards which would break=
 package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5=
.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-plugins went backwards which would break pac=
kage feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-=
alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-qmldesigner went backwards which would break=
 package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5=
.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-qmlplugins-dbg went backwards which would br=
eak package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.=
1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-qmlplugins went backwards which would break =
package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.=
11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-staticdev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.1=
1-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-tools-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.1=
1-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine-tools went backwards which would break packa=
ge feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-al=
pha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package v=
ersion for package qtwebengine went backwards which would break package fee=
ds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [ver=
sion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-dev went backwards which would break package feeds from (0:5.=
10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [ver=
sion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-doc went backwards which would break package feeds from (0:5.=
10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [ver=
sion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-locale went backwards which would break package feeds from (0=
:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [=
version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-mkspecs went backwards which would break package feeds from (=
0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) =
[version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-plugins-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0=
.0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-plugins went backwards which would break package feeds from (=
0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) =
[version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-qmldesigner went backwards which would break package feeds fr=
om (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0=
.0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-qmlplugins-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988=
-r0.0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-qmlplugins went backwards which would break package feeds fro=
m (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.=
0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-staticdev went backwards which would break package feeds from=
 (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0=
) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-tools-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0=
) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-tools went backwards which would break package feeds from (0:=
5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [v=
ersion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit went backwards which would break package feeds from (0:5.10.1=
+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version=
-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d6=
8492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-dev went backwards which would break packag=
e feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d6=
8492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-doc went backwards which would break packag=
e feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d6=
8492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples-dbg went backwards which would bre=
ak package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha=
+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples-dev went backwards which would bre=
ak package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha=
+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples-staticdev went backwards which wou=
ld break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11=
-alpha+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples went backwards which would break p=
ackage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git=
0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-locale went backwards which would break pac=
kage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+=
2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-mkspecs went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0=
+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-plugins-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+=
git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-plugins went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0=
+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-qmldesigner went backwards which would brea=
k package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+=
git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-qmlplugins-dbg went backwards which would b=
reak package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-qmlplugins went backwards which would break=
 package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-staticdev went backwards which would break =
package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-tools-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-tools went backwards which would break pack=
age feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2=
d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples went backwards which would break package fe=
eds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492=
004-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0=
.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-dev went backwards which would break package feeds fr=
om (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0=
.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-doc went backwards which would break package feeds fr=
om (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0=
.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-examples-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a54=
9aca7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-examples-dev went backwards which would break package=
 feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a54=
9aca7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-examples-staticdev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git=
0+8a549aca7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-examples went backwards which would break package fee=
ds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca=
7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-locale went backwards which would break package feeds=
 from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b=
-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-mkspecs went backwards which would break package feed=
s from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7=
b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-plugins-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549=
aca7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-plugins went backwards which would break package feed=
s from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7=
b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-qmldesigner went backwards which would break package =
feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549=
aca7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-qmlplugins-dbg went backwards which would break packa=
ge feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a=
549aca7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-qmlplugins went backwards which would break package f=
eeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549a=
ca7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-staticdev went backwards which would break package fe=
eds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549ac=
a7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-tools-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549ac=
a7b-r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets-tools went backwards which would break package feeds =
from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-=
r0.0) [version-going-backwards]
> qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for=
 package qtwebsockets went backwards which would break package feeds from (=
0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) =
[version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-dbg went backwards which would break package feeds from (0:=
5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [v=
ersion-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-dev went backwards which would break package feeds from (0:=
5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [v=
ersion-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-doc went backwards which would break package feeds from (0:=
5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [v=
ersion-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-examples-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9=
-r0.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-examples-dev went backwards which would break package feeds=
 from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9=
-r0.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-examples-staticdev went backwards which would break package=
 feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23=
a402b9-r0.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-examples went backwards which would break package feeds fro=
m (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.=
0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-locale went backwards which would break package feeds from =
(0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0)=
 [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-mkspecs went backwards which would break package feeds from=
 (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0=
) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-plugins-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-=
r0.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-plugins went backwards which would break package feeds from=
 (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0=
) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-qmldesigner went backwards which would break package feeds =
from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-=
r0.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402=
b9-r0.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-qmlplugins went backwards which would break package feeds f=
rom (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r=
0.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-staticdev went backwards which would break package feeds fr=
om (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0=
.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-tools-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0=
.0) [version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview-tools went backwards which would break package feeds from (=
0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) =
[version-going-backwards]
> qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for pa=
ckage qtwebview went backwards which would break package feeds from (0:5.10=
.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [versi=
on-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0=
) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-dev went backwards which would break package feeds from=
 (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0=
) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-doc went backwards which would break package feeds from=
 (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0=
) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-examples-dbg went backwards which would break package f=
eeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10d=
ad08-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-examples-dev went backwards which would break package f=
eeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10d=
ad08-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-examples-staticdev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+=
78a10dad08-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-examples went backwards which would break package feeds=
 from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08=
-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-locale went backwards which would break package feeds f=
rom (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r=
0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-mkspecs went backwards which would break package feeds =
from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-=
r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-plugins-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10da=
d08-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-plugins went backwards which would break package feeds =
from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-=
r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-qmldesigner went backwards which would break package fe=
eds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10da=
d08-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-qmlplugins-dbg went backwards which would break package=
 feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a1=
0dad08-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-qmlplugins went backwards which would break package fee=
ds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad=
08-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-staticdev went backwards which would break package feed=
s from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad0=
8-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-tools-dbg went backwards which would break package feed=
s from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad0=
8-r0.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras-tools went backwards which would break package feeds fr=
om (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0=
.0) [version-going-backwards]
> qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for =
package qtx11extras went backwards which would break package feeds from (0:=
5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [v=
ersion-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-dbg went backwards which would break package feeds =
from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-=
r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-dev went backwards which would break package feeds =
from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-=
r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-doc went backwards which would break package feeds =
from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-=
r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-examples-dbg went backwards which would break packa=
ge feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c8=
92ceec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-examples-dev went backwards which would break packa=
ge feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c8=
92ceec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-examples-staticdev went backwards which would break=
 package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+c892ceec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-examples went backwards which would break package f=
eeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ce=
ec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-locale went backwards which would break package fee=
ds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec=
1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-mkspecs went backwards which would break package fe=
eds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892cee=
c1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-plugins-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c89=
2ceec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-plugins went backwards which would break package fe=
eds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892cee=
c1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-ptest went backwards which would break package feed=
s from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1=
c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-qmldesigner went backwards which would break packag=
e feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c89=
2ceec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-qmlplugins-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+=
c892ceec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-qmlplugins went backwards which would break package=
 feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892=
ceec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-staticdev went backwards which would break package =
feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892c=
eec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-tools-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892c=
eec1c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns-tools went backwards which would break package feed=
s from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1=
c-r0.0) [version-going-backwards]
> qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version fo=
r package qtxmlpatterns went backwards which would break package feeds from=
 (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0=
) [version-going-backwards]
>
>
> count: 2        issue: host-user-contaminated
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-ss/usr/lib/l=
ocale/ar_SS/LC_PAPER is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-cmn-tw/usr/lib/=
locale/cmn_TW/LC_PAPER is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
>
>
> count: 1        issue: installed-vs-shipped
> rdist: 1 installed and not shipped files. [installed-vs-shipped]
>
>
> count: 1        issue: unknown-configure-option
> gstd-1.0: gstd: configure was passed unrecognised options: --disable-gtk-=
doc [unknown-configure-option]
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
>
> count: 0        issue: ldflags
>
>
> count: 0        issue: compile-host-path
>
>
> count: 0        issue: qa_pseudo
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:
> 34da85e bitbake-user-manual: Added cross reference to "Layers" section.
> not included in master yet:
> b296b3c world-image: add extra target
> f16506c fetch2: Allow Fetch.download() to warn instead of error
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> latest upstream commit:
> b30153a buildhistory-diff: honour report_all flag
> not included in master yet:
> 843ab2e waf.bbclass: check that waf exists before trying to execute it
> 02cd2e2 libpam: be more strict about user's sanity
> f31c95b iputils: add libidn dependency
> 7265b3e insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
> 08f017b kernel-devicetree.bbclass: Use lowercase names for shell variable=
s
> 7cd95d1 kernel-devicetree.bbclass: Fix and simplify instalation of DTB fi=
les
> 309fcc5 kernel.bbclass: use the consistent naming schema for initramfs
> b245214 kernel.bbclass: move variables for kernel artifacts names to sepa=
rate bbclass
> 8adb1c2 report-error: Allow to upload reports automatically
> 6400902 sstate.bbclass: Do not cause build failures due to setscene error=
s
> f6d7320 buildhistory.bbclass: metadata-revs show repo parent
> d35c0bd metadata-revs: provide more information
> 2680274 qemux86: Add identical qemux86copy variant for tests
> 0f993ef reproducible_build.bbclass: initial support for binary reproducib=
ility
> 55931de cpio: provide cpio-replacement-native
> 91e154d image_types.bbclass: improve cpio image reproducibility
> 1c3031d rootfs-postcommands.bbclass: support binary reproducibility
> b66c2df Revert "libepoxy: convert to meson build"
> 1d17cfe pseudo: update to latest master
> a1b4e21 pseudo: bump SRCREV
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> latest upstream commit:
> d0619b6 xrdp: enable cpliboard
> not included in master yet:
> 115f8c1 wireguard: udpate to 20171221 version
> 5569308 cim-schema-exper: 2.39.0 -> 2.50.0
> 7688c6c waf-cross-answers: Add cross-answers-aarch64_be.txt
> 328d7ce classes/recipes: Convert SkipPackage -> SkipRecipe
> d95320b libgpiod: fix packaging of tools
> 61e3de5 samba: Add packagegroup
> f3d0187 net-snmp: Fix compiler options with paths in net-snmp-config
> 576fc05 obexftp: use makefile instead of ninja cmake generator
> 4e550b6 samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, pytho=
n-pam, smbnetfs: require pam in DISTRO_FEATURES
> 69728f6 geoipupdate: 2.4.0 -> 2.5.0
> ad7c702 mdns: Do not include nss.h with musl
> e409431 iscsi-initiator-utils: Upgrade to 2.0.876
> 73b3beb samba: Refresh musl pam patch
> 760185b miniupnpd: update to 2.0.20180203 and add systemd service
> f16e098 wireshark: Update Package to 2.2.12
> 2fa544f opensaf: Upgrade to 5.18.02
> eb87248 libtalloc: Upgrade to 2.1.11
> c53f29d postfix: adapt pkg_postinst to postinst_intercept
> f683e3c geoip: 1.6.9 -> 1.6.11
> f71f046 waf-samba.bbclass: No longer inherit waf.bbclass
> 6413b99 dhcpcd: update to 6.11.5
> 52ca949 zsh: move to recipes-shells
> e5993ae tcsh: move to recipes-shells
> 87b30fb sqlite: move to recipes-dbs
> 800e812 mysql: move to recipes-dbs
> 7262896 psqlodbc: move to recipes-dbs
> 1f461c6 libdbi: move to recipes-dbs
> 9eea207 soci: move to recipes-dbs
> bd24dcf mongodb: move to recipes-dbs
> e5fa613 ipmitool: move to recipes-kernel
> 38f6634 ipmiutil: move to recipes-kernel
> cf7476f testfloat: move to recipe-tests
> adc7cd3 fbtest: move to recipe-tests
> 84d72a0 cxxtest: move to recipes-test
> bc6f85f pm-qa: move to recipe-test
> 52d910b cunit: move to recipes-test
> de8786a cppunit: move to recipes-test
> d6def03 tomoyo-tools: move to recipes-secuity
> 3ec27ec leveldb: move to recipes-security
> 09fe7d1 cpufrequtils: move to recipes-bsp
> c601912 lm_sensors: move to recipes-bsp
> a986288 libmcryt: movre to recipes-crypto
> 04ade44 engine-pkcs11: move to recipes-crypto
> 47c9637 pkcs11-helper: move to recipes-crypto
> 0281cf1 libcrypto: move to recipes-crypto
> be9c92a passwdqc: move to recipes-security
> 3d52dd1 evtest: move to recipes-test
> eba5aa8 cryptsetup: move to crypto
> 3ac8eb2 edac-utils: move to recipes-bsp
> 7c13d98 flashrom: move to recipes-bsp
> b0171c8 efibootmgr: move to recipes-bsps
> 8b3be1a lsscsi: move to recipes-bsps
> c5491ab rocksdb: move to recipes-bsp
> d23e30d acpitools: move to recipes-bsp
> 9f977ac efivar: move to recipes-bsp
> 43cd3d5 dash: move dash to recipes-shell
> 6263354 postgres: move to recipes-dbs
> 77e3346 wireshark: update to new 2.4.5 series
> 0a33f23 openl2tp: fix compile issue with 4.15 kernel
> 23e827a python3-requests: drop incorrect RDEPENDS
> 7948726 nodejs: Add support for building on ppc64le
> a850a34 gstd: Add Gst-Deamon recipe
> 91f30e4 python-evdev: add python3 version of the recipe
> c240618 fix(p7zip): fix CVE-2017-17969
> 9eae784 nodejs: Update from 8.9.0 -> 8.9.4
> f7df889 ] python-oauthlib: Add python-oauthlib and python3-oauthlib.
> bed46fe mraa: Update recipe to use v1.9.0
> 581e236 upm: Update recipe to use v1.6.0
> 80db6e3 libmodule-pluggable-perl: use upstream instead of github.com/moto=
-timo
> 0ca711c libmodule-runtime-perl: upgrade to 0.016, use upstream
> 9160d8d python-systemd: fix dependencies
> 0ca221a opusfile: add new recipe
> db21129 sox: bump 14.4.0 -> 14.4.2
> 230a7f9 vboxguestdrivers: upgrade to 5.2.6
> de66932 python-pybind11: update to version 2.2.2
> 0a3f5a3 python-pymisp: update to version 2.4.87.1
> d91ae12 python-pexpect: update to version 4.4.0
> a24e103 python-msg: update to version 0.5.5
> 9154030 python-can: update to version 2.1.0
> e4b7c41 python-pytz: update to version 2018.3
> f3d9272 python-isort: update to version 4.3.4
> d120453 python-alembic: update to version 0.9.8
> d890521 python-webcolors: update to version 1.8.1
> b8c89b8 python-ply: update to version 3.11
> 54c977e python-pytest: update to version 3.4.1
> 3b73192 python-typing: update to version 3.6.4
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> e60e849 qtpurchasing: upgrade to 5.10.1
> not included in master yet:
> c984f40 qtbase: Add packageconfigs for renameat2 and getentropy use
> fe8e38c qtbase: don't enable renameat2 by default
> 6e663f4 qt5-git.inc: drop nobranch=3D1
> caa615b qt5: upgrade to 5.11 Alpha
> caad8dd qt5-creator: upgrade to 4.5.1
> 9e3b496 packagegroup-qt5-toolchain-target: drop both qtwebkit packages
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> a413b4f Merge pull request #96 from rakuco/m64-167
> not included in master yet:
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

