Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFBA7284B;
	Thu,  8 Jan 2015 17:05:46 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y9GWo-0007Jm-G7 from Joe_MacDonald@mentor.com ;
	Thu, 08 Jan 2015 09:05:46 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Thu, 8 Jan 2015
	09:05:45 -0800
Received: by burninator (Postfix, from userid 1000)	id 86D29581710; Thu,  8
	Jan 2015 12:05:42 -0500 (EST)
Date: Thu, 8 Jan 2015 12:05:42 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150108170537.GA8907@mentor.com>
References: <20150108115722.GG3972@jama>
MIME-Version: 1.0
In-Reply-To: <20150108115722.GG3972@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2015-01-08
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
X-List-Received-Date: Thu, 08 Jan 2015 17:05:52 -0000
X-Groupsio-MsgNum: 53767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] State of bitbake world, Failed tasks 2015-01-08] On 15.01.08 (Thu 12:=
57) Martin Jansa wrote:

> I've reverted font-util change from oe-core to resolve all font-* recipes=
 failing, see
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/10=
0461.html
>=20
> Just as reminder this is using openembedded-core-contrib/jansa/master wit=
h these changes
> which weren't merged to master yet:
> pick 9fadeaf qemux86: Add identical qemux86copy variant for tests
> pick 7d2d6ce WIP: Add KERNEL_EXTRA_ARGS?
> pick 57be53f libsdl: Add support for libsdl-native
> pick c283292 report-error: Allow to upload reports automatically
> pick 655252d DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
> pick c7db4d0 gdb: force arm mode
> pick a683970 icu: force arm mode
> pick 66870ff gst-ffmpeg: add dependency on libpostproc
> pick 131dd6d libav: drop unused FFMPEG_LIBS and move libpostproc only to =
0.8.11
> pick ac92b08 xorg-app: add x11 to required DISTRO_FEATURES and cleanup de=
pendencies
> pick 78b33cc recipes: add x11 to required DISTRO_FEATURES
> pick 890a3dc xorg-driver: add x11 to required DISTRO_FEATURES
> pick 9bf0e73 recipes-qt: add x11 to required DISTRO_FEATURES
> pick 4d7299c resolvconf: Drop allarch
> pick 6db992d usbinit, weston-init, run-postinsts, qt-demo-init: Drop alla=
rch
> pick d41ccc2 ppp-dialin: Drop allarch
> pick 2e00590 linux-firmware: Drop allarch
> pick f273cb7 initramfs-framework: Drop allarch
> pick 347487f libav: drop older 0.8.* and use libav-9 by default
> pick 0dc2e98 libpostproc: import from meta-oe
> pick a17e622 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
> pick 7818a65 Revert "font-util: Fix incorrect PKG_CONFIG_PATH"
>=20
> I'm going to exclude qt5-opengles2-test from world, because it requires g=
les2
> to be enabled.
> I'll blacklist xfce4-vala, because it's broken for long time.
> I'll drop pending change for openwsman.

I didn't get a chance to see the failure in openwsman v2 and I didn't
notice the follow-up on the list, what was the failure?  Or did v2 not
correct all of the issues in v1?

I'll update the patch status in patchworks if you haven't already.

-J.

> There is pending patch for libutempter (needs few more changes)
> perf is failing since last kernel changes, I've pinged Bruce to look.
>=20
> So hopefully next time we'll get better status.
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2015-01-07 =3D=3D
>=20
> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-li=
nux.org/buildlogs/oe/world/log.report.20150108_115117.log
>=20
> =3D=3D=3D common (4) =3D=3D=3D
>     * /meta-openembedded/meta-networking/recipes-protocols/openwsman/open=
wsman_2.4.12.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/libutempter/libutempter_=
1.1.6.bb, do_compile
>     * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.=
3.bb, do_configure
>     * /meta-qt5/recipes-qt/examples/qt5-opengles2-test_git.bb, do_compile
>=20
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemuarm (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * /openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compile
>=20
> =3D=3D=3D Number of failed tasks (13) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.=
world.20150107_141406.log// || http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/3939/
> |-
> || qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.=
world.20150107_152738.log// || http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/3944/
> |-
> || qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20150107_164049.log// || http://errors.yoctoproject.org:80/Errors/=
Search/1/3947/
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (50) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (48) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||build-deps
> |-
> ||0	||file-rdeps
> |-
> ||0	||libdir
> |-
> ||0	||textrel
> |-
> ||48	||version-going-backwards
> |}
>=20
>=20
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifu=
se] ?=3D "depends on blacklisted libimobiledevice"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[=
gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> meta-gnome/recipes-connectivity/network-manager-applet/network-manager-ap=
plet_0.9.8.10.bb:PNBLACKLIST[network-manager-applet] ?=3D "Depends on broke=
n polkit-gnome"
> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLICT=
: 4 files conflict with gnome-keyring"
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends=
 on broken polkit-gnome"
> meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBLAC=
KLIST[gnome-bluetooth] ?=3D "dbus-binding-tool fails with: Unable to load g=
nome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D=
-Bus interface name"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[g=
nome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gn=
ome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with li=
bgweather"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgw=
eather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D=
 "BROKEN: doesn't build with B!=3DS"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=
=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLI=
ST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config=
 was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:=
PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS =
(trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "BROKEN: fails to link against sctp_connectx symb=
ol"
> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:P=
NBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross comp=
iling"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zer=
oc-ice] ?=3D "BROKEN: not compatible with default db version"
> meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-=
gnome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 1024 e=
xceeded, use -L<N> to change it"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurf=
ace] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter=
-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN=
: doesn't build with B!=3DS (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[x=
f86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without $=
{S} in sed call)"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] =
?=3D "Requires newer libav which has negative D_P"
> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=
=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fil=
e or directory"
> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "B=
ROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or d=
irectory"
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?=
=3D "BROKEN: Doesn't work with B!=3DS"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu=
: uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit=
-framework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incorre=
ctly inherits autotools"
> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-p=
lugins] ?=3D "BROKEN: depends on broken maliit-framework"
> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=3D =
"Fails to build with system boost"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmoti=
f] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[va=
la-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `s=
rc/.stamp': No such file or directory"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn'=
t build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdep=
ends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]=
 =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-webos-ports:
> conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
> conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from=
 meta-virtualiazation which isn't included in my world builds"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't=
 really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't=
 really need to be tested so much"
> conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> QA issues by type:
> count: 0	issue: already-stripped
>=20
>=20
> count: 0	issue: libdir
>=20
>=20
> count: 0	issue: textrel
>=20
>=20
> count: 0	issue: build-deps
>=20
>=20
> count: 0	issue: file-rdeps
>=20
>=20
> count: 48	issue: version-going-backwards
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages went backwards which would break packag=
e feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-=
r0.17) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages went backwards which would break packag=
e feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-=
r0.18) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-dbg went backwards which would break pa=
ckage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd=
3f1-r0.17) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-dbg went backwards which would break pa=
ckage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd=
3f1-r0.18) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-dev went backwards which would break pa=
ckage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd=
3f1-r0.17) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-dev went backwards which would break pa=
ckage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd=
3f1-r0.18) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-doc went backwards which would break pa=
ckage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd=
3f1-r0.17) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-doc went backwards which would break pa=
ckage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd=
3f1-r0.18) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-locale went backwards which would break=
 package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7915=
5bd3f1-r0.17) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-locale went backwards which would break=
 package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7915=
5bd3f1-r0.18) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-staticdev went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.17) [version-going-backwards]
> luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version f=
or package luna-sysmgr-ipc-messages-staticdev went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.18) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime went backwards which would break package feeds from (0:1.0-r0=
=2E125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime went backwards which would break package feeds from (0:1.0-r0=
=2E125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-dbg went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-dbg went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-dev went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-dev went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-doc went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-doc went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-locale went backwards which would break package feeds from (0=
:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-locale went backwards which would break package feeds from (0=
:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-staticdev went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-datetime-1.0: Package version for package polkit-group-=
rule-datetime-staticdev went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network went backwards which would break package feeds from (0:1.0-r0.1=
25 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network went backwards which would break package feeds from (0:1.0-r0.1=
25 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-dbg went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-dbg went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-dev went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-dev went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-doc went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-doc went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-locale went backwards which would break package feeds from (0:1=
=2E0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-locale went backwards which would break package feeds from (0:1=
=2E0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-staticdev went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> polkit-group-rule-network-1.0: Package version for package polkit-group-r=
ule-network-staticdev went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common went back=
wards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104)=
 [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common went back=
wards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.105)=
 [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-dbg went =
backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.=
104) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-dbg went =
backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.=
105) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-dev went =
backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.=
104) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-dev went =
backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.=
105) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-doc went =
backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.=
104) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-doc went =
backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.=
105) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-locale we=
nt backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-=
r8.104) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-locale we=
nt backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-=
r8.105) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-staticdev=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.104) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-staticdev=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.105) [version-going-backwards]



--=20
-Joe MacDonald.
:wq

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUrrjeAAoJEEn8ffcsOfaW+ZkH/Aumvp9gv7IVLyV/G/hQU1o1
+9PCu9yvhYoMu8Am8/g6QlAvwjAVMlFWxgaAIbLlEHqcqMqrivdT0eYJjJvxPm3p
6ifaaUA9vW0Y1YCYVKGrcJ8sTzzi4W6XikP6OR+P7YM6OKwXJcaHfnUK4bxLQXQN
wWaQzsgm2b1yqqiyz31Tt8H7Ux+4y+PFEjM773e9Gz1UaGZyp7IHDcdXWhHOnbtq
9J1r/0Ekewf4EISU/NQ4o99KZGUGxM7Lj8DSDWHaYHgH9ukW2Awh1OiKJGm5vBUw
hFOJaTZkvaSzC7+X982lrinh374lpIMaCglHezi0UrDpBZs+RKCMExot9gWphsQ=
=F7Of
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
