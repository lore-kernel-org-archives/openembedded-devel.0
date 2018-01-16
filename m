Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id A4B9E78683
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 00:28:01 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id y27so2653457pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-language;
	bh=XSZJL0CIqj7loRz2/6xQG9eWc2nCUqC1oS2zuGb7Jzk=;
	b=DVaPRM6jELVy5ARvCKgzb1+rM0g/bBveHf2DLHdi1aA42MLFyLx8IozX0EifSHva5t
	2DO49ETIDIati2jGUaMt9EjOAHwjnC49R1k4YRdsjOVjNIP4KtVb2rOxKIIvZ586Xxim
	M1iULlJChFEJeuWUu1+J6o6GX2gsieijMkTzXl1SWEn2IDxQO+loNN1kUITJvko+2e+3
	ZsprNFlHVaKu6e6tuxgprQS9x/JGcomnN+tvBvXORvVTVVIqU9kgFB5VgIbYM9UgwNtB
	ol77nmA48SImB1tU7eOAMDRPvpqhoRDAurqu8FagtR74x0bSQToJ/L38Z5RkS2St73Dy
	XYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-language;
	bh=XSZJL0CIqj7loRz2/6xQG9eWc2nCUqC1oS2zuGb7Jzk=;
	b=a0ZlDuf18iB6LpKBzeTglqpfCo7ZOROC3tGe+LqPrgbLzK8q2M+YCLPxWG6G/bRFA9
	nRgU33O8pypHQQCapcqht6RV9ycUHoJ6SI0r1p52FQArwiZNs1C0BD7xK35kT/vCd1os
	EYTSD3w7FYStSG4+jO9yMVvIoJIqSqrv+T7yJQ3NRlh2HcYtbvHL8DVbcoCGDppN9erS
	2tdLb86FWL+YBpj6U6duOySkj0pRxTWSZwsyn4P2/02fveeUEpTFlgjgAjnmweMo0kXe
	x83dUZ27RV7zq9M8CoZsnl6MJeImrzOFyWijRZm6XQCYB0aOpct/P+RJueeoMUS1C8UT
	Dxdg==
X-Gm-Message-State: AKGB3mKf4dXSDxj1Vkm3CtMxLWXUC37J/g7g1V8aniN8v58C2WxaEy4x
	Qv2WC+MgCwXI9OQkbhnXQl5OzA==
X-Google-Smtp-Source: ACJfBos5Y6NNobjmJn4GvWDEQtf598vwcqoqGUfbhzLMEq4JDseN8wV1rxs32lnVkvQq3VQ/Kz8adw==
X-Received: by 10.99.154.66 with SMTP id e2mr29825403pgo.113.1516062481173;
	Mon, 15 Jan 2018 16:28:01 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:94e2:24fc:6a2d:d1a9?
	([2601:202:4000:1184:94e2:24fc:6a2d:d1a9])
	by smtp.gmail.com with ESMTPSA id
	y79sm814603pfb.177.2018.01.15.16.27.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 16:28:00 -0800 (PST)
From: akuster808 <akuster808@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-ID: <992d5005-cdb7-8d11-8ad5-876626e369d0@gmail.com>
Date: Mon, 15 Jan 2018 16:27:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2018-01-13
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
X-List-Received-Date: Tue, 16 Jan 2018 00:28:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=20

=3D=3D Failed tasks 2018-01-13 =3D=3D

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20180115_123951.log

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepal=
ived_1.3.5.bb:do_configure
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguar=
d-module_0.0.20171221.bb:do_compile
   =C2=A0* meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.=
0.1.bb:do_configure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (5) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_gi=
t.bb:do_packagedata
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa
    * openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb:d=
o_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_c=
ompile

=3D=3D=3D qemuarm64 (6) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
    * meta-qt5/recipes-qt/qt5/qtremoteobjects_git.bb:do_compile
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:d=
o_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_c=
onfigure

=3D=3D=3D qemux86 (29) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3=
274.0.r517731.igalia.1.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-x11_62.0.3202.94.bb:=
do_compile
    * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compil=
e
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_=
4.7.0.bb:do_patch
    * meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-u=
tils/iscsi-initiator-utils_2.0.874.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
=2E17.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
=2E3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.5=
0.9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
=2E8beta5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_gi=
t.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6=
=2E1.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-syste=
md_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-system=
d_234.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-b=
ootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.4.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3=
274.0.r517731.igalia.1.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-serve=
r_git.bb:do_compile

=3D=3D=3D Number of failed tasks (60) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/=
log.world.qemuarm.20180112_131452.log/ || http://errors.yoctoproject.org/=
Errors/Build/51040/
|-
|| qemuarm64 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemuarm64.20180113_142034.log/ || http://errors.yoctoproject=
=2Eorg/Errors/Build/51069/
|-
|| qemux86 	|| 33	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemux86.20180112_131511.log/ || http://errors.yoctoproject.org=
/Errors/Build/51039/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemux86-64.20180113_134945.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/51068/
|}

=3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D

=3D=3D=3D QA issues (564) =3D=3D=3D
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
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||installed-vs-shipped
|-
||2	||textrel
|-
||36	||version-going-backwards
|-
||4	||host-user-contaminated
|-
||521	||qa_pseudo
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20180114_205016.log/


    * ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe=
/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.b=
b RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPE=
NDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps


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


count: 2	issue: textrel
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' h=
as relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.=
148' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 36	issue: version-going-backwards
python3-can-2.0.0: Package version for package python3-can-dbg went backw=
ards which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.=
0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-dbg went backw=
ards which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0=
) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-dbg went backw=
ards which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0=
) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-dev went backw=
ards which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.=
0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-dev went backw=
ards which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0=
) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-dev went backw=
ards which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0=
) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-doc went backw=
ards which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.=
0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-doc went backw=
ards which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0=
) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-doc went backw=
ards which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0=
) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-locale went ba=
ckwards which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-=
r0.0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-locale went ba=
ckwards which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r=
0.0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-locale went ba=
ckwards which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r=
0.0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-staticdev went=
 backwards which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0=
=2E0-r0.0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-staticdev went=
 backwards which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.=
0-r0.0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can-staticdev went=
 backwards which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.=
0-r0.0) [version-going-backwards]
python3-can-2.0.0: Package version for package python3-can went backwards=
 which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.0) [=
version-going-backwards]
python3-can-2.0.0: Package version for package python3-can went backwards=
 which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0) [v=
ersion-going-backwards]
python3-can-2.0.0: Package version for package python3-can went backwards=
 which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0) [v=
ersion-going-backwards]
python-can-2.0.0: Package version for package python-can-dbg went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.0)=
 [version-going-backwards]
python-can-2.0.0: Package version for package python-can-dbg went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0) =
[version-going-backwards]
python-can-2.0.0: Package version for package python-can-dbg went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0) =
[version-going-backwards]
python-can-2.0.0: Package version for package python-can-dev went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.0)=
 [version-going-backwards]
python-can-2.0.0: Package version for package python-can-dev went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0) =
[version-going-backwards]
python-can-2.0.0: Package version for package python-can-dev went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0) =
[version-going-backwards]
python-can-2.0.0: Package version for package python-can-doc went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.0)=
 [version-going-backwards]
python-can-2.0.0: Package version for package python-can-doc went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0) =
[version-going-backwards]
python-can-2.0.0: Package version for package python-can-doc went backwar=
ds which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0) =
[version-going-backwards]
python-can-2.0.0: Package version for package python-can-locale went back=
wards which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0=
=2E0) [version-going-backwards]
python-can-2.0.0: Package version for package python-can-locale went back=
wards which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.=
0) [version-going-backwards]
python-can-2.0.0: Package version for package python-can-locale went back=
wards which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.=
0) [version-going-backwards]
python-can-2.0.0: Package version for package python-can-staticdev went b=
ackwards which would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0=
-r0.0) [version-going-backwards]
python-can-2.0.0: Package version for package python-can-staticdev went b=
ackwards which would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-=
r0.0) [version-going-backwards]
python-can-2.0.0: Package version for package python-can-staticdev went b=
ackwards which would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-=
r0.0) [version-going-backwards]
python-can-2.0.0: Package version for package python-can went backwards w=
hich would break package feeds from (0:2.0.0b1-r0.12 to 0:2.0.0-r0.0) [ve=
rsion-going-backwards]
python-can-2.0.0: Package version for package python-can went backwards w=
hich would break package feeds from (0:2.0.0b1-r0.5 to 0:2.0.0-r0.0) [ver=
sion-going-backwards]
python-can-2.0.0: Package version for package python-can went backwards w=
hich would break package feeds from (0:2.0.0b1-r0.8 to 0:2.0.0-r0.0) [ver=
sion-going-backwards]


count: 4	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-qa/usr/lib/l=
ocale/ar_QA/LC_MEASUREMENT is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-hif-fj/usr/lib/=
locale/hif_FJ/LC_CTYPE is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-conta=
minated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-nl-be/usr/lib/l=
ocale/nl_BE/LC_PAPER is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contami=
nated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-sq-mk/usr/lib/l=
ocale/sq_MK/LC_PAPER is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contami=
nated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 521	issue: qa_pseudo
acl-2.2.52: This /work/i586-oe-linux-musl/acl/2.2.52-r0/pseudo/pseudo.log=
 indicates 4 errors [qa_pseudo]
alsa-lib-1.1.5: This /work/i586-oe-linux-musl/alsa-lib/1.1.5-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
alsa-tools-1.1.5: This /work/core2-64-oe-linux/alsa-tools/1.1.5-r0/pseudo=
/pseudo.log indicates 16 errors [qa_pseudo]
android-tools-5.1.1.r37: This /work/core2-64-oe-linux/android-tools/5.1.1=
=2Er37-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
aoetools-36: This /work/i586-oe-linux-musl/aoetools/36-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
apache2-2.4.29: This /work/aarch64-oe-linux/apache2/2.4.29-r0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
apache2-2.4.29: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.29-r0/pse=
udo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.29: This /work/core2-64-oe-linux/apache2/2.4.29-r0/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
apache2-2.4.29: This /work/i586-oe-linux-musl/apache2/2.4.29-r0/pseudo/ps=
eudo.log indicates 7 errors [qa_pseudo]
apmd-3.2.2-15: This /work/core2-64-oe-linux/apmd/3.2.2-15-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
apmd-3.2.2-15: This /work/i586-oe-linux-musl/apmd/3.2.2-15-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
apr-1.6.2: This /work/i586-oe-linux-musl/apr/1.6.2-r0/pseudo/pseudo.log i=
ndicates 16 errors [qa_pseudo]
apr-util-1.6.0: This /work/aarch64-oe-linux/apr-util/1.6.0-r1/pseudo/pseu=
do.log indicates 20 errors [qa_pseudo]
apr-util-1.6.0: This /work/armv5te-oe-linux-gnueabi/apr-util/1.6.0-r1/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
atftp-0.7.1+gitAUTOINC+be3291a18c: This /work/armv5te-oe-linux-gnueabi/at=
ftp/0.7.1+gitAUTOINC+be3291a18c-r3/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
attr-2.4.47: This /work/aarch64-oe-linux/attr/2.4.47-r0/pseudo/pseudo.log=
 indicates 4 errors [qa_pseudo]
attr-2.4.47: This /work/armv5te-oe-linux-gnueabi/attr/2.4.47-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
attr-2.4.47: This /work/core2-64-oe-linux/attr/2.4.47-r0/pseudo/pseudo.lo=
g indicates 4 errors [qa_pseudo]
attr-2.4.47: This /work/i586-oe-linux-musl/attr/2.4.47-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
autofs-5.1.2: This /work/armv5te-oe-linux-gnueabi/autofs/5.1.2-r0/pseudo/=
pseudo.log indicates 18 errors [qa_pseudo]
automake-1.15.1: This /work/armv5te-oe-linux-gnueabi/automake/1.15.1-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
babeltrace-1.5.3: This /work/core2-64-oe-linux/babeltrace/1.5.3-r0/pseudo=
/pseudo.log indicates 16 errors [qa_pseudo]
beecrypt-4.2.1: This /work/aarch64-oe-linux/beecrypt/4.2.1-r3/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
beecrypt-4.2.1: This /work/armv5te-oe-linux-gnueabi/beecrypt/4.2.1-r3/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]
bluez5-5.47: This /work/aarch64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
bluez5-5.47: This /work/armv5te-oe-linux-gnueabi/bluez5/5.47-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
bluez5-5.47: This /work/core2-64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
bluez5-5.47: This /work/i586-oe-linux-musl/bluez5/5.47-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This /work/aarch64-oe-linux/can-uti=
ls/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseudo.log indicates 10 errors [q=
a_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This /work/i586-oe-linux-musl/can-u=
tils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
chromium-x11-62.0.3202.94: This /work/core2-64-oe-linux/chromium-x11/62.0=
=2E3202.94-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
chrony-3.2: This /work/aarch64-oe-linux/chrony/3.2-r0/pseudo/pseudo.log i=
ndicates 4 errors [qa_pseudo]
chrony-3.2: This /work/armv5te-oe-linux-gnueabi/chrony/3.2-r0/pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
chrony-3.2: This /work/core2-64-oe-linux/chrony/3.2-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
chrony-3.2: This /work/i586-oe-linux-musl/chrony/3.2-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]
chrpath-0.16: This /work/aarch64-oe-linux/chrpath/0.16-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
collectd-5.7.2: This /work/i586-oe-linux-musl/collectd/5.7.2-r0/pseudo/ps=
eudo.log indicates 18 errors [qa_pseudo]
connman-1.35: This /work/i586-oe-linux-musl/connman/1.35-r0/pseudo/pseudo=
=2Elog indicates 18 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/aarch64-oe-linux/conntrack-tools/1.4.4-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/i586-oe-linux-musl/conntrack-tools/1.4.=
4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
coreutils-8.28: This /work/aarch64-oe-linux/coreutils/8.28-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
coreutils-8.28: This /work/core2-64-oe-linux/coreutils/8.28-r0/pseudo/pse=
udo.log indicates 4 errors [qa_pseudo]
cryptodev-tests-1.9: This /work/core2-64-oe-linux/cryptodev-tests/1.9-r0/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log i=
ndicates 4 errors [qa_pseudo]
ctdb-2.5.6: This /work/i586-oe-linux-musl/ctdb/2.5.6-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]
cups-2.2.6: This /work/armv5te-oe-linux-gnueabi/cups/2.2.6-r0/pseudo/pseu=
do.log indicates 18 errors [qa_pseudo]
curlpp-0.8.1: This /work/aarch64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
curlpp-0.8.1: This /work/armv5te-oe-linux-gnueabi/curlpp/0.8.1-r0/pseudo/=
pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
curlpp-0.8.1: This /work/i586-oe-linux-musl/curlpp/0.8.1-r0/pseudo/pseudo=
=2Elog indicates 7 errors [qa_pseudo]
dfu-util-0.9: This /work/armv5te-oe-linux-gnueabi/dfu-util/0.9-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/aarch64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux-musl/dhcp/4.3.6-r0/pseudo/pseudo.log=
 indicates 12 errors [qa_pseudo]
distcc-3.2: This /work/core2-64-oe-linux/distcc/3.2-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
dleyna-server-0.6.0: This /work/i586-oe-linux-musl/dleyna-server/0.6.0-r0=
/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
dnf-2.7.5: This /work/i586-oe-linux-musl/dnf/2.7.5-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
dovecot-2.2.29: This /work/aarch64-oe-linux/dovecot/2.2.29-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
dovecot-2.2.29: This /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pse=
udo.log indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This /work/i586-oe-linux-musl/dovecot/2.2.29-r0/pseudo/ps=
eudo.log indicates 15 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/aarch64-oe-linux/ebtables/2.0.10-4-r4/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-=
r4/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseu=
do/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/i586-oe-linux-musl/ebtables/2.0.10-4-r4/pse=
udo/pseudo.log indicates 7 errors [qa_pseudo]
eglinfo-fb-1.0.0: This /work/armv5te-oe-linux-gnueabi/eglinfo-fb/1.0.0-r0=
/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
enchant-1.6.0: This /work/core2-64-oe-linux/enchant/1.6.0-r3/pseudo/pseud=
o.log indicates 15 errors [qa_pseudo]
esound-0.2.41: This /work/i586-oe-linux-musl/esound/0.2.41-r0/pseudo/pseu=
do.log indicates 18 errors [qa_pseudo]
eventlog-0.2.13: This /work/aarch64-oe-linux/eventlog/0.2.13-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
exfat-utils-1.2.3: This /work/core2-64-oe-linux/exfat-utils/1.2.3-r0/pseu=
do/pseudo.log indicates 10 errors [qa_pseudo]
expat-2.2.5: This /work/aarch64-oe-linux/expat/2.2.5-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
expat-2.2.5: This /work/core2-64-oe-linux/expat/2.2.5-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
firefox-l10n-ru-45.9.0esr: This /work/all-oe-linux/firefox-l10n-ru/45.9.0=
esr-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
fluentbit-0.12.1: This /work/core2-64-oe-linux/fluentbit/0.12.1-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
freetype-2.8.1: This /work/i586-oe-linux-musl/freetype/2.8.1-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
fstests-0.1+gitAUTOINC+e5939ff608: This /work/i586-oe-linux-musl/fstests/=
0.1+gitAUTOINC+e5939ff608-r0/pseudo/pseudo.log indicates 18 errors [qa_ps=
eudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/aarch64-oe-linux/gateone/1.=
2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseud=
o]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/armv5te-oe-linux-gnueabi/ga=
teone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [=
qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1=
=2E2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_ps=
eudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/i586-oe-linux-musl/gateone/=
1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pse=
udo]
gawk-4.2.0: This /work/core2-64-oe-linux/gawk/4.2.0-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
gcc-7.2.0: This /work/armv5e-oe-linux-gnueabi/gcc/7.2.0-r0/pseudo/pseudo.=
log indicates 6 errors [qa_pseudo]
giflib-5.1.4: This /work/armv5te-oe-linux-gnueabi/giflib/5.1.4-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
glew-2.1.0: This /work/armv5te-oe-linux-gnueabi/glew/2.1.0-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
glib-2.0-2.54.2: This /work/aarch64-oe-linux/glib-2.0/1_2.54.2-r0/pseudo/=
pseudo.log indicates 20 errors [qa_pseudo]
glibc-2.26: This /work/aarch64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log i=
ndicates 6 errors [qa_pseudo]
glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseud=
o.log indicates 63 errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
glibc-locale-2.26: This /work/aarch64-oe-linux/glibc-locale/2.26-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r=
0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
glibc-locale-2.26: This /work/core2-64-oe-linux/glibc-locale/2.26-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
gnome-menus3-3.10.1: This /work/core2-64-oe-linux/gnome-menus3/3.10.1-r0/=
pseudo/pseudo.log indicates 16 errors [qa_pseudo]
grail-3.1.1: This /work/i586-oe-linux-musl/grail/3.1.1-r0/pseudo/pseudo.l=
og indicates 17 errors [qa_pseudo]
grub-2.02: This /work/core2-64-oe-linux/grub/2.02-r0/pseudo/pseudo.log in=
dicates 11 errors [qa_pseudo]
gst-plugins-bad-0.10.23: This /work/i586-oe-linux-musl/gst-plugins-bad/0.=
10.23-r4/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gstreamer1.0-plugins-ugly-1.12.4: This /work/armv5te-oe-linux-gnueabi/gst=
reamer1.0-plugins-ugly/1.12.4-r0/pseudo/pseudo.log indicates 18 errors [q=
a_pseudo]
hdparm-9.52: This /work/core2-64-oe-linux/hdparm/9.52-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
hidapi-0.7.99+0.8.0-rc1+gitAUTOINC+d17db57b9d: This /work/i586-oe-linux-m=
usl/hidapi/0.7.99+0.8.0-rc1+gitAUTOINC+d17db57b9d-r0/pseudo/pseudo.log in=
dicates 18 errors [qa_pseudo]
htop-2.0.2: This /work/aarch64-oe-linux/htop/2.0.2-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
icu-60.1: This /work/aarch64-oe-linux/icu/60.1-r0/pseudo/pseudo.log indic=
ates 5 errors [qa_pseudo]
icu-60.1: This /work/armv5e-oe-linux-gnueabi/icu/60.1-r0/pseudo/pseudo.lo=
g indicates 6 errors [qa_pseudo]
icu-60.1: This /work/core2-64-oe-linux/icu/60.1-r0/pseudo/pseudo.log indi=
cates 5 errors [qa_pseudo]
icu-60.1: This /work/i586-oe-linux-musl/icu/60.1-r0/pseudo/pseudo.log ind=
icates 8 errors [qa_pseudo]
iotop-0.6: This /work/aarch64-oe-linux/iotop/0.6-r0/pseudo/pseudo.log ind=
icates 4 errors [qa_pseudo]
ipmiutil-3.0.5: This /work/core2-64-oe-linux/ipmiutil/3.0.5-r0/pseudo/pse=
udo.log indicates 4 errors [qa_pseudo]
kexecboot-klibc-0.6+gitAUTOINC+4c4f127e79: This /work/qemux86_64-oe-linux=
/kexecboot-klibc/0.6+gitAUTOINC+4c4f127e79-r0/pseudo/pseudo.log indicates=
 10 errors [qa_pseudo]
lame-3.100: This /work/i586-oe-linux-musl/lame/3.100-r0/pseudo/pseudo.log=
 indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/=
0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/=
lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/i586-oe-linux-musl/lcdpro=
c/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [q=
a_pseudo]
leveldb-1.20+gitAUTOINC+a53934a3ae: This /work/aarch64-oe-linux/leveldb/1=
=2E20+gitAUTOINC+a53934a3ae-r0/pseudo/pseudo.log indicates 4 errors [qa_p=
seudo]
lftp-4.7.7: This /work/i586-oe-linux-musl/lftp/4.7.7-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]
libarchive-3.3.2: This /work/aarch64-oe-linux/libarchive/3.3.2-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/i586-oe-linux-musl/libatasmart/0.19-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
libclass-method-modifiers-perl-2.12: This /work/aarch64-oe-linux/libclass=
-method-modifiers-perl/2.12-r0/pseudo/pseudo.log indicates 9 errors [qa_p=
seudo]
libcomps-0.1.8+gitAUTOINC+01a4759894: This /work/i586-oe-linux-musl/libco=
mps/0.1.8+gitAUTOINC+01a4759894-r0/pseudo/pseudo.log indicates 19 errors =
[qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/l=
ibconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-g=
nueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log in=
dicates 13 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/=
libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates=
 11 errors [qa_pseudo]
libdevmapper-2.02.171: This /work/i586-oe-linux-musl/libdevmapper/2.02.17=
1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libdigest-hmac-perl-1.03: This /work/i586-oe-linux-musl/libdigest-hmac-pe=
rl/1.03-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libdmx-1.1.3: This /work/aarch64-oe-linux/libdmx/1_1.1.3-r0/pseudo/pseudo=
=2Elog indicates 9 errors [qa_pseudo]
libee-0.4.1: This /work/aarch64-oe-linux/libee/0.4.1-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
libencode-perl-2.83: This /work/core2-64-oe-linux/libencode-perl/2.83-r0/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libevent-2.1.8: This /work/i586-oe-linux-musl/libevent/2.1.8-r0/pseudo/ps=
eudo.log indicates 6 errors [qa_pseudo]
libgpiod-0.3.2: This /work/armv5te-oe-linux-gnueabi/libgpiod/0.3.2-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
libgpiod-0.3.2: This /work/core2-64-oe-linux/libgpiod/0.3.2-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
libiec61883-1.2.0: This /work/i586-oe-linux-musl/libiec61883/1.2.0-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
libldb-1.2.2: This /work/aarch64-oe-linux/libldb/1.2.2-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
libldb-1.2.2: This /work/core2-64-oe-linux/libldb/1.2.2-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
libmtp-1.1.5: This /work/i586-oe-linux-musl/libmtp/1.1.5-r0/pseudo/pseudo=
=2Elog indicates 6 errors [qa_pseudo]
libnl-3.2.29: This /work/aarch64-oe-linux/libnl/1_3.2.29-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
libotr-4.1.1: This /work/i586-oe-linux-musl/libotr/4.1.1-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqof=
ono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueab=
i/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 12=
 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqo=
fono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 10 errors=
 [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/i586-oe-linux-musl/libq=
ofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
libsamplerate0-0.1.9: This /work/aarch64-oe-linux/libsamplerate0/0.1.9-r1=
/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libsm-1.2.2: This /work/armv5te-oe-linux-gnueabi/libsm/1_1.2.2-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
libsndfile1-1.0.28: This /work/core2-64-oe-linux/libsndfile1/1.0.28-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/aarch64-oe-linux/libtool-cross/2.4.6-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/armv5te-oe-linux-gnueabi/libtool-cross/2.=
4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/core2-64-oe-linux/libtool-cross/2.4.6-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/i586-oe-linux-musl/libtool-cross/2.4.6-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9=
=2E11-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/=
pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/i586-oe-linux-musl/libvncserver/0.9.11-r0=
/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/aarch64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
libxcb-1.12: This /work/core2-64-oe-linux/libxcb/1.12-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
libxfont-1.5.4: This /work/armv5te-oe-linux-gnueabi/libxfont/1_1.5.4-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
libxml-libxml-perl-2.0131: This /work/core2-64-oe-linux/libxml-libxml-per=
l/2.0131-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
linux-atm-2.5.2: This /work/qemuarm64-oe-linux/linux-atm/2.5.2-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux-musl/lirc/0.9.4d-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
lksctp-tools-1.0.17+gitAUTOINC+736b91d340: This /work/i586-oe-linux-musl/=
lksctp-tools/1.0.17+gitAUTOINC+736b91d340-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
llvm-5.0: This /work/aarch64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indic=
ates 11 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux-musl/llvm/5.0-r0/pseudo/pseudo.log ind=
icates 12 errors [qa_pseudo]
log4cpp-1.1.2: This /work/aarch64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo=
=2Elog indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseud=
o/pseudo.log indicates 6 errors [qa_pseudo]
log4cpp-1.1.2: This /work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
logcheck-1.3.18: This /work/armv5te-oe-linux-gnueabi/logcheck/1.3.18-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/aarch64-oe-linux/lttng-tools/2.9.5-r0/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseu=
do/pseudo.log indicates 16 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/i586-oe-linux-musl/lttng-tools/2.9.5-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
lvm2-2.02.171: This /work/core2-64-oe-linux/lvm2/2.02.171-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/aarch64-oe-=
linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-=
linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo=
/pseudo.log indicates 17 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe=
-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/i586-oe-lin=
ux-musl/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseud=
o.log indicates 13 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/armv5te-oe-li=
nux-gnueabi/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
mc-4.8.20: This /work/armv5te-oe-linux-gnueabi/mc/4.8.20-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
mc-4.8.20: This /work/core2-64-oe-linux/mc/4.8.20-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
menulibre-2.1.3: This /work/armv5te-oe-linux-gnueabi/menulibre/2.1.3-r0/p=
seudo/pseudo.log indicates 6 errors [qa_pseudo]
meson-0.40.1: This /work/core2-64-oe-linux/meson/0.40.1-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
mongodb-3.4.6+gitAUTOINC+c55eb86ef4: This /work/aarch64-oe-linux/mongodb/=
3.4.6+gitAUTOINC+c55eb86ef4-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
mosquitto-1.4.14: This /work/aarch64-oe-linux/mosquitto/1.4.14-r0/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0=
/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mosquitto-1.4.14: This /work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/i586-oe-linux-musl/mosquitto/1.4.14-r0/pseud=
o/pseudo.log indicates 6 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/core2-64-oe-linux/mozilla-devscripts/=
0.30-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/i586-oe-linux-musl/mozilla-devscripts=
/0.30-r1/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mpeg2dec-0.5.1: This /work/i586-oe-linux-musl/mpeg2dec/0.5.1-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
mpich-3.2: This /work/aarch64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log ind=
icates 4 errors [qa_pseudo]
mpich-3.2: This /work/armv5te-oe-linux-gnueabi/mpich/3.2-r0/pseudo/pseudo=
=2Elog indicates 6 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]
msmtp-1.6.6: This /work/armv5te-oe-linux-gnueabi/msmtp/1.6.6-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
mtd-utils-2.0.0: This /work/i586-oe-linux-musl/mtd-utils/2.0.0-r0/pseudo/=
pseudo.log indicates 6 errors [qa_pseudo]
multipath-tools-0.7.1: This /work/i586-oe-linux-musl/multipath-tools/0.7.=
1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nbd-3.11: This /work/core2-64-oe-linux/nbd/3.11-r0/pseudo/pseudo.log indi=
cates 15 errors [qa_pseudo]
ncurses-6.0+20170715: This /work/aarch64-oe-linux/ncurses/6.0+20170715-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
netdata-1.8.0+gitAUTOINC+89ed309252: This /work/armv5te-oe-linux-gnueabi/=
netdata/1.8.0+gitAUTOINC+89ed309252-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
netdata-1.8.0+gitAUTOINC+89ed309252: This /work/core2-64-oe-linux/netdata=
/1.8.0+gitAUTOINC+89ed309252-r0/pseudo/pseudo.log indicates 16 errors [qa=
_pseudo]
net-snmp-5.7.3: This /work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseu=
do.log indicates 16 errors [qa_pseudo]
networkmanager-1.4.4: This /work/armv5te-oe-linux-gnueabi/networkmanager/=
1.4.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
nginx-1.12.2: This /work/aarch64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
nginx-1.12.2: This /work/armv5te-oe-linux-gnueabi/nginx/1.12.2-r0/pseudo/=
pseudo.log indicates 14 errors [qa_pseudo]
nginx-1.12.2: This /work/core2-64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.=
log indicates 6 errors [qa_pseudo]
nginx-1.12.2: This /work/i586-oe-linux-musl/nginx/1.12.2-r0/pseudo/pseudo=
=2Elog indicates 8 errors [qa_pseudo]
nodejs-8.9.0: This /work/aarch64-oe-linux/nodejs/8.9.0-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
nspr-4.17: This /work/aarch64-oe-linux/nspr/4.17-r0/pseudo/pseudo.log ind=
icates 5 errors [qa_pseudo]
ntp-4.2.8p10: This /work/aarch64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/=
pseudo.log indicates 13 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.=
log indicates 18 errors [qa_pseudo]
ntp-4.2.8p10: This /work/i586-oe-linux-musl/ntp/4.2.8p10-r0/pseudo/pseudo=
=2Elog indicates 14 errors [qa_pseudo]
openhpi-3.6.1: This /work/i586-oe-linux-musl/openhpi/3.6.1-r0/pseudo/pseu=
do.log indicates 20 errors [qa_pseudo]
open-isns-0.97: This /work/aarch64-oe-linux/open-isns/0.97-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
open-isns-0.97: This /work/armv5te-oe-linux-gnueabi/open-isns/0.97-r0/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]
open-isns-0.97: This /work/core2-64-oe-linux/open-isns/0.97-r0/pseudo/pse=
udo.log indicates 4 errors [qa_pseudo]
openldap-2.4.45: This /work/armv5te-oe-linux-gnueabi/openldap/2.4.45-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
openlmi-tools-0.10.5: This /work/aarch64-oe-linux/openlmi-tools/0.10.5-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
openlmi-tools-0.10.5: This /work/core2-64-oe-linux/openlmi-tools/0.10.5-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/ps=
eudo.log indicates 18 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/p=
seudo/pseudo.log indicates 17 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/p=
seudo.log indicates 16 errors [qa_pseudo]
openssh-7.6p1: This /work/aarch64-oe-linux/openssh/7.6p1-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
openssh-7.6p1: This /work/core2-64-oe-linux/openssh/7.6p1-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
openssh-7.6p1: This /work/i586-oe-linux-musl/openssh/7.6p1-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
openssl-1.0.2m: This /work/aarch64-oe-linux/openssl/1.0.2m-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/aarch64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/p=
seudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/p=
seudo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/i586-oe-linux-musl/ossp-uuid/1.6.2-r2/pseudo/=
pseudo.log indicates 6 errors [qa_pseudo]
packagegroup-go-sdk-target-1.0: This /work/all-oe-linux/packagegroup-go-s=
dk-target/1.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
paho-mqtt-c-1.2.0: This /work/core2-64-oe-linux/paho-mqtt-c/1.2.0-r0/pseu=
do/pseudo.log indicates 10 errors [qa_pseudo]
pango-1.40.12: This /work/aarch64-oe-linux/pango/1.40.12-r0/pseudo/pseudo=
=2Elog indicates 16 errors [qa_pseudo]
pcsc-lite-1.8.22: This /work/core2-64-oe-linux/pcsc-lite/1.8.22-r0/pseudo=
/pseudo.log indicates 16 errors [qa_pseudo]
perf-1.0: This /work/qemuarm-oe-linux-gnueabi/perf/1.0-r9/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/aarch64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log ind=
icates 12 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.=
log indicates 14 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux-musl/php/7.1.9-r0/pseudo/pseudo.log i=
ndicates 13 errors [qa_pseudo]
pkcs11-helper-1.11: This /work/aarch64-oe-linux/pkcs11-helper/1.11-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
pm-qa-0.5.2: This /work/aarch64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log=
 indicates 7 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/ps=
eudo.log indicates 47 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.lo=
g indicates 37 errors [qa_pseudo]
poppler-0.57.0: This /work/armv5te-oe-linux-gnueabi/poppler/0.57.0-r0/pse=
udo/pseudo.log indicates 16 errors [qa_pseudo]
popt-1.16: This /work/aarch64-oe-linux/popt/1.16-r3/pseudo/pseudo.log ind=
icates 4 errors [qa_pseudo]
popt-1.16: This /work/armv5te-oe-linux-gnueabi/popt/1.16-r3/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
popt-1.16: This /work/core2-64-oe-linux/popt/1.16-r3/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This /work/aarch64-oe-linux/portaudio-v19/v190600-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
portaudio-v19-v190600: This /work/armv5te-oe-linux-gnueabi/portaudio-v19/=
v190600-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
portaudio-v19-v190600: This /work/core2-64-oe-linux/portaudio-v19/v190600=
-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
postfix-3.2.2: This /work/aarch64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
postfix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.15: This /work/aarch64-oe-linux/postgresql/9.4.15-r0/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]
postgresql-9.4.15: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.15-r=
0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.15: This /work/core2-64-oe-linux/postgresql/9.4.15-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.15: This /work/i586-oe-linux-musl/postgresql/9.4.15-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
ppp-2.4.7: This /work/i586-oe-linux-musl/ppp/2.4.7-r0/pseudo/pseudo.log i=
ndicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/aarch64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseud=
o/pseudo.log indicates 14 errors [qa_pseudo]
proftpd-1.3.6: This /work/i586-oe-linux-musl/proftpd/1.3.6-r0/pseudo/pseu=
do.log indicates 14 errors [qa_pseudo]
psqlodbc-09.05.0300: This /work/armv5te-oe-linux-gnueabi/psqlodbc/09.05.0=
300-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
psqlodbc-09.05.0300: This /work/core2-64-oe-linux/psqlodbc/09.05.0300-r0/=
pseudo/pseudo.log indicates 16 errors [qa_pseudo]
pyrtm-0.4.2: This /work/core2-64-oe-linux/pyrtm/0.4.2-r0/pseudo/pseudo.lo=
g indicates 4 errors [qa_pseudo]
python-2.7.13: This /work/aarch64-oe-linux/python/2.7.13-r1/pseudo/pseudo=
=2Elog indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/i586-oe-linux-musl/python/2.7.13-r1/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/aarch64-oe-linux/python3/3.5.3-r1.0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pse=
udo/pseudo.log indicates 7 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pse=
udo.log indicates 9 errors [qa_pseudo]
python3-alembic-0.9.6: This /work/armv5te-oe-linux-gnueabi/python3-alembi=
c/0.9.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-automat-0.6.0: This /work/aarch64-oe-linux/python3-automat/0.6.0-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-blivetgui-2.1.5: This /work/aarch64-oe-linux/python3-blivetgui/2.=
1.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-chardet-3.0.4: This /work/core2-64-oe-linux/python3-chardet/3.0.4=
-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-coverage-4.4.2: This /work/armv5te-oe-linux-gnueabi/python3-cover=
age/4.4.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-flask-0.12.2: This /work/aarch64-oe-linux/python3-flask/0.12.2-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-flask-0.12.2: This /work/i586-oe-linux-musl/python3-flask/0.12.2-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-flask-nav-0.6: This /work/armv5te-oe-linux-gnueabi/python3-flask-=
nav/0.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-gsocketpool-0.1.6: This /work/core2-64-oe-linux/python3-gsocketpo=
ol/0.1.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-hyperlink-17.3.1: This /work/i586-oe-linux-musl/python3-hyperlink=
/17.3.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-iso8601-0.1.12: This /work/armv5te-oe-linux-gnueabi/python3-iso86=
01/0.1.12-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-isort-4.2.15: This /work/aarch64-oe-linux/python3-isort/4.2.15-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-isort-4.2.15: This /work/i586-oe-linux-musl/python3-isort/4.2.15-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-jsonpatch-1.21: This /work/aarch64-oe-linux/python3-jsonpatch/1.2=
1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-jsonpointer-1.14: This /work/i586-oe-linux-musl/python3-jsonpoint=
er/1.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-jsonschema-2.6.0: This /work/i586-oe-linux-musl/python3-jsonschem=
a/2.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-msgpack-0.5.1: This /work/aarch64-oe-linux/python3-msgpack/0.5.1-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-netaddr-0.7.19: This /work/core2-64-oe-linux/python3-netaddr/0.7.=
19-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This /work/aarch64-oe-linux/python3-pip/9.0.1-r0/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This /work/armv5te-oe-linux-gnueabi/python3-pip/9.0.1-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pip-9.0.1: This /work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python3-pyasn1-0.4.2: This /work/core2-64-oe-linux/python3-pyasn1/0.4.2-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pybind11-2.2.1: This /work/armv5te-oe-linux-gnueabi/python3-pybin=
d11/2.2.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-pycrypto-2.6.1: This /work/core2-64-oe-linux/python3-pycrypto/2.6=
=2E1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pykickstart-2.35: This /work/i586-oe-linux-musl/python3-pykicksta=
rt/2.35-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/aarch64-oe-linux/python3-pylint/1.8.1-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/armv5te-oe-linux-gnueabi/python3-pylint/=
1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/core2-64-oe-linux/python3-pylint/1.8.1-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/i586-oe-linux-musl/python3-pylint/1.8.1-=
r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-pytest-3.3.2: This /work/aarch64-oe-linux/python3-pytest/3.3.2-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pytest-runner-3.0: This /work/core2-64-oe-linux/python3-pytest-ru=
nner/3.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-requests-ftp-0.3.1: This /work/i586-oe-linux-musl/python3-request=
s-ftp/0.3.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-six-1.11.0: This /work/i586-oe-linux-musl/python3-six/1.11.0-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-xlrd-1.1.0: This /work/i586-oe-linux-musl/python3-xlrd/1.1.0-r0/p=
seudo/pseudo.log indicates 6 errors [qa_pseudo]
python-automat-0.6.0: This /work/aarch64-oe-linux/python-automat/0.6.0-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-babel-2.5.1: This /work/aarch64-oe-linux/python-babel/2.5.1-r0/pse=
udo/pseudo.log indicates 4 errors [qa_pseudo]
python-behave-1.2.5: This /work/aarch64-oe-linux/python-behave/1.2.5-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/aarch64-oe-linux/python-cpuset/1.5.7-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/i586-oe-linux-musl/python-cpuset/1.5.7-r0=
/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-django-1.11.9: This /work/core2-64-oe-linux/python-django/1.11.9-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-docutils-0.14rc2: This /work/i586-oe-linux-musl/python-docutils/0.=
14rc2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-flask-navigation-0.2.0: This /work/core2-64-oe-linux/python-flask-=
navigation/0.2.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-jsonpointer-1.14: This /work/core2-64-oe-linux/python-jsonpointer/=
1.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-markupsafe-1.0: This /work/aarch64-oe-linux/python-markupsafe/1.0-=
r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-pbr-3.1.1: This /work/aarch64-oe-linux/python-pbr/3.1.1-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
python-pip-9.0.1: This /work/aarch64-oe-linux/python-pip/9.0.1-r0/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]
python-pip-9.0.1: This /work/armv5te-oe-linux-gnueabi/python-pip/9.0.1-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pip-9.0.1: This /work/core2-64-oe-linux/python-pip/9.0.1-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
python-progress-1.3: This /work/core2-64-oe-linux/python-progress/1.3-r0/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-pycrypto-2.6.1: This /work/i586-oe-linux-musl/python-pycrypto/2.6.=
1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-pydbus-0.6.0: This /work/core2-64-oe-linux/python-pydbus/0.6.0-r0/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-pylint-1.8.1: This /work/aarch64-oe-linux/python-pylint/1.8.1-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.8.1: This /work/core2-64-oe-linux/python-pylint/1.8.1-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.8.1: This /work/i586-oe-linux-musl/python-pylint/1.8.1-r0=
/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pyro4-4.63: This /work/aarch64-oe-linux/python-pyro4/4.63-r0/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]
python-pyserial-3.4: This /work/aarch64-oe-linux/python-pyserial/3.4-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pysmi-0.2.2: This /work/armv5te-oe-linux-gnueabi/python-pysmi/0.2.=
2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pytest-3.3.2: This /work/core2-64-oe-linux/python-pytest/3.3.2-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyudev-0.21.0: This /work/i586-oe-linux-musl/python-pyudev/0.21.0-=
r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
python-setuptools-38.2.5: This /work/armv5te-oe-linux-gnueabi/python-setu=
ptools/38.2.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-sparts-0.7.3: This /work/core2-64-oe-linux/python-sparts/0.7.3-r0/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-unidiff-0.5.5: This /work/core2-64-oe-linux/python-unidiff/0.5.5-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
qsiv-1.1: This /work/i586-oe-linux-musl/qsiv/1.1-r0/pseudo/pseudo.log ind=
icates 7 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/aarch64-oe-linux/qt3d/5.10.=
0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 11 errors [qa_pseu=
do]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/armv5te-oe-linux-gnueabi/qt=
3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 15 errors =
[qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/core2-64-oe-linux/qt3d/5.10=
=2E0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 11 errors [qa_p=
seudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/i586-oe-linux-musl/qt3d/5.1=
0.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 14 errors [qa_ps=
eudo]
qt5-creator-3.5.1: This /work/aarch64-oe-linux/qt5-creator/3.5.1-r0/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-=
r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/aarch64-oe-linux/qtbase/5=
=2E10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 34 errors [q=
a_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/armv5te-oe-linux-gnueabi/=
qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 104 er=
rors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/core2-64-oe-linux/qtbase/=
5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 15 errors [qa=
_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/i586-oe-linux-musl/qtbase=
/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 14 errors [q=
a_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/aarch64-oe-linux/qtchar=
ts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/armv5te-oe-linux-gnueab=
i/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/core2-64-oe-linux/qtcha=
rts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 16 errors=
 [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/i586-oe-linux-musl/qtch=
arts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/armv5te-oe-linux-=
gnueabi/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log =
indicates 13 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/core2-64-oe-linux=
/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicat=
es 11 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/i586-oe-linux-mus=
l/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indica=
tes 14 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/aarch64-oe-linux/qtd=
atavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 12 e=
rrors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/armv5te-oe-linux-gnu=
eabi/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/core2-64-oe-linux/qt=
datavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 11 =
errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/i586-oe-linux-musl/q=
tdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/aarch64-oe-linux/q=
tdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates =
20 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/armv5te-oe-linux-g=
nueabi/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log in=
dicates 27 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/i586-oe-linux-musl=
/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicate=
s 22 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qteng=
inio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnuea=
bi/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates =
14 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/i586-oe-linux-musl/qte=
nginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/aarch64-oe-linux/qtgam=
epad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 10 error=
s [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/armv5te-oe-linux-gnuea=
bi/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates =
13 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/core2-64-oe-linux/qtga=
mepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 11 erro=
rs [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/i586-oe-linux-musl/qtg=
amepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
qtimageformats-5.10.0+gitAUTOINC+caa90acd43: This /work/armv5te-oe-linux-=
gnueabi/qtimageformats/5.10.0+gitAUTOINC+caa90acd43-r0/pseudo/pseudo.log =
indicates 14 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/aarch64-oe=
-linux/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/armv5te-oe=
-linux-gnueabi/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseu=
do/pseudo.log indicates 25 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/core2-64-o=
e-linux/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/i586-oe-li=
nux-musl/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/aarch64-oe-linux/qt=
multimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 11=
 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/armv5te-oe-linux-gn=
ueabi/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indi=
cates 11 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/core2-64-oe-linux/q=
tmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 1=
1 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/i586-oe-linux-musl/=
qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/aarch64-oe-linux/q=
tnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/armv5te-oe-linux-g=
nueabi/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log in=
dicates 7 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/core2-64-oe-linux/=
qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates=
 11 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/i586-oe-linux-musl=
/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicate=
s 12 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/aarch64-oe-linux/qtquic=
k1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 18 errors =
[qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/armv5te-oe-linux-gnueab=
i/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 19=
 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/core2-64-oe-linux/qtqui=
ck1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 29 errors=
 [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/aarch64-oe-linu=
x/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indi=
cates 11 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/armv5te-oe-linu=
x-gnueabi/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.=
log indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/core2-64-oe-lin=
ux/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log ind=
icates 11 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/i586-oe-linux-m=
usl/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log in=
dicates 13 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/armv5te-oe-linux=
-gnueabi/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.lo=
g indicates 13 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/core2-64-oe-linu=
x/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indic=
ates 12 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/i586-oe-linux-mu=
sl/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/aarch64-oe-linux/qtscri=
pt/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/armv5e-oe-linux-gnueabi=
/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 12 =
errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/core2-64-oe-linux/qtscr=
ipt/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 18 errors=
 [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/i586-oe-linux-musl/qtsc=
ript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/aarch64-oe-linux/qtscxml=
/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/armv5te-oe-linux-gnueabi=
/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/core2-64-oe-linux/qtscxm=
l/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 10 errors [=
qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/i586-oe-linux-musl/qtscx=
ml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 13 errors =
[qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/aarch64-oe-linux/qtsen=
sors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/armv5te-oe-linux-gnuea=
bi/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/core2-64-oe-linux/qtse=
nsors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 10 erro=
rs [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/i586-oe-linux-musl/qts=
ensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 14 err=
ors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/aarch64-oe-linux/qts=
erialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 11 e=
rrors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/armv5te-oe-linux-gnu=
eabi/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/core2-64-oe-linux/qt=
serialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 11 =
errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/i586-oe-linux-musl/q=
tserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/aarch64-oe-linux/qt=
serialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 6 =
errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/armv5te-oe-linux-gn=
ueabi/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/core2-64-oe-linux/q=
tserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 5=
 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/i586-oe-linux-musl/=
qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates =
7 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/aarch64-oe-linux/qtsvg/5.1=
0.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 11 errors [qa_ps=
eudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/armv5te-oe-linux-gnueabi/q=
tsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 12 error=
s [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/core2-64-oe-linux/qtsvg/5.=
10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 10 errors [qa_p=
seudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/i586-oe-linux-musl/qtsvg/5=
=2E10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 13 errors [q=
a_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/aarch64-oe-linux/qtsys=
tems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 10 error=
s [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/armv5te-oe-linux-gnuea=
bi/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates =
16 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/core2-64-oe-linux/qtsy=
stems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 11 erro=
rs [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/i586-oe-linux-musl/qts=
ystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/aarch64-oe-linux/qttools=
/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/armv5te-oe-linux-gnueabi=
/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/core2-64-oe-linux/qttool=
s/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 14 errors [=
qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/i586-oe-linux-musl/qttoo=
ls/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 22 errors =
[qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/aarch64-oe-linux/qtway=
land/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/armv5te-oe-linux-gnuea=
bi/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates =
13 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/core2-64-oe-linux/qtwa=
yland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/i586-oe-linux-musl/qtw=
ayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 14 err=
ors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/aarch64-oe-linux/qt=
webchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 10=
 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/armv5te-oe-linux-gn=
ueabi/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/core2-64-oe-linux/q=
twebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 1=
0 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/i586-oe-linux-musl/=
qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates =
13 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/aarch64-o=
e-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pse=
udo.log indicates 35 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/core2-64-=
oe-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/i586-oe-l=
inux-musl/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/p=
seudo.log indicates 37 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebk=
it/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi=
/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 11 =
errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtweb=
kit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 10 errors=
 [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/i586-oe-linux-musl/qtwe=
bkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/aarch64-oe-lin=
ux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/armv5te-oe-lin=
ux-gnueabi/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/core2-64-oe-li=
nux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log i=
ndicates 12 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/i586-oe-linux-=
musl/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log =
indicates 13 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/aarch64-oe-linux/qt=
websockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 15=
 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/armv5te-oe-linux-gn=
ueabi/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/core2-64-oe-linux/q=
twebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 1=
3 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/i586-oe-linux-musl/=
qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates =
13 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/aarch64-oe-linux/qtweb=
view/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/core2-64-oe-linux/qtwe=
bview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 11 erro=
rs [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/i586-oe-linux-musl/qtw=
ebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 7 erro=
rs [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/aarch64-oe-linux/qtx=
11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 5 er=
rors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/armv5te-oe-linux-gnu=
eabi/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/core2-64-oe-linux/qt=
x11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 6 e=
rrors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/i586-oe-linux-musl/q=
tx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 7 =
errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/aarch64-oe-linux/q=
txmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates =
17 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/armv5te-oe-linux-g=
nueabi/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log in=
dicates 17 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/i586-oe-linux-musl=
/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicate=
s 11 errors [qa_pseudo]
quagga-1.2.1: This /work/aarch64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.l=
og indicates 13 errors [qa_pseudo]
quagga-1.2.1: This /work/armv5te-oe-linux-gnueabi/quagga/1.2.1-r0/pseudo/=
pseudo.log indicates 16 errors [qa_pseudo]
quagga-1.2.1: This /work/core2-64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.=
log indicates 13 errors [qa_pseudo]
quagga-1.2.1: This /work/i586-oe-linux-musl/quagga/1.2.1-r0/pseudo/pseudo=
=2Elog indicates 22 errors [qa_pseudo]
quilt-0.65: This /work/core2-64-oe-linux/quilt/0.65-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
radvd-2.17: This /work/aarch64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log i=
ndicates 11 errors [qa_pseudo]
radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux-musl/radvd/2.17-r0/pseudo/pseudo.log=
 indicates 7 errors [qa_pseudo]
readline-7.0: This /work/armv5te-oe-linux-gnueabi/readline/7.0-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
readline-7.0: This /work/i586-oe-linux-musl/readline/7.0-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
rodent-icon-theme-5.0: This /work/all-oe-linux/rodent-icon-theme/5.0-r0/p=
seudo/pseudo.log indicates 10 errors [qa_pseudo]
rrdtool-1.6.0: This /work/core2-64-oe-linux/rrdtool/1.6.0-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
samba-4.7.0: This /work/core2-64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
sblim-sfcb-1.4.9: This /work/core2-64-oe-linux/sblim-sfcb/1.4.9-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
sed-4.2.2: This /work/aarch64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log ind=
icates 4 errors [qa_pseudo]
sed-4.2.2: This /work/core2-64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]
sg3-utils-1.42: This /work/aarch64-oe-linux/sg3-utils/1.42-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
smem-1.4: This /work/i586-oe-linux-musl/smem/1.4-r0/pseudo/pseudo.log ind=
icates 12 errors [qa_pseudo]
smstools3-3.1.21: This /work/i586-oe-linux-musl/smstools3/3.1.21-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
source-han-sans-jp-fonts-1.004: This /work/all-oe-linux/source-han-sans-j=
p-fonts/1.004-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
source-han-sans-kr-fonts-1.004: This /work/all-oe-linux/source-han-sans-k=
r-fonts/1.004-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
sox-14.4.0: This /work/armv5te-oe-linux-gnueabi/sox/14.4.0-r2/pseudo/pseu=
do.log indicates 18 errors [qa_pseudo]
squid-3.5.26: This /work/armv5te-oe-linux-gnueabi/squid/3.5.26-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
start-stop-daemon-1.17.25: This /work/armv5te-oe-linux-gnueabi/start-stop=
-daemon/1.17.25-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
sthttpd-2.27.1: This /work/aarch64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]
sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pse=
udo.log indicates 6 errors [qa_pseudo]
sthttpd-2.27.1: This /work/i586-oe-linux-musl/sthttpd/2.27.1-r0/pseudo/ps=
eudo.log indicates 7 errors [qa_pseudo]
strace-4.19: This /work/aarch64-oe-linux/strace/4.19-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
strace-4.19: This /work/armv5te-oe-linux-gnueabi/strace/4.19-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
strace-4.19: This /work/core2-64-oe-linux/strace/4.19-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
strace-4.19: This /work/i586-oe-linux-musl/strace/4.19-r0/pseudo/pseudo.l=
og indicates 13 errors [qa_pseudo]
t1lib-5.1.2: This /work/core2-64-oe-linux/t1lib/5.1.2-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
t1lib-5.1.2: This /work/i586-oe-linux-musl/t1lib/5.1.2-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux-musl/tcl/8.6.7-r0/pseudo/pseudo.log i=
ndicates 7 errors [qa_pseudo]
tcpslice-1.2a3: This /work/core2-64-oe-linux/tcpslice/1.2a3-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
tftp-hpa-5.2: This /work/aarch64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.l=
og indicates 5 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/=
pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/core2-64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]
tftp-hpa-5.2: This /work/i586-oe-linux-musl/tftp-hpa/5.2-r0/pseudo/pseudo=
=2Elog indicates 9 errors [qa_pseudo]
tomoyo-tools-2.5.0: This /work/armv5te-oe-linux-gnueabi/tomoyo-tools/2.5.=
0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
tomoyo-tools-2.5.0: This /work/i586-oe-linux-musl/tomoyo-tools/2.5.0-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
ttf-inconsolata-20100526: This /work/all-oe-linux/ttf-inconsolata/2010052=
6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
udev-extraconf-1.1: This /work/i586-oe-linux-musl/udev-extraconf/1.1-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
uftp-4.9.3: This /work/core2-64-oe-linux/uftp/4.9.3-r0/pseudo/pseudo.log =
indicates 9 errors [qa_pseudo]
uftrace-0.8: This /work/aarch64-oe-linux/uftrace/0.8-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.l=
og indicates 7 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indi=
cates 7 errors [qa_pseudo]
ufw-0.33: This /work/i586-oe-linux-musl/ufw/0.33-r0/pseudo/pseudo.log ind=
icates 9 errors [qa_pseudo]
unixodbc-2.3.4: This /work/i586-oe-linux-musl/unixodbc/2.3.4-r0/pseudo/ps=
eudo.log indicates 18 errors [qa_pseudo]
upm-1.3.0-gitAUTOINC+106b6c7062: This /work/aarch64-oe-linux/upm/1.3.0-gi=
tAUTOINC+106b6c7062-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
util-linux-2.31: This /work/aarch64-oe-linux/util-linux/2.31-r0/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
util-linux-2.31: This /work/core2-64-oe-linux/util-linux/2.31-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
utouch-mtview-1.1.7+gitAUTOINC+ad437c38dc: This /work/core2-64-oe-linux/u=
touch-mtview/1.1.7+gitAUTOINC+ad437c38dc-r0/pseudo/pseudo.log indicates 1=
0 errors [qa_pseudo]
weston-3.0.0: This /work/armv5te-oe-linux-gnueabi/weston/3.0.0-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
wireshark-2.2.11: This /work/armv5e-oe-linux-gnueabi/wireshark/1_2.2.11-r=
0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xeyes-1.1.1: This /work/i586-oe-linux-musl/xeyes/1_1.1.1-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
xf86-input-mouse-1.9.2: This /work/core2-64-oe-linux/xf86-input-mouse/2_1=
=2E9.2-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-vala-4.10.3: This /work/armv5te-oe-linux-gnueabi/xfce4-vala/4.10.3-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/armv5te-oe-linux-gnueabi/xrd=
p/0.9.4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 12 errors [q=
a_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/core2-64-oe-linux/xrdp/0.9.4=
+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 10 errors [qa_pseud=
o]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/i586-oe-linux-musl/xrdp/0.9.=
4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseu=
do]
xtrans-1.3.5: This /work/armv5te-oe-linux-gnueabi/xtrans/1_1.3.5-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
znc-1.6.0: This /work/aarch64-oe-linux/znc/1.6.0-r0/pseudo/pseudo.log ind=
icates 4 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
ceaca28 fetch2/__init__: Disable pseudo in runfetchcmd()
not included in master yet:=20
9a6bf73 world-image: add extra target
123fe3c fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
e9dfe7e icu-dbg: improve reproducibility
not included in master yet:=20
1f6bb90 kernel-devicetree.bbclass: Use lowercase names for shell variable=
s
ec6a493 kernel-devicetree.bbclass: Fix and simplify instalation of DTB fi=
les
63bbb9c kernel.bbclass: use the consistent naming schema for initramfs
e98b620 kernel.bbclass: move variables for kernel artifacts names to sepa=
rate bbclass
925d23d report-error: Allow to upload reports automatically
14faafc buildhistory.bbclass: metadata-revs show repo parent
6f63e53 metadata-revs: provide more information
ad1f517 qemux86: Add identical qemux86copy variant for tests
caace59 reproducible_build.bbclass: initial support for binary reproducib=
ility
be95f3f cpio: provide cpio-replacement-native
832a428 image_types.bbclass: improve cpio image reproducibility
e8a35d8 rootfs-postcommands.bbclass: support binary reproducibility
b231fff sstate.bbclass: Do not cause build failures due to setscene error=
s
b6aea80 insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
6adc8b7 insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
29a4983 python-pandas: add json to the RDEPENDS list
not included in master yet:=20
4a2262c smstools3: update to 3.1.21; drop uneeded patches
f7e360d smstools3: remove bash dependency on packaged scripts
a134f27 protobuf: update to version 3.5.1
ae2481f jsoncpp: update to version 1.8.4
246269b python-attrs: update to version 17.4.0
805a97a python-pandas: update to version 0.22.0
edc25bb pypi: remove class that was added to oe-core
64dd046 python-werkzeug: update to version 0.14
a2fae82 python-grpcio: update to version 1.8.2
5c3bd7d python-grpcio-tools: update to version 1.8.2
09e50d7 python-jsonpointer: add a python3 version of the recipe
b944750 python-jsonpatch: add a python3 version of the recipe
769cd2b python-jsonpatch: update to version 1.21
fcb57c9 nginx: update dev version to 1.13.8
df552f0 python-protobuf: update to version 3.5.1
a599f5f kexec-tools-klibc: update to fix build issues after core changes.=

3dab65b open-isns: Fix build with musl
1a4b47f bridge-utils: modify the AR to cross toolchain
607620e ssmtp: misc recipe updates + add Debian "partial loss of message =
body" fix
4cec433 dovecot: Fix parallel build
8c85ace dnsmasq: update SRC_URI for versions 2.69 and earlier
a5f4d90 postfix: fix send mail failure and eliminate warning
f8ab6df openvpn: Upgrade 2.4.3 -> 2.4.4
87de080 arptables: Fix do_install task
1c5a461 lksctp-tools: update and remove from blacklist
14a9ceb freediameter: add new recipe
40bf3be net-snmp: support openssl without 3des
5c571f6 stunnel: fix compile error when openssl disable des support
2119ee4 bridge-utils: update to v1.6
1132bca corosync: 2.4.2 -> 2.4.3
b9bab55 cyrus-sasl: virtual/db isn't used by core, change to db
b4e36a9 postfix: virtual/db isn't used by core, change to db
73d39e7 networkmanager: add consolekit only when x11 is enabled
2993304 iscsi-initiator-utils: check file existence before moving
5953293 iscsi-initiator-utils: remove the distro_features_check
69a165f open-isns: add sysvinit support
76054b2 libtalloc: update to version 2.1.10
6a6dc77 libtevent: update to version 0.99.33
33b4472 libtdb: update to version 1.3.15
94d5dea libldb: update to version 1.2.2
e0323a0 Revert "samba: add missing RDEPENDS"
8a5306e samba: move to version 4.7.0
47ef3c8 pcmciautils: add (from oe-core)
d4ed7d0 chrony: Update to version 3.2
b8078db site: move from meta-oe to meta-networking
e539fb8 inetutils: make -syslog rconflict with other system loggers
b8e9f96 net-snmp: fix invalid paths in target net-snmp-config
d42096e cifs-utils: mount.cifs should build without samba dependency
17882a4 wireshark: Update to 2.2.11
b4c8038 tinyproxy: 'nobody' should belong to 'nogroup'
d56d309 postfix: drop NATIVE_INSTALL_WORKS
160b873 openl2tp: add ptest support
ea50f55 tinyproxy: fix build ERROR
d3d32cc cfengine-masterfiles: 3.9.0 -> 3.10.2
270675d cfengine: 3.9.0 -> 3.10.2
df8c23d iscsi-initiator-utils: CVE-2017-17840
161dc29 pyinotify: Fix support for different python versions
9e3b0b4 spitools: bump git revision
2e646aa pycrypto: Add recipe to have support on python3
2bdf357 dialog: update SRC_URI
0a5da9b uw-imap: update SRC_URI
456138a vim: set CLEANBROKEN to fix rebuild
b576656 drbd-utils: update SRC_URI
163571f xorgxrdp: new add
a3f704d ell: Upgrade SRCREV
b902cf4 zile: update to 2.14
769cddf bdftopcf: 1.0.5 -> 1.1
8e422d4 libyui-ncurses: fix indentation, include SRCPV in PV, don't use +=
=3D and append.
40e911b wireguard: udpate to 20171221 version
ee75c8e open-vm-tools: add sysvinit script to start vmtoolsd daemon at bo=
ot time
a98ca6f postfix: fix generating aliases db files
b117faf stress-ng: upgrade to 0.09.09 and fix musl build
4772f7f python-unidiff: update to version 0.5.5
cf259ad python-psutil: update to version 5.4.3
37edccf python-werkzeug: update to version 0.14.1
a5c2725 python-pytest: update to version 3.3.2
4629c9f python-tornado: update to version 4.5.3
ceced5a php-native: eliminate SSTATEPOSTINSTFUNCS use
a98f41c python-msgpack: update to version 0.5.1
89424f4 python-grpcio: update to version 1.8.3
c69d4e4 python-grpcio-tools: update to version 1.8.3
a116462 python-can: update to the released version of 2.0.0
fe43567 python-django: update to version 1.11.9
cde05eb python-cmd2: update to version 0.7.9

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
3cf0bbb qtbase_git: install qt.conf for the target
not included in master yet:=20
0fd9104 packagegroup-qt5-qtcreator-debug: remove qtdeclarative-plugins

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
8cc24ca Merge pull request #86 from rakuco/oz-wl-command-line-args
not included in master yet:=20


