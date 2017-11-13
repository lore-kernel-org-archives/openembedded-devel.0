Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 44CB9786A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 17:59:02 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id m88so5096469pfi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 09:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-language;
	bh=/h3nP9dDitQR2D2mom3ZmOKLuw6D1dqCDpN+O2fl7mA=;
	b=UGcHYpK9+d/ceHKQdmkuRz8ihvNoxLXdMShwihDNihNibm14iVtHvYovlZGSVWpH+L
	gyJr4qwvQS89MeiTL0aHHT680sU/LfYjYY39SgdxVDPpB0tJNB4g5VMops8QmOovurdt
	MPQrfReY+tKHzyFggKtDxF/QpTNkFeSL3QGVYUQY9/3TnX2TYAG7EzLbOPMrRU9GyNCO
	Ce49pTvU5vQgCCEITbaqN1eUGtLcaCkPMUswSp2aWGwW+kUrOFcEucwrgf7uL9TFxCFV
	OBo1UbTsQpCSdZ3OM3gmJXG7txNcXzab4tA74fAk5RVxxhrc9epO215MKB9svK2oboCR
	pKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-language;
	bh=/h3nP9dDitQR2D2mom3ZmOKLuw6D1dqCDpN+O2fl7mA=;
	b=kdNLp0/zX2J5jHAcx0+lxD5hzESMCHssHziXlf2Cu95d7l9L9/uIVzNfX/Eh7ZU0T2
	PKjndTA2QjHhNzdqMyCwcCqv1pO1h0Zq17A2VtxV0JCp107r5abg8hlvIStVDbwDNPHh
	SFKQDYx59SPphNPtBvlzgwiXwUpIKzofARCRRS9MVLoDl5liQhW+SYoLG46sT3FN3x5+
	GBa6e8/NWew3ZS7QqCn3L59McoKUU5b2D15OJhy5vF++rzPOPQhAZMvmHfQtSrK6ZUlM
	vrtRO0n8qHUB65FOi+CmRJJz8S5KlQCuvY5gJL+hSFHBKbCvr1d8M1Mbjfo2L1sB5W0p
	MQDQ==
X-Gm-Message-State: AJaThX6DG/iNxEQNtSWzY1k2MRvduWNveBmsYJ8fx9SMip6C0h1lBDqe
	v/RAwN/Yof9LVMX8v5OvCzUTyg==
X-Google-Smtp-Source: AGs4zMYlZccBTikBNH27xF/8caZVbH6nGLA+W6Qryy9rxLkwclQKyGkg+7tNNU1uAWCWZOur4VVwJA==
X-Received: by 10.159.204.146 with SMTP id t18mr9686898plo.70.1510595942975;
	Mon, 13 Nov 2017 09:59:02 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:9e6:e207:34f:6a65?
	([2601:202:4001:9ea0:9e6:e207:34f:6a65])
	by smtp.gmail.com with ESMTPSA id
	s71sm36990030pfa.147.2017.11.13.09.59.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 09:59:02 -0800 (PST)
From: akuster808 <akuster808@gmail.com>
To: "openembedded-devel@lists.openembedded.org >> OpenEmbedded Devel List"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <cf16996f-ef8f-b6f6-645a-be1d5cd4142e@gmail.com>
Date: Mon, 13 Nov 2017 09:59:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-11-11
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
X-List-Received-Date: Mon, 13 Nov 2017 17:59:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'4'|Failed tasks			    !!|Signatures		  !!colspa=
n=3D'15'|QA !!Comment
|-
||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-strippe=
d	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	=
||host-user-contaminated	||installed-vs-shipped	||unknown-configure-optio=
n	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-=
host-path	||qa_pseudo	||=09
|-
||2017-11-09	||5	||10	||30	||5	||0	||0		||0		||0		||0		||0		||18		||3		||=
0		||0		||0		||0		||0		||0		||0		||378		||=09
|}

=3D=3D Failed tasks 2017-11-09 =3D=3D

INFO: jenkins-job.sh-1.8.41 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20171111_042827.log

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-daemons/ddclient/ddclient=
_3.8.3.bb:do_install
    * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3=
=2E2.2.bb:do_install
    * meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb:do=
_configure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa

=3D=3D=3D qemuarm64 (6) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_co=
mpile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.14=
3.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3=
=2Ebb:do_configure

=3D=3D=3D qemux86 (27) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compil=
e
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
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
    * meta-openembedded/meta-networking/recipes-support/open-isns/open-is=
ns_0.97.bb:do_compile
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
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.b=
b:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-syste=
md_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-system=
d_234.bb:do_compile
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_package=
_qa
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-b=
ootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
    * openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer=
_git.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.3.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (50) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/=
log.world.qemuarm.20171108_100141.log/ || http://errors.yoctoproject.org/=
Errors/Build/48233/
|-
|| qemuarm64 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemuarm64.20171109_103013.log/ ||=20
|-
|| qemux86 	|| 30	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemux86.20171108_095856.log/ || http://errors.yoctoproject.org=
/Errors/Build/48232/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemux86-64.20171109_102213.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/48267/
|}

=3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D

=3D=3D=3D QA issues (399) =3D=3D=3D
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
||0	||installed-vs-shipped
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||18	||version-going-backwards
|-
||378	||qa_pseudo
|-
||3	||host-user-contaminated
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20171110_170629.log/


    * ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe=
/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.b=
b RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPE=
NDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmp-glibc/stamps


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


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 18	issue: version-going-backwards
spitools-0.8.1: Package version for package spitools-dbg went backwards w=
hich would break package feeds from (0:git-r0.10 to 0:0.8.1-r0.0) [versio=
n-going-backwards]
spitools-0.8.1: Package version for package spitools-dbg went backwards w=
hich would break package feeds from (0:git-r0.11 to 0:0.8.1-r0.0) [versio=
n-going-backwards]
spitools-0.8.1: Package version for package spitools-dbg went backwards w=
hich would break package feeds from (0:git-r0.1 to 0:0.8.1-r0.0) [version=
-going-backwards]
spitools-0.8.1: Package version for package spitools-dev went backwards w=
hich would break package feeds from (0:git-r0.10 to 0:0.8.1-r0.0) [versio=
n-going-backwards]
spitools-0.8.1: Package version for package spitools-dev went backwards w=
hich would break package feeds from (0:git-r0.11 to 0:0.8.1-r0.0) [versio=
n-going-backwards]
spitools-0.8.1: Package version for package spitools-dev went backwards w=
hich would break package feeds from (0:git-r0.1 to 0:0.8.1-r0.0) [version=
-going-backwards]
spitools-0.8.1: Package version for package spitools-doc went backwards w=
hich would break package feeds from (0:git-r0.10 to 0:0.8.1-r0.0) [versio=
n-going-backwards]
spitools-0.8.1: Package version for package spitools-doc went backwards w=
hich would break package feeds from (0:git-r0.11 to 0:0.8.1-r0.0) [versio=
n-going-backwards]
spitools-0.8.1: Package version for package spitools-doc went backwards w=
hich would break package feeds from (0:git-r0.1 to 0:0.8.1-r0.0) [version=
-going-backwards]
spitools-0.8.1: Package version for package spitools-locale went backward=
s which would break package feeds from (0:git-r0.10 to 0:0.8.1-r0.0) [ver=
sion-going-backwards]
spitools-0.8.1: Package version for package spitools-locale went backward=
s which would break package feeds from (0:git-r0.11 to 0:0.8.1-r0.0) [ver=
sion-going-backwards]
spitools-0.8.1: Package version for package spitools-locale went backward=
s which would break package feeds from (0:git-r0.1 to 0:0.8.1-r0.0) [vers=
ion-going-backwards]
spitools-0.8.1: Package version for package spitools-staticdev went backw=
ards which would break package feeds from (0:git-r0.10 to 0:0.8.1-r0.0) [=
version-going-backwards]
spitools-0.8.1: Package version for package spitools-staticdev went backw=
ards which would break package feeds from (0:git-r0.11 to 0:0.8.1-r0.0) [=
version-going-backwards]
spitools-0.8.1: Package version for package spitools-staticdev went backw=
ards which would break package feeds from (0:git-r0.1 to 0:0.8.1-r0.0) [v=
ersion-going-backwards]
spitools-0.8.1: Package version for package spitools went backwards which=
 would break package feeds from (0:git-r0.10 to 0:0.8.1-r0.0) [version-go=
ing-backwards]
spitools-0.8.1: Package version for package spitools went backwards which=
 would break package feeds from (0:git-r0.11 to 0:0.8.1-r0.0) [version-go=
ing-backwards]
spitools-0.8.1: Package version for package spitools went backwards which=
 would break package feeds from (0:git-r0.1 to 0:0.8.1-r0.0) [version-goi=
ng-backwards]


count: 3	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-an-es.iso-8859-=
15/usr/lib/locale/an_ES.ISO-8859-15/LC_PAPER is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ber-dz/usr/lib/=
locale/ber_DZ/LC_MEASUREMENT is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user=
-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-es-mx.iso-8859-=
1/usr/lib/locale/es_MX.ISO-8859-1/LC_PAPER is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 378	issue: qa_pseudo
alsa-lib-1.1.4.1: This /work/core2-64-oe-linux/alsa-lib/1.1.4.1-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
apache2-2.4.29: This /work/aarch64-oe-linux/apache2/2.4.29-r0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
apache2-2.4.29: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.29-r0/pse=
udo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.29: This /work/core2-64-oe-linux/apache2/2.4.29-r0/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
apr-1.6.2: This /work/core2-64-oe-linux/apr/1.6.2-r0/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]
atftp-0.7.1+gitAUTOINC+be3291a18c: This /work/aarch64-oe-linux/atftp/0.7.=
1+gitAUTOINC+be3291a18c-r3/pseudo/pseudo.log indicates 10 errors [qa_pseu=
do]
attr-2.4.47: This /work/aarch64-oe-linux/attr/2.4.47-r0/pseudo/pseudo.log=
 indicates 4 errors [qa_pseudo]
attr-2.4.47: This /work/armv5te-oe-linux-gnueabi/attr/2.4.47-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
audiofile-0.3.6: This /work/aarch64-oe-linux/audiofile/0.3.6-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
babl-0.1.28: This /work/aarch64-oe-linux/babl/0.1.28-r0/pseudo/pseudo.log=
 indicates 4 errors [qa_pseudo]
bluez5-5.47: This /work/core2-64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This /work/armv5te-oe-linux-gnueabi=
/can-utils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseudo.log indicates 12 e=
rrors [qa_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This /work/core2-64-oe-linux/can-ut=
ils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseudo.log indicates 10 errors [=
qa_pseudo]
chrony-2.4: This /work/aarch64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log i=
ndicates 4 errors [qa_pseudo]
chrony-2.4: This /work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
chrony-2.4: This /work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
collectd-5.7.2: This /work/aarch64-oe-linux/collectd/5.7.2-r0/pseudo/pseu=
do.log indicates 16 errors [qa_pseudo]
collectd-5.7.2: This /work/core2-64-oe-linux/collectd/5.7.2-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
consolekit-0.4.6: This /work/core2-64-oe-linux/consolekit/0.4.6-r0/pseudo=
/pseudo.log indicates 16 errors [qa_pseudo]
console-tools-0.3.2: This /work/core2-64-oe-linux/console-tools/0.3.2-r8/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
curlpp-0.8.1: This /work/aarch64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.l=
og indicates 5 errors [qa_pseudo]
curlpp-0.8.1: This /work/armv5te-oe-linux-gnueabi/curlpp/0.8.1-r0/pseudo/=
pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]
dbus-test-1.10.20: This /work/aarch64-oe-linux/dbus-test/1.10.20-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
debootstrap-1.0.67: This /work/armv5te-oe-linux-gnueabi/debootstrap/1.0.6=
7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
debsums-2.2.2: This /work/core2-64-oe-linux/debsums/2.2.2-r0/pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
desktop-file-utils-0.18: This /work/core2-64-oe-linux/desktop-file-utils/=
0.18-r1/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
dhcp-4.3.6: This /work/aarch64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log =
indicates 11 errors [qa_pseudo]
directfb-examples-1.7.0: This /work/core2-64-oe-linux/directfb-examples/1=
=2E7.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dovecot-2.2.29: This /work/aarch64-oe-linux/dovecot/2.2.29-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pse=
udo/pseudo.log indicates 14 errors [qa_pseudo]
dovecot-2.2.29: This /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pse=
udo.log indicates 11 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/aarch64-oe-linux/ebtables/2.0.10-4-r4/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-=
r4/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseu=
do/pseudo.log indicates 5 errors [qa_pseudo]
enchant-1.6.0: This /work/core2-64-oe-linux/enchant/1.6.0-r3/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
expect-5.45: This /work/core2-64-oe-linux/expect/5.45-r1/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
ffmpeg-3.3.4: This /work/aarch64-oe-linux/ffmpeg/3.3.4-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
firefox-l10n-ca-45.9.0esr: This /work/all-oe-linux/firefox-l10n-ca/45.9.0=
esr-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
firefox-l10n-zh-cn-45.9.0esr: This /work/all-oe-linux/firefox-l10n-zh-cn/=
45.9.0esr-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
formfactor-0.0: This /work/qemuarm-oe-linux-gnueabi/formfactor/0.0-r45/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
fstests-0.1+gitAUTOINC+e5939ff608: This /work/aarch64-oe-linux/fstests/0.=
1+gitAUTOINC+e5939ff608-r0/pseudo/pseudo.log indicates 4 errors [qa_pseud=
o]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/aarch64-oe-linux/gateone/1.=
2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseud=
o]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/armv5te-oe-linux-gnueabi/ga=
teone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [=
qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1=
=2E2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_ps=
eudo]
geoip-1.6.9: This /work/core2-64-oe-linux/geoip/1.6.9-r0/pseudo/pseudo.lo=
g indicates 4 errors [qa_pseudo]
gettext-0.19.8.1: This /work/core2-64-oe-linux/gettext/0.19.8.1-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
giflib-5.1.4: This /work/armv5te-oe-linux-gnueabi/giflib/5.1.4-r0/pseudo/=
pseudo.log indicates 11 errors [qa_pseudo]
glibc-2.26: This /work/aarch64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
glibc-locale-2.26: This /work/aarch64-oe-linux/glibc-locale/2.26-r0/pseud=
o/pseudo.log indicates 14 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r=
0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
glibc-locale-2.26: This /work/core2-64-oe-linux/glibc-locale/2.26-r0/pseu=
do/pseudo.log indicates 14 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/armv5te-oe-linux-gnueabi/gobject=
-introspection/1.52.1-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo=
]
gstreamer1.0-plugins-bad-1.12.3: This /work/core2-64-oe-linux/gstreamer1.=
0-plugins-bad/1.12.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]=

gstreamer1.0-plugins-ugly-1.12.3: This /work/armv5te-oe-linux-gnueabi/gst=
reamer1.0-plugins-ugly/1.12.3-r0/pseudo/pseudo.log indicates 18 errors [q=
a_pseudo]
gupnp-dlna-0.10.5: This /work/aarch64-oe-linux/gupnp-dlna/0.10.5-r0/pseud=
o/pseudo.log indicates 16 errors [qa_pseudo]
gzip-1.8: This /work/core2-64-oe-linux/gzip/1.8-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
hdparm-9.52: This /work/armv5te-oe-linux-gnueabi/hdparm/9.52-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
hwloc-1.11.5: This /work/aarch64-oe-linux/hwloc/1.11.5-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
icu-59.1: This /work/aarch64-oe-linux/icu/59.1-r0/pseudo/pseudo.log indic=
ates 5 errors [qa_pseudo]
icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.lo=
g indicates 7 errors [qa_pseudo]
icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log indi=
cates 5 errors [qa_pseudo]
id3lib-3.8.3: This /work/aarch64-oe-linux/id3lib/3.8.3-r1/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
iotop-0.6: This /work/armv5te-oe-linux-gnueabi/iotop/0.6-r0/pseudo/pseudo=
=2Elog indicates 6 errors [qa_pseudo]
iperf3-3.2: This /work/aarch64-oe-linux/iperf3/3.2-r0/pseudo/pseudo.log i=
ndicates 4 errors [qa_pseudo]
json-spirit-4.08: This /work/armv5te-oe-linux-gnueabi/json-spirit/4.08-r0=
/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/=
0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/=
lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
lcov-1.11: This /work/core2-64-oe-linux/lcov/1.11-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
libblockdev-2.10: This /work/aarch64-oe-linux/libblockdev/2.10-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
libblockdev-2.10: This /work/core2-64-oe-linux/libblockdev/2.10-r0/pseudo=
/pseudo.log indicates 16 errors [qa_pseudo]
libcgroup-0.41: This /work/armv5te-oe-linux-gnueabi/libcgroup/0.41-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/l=
ibconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates =
10 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-g=
nueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log in=
dicates 13 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/=
libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates=
 4 errors [qa_pseudo]
libev-4.24: This /work/core2-64-oe-linux/libev/4.24-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
libexif-0.6.21: This /work/aarch64-oe-linux/libexif/0.6.21-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
libice-1.0.9: This /work/core2-64-oe-linux/libice/1_1.0.9-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
libiec61883-1.2.0: This /work/core2-64-oe-linux/libiec61883/1.2.0-r0/pseu=
do/pseudo.log indicates 10 errors [qa_pseudo]
libimobiledevice-1.1.4: This /work/armv5te-oe-linux-gnueabi/libimobiledev=
ice/1.1.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libio-socket-ssl-perl-1.997: This /work/armv5te-oe-linux-gnueabi/libio-so=
cket-ssl-perl/1.997-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
liblbxutil-1.1.0: This /work/aarch64-oe-linux/liblbxutil/1_1.1.0-r11/pseu=
do/pseudo.log indicates 14 errors [qa_pseudo]
libnl-3.2.29: This /work/aarch64-oe-linux/libnl/1_3.2.29-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
libqb-1.0.2+gitAUTOINC+608de6d59a: This /work/armv5te-oe-linux-gnueabi/li=
bqb/1.0.2+gitAUTOINC+608de6d59a-r0/pseudo/pseudo.log indicates 6 errors [=
qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqof=
ono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueab=
i/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqo=
fono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
librcf-2.2.0.0: This /work/armv5te-oe-linux-gnueabi/librcf/2.2.0.0-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
libsdl-ttf-2.0.11: This /work/armv5te-oe-linux-gnueabi/libsdl-ttf/2.0.11-=
r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libsub-exporter-progressive-perl-0.001013: This /work/aarch64-oe-linux/li=
bsub-exporter-progressive-perl/0.001013-r0/pseudo/pseudo.log indicates 4 =
errors [qa_pseudo]
libtevent-0.9.31: This /work/aarch64-oe-linux/libtevent/0.9.31-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/aarch64-oe-linux/libtool-cross/2.4.6-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/core2-64-oe-linux/libtool-cross/2.4.6-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/p=
seudo/pseudo.log indicates 10 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9=
=2E11-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/aarch64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pse=
udo.log indicates 11 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
lldpd-0.9.8: This /work/armv5te-oe-linux-gnueabi/lldpd/0.9.8-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
llvm-5.0: This /work/armv5e-oe-linux-gnueabi/llvm/5.0-r0/pseudo/pseudo.lo=
g indicates 7 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indi=
cates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/aarch64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo=
=2Elog indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
logrotate-3.12.3: This /work/aarch64-oe-linux/logrotate/3.12.3-r0/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]
lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce: This /work/armv5te-oe-linux-gnu=
eabi/lowpan-tools/0.3.1+gitAUTOINC+38f42dbfce-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce: This /work/core2-64-oe-linux/lo=
wpan-tools/0.3.1+gitAUTOINC+38f42dbfce-r0/pseudo/pseudo.log indicates 10 =
errors [qa_pseudo]
lttng-modules-2.9.3: This /work/qemuarm64-oe-linux/lttng-modules/2.9.3-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/aarch64-oe-linux/lttng-tools/2.9.5-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/armv5te-oe-linux-gnueabi/lttng-tools/2.9.5-=
r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lua-5.3.4: This /work/core2-64-oe-linux/lua/5.3.4-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
lvm2-2.02.171: This /work/armv5te-oe-linux-gnueabi/lvm2/2.02.171-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
lz4-1.7.4: This /work/core2-64-oe-linux/lz4/1_1.7.4-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/aarch64-oe-=
linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.=
log indicates 17 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-=
linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe=
-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
matchbox-panel-2-2.11: This /work/core2-64-oe-linux/matchbox-panel-2/2.11=
-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
matchbox-terminal-0.1: This /work/armv5te-oe-linux-gnueabi/matchbox-termi=
nal/0.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mc-4.8.19: This /work/armv5te-oe-linux-gnueabi/mc/4.8.19-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
menulibre-2.1.3: This /work/core2-64-oe-linux/menulibre/2.1.3-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
meson-0.40.1: This /work/armv5te-oe-linux-gnueabi/meson/0.40.1-r0/pseudo/=
pseudo.log indicates 13 errors [qa_pseudo]
mongodb-3.4.6+gitAUTOINC+c55eb86ef4: This /work/aarch64-oe-linux/mongodb/=
3.4.6+gitAUTOINC+c55eb86ef4-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
monkey-1.5.6: This /work/aarch64-oe-linux/monkey/1.5.6-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/aarch64-oe-linux/mosquitto/1.4.14-r0/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0=
/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mosquitto-1.4.14: This /work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/core2-64-oe-linux/mozilla-devscripts/=
0.30-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/aarch64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log ind=
icates 4 errors [qa_pseudo]
netcat-openbsd-1.105: This /work/core2-64-oe-linux/netcat-openbsd/1.105-r=
0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
netkit-rsh-0.17: This /work/armv5te-oe-linux-gnueabi/netkit-rsh/0.17-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
netkit-rwho-0.17: This /work/core2-64-oe-linux/netkit-rwho/0.17-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
net-snmp-5.7.3: This /work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
nettle-3.3: This /work/aarch64-oe-linux/nettle/3.3-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
nfs-utils-2.1.1: This /work/armv5te-oe-linux-gnueabi/nfs-utils/2.1.1-r0/p=
seudo/pseudo.log indicates 18 errors [qa_pseudo]
nginx-1.12.2: This /work/aarch64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
nginx-1.12.2: This /work/armv5te-oe-linux-gnueabi/nginx/1.12.2-r0/pseudo/=
pseudo.log indicates 14 errors [qa_pseudo]
nspr-4.17: This /work/armv5te-oe-linux-gnueabi/nspr/4.17-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
nss-3.33: This /work/aarch64-oe-linux/nss/3.33-r0/pseudo/pseudo.log indic=
ates 5 errors [qa_pseudo]
ntp-4.2.8p10: This /work/aarch64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.l=
og indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
ofono-1.20: This /work/aarch64-oe-linux/ofono/1.20-r0/pseudo/pseudo.log i=
ndicates 16 errors [qa_pseudo]
onboard-1.4.1: This /work/aarch64-oe-linux/onboard/1.4.1-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
openhpi-3.6.1: This /work/armv5te-oe-linux-gnueabi/openhpi/3.6.1-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseud=
o.log indicates 20 errors [qa_pseudo]
openl2tp-1.8: This /work/core2-64-oe-linux/openl2tp/1.8-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
openlmi-tools-0.10.5: This /work/aarch64-oe-linux/openlmi-tools/0.10.5-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
openobex-1.7.2: This /work/aarch64-oe-linux/openobex/1.7.2-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
openocd-0.10+gitrAUTOINC+1025be363e: This /work/core2-64-oe-linux/openocd=
/0.10+gitrAUTOINC+1025be363e-r0/pseudo/pseudo.log indicates 4 errors [qa_=
pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/ps=
eudo.log indicates 18 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/p=
seudo/pseudo.log indicates 22 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/p=
seudo.log indicates 19 errors [qa_pseudo]
openssh-7.6p1: This /work/aarch64-oe-linux/openssh/7.6p1-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
openssh-7.6p1: This /work/armv5te-oe-linux-gnueabi/openssh/7.6p1-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
openssl-1.0.2l: This /work/aarch64-oe-linux/openssl/1.0.2l-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
openwsman-2.6.3: This /work/aarch64-oe-linux/openwsman/2.6.3-r0/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
opkg-0.3.5: This /work/armv5te-oe-linux-gnueabi/opkg/1_0.3.5-r0/pseudo/ps=
eudo.log indicates 18 errors [qa_pseudo]
oprofile-1.1.0: This /work/armv5te-oe-linux-gnueabi/oprofile/1.1.0-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/aarch64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/p=
seudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
packagegroup-tools-bluetooth-1.0: This /work/all-oe-linux/packagegroup-to=
ols-bluetooth/1.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
parted-3.2: This /work/armv5te-oe-linux-gnueabi/parted/3.2-r1/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
passwdqc-1.3.1: This /work/armv5te-oe-linux-gnueabi/passwdqc/1.3.1-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
perf-1.0: This /work/qemux86_64-oe-linux/perf/1.0-r9/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]
perl-5.24.1: This /work/aarch64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log=
 indicates 4 errors [qa_pseudo]
perl-5.24.1: This /work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.lo=
g indicates 4 errors [qa_pseudo]
php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log ind=
icates 12 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.=
log indicates 17 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
pixman-0.34.0: This /work/aarch64-oe-linux/pixman/1_0.34.0-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
pm-qa-0.5.2: This /work/aarch64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log=
 indicates 34 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/ps=
eudo.log indicates 49 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.lo=
g indicates 46 errors [qa_pseudo]
pm-utils-1.4.1: This /work/aarch64-oe-linux/pm-utils/1.4.1-r1/pseudo/pseu=
do.log indicates 9 errors [qa_pseudo]
portaudio-v19-v190600: This /work/aarch64-oe-linux/portaudio-v19/v190600-=
r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This /work/core2-64-oe-linux/portaudio-v19/v190600=
-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postgresql-9.4.14: This /work/aarch64-oe-linux/postgresql/9.4.14-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.14: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.14-r=
0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.14: This /work/core2-64-oe-linux/postgresql/9.4.14-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
procps-3.3.12: This /work/core2-64-oe-linux/procps/3.3.12-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
proftpd-1.3.6: This /work/aarch64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseud=
o/pseudo.log indicates 14 errors [qa_pseudo]
proftpd-1.3.6: This /work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
psqlodbc-09.05.0300: This /work/core2-64-oe-linux/psqlodbc/09.05.0300-r0/=
pseudo/pseudo.log indicates 16 errors [qa_pseudo]
pure-ftpd-1.0.42: This /work/aarch64-oe-linux/pure-ftpd/1.0.42-r0/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/armv5te-oe-linux-gnueabi/pu=
zzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicates 19 error=
s [qa_pseudo]
python-2.7.13: This /work/aarch64-oe-linux/python/2.7.13-r1/pseudo/pseudo=
=2Elog indicates 11 errors [qa_pseudo]
python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/aarch64-oe-linux/python3/3.5.3-r1.0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pse=
udo/pseudo.log indicates 7 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
python3-automat-0.6.0: This /work/aarch64-oe-linux/python3-automat/0.6.0-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-automat-0.6.0: This /work/core2-64-oe-linux/python3-automat/0.6.0=
-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-babel-2.5.1: This /work/aarch64-oe-linux/python3-babel/2.5.1-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-django-1.11.5: This /work/armv5te-oe-linux-gnueabi/python3-django=
/1.11.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-mako-1.0.7: This /work/armv5te-oe-linux-gnueabi/python3-mako/1.0.=
7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-nose-1.3.7: This /work/core2-64-oe-linux/python3-nose/1.3.7-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-pip-9.0.1: This /work/aarch64-oe-linux/python3-pip/9.0.1-r0/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This /work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/aarch64-oe-linux/python3-pylint/1.7.4-r0=
/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/core2-64-oe-linux/python3-pylint/1.7.4-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-setuptools-36.5.0: This /work/core2-64-oe-linux/python3-setuptool=
s/36.5.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-webencodings-0.5.1: This /work/aarch64-oe-linux/python3-webencodi=
ngs/0.5.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-automat-0.6.0: This /work/armv5te-oe-linux-gnueabi/python-automat/=
0.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-chardet-3.0.4: This /work/core2-64-oe-linux/python-chardet/3.0.4-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cython-0.27.2: This /work/armv5te-oe-linux-gnueabi/python-cython/0=
=2E27.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-dbusmock-0.16.7: This /work/armv5te-oe-linux-gnueabi/python-dbusmo=
ck/0.16.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-django-1.11.5: This /work/core2-64-oe-linux/python-django/1.11.5-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-docutils-0.14rc2: This /work/aarch64-oe-linux/python-docutils/0.14=
rc2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-flask-0.12.2: This /work/aarch64-oe-linux/python-flask/0.12.2-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-future-0.16.0: This /work/armv5te-oe-linux-gnueabi/python-future/0=
=2E16.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-gevent-1.2.2: This /work/armv5te-oe-linux-gnueabi/python-gevent/1.=
2.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-imaging-1.1.7: This /work/armv5te-oe-linux-gnueabi/python-imaging/=
1.1.7-r5/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python-jsonpointer-1.12: This /work/aarch64-oe-linux/python-jsonpointer/1=
=2E12-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-numpy-1.13.1: This /work/aarch64-oe-linux/python-numpy/1.13.1-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-numpy-1.13.1: This /work/armv5te-oe-linux-gnueabi/python-numpy/1.1=
3.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pip-9.0.1: This /work/core2-64-oe-linux/python-pip/9.0.1-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
python-pyflakes-1.2.3: This /work/core2-64-oe-linux/python-pyflakes/1.2.3=
-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This /work/aarch64-oe-linux/python-pylint/1.7.4-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python-pylint/1.=
7.4-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python-pylint-1.7.4: This /work/core2-64-oe-linux/python-pylint/1.7.4-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyro4-4.62: This /work/core2-64-oe-linux/python-pyro4/4.62-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python-pytest-3.2.3: This /work/core2-64-oe-linux/python-pytest/3.2.3-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-scons-3.0.0: This /work/armv5te-oe-linux-gnueabi/python-scons/3.0.=
0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-scons-3.0.0: This /work/core2-64-oe-linux/python-scons/3.0.0-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
python-setuptools-36.5.0: This /work/aarch64-oe-linux/python-setuptools/3=
6.5.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/aarch64-oe-linux/qt3d/5.9.2+=
gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo=
]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/qt3=
d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 15 errors [q=
a_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/core2-64-oe-linux/qt3d/5.9.2=
+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 19 errors [qa_pseud=
o]
qt5-creator-3.5.1: This /work/aarch64-oe-linux/qt5-creator/3.5.1-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/aarch64-oe-linux/qtbase/5.=
9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 14 errors [qa_ps=
eudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/armv5te-oe-linux-gnueabi/q=
tbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 21 error=
s [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/core2-64-oe-linux/qtbase/5=
=2E9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 11 errors [qa=
_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/aarch64-oe-linux/qtchart=
s/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/armv5te-oe-linux-gnueabi=
/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/aarch64-oe-linux/q=
tconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/armv5te-oe-linux-g=
nueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log in=
dicates 15 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-linux/=
qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates=
 10 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/aarch64-oe-linux/qtda=
tavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/armv5te-oe-linux-gnue=
abi/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicate=
s 13 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/core2-64-oe-linux/qtd=
atavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 11 er=
rors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/aarch64-oe-linux/qt=
declarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 18=
 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/armv5te-oe-linux-gn=
ueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indi=
cates 32 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/core2-64-oe-linux/q=
tdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 1=
8 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueab=
i/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 15=
 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qteng=
inio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/aarch64-oe-linux/qtgame=
pad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 10 errors =
[qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-linux-gnueab=
i/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 14=
 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/core2-64-oe-linux/qtgam=
epad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/aarch64-oe-=
linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.=
log indicates 25 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-oe-=
linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo=
/pseudo.log indicates 13 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/core2-64-oe=
-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo=
=2Elog indicates 15 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/aarch64-oe-linux/qtm=
ultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 10 e=
rrors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-gnu=
eabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe-linux/qt=
multimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 24 =
errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/aarch64-oe-linux/qt=
networkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 6 =
errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux-gn=
ueabi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indi=
cates 8 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linux/q=
tnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 1=
1 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/aarch64-oe-linux/qtquick=
1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 17 errors [q=
a_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi=
/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 24 e=
rrors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/qtquic=
k1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 18 errors [=
qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/aarch64-oe-linux=
/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/armv5te-oe-linux=
-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.lo=
g indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-linu=
x/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indic=
ates 10 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/aarch64-oe-linux/=
qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicate=
s 10 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linux-=
gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log =
indicates 17 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux=
/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicat=
es 12 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/aarch64-oe-linux/qtscrip=
t/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 13 errors [q=
a_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/armv5e-oe-linux-gnueabi/=
qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 15 er=
rors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/core2-64-oe-linux/qtscri=
pt/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 11 errors [=
qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/aarch64-oe-linux/qtscxml/=
5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueabi/=
qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qtscxml=
/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 11 errors [qa=
_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/aarch64-oe-linux/qtsens=
ors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/armv5te-oe-linux-gnueab=
i/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qtsen=
sors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 16 errors=
 [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/aarch64-oe-linux/qtse=
rialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/armv5te-oe-linux-gnue=
abi/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicate=
s 12 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/core2-64-oe-linux/qts=
erialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 11 er=
rors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/aarch64-oe-linux/qts=
erialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 6 er=
rors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/armv5te-oe-linux-gnu=
eabi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indica=
tes 6 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/core2-64-oe-linux/qt=
serialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 7 e=
rrors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/aarch64-oe-linux/qtsvg/5.9.=
2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 12 errors [qa_pseu=
do]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/armv5te-oe-linux-gnueabi/qt=
svg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 15 errors =
[qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/core2-64-oe-linux/qtsvg/5.9=
=2E2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 11 errors [qa_p=
seudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/aarch64-oe-linux/qtsyst=
ems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te-oe-linux-gnueab=
i/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/core2-64-oe-linux/qtsys=
tems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 12 errors=
 [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/aarch64-oe-linux/qttools/=
5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueabi/=
qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/core2-64-oe-linux/qttools=
/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 11 errors [qa=
_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/aarch64-oe-linux/qtwayl=
and/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/armv5te-oe-linux-gnueab=
i/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 26=
 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/core2-64-oe-linux/qtway=
land/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/aarch64-oe-linux/qtw=
ebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 10 e=
rrors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/armv5te-oe-linux-gnu=
eabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/core2-64-oe-linux/qt=
webchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 16 =
errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/aarch64-oe=
-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseud=
o.log indicates 79 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core2-64-o=
e-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebki=
t/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/=
qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 11 er=
rors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebk=
it/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors [=
qa_pseudo]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/aarch64-oe-linu=
x/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/armv5te-oe-linu=
x-gnueabi/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.=
log indicates 13 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/aarch64-oe-linux/qtw=
ebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 11 e=
rrors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-gnu=
eabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/core2-64-oe-linux/qt=
websockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 11 =
errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/aarch64-oe-linux/qtwebv=
iew/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtweb=
view/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/aarch64-oe-linux/qtx1=
1extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 5 erro=
rs [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/qtx=
11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 5 err=
ors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/aarch64-oe-linux/qt=
xmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 22=
 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-gn=
ueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indi=
cates 18 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linux/q=
txmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 1=
7 errors [qa_pseudo]
quagga-1.2.1: This /work/aarch64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.l=
og indicates 13 errors [qa_pseudo]
quagga-1.2.1: This /work/core2-64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
quazip-0.7.3: This /work/core2-64-oe-linux/quazip/0.7.3-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
quilt-0.65: This /work/armv5te-oe-linux-gnueabi/quilt/0.65-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
radvd-2.17: This /work/aarch64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log i=
ndicates 11 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
readline-7.0: This /work/aarch64-oe-linux/readline/7.0-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
rp-pppoe-3.12: This /work/aarch64-oe-linux/rp-pppoe/3.12-r10/pseudo/pseud=
o.log indicates 11 errors [qa_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
ruby-2.4.2: This /work/core2-64-oe-linux/ruby/2.4.2-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
samba-4.6.7: This /work/armv5te-oe-linux-gnueabi/samba/4.6.7-r0/pseudo/ps=
eudo.log indicates 17 errors [qa_pseudo]
sg3-utils-1.42: This /work/core2-64-oe-linux/sg3-utils/1.42-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
slang-2.3.1a: This /work/aarch64-oe-linux/slang/2.3.1a-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
slang-2.3.1a: This /work/core2-64-oe-linux/slang/2.3.1a-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
soci-3.2.2: This /work/aarch64-oe-linux/soci/3.2.2-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/aarch64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
sthttpd-2.27.1: This /work/aarch64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pse=
udo/pseudo.log indicates 8 errors [qa_pseudo]
sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
strace-4.18: This /work/aarch64-oe-linux/strace/4.18-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
stress-ng-0.08.17: This /work/core2-64-oe-linux/stress-ng/0.08.17-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
subversion-1.9.6: This /work/core2-64-oe-linux/subversion/1.9.6-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
systemd-bootchart-231+gitAUTOINC+9ee2ffc1dc: This /work/armv5te-oe-linux-=
gnueabi/systemd-bootchart/231+gitAUTOINC+9ee2ffc1dc-r0/pseudo/pseudo.log =
indicates 18 errors [qa_pseudo]
tcl-8.6.7: This /work/aarch64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log ind=
icates 5 errors [qa_pseudo]
tcl-8.6.7: This /work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo=
=2Elog indicates 7 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log in=
dicates 5 errors [qa_pseudo]
tcpreplay-4.2.6: This /work/core2-64-oe-linux/tcpreplay/4.2.6-r0/pseudo/p=
seudo.log indicates 10 errors [qa_pseudo]
tcp-wrappers-7.6: This /work/armv5te-oe-linux-gnueabi/tcp-wrappers/7.6-r1=
0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/=
pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/core2-64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
tiff-4.0.8: This /work/core2-64-oe-linux/tiff/4.0.8-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
tomoyo-tools-2.5.0: This /work/armv5te-oe-linux-gnueabi/tomoyo-tools/2.5.=
0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
trace-cmd-2.6.1: This /work/armv5te-oe-linux-gnueabi/trace-cmd/2.6.1-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
ufw-0.33: This /work/aarch64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indic=
ates 5 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indi=
cates 9 errors [qa_pseudo]
util-linux-2.31: This /work/core2-64-oe-linux/util-linux/2.31-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
v4l-utils-1.12.3: This /work/aarch64-oe-linux/v4l-utils/1.12.3-r0/pseudo/=
pseudo.log indicates 16 errors [qa_pseudo]
vo-amrwbenc-0.1.3: This /work/armv5te-oe-linux-gnueabi/vo-amrwbenc/0.1.3-=
r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
weston-3.0.0: This /work/aarch64-oe-linux/weston/3.0.0-r0/pseudo/pseudo.l=
og indicates 16 errors [qa_pseudo]
weston-3.0.0: This /work/core2-64-oe-linux/weston/3.0.0-r0/pseudo/pseudo.=
log indicates 16 errors [qa_pseudo]
weston-init-1.0: This /work/all-oe-linux/weston-init/1.0-r0/pseudo/pseudo=
=2Elog indicates 4 errors [qa_pseudo]
xf86-input-tslib-0.0.6: This /work/armv5te-oe-linux-gnueabi/xf86-input-ts=
lib/2_0.0.6-r21.1/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xf86vidmodeproto-2.3.1: This /work/armv5te-oe-linux-gnueabi/xf86vidmodepr=
oto/1_2.3.1-r1/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
xfce4-notifyd-0.4.0: This /work/aarch64-oe-linux/xfce4-notifyd/0.4.0-r0/p=
seudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-sensors-plugin-1.2.97: This /work/armv5te-oe-linux-gnueabi/xfce4-se=
nsors-plugin/1.2.97-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xvinfo-1.1.3: This /work/armv5te-oe-linux-gnueabi/xvinfo/1_1.1.3-r0/pseud=
o/pseudo.log indicates 6 errors [qa_pseudo]
xvinfo-1.1.3: This /work/core2-64-oe-linux/xvinfo/1_1.1.3-r0/pseudo/pseud=
o.log indicates 9 errors [qa_pseudo]
xz-5.2.3: This /work/core2-64-oe-linux/xz/5.2.3-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
zeromq-4.1.6: This /work/core2-64-oe-linux/zeromq/4.1.6-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
znc-1.6.0: This /work/armv5te-oe-linux-gnueabi/znc/1.6.0-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
af7d63b tinfoil: Ensure we clean up loggers
not included in master yet:=20
ab1c49a world-image: add extra target
d8f0984 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
f706448 maintainers.inc: add Otavio Salvador for go-dep
not included in master yet:=20
d9e573c systemd: Fix build with musl/mips64
df0dba1 report-error: Allow to upload reports automatically
744d294 buildhistory.bbclass: metadata-revs show repo parent
e70d0cf metadata-revs: provide more information
34fdc77 qemux86: Add identical qemux86copy variant for tests
462eee1 reproducible_build.bbclass: initial support for binary reproducib=
ility
7bc4cba cpio: provide cpio-replacement-native
103d496 image_types.bbclass: improve cpio image reproducibility
b8602cb rootfs-postcommands.bbclass: support binary reproducibility
2eb4e96 sstate.bbclass: Do not cause build failures due to setscene error=
s
0c49e3e insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
3aeb238 libsdl2: allow to build native and nativesdk
a8ea0a8 libdrm: allow to build native and nativesdk
e5f5183 nativesdk-mesa,mesa-native: add new recipe to build small part of=
 mesa
3b614b1 libepoxy: add support for native(sdk)
93460ba libjpeg-turbo: provide nativesdk version
fa168b9 virglrenderer: add new recipe
7fe9929 virglrenderer: fix target build
da74eb4 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
ca48edc insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
not included in master yet:=20
ebcef48 bridge-utils: modify the AR to cross toolchain
ac49f64 ssmtp: misc recipe updates + add Debian "partial loss of message =
body" fix
033b4cd Revert "smbnetfs: delete blacklisted"
c2d11bd smbnetfs: update update 0.5.3a -> 0.6.0
e97359b dovecot: Fix parallel build
7a637dc gnome-common: add PACKAGECONFIG for autoconf-archive
1cf71a4 samba: add missing RDEPENDS
a890147 python-future: add new recipe
bdec848 python-bcrypt: update to version 3.1.4
37b719f python-cython: update to version 0.27.2
6d08aef python-pymisp: update to version 2.4.81.2
8d2c910 python-pyasn1: update to version 0.3.7
a554740 python-psutil: update to version 5.4.0
aa32614 python-mprpc: update to version 0.1.16
fac63e8 python-paho-mqtt: update to version 1.3.1
37d2346 python-pytest: update to version 3.2.3
9d1f705 python-flask-sqlalchemy: update to version 2.3.2
21d2300 python-pep8: update to version 1.7.1
1cf87ca python-grpcio: update to version 1.6.3
2dc8614 python-cryptography: update to version 2.1.2
be385a1 python-cryptography-vectors: update to version 2.1.2
e04d40e python-constantly: add a recipe for version 15.1.0
ed61435 python-incremental: add an initial recipe for version 17.5.0
c376b6a python-hyperlink: add a recipe for version 17.3.1
a7eadf0 python-attr: add initial recipe for version 0.2.0
e530b42 python-attrs: add an initial recipe for version 17.2.0
f00b0bf python-automat: add an initial recipe for version 0.6.0
ade1c33 python-twisted: clean-up the dependencies
a1db8f3 python-snimpy: refactor to use pypi class
c7f588b python-scrypt: add new package
1cfb007 python3-multidict: update to version 3.3.0
89c796a dnsmasq: update SRC_URI for versions 2.69 and earlier
7035c7b postfix: fix send mail failure and eliminate warning
ffd1568 openvpn: Upgrade 2.4.3 -> 2.4.4
aeed46f arptables: Fix do_install task
47bf718 ddclient: new package
88ba165 lksctp-tools: update and remove from blacklist
60088b7 freediameter: add new recipe
56c1d80 net-snmp: support openssl without 3des
9f7b355 stunnel: fix compile error when openssl disable des support
08a0aed bridge-utils: update to v1.6
9e1f990 python-pydbus: add new recipe
452994b spi-tools: Add version info.
9791355 mraa/upm: drop HAVE_NODEJS conditional
68d5502 gpsd: add missing python-pygps RDEPENDS
0d1e045 can-isotp: add recipe
ed01992 libgpiod: bump version to v0.3.2
8c8811e glflags: Build native version
e384799 grpc: Add recipe for grpc v1.6.6
07a264e iksemel: drop stray patch left behind when iksemel 1.4 recipe was=
 purged
1665de9 iksemel: reinstate recipe with build fixes and update 1.4 -> 1.5
20e460a linpack_1.0.bb: Add linpack benchmark
a7a5204 libeigen: update to 3.3.4
feb8ecd nodejs: Update to 8.9.0
0cb55aa android-tools: do_unpack_extra task removed
0a542ec toybox: Switch to v0.7.5 release
1a94dec mercurial: Update to v4.4
3f7c7c9 mercurial: Support building for target
734b179 dash: Update to v0.5.9.1
06bfb67 ddrescue: Update to v1.22
21ef7ac htop: Update to v2.0.2
14ea76d tmux: Update to v2.6
e298ad8 dumb-init: New recipe
3c98d43 whetstone_1.2.bb: Add whetstone benchmark
a7dc151 apache2: update to version 2.4.29
b4118b9 phpmyadmin: update to version 4.7.5
65b69f4 nginx: update stable version to 1.12.2
c456768 nginx: update development version to 1.13.6
11e34c8 hiawatha: update to version 10.7
241d1a2 netdata: update to version 1.8.0
c94b26a README: add self as maintainer
0a6ccba libnet-dns-perl: update to version 1.13
ec0f008 libxml-libxml-perl: update to version 2.0131
9ed375e python-pyusb: update to version 1.0.2
66226e5 python-ply: update to use the pypi class
9f49c7c python-pysmi: update recipe to use pypi
feb8329 tumbler: make thumbnails work again
d2ee4a1 xfce4-settings: update to 4.12.1
a5d9ecc libgphoto2: update 2.5.8 -> 2.5.14
3addd45 gphoto2: update 2.5.8 -> 2.5.14
277bbb6 xfce4-notifyd: update 0.3.6 -> 0.4.0
fdb37da xfce4-pulseaudio-plugin: update 0.2.4 -> 0.3.2
00cbbf5 xfce4-weather-plugin: update 0.8.9 -> 0.8.10
be5487c xfce4-xkb-plugin: update 0.8.0 -> 0.8.1
9a2f16e xfce4-appfinder: update 4.12.0 -> 4.13.0
fdff2e2 gparted: update 0.28.1 -> 0.30.0
b959225 corosync: 2.4.2 -> 2.4.3
cdc065e samba: fix for AD DC service

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order ca=
ll
not included in master yet:=20
197811b qtwebengine: make test suite succeed

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
26d5066 firefox: fix build failures
not included in master yet:=20
6773bf9 meta: drop ${COREBASE}/LICENSE references

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REPORT STOP =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20


