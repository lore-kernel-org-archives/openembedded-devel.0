Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id AEAAE72498
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 15:11:30 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so8599634wgg.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jan 2015 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ML1kxxnnqg4SZosBxcGKR2g5mxifXnbAJNUk11iDQno=;
	b=bNXgvwyxl7so4IgH+metiBAVaiiifu/EtqXt/P61CUguHyetMGsIGwNpV5g29GkXf1
	/pA3FRhfmID6JY4VYFGq1odskVPKn+iGqZeYbtiuIHlNHTEMJVmCLnL2f+sTgiB6vsGN
	tUVnQs1CjmUoq/vf3UsdNPcPTva+Ya1HhCEfrBubbv31CIQbbbqJQ+8ZOBfLww0DnRbV
	KWoef3w+4umKoagj6koZ2pPKDhcBgRO3uUNYpMaMeEBguzJ96BCUWL5TdhaG7bY6mJNt
	EJXuHdo69X+7VUFQ9Cmlm7Uuc1UvotbA3BFcPcdaNDKBXvv8jKM/YE9SPjy6Bv9hkpfC
	n/gA==
X-Received: by 10.194.174.3 with SMTP id bo3mr32573287wjc.98.1420816288839;
	Fri, 09 Jan 2015 07:11:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ez1sm10334257wjd.31.2015.01.09.07.11.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jan 2015 07:11:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Jan 2015 16:11:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150109151133.GD3137@jama>
References: <20150108115722.GG3972@jama> <20150108170537.GA8907@mentor.com>
	<20150108171955.GJ3972@jama> <20150109144153.GA475@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20150109144153.GA475@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Fri, 09 Jan 2015 15:11:36 -0000
X-Groupsio-MsgNum: 53787
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline

--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2015 at 09:41:53AM -0500, Joe MacDonald wrote:
> [Re: [oe] State of bitbake world, Failed tasks 2015-01-08] On 15.01.08 (T=
hu 18:19) Martin Jansa wrote:
>=20
> > On Thu, Jan 08, 2015 at 12:05:42PM -0500, Joe MacDonald wrote:
> > > [[oe] State of bitbake world, Failed tasks 2015-01-08] On 15.01.08 (T=
hu 12:57) Martin Jansa wrote:
> > >=20
> > > > I've reverted font-util change from oe-core to resolve all font-* r=
ecipes failing, see
> > > > http://lists.openembedded.org/pipermail/openembedded-core/2015-Janu=
ary/100461.html
> > > >=20
> > > > Just as reminder this is using openembedded-core-contrib/jansa/mast=
er with these changes
> > > > which weren't merged to master yet:
> > > > pick 9fadeaf qemux86: Add identical qemux86copy variant for tests
> > > > pick 7d2d6ce WIP: Add KERNEL_EXTRA_ARGS?
> > > > pick 57be53f libsdl: Add support for libsdl-native
> > > > pick c283292 report-error: Allow to upload reports automatically
> > > > pick 655252d DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE va=
riable
> > > > pick c7db4d0 gdb: force arm mode
> > > > pick a683970 icu: force arm mode
> > > > pick 66870ff gst-ffmpeg: add dependency on libpostproc
> > > > pick 131dd6d libav: drop unused FFMPEG_LIBS and move libpostproc on=
ly to 0.8.11
> > > > pick ac92b08 xorg-app: add x11 to required DISTRO_FEATURES and clea=
nup dependencies
> > > > pick 78b33cc recipes: add x11 to required DISTRO_FEATURES
> > > > pick 890a3dc xorg-driver: add x11 to required DISTRO_FEATURES
> > > > pick 9bf0e73 recipes-qt: add x11 to required DISTRO_FEATURES
> > > > pick 4d7299c resolvconf: Drop allarch
> > > > pick 6db992d usbinit, weston-init, run-postinsts, qt-demo-init: Dro=
p allarch
> > > > pick d41ccc2 ppp-dialin: Drop allarch
> > > > pick 2e00590 linux-firmware: Drop allarch
> > > > pick f273cb7 initramfs-framework: Drop allarch
> > > > pick 347487f libav: drop older 0.8.* and use libav-9 by default
> > > > pick 0dc2e98 libpostproc: import from meta-oe
> > > > pick a17e622 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitel=
ist
> > > > pick 7818a65 Revert "font-util: Fix incorrect PKG_CONFIG_PATH"
> > > >=20
> > > > I'm going to exclude qt5-opengles2-test from world, because it requ=
ires gles2
> > > > to be enabled.
> > > > I'll blacklist xfce4-vala, because it's broken for long time.
> > > > I'll drop pending change for openwsman.
> > >=20
> > > I didn't get a chance to see the failure in openwsman v2 and I didn't
> > > notice the follow-up on the list, what was the failure?  Or did v2 not
> > > correct all of the issues in v1?
> >=20
> > The links to logs are in the "=3D=3D=3D Number of failed tasks (13) =3D=
=3D=3D"
> > section of the e-mail
> >=20
> >  ../libwsman.so.1.0.0: error: undefined reference to 'floor'
> >=20
> > http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150107_1414=
06.log//bitbake.log
> > or
> > http://errors.yoctoproject.org/Errors/Search/Details/7107/1/10/3939
> >=20
> > and similar links for other architectures
>=20
> Okay, found it now.  I don't know why, but I was looking for a break-out
> of the individual package failures and didn't check the mega log.  I
> wasn't using the error dashboard but now that I've seen it I'll
> definitely make better use of it.  Thanks.

Break-out logs are only in test-dependencies reports (because those are
building every failing recipe separately).

> -J.
>=20
> >=20
> > > I'll update the patch status in patchworks if you haven't already.
> >=20
> > I did for no-bundle and master-next/meta-qt5 bundles, but please check
> > meta-networking bundle (patches included in jenkins builds are usually
> > included in both meta-networking and master-next bundles)
> >=20
> > > > There is pending patch for libutempter (needs few more changes)
> > > > perf is failing since last kernel changes, I've pinged Bruce to loo=
k.
> > > >=20
> > > > So hopefully next time we'll get better status.
> > > >=20
> > > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > > >=20
> > > > =3D=3D Failed tasks 2015-01-07 =3D=3D
> > > >=20
> > > > INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.ns=
lu2-linux.org/buildlogs/oe/world/log.report.20150108_115117.log
> > > >=20
> > > > =3D=3D=3D common (4) =3D=3D=3D
> > > >     * /meta-openembedded/meta-networking/recipes-protocols/openwsma=
n/openwsman_2.4.12.bb, do_compile
> > > >     * /meta-openembedded/meta-oe/recipes-support/libutempter/libute=
mpter_1.1.6.bb, do_compile
> > > >     * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala=
_4.10.3.bb, do_configure
> > > >     * /meta-qt5/recipes-qt/examples/qt5-opengles2-test_git.bb, do_c=
ompile
> > > >=20
> > > > =3D=3D=3D common-x86 (0) =3D=3D=3D
> > > >=20
> > > > =3D=3D=3D qemuarm (0) =3D=3D=3D
> > > >=20
> > > > =3D=3D=3D qemux86 (0) =3D=3D=3D
> > > >=20
> > > > =3D=3D=3D qemux86_64 (1) =3D=3D=3D
> > > >     * /openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compi=
le
> > > >=20
> > > > =3D=3D=3D Number of failed tasks (13) =3D=3D=3D
> > > > {| class=3Dwikitable
> > > > |-
> > > > || qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world=
//log.world.20150107_141406.log// || http://errors.yoctoproject.org:80/Erro=
rs/Search/1/3939/
> > > > |-
> > > > || qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world=
//log.world.20150107_152738.log// || http://errors.yoctoproject.org:80/Erro=
rs/Search/1/3944/
> > > > |-
> > > > || qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld//log.world.20150107_164049.log// || http://errors.yoctoproject.org:80/E=
rrors/Search/1/3947/
> > > > |}
> > > >=20
> > > > =3D=3D=3D PNBLACKLISTs (50) =3D=3D=3D
> > > >=20
> > > > =3D=3D=3D QA issues (48) =3D=3D=3D
> > > > {| class=3Dwikitable
> > > > !| Count		||Issue
> > > > |-
> > > > ||0	||already-stripped
> > > > |-
> > > > ||0	||build-deps
> > > > |-
> > > > ||0	||file-rdeps
> > > > |-
> > > > ||0	||libdir
> > > > |-
> > > > ||0	||textrel
> > > > |-
> > > > ||48	||version-going-backwards
> > > > |}
> > > >=20
> > > >=20
> > > > PNBLACKLISTs:
> > > > openembedded-core/:
> > > > meta-browser:
> > > > meta-openembedded:
> > > > meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLI=
ST[ifuse] ?=3D "depends on blacklisted libimobiledevice"
> > > > meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLAC=
KLIST[gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> > > > meta-gnome/recipes-connectivity/network-manager-applet/network-mana=
ger-applet_0.9.8.10.bb:PNBLACKLIST[network-manager-applet] ?=3D "Depends on=
 broken polkit-gnome"
> > > > meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CO=
NFLICT: 4 files conflict with gnome-keyring"
> > > > meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "D=
epends on broken polkit-gnome"
> > > > meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:=
PNBLACKLIST[gnome-bluetooth] ?=3D "dbus-binding-tool fails with: Unable to =
load gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a v=
alid D-Bus interface name"
> > > > meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACK=
LIST[gnome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menu=
s"
> > > > meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKL=
IST[gnome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts w=
ith libgweather"
> > > > meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST=
[libgweather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> > > > meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity=
] ?=3D "BROKEN: doesn't build with B!=3DS"
> > > > meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xb=
mc] ?=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been decl=
ared"
> > > > meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNB=
LACKLIST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-=
config was removed, error: unknown type name 'SDL_Overlay'"
> > > > meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3=
=2E0.bb:PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with=
 B!=3DS (trying to install rendererconsole.py from ${B} instead of ${S})"
> > > > meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb=
:PNBLACKLIST[lksctp-tools] ?=3D "BROKEN: fails to link against sctp_connect=
x symbol"
> > > > meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.=
4.bb:PNBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cros=
s compiling"
> > > > meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft6=
6] ?=3D "BROKEN: depends on broken libftdi"
> > > > meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLI=
ST[zeroc-ice] ?=3D "BROKEN: not compatible with default db version"
> > > > meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[p=
olkit-gnome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of =
1024 exceeded, use -L<N> to change it"
> > > > meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[s=
ubsurface] ?=3D "Needs to be upgraded for compatibility with new libdivecom=
puter"
> > > > meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[c=
lutter-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> > > > meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "=
BROKEN: doesn't build with B!=3DS (flex: can't open lex.lex)"
> > > > meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACK=
LIST[xf86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile wit=
hout ${S} in sed call)"
> > > > meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mpla=
yer2] ?=3D "Requires newer libav which has negative D_P"
> > > > meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-=
e] ?=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such=
 file or directory"
> > > > meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=
=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fil=
e or directory"
> > > > meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylph=
eed] ?=3D "BROKEN: Doesn't work with B!=3DS"
> > > > meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcu=
psd] ?=3D "BROKEN: doesn't build with B!=3DS"
> > > > meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D=
 "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
> > > > meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[=
maliit-framework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe i=
ncorrectly inherits autotools"
> > > > meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[ma=
liit-plugins] ?=3D "BROKEN: depends on broken maliit-framework"
> > > > meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb]=
 ?=3D "Fails to build with system boost"
> > > > meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[op=
enmotif] ?=3D "BROKEN: doesn't build with B!=3DS"
> > > > meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKL=
IST[vala-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot to=
uch `src/.stamp': No such file or directory"
> > > > meta-qt5:
> > > > meta-smartphone:
> > > > meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms]=
 =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > > > meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > > > meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D=
 "rdepends on blacklisted mplayer2"
> > > > meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > > > meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valaco=
mpass] =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > > > meta-webos-ports:
> > > > conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
> > > > conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lx=
c from meta-virtualiazation which isn't included in my world builds"
> > > > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and d=
oesn't really need to be tested so much"
> > > > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and do=
esn't really need to be tested so much"
> > > > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and do=
esn't really need to be tested so much"
> > > > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and do=
esn't really need to be tested so much"
> > > > conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and d=
oesn't really need to be tested so much"
> > > > conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> > > > conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> > > > conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to =
build"
> > > > conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to buil=
d"
> > > > conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> > > > QA issues by type:
> > > > count: 0	issue: already-stripped
> > > >=20
> > > >=20
> > > > count: 0	issue: libdir
> > > >=20
> > > >=20
> > > > count: 0	issue: textrel
> > > >=20
> > > >=20
> > > > count: 0	issue: build-deps
> > > >=20
> > > >=20
> > > > count: 0	issue: file-rdeps
> > > >=20
> > > >=20
> > > > count: 48	issue: version-going-backwards
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.17) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.18) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-dbg went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.17) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-dbg went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.18) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-dev went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.17) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-dev went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.18) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-doc went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.17) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-doc went backwards which would br=
eak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+7=
9155bd3f1-r0.18) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-locale went backwards which would=
 break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git=
0+79155bd3f1-r0.17) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-locale went backwards which would=
 break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git=
0+79155bd3f1-r0.18) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-staticdev went backwards which wo=
uld break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+=
git0+79155bd3f1-r0.17) [version-going-backwards]
> > > > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package ver=
sion for package luna-sysmgr-ipc-messages-staticdev went backwards which wo=
uld break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+=
git0+79155bd3f1-r0.18) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-dbg went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-dbg went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-dev went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-dev went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-doc went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-doc went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-locale went backwards which would break package feeds f=
rom (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-locale went backwards which would break package feeds f=
rom (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-staticdev went backwards which would break package feed=
s from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-datetime-1.0: Package version for package polkit-=
group-rule-datetime-staticdev went backwards which would break package feed=
s from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-dbg went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-dbg went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-dev went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-dev went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-doc went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-doc went backwards which would break package feeds from (=
0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-locale went backwards which would break package feeds fro=
m (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-locale went backwards which would break package feeds fro=
m (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-staticdev went backwards which would break package feeds =
=66rom (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > > > polkit-group-rule-network-1.0: Package version for package polkit-g=
roup-rule-network-staticdev went backwards which would break package feeds =
=66rom (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.104) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.105) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-dbg=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.104) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-dbg=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.105) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-dev=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.104) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-dev=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.105) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-doc=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.104) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-doc=
 went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.=
34-r8.105) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-loc=
ale went backwards which would break package feeds from (0:1.34-r8.106 to 0=
:1.34-r8.104) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-loc=
ale went backwards which would break package feeds from (0:1.34-r8.106 to 0=
:1.34-r8.105) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-sta=
ticdev went backwards which would break package feeds from (0:1.34-r8.106 t=
o 0:1.34-r8.104) [version-going-backwards]
> > > > xserver-common-1.34: Package version for package xserver-common-sta=
ticdev went backwards which would break package feeds from (0:1.34-r8.106 t=
o 0:1.34-r8.105) [version-going-backwards]
> > >=20
> > >=20
> > >=20
> > > --=20
> > > -Joe MacDonald.
> > > :wq
> >=20
> >=20
> >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> -Joe MacDonald.
> :wq



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSv76UACgkQN1Ujt2V2gBwGWACgmOo1jW5ED+oBG8DXwT7ZNEEZ
2k0An19pRnTPlwizDWKgjG2CDLcSqBPB
=nUKR
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
