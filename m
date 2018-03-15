Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 26F0A6093E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 21:19:17 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id a23so8854900qtn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=/1m3lR1rWC2IjIpctizFElWgNXck+ns8VgbprVuBgC0=;
	b=ij8dPst7CJ9M3UVvtmEM13XPTCs8y6Qx1h8/xIvRCCPXJ+1IESGQcEILU1VErpxTOW
	aLRvV68m11DU/NGJtBUtvc3bNzW8HVb0ZNB+FV1IWp1mBkdwhHgQ+a92m5g/DB0rP58H
	U4dSy4L+TXFIn7a+rMwTQ5HP1ZF0JD9+4sgWp709Fzugv5u2O/NK3qsufefAP7YY/iMc
	QuHjL7yt1XDcOHgfYL9dxw735QxtBofjGGbGVWdn1U27fKFJrGlbjG+qc5p8VVdfYXtL
	4AG3mOTW6pnr9RizMoviE6vG4IXbOLZRvea7nyHafooLSUf5X3In0im65hRGfz8hSkUa
	cjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=/1m3lR1rWC2IjIpctizFElWgNXck+ns8VgbprVuBgC0=;
	b=aRAPvHkDR3p/cXF0ryYijaT1UPALHrDkubNlVeVTI8W+bum1xxbDoNPkri/zYjt3W0
	jjC7qnfEzZrAyI4Ed1odaxFRtxM5Kh57cSd0srjRu8ThH7tH2xBdKKQjNPcJxEfqEwqx
	9b7J1Syh0i69/6WN2Wn4JMk6eCOrx2Cxx09iNdO+IPrE1/OnC/EDEyrZPr7LLXr9bPee
	KxuvoHr0xQlnSwr32W84Pskb9ul/tLUiCin1aBz3dW5h8+ucR+HBk0BksJ8xxM5en61j
	EqC/dfzZgEwBiAaOs9pKXY1BjDtJUAnlMplWRxqK3VZhTBHaGMQQ9nEgxmHinn9OL54G
	GuhQ==
X-Gm-Message-State: AElRT7EK/vWVLZ31zOkhwoZI4ohz6xzzERh2NyUc4ULaFMVfj2Ce5OIp
	G3GSYtfutn7CqQN16FLRDPlQhw==
X-Google-Smtp-Source: AG47ELsD2XONgbHnG8DM1m+J0klmjujz1I+O1ltfidOx7rqN2y3bx198HTCNFF0zEWFUnsY3Wc7e8w==
X-Received: by 10.200.10.200 with SMTP id g8mr15790076qti.121.1521148758006;
	Thu, 15 Mar 2018 14:19:18 -0700 (PDT)
Received: from [172.16.131.121] (nat-wv.mentorg.com. [192.94.38.34])
	by smtp.gmail.com with ESMTPSA id x8sm4586884qta.64.2018.03.15.14.19.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Mar 2018 14:19:17 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <118584e1-07e0-d3fb-e25d-e6c4cf053e22@gmail.com>
Date: Thu, 15 Mar 2018 14:19:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of the world, Failed tasks 2018-03-13
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
X-List-Received-Date: Thu, 15 Mar 2018 21:19:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=3D=3D Failed tasks 2018-03-13 =3D=3D

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20180315_073156.log

=3D=3D=3D common (9) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyr=
ing_2.32.1.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-k=
eyring_2.32.0.bb:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb:do=
_configure
    * meta-openembedded/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.=
bb:do_install_ptest_base
    * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-extended/polkit/polkit-gnome_0.10=
5.bb:do_configure
    * meta-openembedded/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb:=
do_configure
    * meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_gi=
t.bb:do_packagedata
    * meta-openembedded/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.=
bb:do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
=2E8beta5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb:do_compile

=3D=3D=3D qemuarm (7) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/=
gstd_1.0.bb:do_configure
    * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscs=
itarget_1.4.20.3+svn502.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.8-1=
=2Ebb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_gi=
t.bb:do_packagedata
    * meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_c=
ompile

=3D=3D=3D qemuarm64 (9) =3D=3D=3D
    * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-uti=
l_git.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_2=
0110206.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.27.bb:do_p=
ackage_qa
    * openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_pa=
ckage_qa
    * openembedded-core/meta/recipes-devtools/go/go_1.10.bb:do_package_qa=

    * openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_packa=
ge_qa
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:d=
o_compile
    * openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.15.bb:do_=
compile

=3D=3D=3D qemux86 (21) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3=
274.0.r517731.igalia.1.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-x11_64.0.3282.167.bb=
:do_patch
    * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compil=
e
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
=2E18.02.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
=2E3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/libtevent/libteve=
nt_0.9.36.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/wireshark/wiresha=
rk_2.4.5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-support/nano/nano_2.9.3.bb:do_pac=
kage
    * meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compil=
e
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_configure
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.4.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb:do_co=
mpile

=3D=3D=3D Number of failed tasks (92) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemuarm.20180312_113757.log/ || http://errors.yoctoproject.org=
/Errors/Build/55949/
|-
|| qemuarm64 	|| 23	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemuarm64.20180313_163546.log/ || http://errors.yoctoproject=
=2Eorg/Errors/Build/56075/
|-
|| qemux86 	|| 36	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemux86.20180312_113805.log/ || http://errors.yoctoproject.org=
/Errors/Build/55902/
|-
|| qemux86_64 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world/s=
umo/log.world.qemux86-64.20180313_140110.log/ || http://errors.yoctoproje=
ct.org/Errors/Build/56073/
|}

=3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D

=3D=3D=3D QA issues (17) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||qa_pseudo
|-
||0	||symlink-to-sysroot
|-
||2	||host-user-contaminated
|-
||2	||installed-vs-shipped
|-
||2	||unknown-configure-option
|-
||6	||version-going-backwards
|-
||7	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (188) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20180315_035122.log/
    * ERROR: 188 issues were found in these recipes: adwaita-icon-theme a=
utoconf-archive ca-certificates cantarell-fonts docbook-xml-dtd4 docbook-=
xsl-stylesheets encodings faenza-icon-theme firefox-addon-webconverger fi=
refox-l10n-ach firefox-l10n-af firefox-l10n-an firefox-l10n-ar firefox-l1=
0n-as firefox-l10n-ast firefox-l10n-az firefox-l10n-be firefox-l10n-bg fi=
refox-l10n-bn-bd firefox-l10n-bn-in firefox-l10n-br firefox-l10n-bs firef=
ox-l10n-ca firefox-l10n-cs firefox-l10n-cy firefox-l10n-da firefox-l10n-d=
e firefox-l10n-dsb firefox-l10n-el firefox-l10n-en-gb firefox-l10n-en-us =
firefox-l10n-en-za firefox-l10n-eo firefox-l10n-es-ar firefox-l10n-es-cl =
firefox-l10n-es-es firefox-l10n-es-mx firefox-l10n-et firefox-l10n-eu fir=
efox-l10n-fa firefox-l10n-ff firefox-l10n-fi firefox-l10n-fr firefox-l10n=
-fy-nl firefox-l10n-ga-ie firefox-l10n-gd firefox-l10n-gl firefox-l10n-gn=
 firefox-l10n-gu-in firefox-l10n-he firefox-l10n-hi-in firefox-l10n-hr fi=
refox-l10n-hsb firefox-l10n-hu firefox-l10n-hy-am firefox-l10n-id firefox=
-l10n-is firefox-l10n-it firefox-l10n-ja firefox-l10n-kk firefox-l10n-km =
firefox-l10n-kn firefox-l10n-ko firefox-l10n-lij firefox-l10n-lt firefox-=
l10n-lv firefox-l10n-mai firefox-l10n-mk firefox-l10n-ml firefox-l10n-mr =
firefox-l10n-ms firefox-l10n-nb-no firefox-l10n-nl firefox-l10n-nn-no fir=
efox-l10n-or firefox-l10n-pa-in firefox-l10n-pl firefox-l10n-pt-br firefo=
x-l10n-pt-pt firefox-l10n-rm firefox-l10n-ro firefox-l10n-ru firefox-l10n=
-si firefox-l10n-sk firefox-l10n-sl firefox-l10n-son firefox-l10n-sq fire=
fox-l10n-sr firefox-l10n-sv-se firefox-l10n-ta firefox-l10n-te firefox-l1=
0n-th firefox-l10n-tr firefox-l10n-uk firefox-l10n-uz firefox-l10n-vi fir=
efox-l10n-xh firefox-l10n-zh-cn firefox-l10n-zh-tw font-alias freediamete=
r gnome-common gtksourceview-classic-light hicolor-icon-theme icon-naming=
-utils initramfs-boot initramfs-debug initramfs-framework initramfs-modul=
e-setup-live iso-codes liberation-fonts linux-firmware mplayer-common ope=
nzone oprofile os-release packagegroup-core-buildessential packagegroup-c=
ore-clutter packagegroup-core-device-devel packagegroup-core-eclipse-debu=
g packagegroup-core-full-cmdline packagegroup-core-nfs packagegroup-core-=
ssh-dropbear packagegroup-core-ssh-openssh packagegroup-core-standalone-s=
dk-target packagegroup-core-tools-debug packagegroup-core-x11 packagegrou=
p-core-x11-base packagegroup-fonts-truetype packagegroup-go-sdk-target pa=
ckagegroup-qt5-qtcreator-debug packagegroup-qt5-toolchain-target packageg=
roup-sdk-target packagegroup-self-hosted packagegroup-tools-bluetooth pac=
kagegroup-xfce-base packagegroup-xfce-extended packagegroup-xfce-multimed=
ia phoronix-test-suite phpmyadmin poppler-data ppp-dialin pseudo-test pul=
seaudio-client-conf-sato qt5-demo-extrafiles resolvconf rodent-icon-theme=
 run-postinsts shutdown-desktop source-han-sans-cn-fonts source-han-sans-=
jp-fonts source-han-sans-kr-fonts source-han-sans-tw-fonts terminus-font =
tesseract-lang ttf-abyssinica ttf-arphic-uming ttf-dejavu ttf-droid ttf-g=
entium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-liberation-sans-=
narrow ttf-lklug ttf-lohit ttf-mplus ttf-pt-sans ttf-sazanami ttf-tlwg tt=
f-ubuntu-font-family ttf-vlgothic ttf-wqy-zenhei tzdata update-rc.d usbin=
it usb-modeswitch-data volatile-binds wayland-protocols weston-init xcurs=
or-transparent-theme xfce-dusk-gtk3 xorg-fonts-100dpi xorg-minimal-fonts =
xuser-account

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.lo=
g
    * ERROR: 2 errors found in signatures.qemux86.do_populate_sysroot.sig=
data.log
    * ERROR: 2 errors found in signatures.qemux86.do_package_write_ipk.si=
gdata.log
    * ERROR: 183 errors found in signatures.qemuarm.do_package_write_ipk.=
sigdata.log

    * ERROR: oprofile different signature for task do_configure.sigdata b=
etween qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmpfs/ssta=
te-diff/1521121882/signatures.qemux86.do_configure.sigdata.log
    * ERROR: freediameter different signature for task do_populate_sysroo=
t.sigdata between qemux86copy and qemux86
    * ERROR: oprofile different signature for task do_populate_sysroot.si=
gdata between qemux86copy and qemux86
    * ERROR: 2 errors found in /home/jenkins/oe/world/shr-core/tmpfs/ssta=
te-diff/1521121882/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: freediameter different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemux86
    * ERROR: oprofile different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemux86
    * ERROR: 2 errors found in /home/jenkins/oe/world/shr-core/tmpfs/ssta=
te-diff/1521121882/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: adwaita-icon-theme different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: autoconf-archive different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ca-certificates different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: cantarell-fonts different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: docbook-xml-dtd4 different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: docbook-xsl-stylesheets different signature for task do_pack=
age_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: encodings different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
    * ERROR: faenza-icon-theme different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-addon-webconverger different signature for task do_p=
ackage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ach different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-af different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-an different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ar different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-as different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ast different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-az different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-be different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-bg different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-bn-bd different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-bn-in different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-br different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-bs different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ca different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-cs different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-cy different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-da different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-de different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-dsb different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-el different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-en-gb different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-en-us different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-en-za different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-eo different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-es-ar different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-es-cl different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-es-es different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-es-mx different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-et different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-eu different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-fa different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ff different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-fi different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-fr different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-fy-nl different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ga-ie different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-gd different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-gl different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-gn different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-gu-in different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-he different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-hi-in different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-hr different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-hsb different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-hu different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-hy-am different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-id different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-is different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-it different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ja different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-kk different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-km different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-kn different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ko different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-lij different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-lt different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-lv different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-mai different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-mk different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ml different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-mr different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ms different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-nb-no different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-nl different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-nn-no different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-or different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-pa-in different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-pl different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-pt-br different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-pt-pt different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-rm different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ro different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ru different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-si different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-sk different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-sl different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-son different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-sq different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-sr different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-sv-se different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-ta different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-te different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-th different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-tr different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-uk different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-uz different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-vi different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-xh different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-zh-cn different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: firefox-l10n-zh-tw different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: font-alias different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
    * ERROR: gnome-common different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemuarm
    * ERROR: gtksourceview-classic-light different signature for task do_=
package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: hicolor-icon-theme different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: icon-naming-utils different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: initramfs-boot different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: initramfs-debug different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: initramfs-framework different signature for task do_package_=
write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: initramfs-module-setup-live different signature for task do_=
package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: iso-codes different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
    * ERROR: liberation-fonts different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: linux-firmware different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: mplayer-common different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: openzone different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
    * ERROR: os-release different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-buildessential different signature for tas=
k do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-clutter different signature for task do_pa=
ckage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-device-devel different signature for task =
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-eclipse-debug different signature for task=
 do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-full-cmdline different signature for task =
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-nfs different signature for task do_packag=
e_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-ssh-dropbear different signature for task =
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-ssh-openssh different signature for task d=
o_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-standalone-sdk-target different signature =
for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-tools-debug different signature for task d=
o_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-x11 different signature for task do_packag=
e_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-x11-base different signature for task do_p=
ackage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-fonts-truetype different signature for task do_=
package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-go-sdk-target different signature for task do_p=
ackage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-qt5-qtcreator-debug different signature for tas=
k do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-qt5-toolchain-target different signature for ta=
sk do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-sdk-target different signature for task do_pack=
age_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-self-hosted different signature for task do_pac=
kage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-tools-bluetooth different signature for task do=
_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-xfce-base different signature for task do_packa=
ge_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-xfce-extended different signature for task do_p=
ackage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-xfce-multimedia different signature for task do=
_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phoronix-test-suite different signature for task do_package_=
write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
    * ERROR: poppler-data different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemuarm
    * ERROR: ppp-dialin different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
    * ERROR: pseudo-test different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
    * ERROR: pulseaudio-client-conf-sato different signature for task do_=
package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: qt5-demo-extrafiles different signature for task do_package_=
write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: resolvconf different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
    * ERROR: rodent-icon-theme different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: run-postinsts different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemuarm
    * ERROR: shutdown-desktop different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: source-han-sans-cn-fonts different signature for task do_pac=
kage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: source-han-sans-jp-fonts different signature for task do_pac=
kage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: source-han-sans-kr-fonts different signature for task do_pac=
kage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: source-han-sans-tw-fonts different signature for task do_pac=
kage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: terminus-font different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemuarm
    * ERROR: tesseract-lang different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-abyssinica different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-arphic-uming different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-dejavu different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
    * ERROR: ttf-droid different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
    * ERROR: ttf-gentium different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-hunkyfonts different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-inconsolata different signature for task do_package_writ=
e_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-liberation different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-liberation-sans-narrow different signature for task do_p=
ackage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-lklug different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
    * ERROR: ttf-lohit different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
    * ERROR: ttf-mplus different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
    * ERROR: ttf-pt-sans different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-sazanami different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-tlwg different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
    * ERROR: ttf-ubuntu-font-family different signature for task do_packa=
ge_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-vlgothic different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemuarm
    * ERROR: ttf-wqy-zenhei different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: tzdata different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
    * ERROR: update-rc.d different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
    * ERROR: usbinit different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemuarm
    * ERROR: usb-modeswitch-data different signature for task do_package_=
write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: volatile-binds different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: wayland-protocols different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: weston-init different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
    * ERROR: xcursor-transparent-theme different signature for task do_pa=
ckage_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: xfce-dusk-gtk3 different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: xorg-fonts-100dpi different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: xorg-minimal-fonts different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: xuser-account different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 183 errors found in /home/jenkins/oe/world/shr-core/tmpfs/ss=
tate-diff/1521121882/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 188 issues were found in these recipes: adwaita-icon-theme a=
utoconf-archive ca-certificates cantarell-fonts docbook-xml-dtd4 docbook-=
xsl-stylesheets encodings faenza-icon-theme firefox-addon-webconverger fi=
refox-l10n-ach firefox-l10n-af firefox-l10n-an firefox-l10n-ar firefox-l1=
0n-as firefox-l10n-ast firefox-l10n-az firefox-l10n-be firefox-l10n-bg fi=
refox-l10n-bn-bd firefox-l10n-bn-in firefox-l10n-br firefox-l10n-bs firef=
ox-l10n-ca firefox-l10n-cs firefox-l10n-cy firefox-l10n-da firefox-l10n-d=
e firefox-l10n-dsb firefox-l10n-el firefox-l10n-en-gb firefox-l10n-en-us =
firefox-l10n-en-za firefox-l10n-eo firefox-l10n-es-ar firefox-l10n-es-cl =
firefox-l10n-es-es firefox-l10n-es-mx firefox-l10n-et firefox-l10n-eu fir=
efox-l10n-fa firefox-l10n-ff firefox-l10n-fi firefox-l10n-fr firefox-l10n=
-fy-nl firefox-l10n-ga-ie firefox-l10n-gd firefox-l10n-gl firefox-l10n-gn=
 firefox-l10n-gu-in firefox-l10n-he firefox-l10n-hi-in firefox-l10n-hr fi=
refox-l10n-hsb firefox-l10n-hu firefox-l10n-hy-am firefox-l10n-id firefox=
-l10n-is firefox-l10n-it firefox-l10n-ja firefox-l10n-kk firefox-l10n-km =
firefox-l10n-kn firefox-l10n-ko firefox-l10n-lij firefox-l10n-lt firefox-=
l10n-lv firefox-l10n-mai firefox-l10n-mk firefox-l10n-ml firefox-l10n-mr =
firefox-l10n-ms firefox-l10n-nb-no firefox-l10n-nl firefox-l10n-nn-no fir=
efox-l10n-or firefox-l10n-pa-in firefox-l10n-pl firefox-l10n-pt-br firefo=
x-l10n-pt-pt firefox-l10n-rm firefox-l10n-ro firefox-l10n-ru firefox-l10n=
-si firefox-l10n-sk firefox-l10n-sl firefox-l10n-son firefox-l10n-sq fire=
fox-l10n-sr firefox-l10n-sv-se firefox-l10n-ta firefox-l10n-te firefox-l1=
0n-th firefox-l10n-tr firefox-l10n-uk firefox-l10n-uz firefox-l10n-vi fir=
efox-l10n-xh firefox-l10n-zh-cn firefox-l10n-zh-tw font-alias freediamete=
r gnome-common gtksourceview-classic-light hicolor-icon-theme icon-naming=
-utils initramfs-boot initramfs-debug initramfs-framework initramfs-modul=
e-setup-live iso-codes liberation-fonts linux-firmware mplayer-common ope=
nzone oprofile os-release packagegroup-core-buildessential packagegroup-c=
ore-clutter packagegroup-core-device-devel packagegroup-core-eclipse-debu=
g packagegroup-core-full-cmdline packagegroup-core-nfs packagegroup-core-=
ssh-dropbear packagegroup-core-ssh-openssh packagegroup-core-standalone-s=
dk-target packagegroup-core-tools-debug packagegroup-core-x11 packagegrou=
p-core-x11-base packagegroup-fonts-truetype packagegroup-go-sdk-target pa=
ckagegroup-qt5-qtcreator-debug packagegroup-qt5-toolchain-target packageg=
roup-sdk-target packagegroup-self-hosted packagegroup-tools-bluetooth pac=
kagegroup-xfce-base packagegroup-xfce-extended packagegroup-xfce-multimed=
ia phoronix-test-suite phpmyadmin poppler-data ppp-dialin pseudo-test pul=
seaudio-client-conf-sato qt5-demo-extrafiles resolvconf rodent-icon-theme=
 run-postinsts shutdown-desktop source-han-sans-cn-fonts source-han-sans-=
jp-fonts source-han-sans-kr-fonts source-han-sans-tw-fonts terminus-font =
tesseract-lang ttf-abyssinica ttf-arphic-uming ttf-dejavu ttf-droid ttf-g=
entium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-liberation-sans-=
narrow ttf-lklug ttf-lohit ttf-mplus ttf-pt-sans ttf-sazanami ttf-tlwg tt=
f-ubuntu-font-family ttf-vlgothic ttf-wqy-zenhei tzdata update-rc.d usbin=
it usb-modeswitch-data volatile-binds wayland-protocols weston-init xcurs=
or-transparent-theme xfce-dusk-gtk3 xorg-fonts-100dpi xorg-minimal-fonts =
xuser-account


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-qt5:
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation=
 which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be te=
sted so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be te=
sted so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads =
directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 7	issue: textrel
ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-p=
test/usr/lib/glide/ptest/github.com/Masterminds/glide/action/action.test'=
 has relocations in .text [textrel]
ELF binary '/work/aarch64-oe-linux/go/1.10-r0/packages-split/go/usr/lib/g=
o/bin/go' has relocations in .text [textrel]
glide-0.13.1: ELF binary '/work/i586-oe-linux-musl/glide/0.13.1-r0/packag=
es-split/glide/usr/bin/glide' has relocations in .text [textrel]
go-dep-0.4.1: ELF binary '/work/aarch64-oe-linux/go-dep/0.4.1-r0/packages=
-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/de=
p.test' has relocations in .text [textrel]
go-dep-0.4.1: ELF binary '/work/i586-oe-linux-musl/go-dep/0.4.1-r0/packag=
es-split/go-dep/usr/bin/dep' has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264' h=
as relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.=
152' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 6	issue: version-going-backwards
kodi-17.3+gitrAUTOINC+6abeebd5ba: Package version for package kodi-dbg we=
nt backwards which would break package feeds from (0:17.3+gitr0+6abeebd5b=
a-r0.15 to 0:17.3+gitr0+6abeebd5ba-r0.0) [version-going-backwards]
kodi-17.3+gitrAUTOINC+6abeebd5ba: Package version for package kodi-dev we=
nt backwards which would break package feeds from (0:17.3+gitr0+6abeebd5b=
a-r0.15 to 0:17.3+gitr0+6abeebd5ba-r0.0) [version-going-backwards]
kodi-17.3+gitrAUTOINC+6abeebd5ba: Package version for package kodi-doc we=
nt backwards which would break package feeds from (0:17.3+gitr0+6abeebd5b=
a-r0.15 to 0:17.3+gitr0+6abeebd5ba-r0.0) [version-going-backwards]
kodi-17.3+gitrAUTOINC+6abeebd5ba: Package version for package kodi-locale=
 went backwards which would break package feeds from (0:17.3+gitr0+6abeeb=
d5ba-r0.15 to 0:17.3+gitr0+6abeebd5ba-r0.0) [version-going-backwards]
kodi-17.3+gitrAUTOINC+6abeebd5ba: Package version for package kodi-static=
dev went backwards which would break package feeds from (0:17.3+gitr0+6ab=
eebd5ba-r0.15 to 0:17.3+gitr0+6abeebd5ba-r0.0) [version-going-backwards]
kodi-17.3+gitrAUTOINC+6abeebd5ba: Package version for package kodi went b=
ackwards which would break package feeds from (0:17.3+gitr0+6abeebd5ba-r0=
=2E15 to 0:17.3+gitr0+6abeebd5ba-r0.0) [version-going-backwards]


count: 2	issue: host-user-contaminated
glibc-locale-2.27: glibc-locale: /glibc-binary-localedata-ar-iq.iso-8859-=
6/usr/lib/locale/ar_IQ.ISO-8859-6/LC_COLLATE is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
glibc-locale-2.27: glibc-locale: /glibc-binary-localedata-bo-cn/usr/lib/l=
ocale/bo_CN/LC_PAPER is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contami=
nated]


count: 2	issue: installed-vs-shipped
nano: 2 installed and not shipped files. [installed-vs-shipped]
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 2	issue: unknown-configure-option
gstd-1.0: gstd: configure was passed unrecognised options: --disable-gtk-=
doc [unknown-configure-option]
krb5-1.16: krb5: configure was passed unrecognised options: --with-pkinit=
-crypto-impl [unknown-configure-option]


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 0	issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
6138897 cooker: Fix environment double key expansion issue
not included in master yet:=20
7eec204 world-image: add extra target
5e7e759 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
073d8d0 dbus-test-ptest: improve reproducibility
not included in master yet:=20
8cdeba0 waf.bbclass: check that waf exists before trying to execute it
e925cb0 iputils: add libidn dependency
de182f8 insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
91fe8d9 kernel-devicetree.bbclass: Use lowercase names for shell variable=
s
5fb10db kernel-devicetree.bbclass: Fix and simplify instalation of DTB fi=
les
34e5003 kernel.bbclass: use the consistent naming schema for initramfs
075a8ec kernel.bbclass: move variables for kernel artifacts names to sepa=
rate bbclass
6c1f56e report-error: Allow to upload reports automatically
eed00f2 sstate.bbclass: Do not cause build failures due to setscene error=
s
abe4dea buildhistory.bbclass: metadata-revs show repo parent
2de014e metadata-revs: provide more information
aeb6ac5 qemux86: Add identical qemux86copy variant for tests
0981b15 pseudo: bump SRCREV
d95208c pseudo-text: add dummy recipe to reproduce YOCTO #12434

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
790ddac python-sqlalchemy: update to version 1.1.17
not included in master yet:=20
5fe43eb libgpiod: fix packaging of tools
73c7155 obexftp: use makefile instead of ninja cmake generator
ce32d1d geoipupdate: 2.4.0 -> 2.5.0
da1ec81 mdns: Do not include nss.h with musl
7063991 iscsi-initiator-utils: Upgrade to 2.0.876
50d876e samba: Refresh musl pam patch
c8511ca miniupnpd: update to 2.0.20180203 and add systemd service
e432cbd wireshark: Update Package to 2.2.12
2f695cb opensaf: Upgrade to 5.18.02
8550bb5 libtalloc: Upgrade to 2.1.11
ea8581c postfix: adapt pkg_postinst to postinst_intercept
79a3f2e geoip: 1.6.9 -> 1.6.11
be70b5f dhcpcd: update to 6.11.5
adc9709 wireshark: update to new 2.4.5 series
e2b18f8 openl2tp: fix compile issue with 4.15 kernel
ed26fb6 grpc: move it from oe to networking layer
8c6cda8 mosquito: move from oe to networking layer
2c30335 ntp: add libgcc as runtime dependency
9843bd0 xfce4-panel: add gtk-icon-cache to inherit
22b085f xfce4-whiskermenu-plugin: update 2.1.4 -> 2.1.5
6998e77 exo: update 0.11.5 -> 0.12.0
1eff0ba thunar: update 1.6.13 -> 1.6.14
46feb69 xfce4-timer-plugin: update 1.6.0 -> 1.7.0
1d83993 menulibre: update 2.1.3 -> 2.1.5
c2ee0ab xfce4-notifyd: update 0.4.0 -> 0.4.2
12228a4 parole: update 0.8.1 -> 1.0.0
c035fbf xfce4-pulseaudio-plugin: update 0.3.4 -> 0.3.5
e7bd08a fltk: rework packaging
c40c48e devilspie2: update 0.42 -> 0.43
3db3d41 xfce4-terminal: update 0.8.6 -> 0.8.7.1
34ad3f1 nginx: update development version to 1.13.9
b0ec76b php: Security Advisory - php - CVE-2018-5711
222d014 libtevent: update to version 0.9.36
8e7d0d6 libldb: update to version 1.3.1
7a5919e samba: update to 4.7.5
f4e2d6b nano: 2.7.4 -> 2.9.3
18bb2e2 nautilus: remove unused patches
7e20b74 breakpad: remove unused patch
5618d83 flite: remove leftover patch
7a2a568 libeigen: remove unused patch
4133bdf gst-ffmpeg: remove leftover patch
a821a1a fvwm: add new recipe
2fe6db6 cpupower: add gettext-native to DEPENDS
08bd100 ebtables: enable KERNEL_64_USERSPACE_32 for arm
6289862 kodi: add PACKAGECONFIG for samba and enable only with pam in DIS=
TRO_FEATURES
4be0306 kodi: fix indentation
a0fb611 uim: add glibc-utils glibc-gconv-euc-jp only for libc-glibc
177b578 vboxguestdrivers: upgrade to 5.2.8
94458e6 python3-cryptography: Add -pthread to link flags
6c6b3eb python-pymongo: update to version 3.6.1
dbe9be5 python-cffi: update to version 1.11.4
e176aa7 python-serpent: update to version 1.24
1c39cbd sox: backport fix for dynamically linked flac builds
b21a0b2 cppzmq: 4.2.3 update
a30919d zeromq: 4.2.3 update
5b45c83 python-pytest.inc: add ${PYTHON_PN}-doctest to RDEPENDS
e7b32f6 tipcutils: Fix builds with kernel headers >=3D 4.15
f212b78 keepalived: Upgrade from 1.3.5 -> 1.4.2
2401c44 libsdl2-mixer: Upgrade to 2.0.2
3ebf304 libyui,libyui-ncurses: Update to lates
96ef5f4 libyui-ncurses: Fix build with musl _nl_msg_cat_cntr in not avail=
able
4d1638d ebtables: Fix duplicate definition errors due to netinet/ether.h
5cbca80 openbox: Improve handling of openbox-session / gnome-openbox-sess=
ion
7de8a96 python-pynetlinux: add recipe for 1.1 version
6a5d668 python-pyexpect: add recipe for 1.0.17 version
2e33638 python3-scapy: add recipe for 0.23 version
ea43424 python-robotframework: add recipe for 3.0.2 version
ddb5acd libiio: update and improve recipe
47a6189 pyrtm: update RDEPENDS to include python-logging
b5e456f python-pymisp: add dateutil to the set of RDEPENDS
dcb84f7 phpmyadmin: update to version 4.7.9
ba86a94 phpmyadmin: add correct versions for upstream url and version reg=
ex
8a00773 hthttpd: add a valid upstream check uri and regex
6df6690 webmin: add a valid upstream check uri and regex
6308bf7 monkey: add a valid upstream check uri and regex
71161b3 python3-pid: update to version 2.2.0
39bcf03 python-scrypt: update to version 0.8.6
f36d66d python-pyjwt: update to version 1.6.0
3af87bd python-protobuf: update to version 3.5.2
c0a4fcc Add support for pyiface

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
e60e849 qtpurchasing: upgrade to 5.10.1
not included in master yet:=20
c984f40 qtbase: Add packageconfigs for renameat2 and getentropy use
fe8e38c qtbase: don't enable renameat2 by default
6e663f4 qt5-git.inc: drop nobranch=3D1
caa615b qt5: upgrade to 5.11 Alpha
caad8dd qt5-creator: upgrade to 4.5.1
9e3b496 packagegroup-qt5-toolchain-target: drop both qtwebkit packages

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
961d7f1 Merge pull request #103 from rakuco/m65-146
not included in master yet:=20


