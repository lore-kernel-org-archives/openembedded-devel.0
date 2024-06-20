Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBD5C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 07:06:19 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] bpftool: Add missing dep on elfutils-native
To: openembedded-devel@lists.openembedded.org
From: "chenheyun" <chen_heyun@163.com>
X-Originating-Location: Chongqing, CN (183.66.200.41)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Jun 2024 00:06:15 -0700
References: <20240201072150.3751126-1-raj.khem@gmail.com>
In-Reply-To: <20240201072150.3751126-1-raj.khem@gmail.com>
Message-ID: <2056.1718867175546392732@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="V9wsYvHcYCGUOkf3H5nU"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 07:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110971

--V9wsYvHcYCGUOkf3H5nU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi=EF=BC=8C
this patch may be have some problem=E3=80=82
bitbake bpftool=EF=BC=9A
chy@ubuntu:/home/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/t=
mp/work-shared/qemuarm64/kernel-source/tools/bpf/bpftool$ make -C /home/sam=
/work/qemu-buildsystem/buildsystem3.0/buildsystem/source/kernel/linux-6.1.8=
3/tools/lib/bpf OUTPUT=3D/home/sam/work/qemu-buildsystem/buildsystem3.0/bui=
ld/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/boots=
trap/libbpf/ =C2=A0DESTDIR=3D/home/sam/work/qemu-buildsystem/buildsystem3.0=
/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/b=
ootstrap/libbpf prefix=3D =C2=A0ARCH=3D CROSS_COMPILE=3D CC=3Dgcc =C2=A0-is=
ystem/home/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tmp/wor=
k/qemuarm64-poky-linux/bpftool/1.0-r0/recipe-sysroot-native/usr/include -O2=
 -pipe LD=3Dld AR=3Dar /home/sam/work/qemu-buildsystem/buildsystem3.0/build=
/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/bootstr=
ap/libbpf/libbpf.a install_headers
make: invalid option -- 'y'
make: invalid option -- '/'

i guss that=EF=BC=9A
HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS}"
should be this=EF=BC=9A
HOSTCC=3D"${BUILD_CC}

because=EF=BC=8C HOSTCC is used in =EF=BC=9A

$(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(=
LIBBPF_BOOTSTRAP_OUTPUT)
echo chy____________1___$(BPF_DIR) _______________________
$(Q)$(MAKE) -C $(BPF_DIR) OUTPUT=3D$(LIBBPF_BOOTSTRAP_OUTPUT) \
DESTDIR=3D$(LIBBPF_BOOTSTRAP_DESTDIR:/=3D) prefix=3D \
ARCH=3D CROSS_COMPILE=3D CC=3D$(HOSTCC) LD=3D$(HOSTLD) AR=3D$(HOSTAR) $@ in=
stall_headers
echo chy____________2__________________________

if HOSTCC=3D ${BUILD_CC} and ${BUILD_CFLAGS}
it will be err in step make -C =EF=BC=9A

make -C /home/sam/work/qemu-buildsystem/buildsystem3.0/buildsystem/source/k=
ernel/linux-6.1.83/tools/lib/bpf OUTPUT=3D/home/sam/work/qemu-buildsystem/b=
uildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/=
bpftool-1.0/bootstrap/libbpf/ =C2=A0DESTDIR=3D/home/sam/work/qemu-buildsyst=
em/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0=
-r0/bpftool-1.0/bootstrap/libbpf prefix=3D =C2=A0ARCH=3D CROSS_COMPILE=3D *=
CC=3Dgcc* *-isystem/home/sam/work/qemu-buildsystem/buildsystem3.0/build/qem=
uarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/recipe-sysroot-native/u=
sr/include -O2 -pipe* LD=3Dld AR=3Dar /home/sam/work/qemu-buildsystem/build=
system3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpft=
ool-1.0/bootstrap/libbpf/libbpf.a install_headers

--V9wsYvHcYCGUOkf3H5nU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi=EF=BC=8C<br />&nbsp; this patch may be have some problem=E3=80=82<br />&=
nbsp; bitbake <span style=3D"color: #333333; font-family: system-ui, 'Segoe=
 UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans=
-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Col=
or Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-w=
rap; background-color: #ffffff; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial; display: inline !i=
mportant; float: none;">bpftool=EF=BC=9A<br />chy@ubuntu:/home/sam/work/qem=
u-buildsystem/buildsystem3.0/build/qemuarm64/tmp/work-shared/qemuarm64/kern=
el-source/tools/bpf/bpftool$ make -C /home/sam/work/qemu-buildsystem/builds=
ystem3.0/buildsystem/source/kernel/linux-6.1.83/tools/lib/bpf OUTPUT=3D/hom=
e/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm=
64-poky-linux/bpftool/1.0-r0/bpftool-1.0/bootstrap/libbpf/ &nbsp;DESTDIR=3D=
/home/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tmp/work/qem=
uarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/bootstrap/libbpf prefix=3D &nb=
sp;ARCH=3D CROSS_COMPILE=3D CC=3Dgcc &nbsp;-isystem/home/sam/work/qemu-buil=
dsystem/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftoo=
l/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe LD=3Dld AR=3Dar /home/=
sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64=
-poky-linux/bpftool/1.0-r0/bpftool-1.0/bootstrap/libbpf/libbpf.a install_he=
aders<br />make: invalid option -- 'y'<br />make: invalid option -- '/'<br =
/><br />i guss that=EF=BC=9A<br /><span style=3D"color: #333333; font-famil=
y: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberatio=
n Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe U=
I Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lette=
r-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tr=
ansform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; white-space: pre-wrap; background-color: #ffffff; text-decoration-thickne=
ss: initial; text-decoration-style: initial; text-decoration-color: initial=
; display: inline !important; float: none;">HOSTCC=3D"${BUILD_CC} ${BUILD_C=
FLAGS}" </span><br />should be this=EF=BC=9A<br /><span style=3D"color: #33=
3333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto S=
ans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-de=
coration-thickness: initial; text-decoration-style: initial; text-decoratio=
n-color: initial; display: inline !important; float: none;"><span style=3D"=
color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue=
', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', =
'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #fffff=
f; text-decoration-thickness: initial; text-decoration-style: initial; text=
-decoration-color: initial; display: inline !important; float: none;">HOSTC=
C=3D"${BUILD_CC}</span></span><br /><br />because=EF=BC=8C<span style=3D"co=
lor: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue',=
 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'S=
egoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; fon=
t-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; t=
ext-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff;=
 text-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial; display: inline !important; float: none;"><span s=
tyle=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvet=
ica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color =
Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size:=
 16px; font-style: normal; font-variant-ligatures: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align=
: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color=
: #ffffff; text-decoration-thickness: initial; text-decoration-style: initi=
al; text-decoration-color: initial; display: inline !important; float: none=
;"><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">HOSTCC is used in =EF=BC=9A<br /><br />$(LIBBPF_BOOTSTRAP): $(=
wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT=
)<br />&nbsp; &nbsp; echo chy____________1___$(BPF_DIR) ___________________=
____<br />&nbsp; &nbsp; $(Q)$(MAKE) -C $(BPF_DIR) OUTPUT=3D$(LIBBPF_BOOTSTR=
AP_OUTPUT) \<br />&nbsp; &nbsp; &nbsp; &nbsp; DESTDIR=3D$(LIBBPF_BOOTSTRAP_=
DESTDIR:/=3D) prefix=3D \<br />&nbsp; &nbsp; &nbsp; &nbsp; ARCH=3D CROSS_CO=
MPILE=3D CC=3D$(HOSTCC) LD=3D$(HOSTLD) AR=3D$(HOSTAR) $@ install_headers<br=
 />&nbsp; &nbsp; echo chy____________2__________________________<br /><br /=
></span></span></span>if <span style=3D"color: #333333; font-family: system=
-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', =
Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'=
, 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: #ffffff; text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial; display=
: inline !important; float: none;"><span style=3D"color: #333333; font-fami=
ly: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberati=
on Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe =
UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; white-space: pre-wrap; background-color: #ffffff; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l; display: inline !important; float: none;">HOSTCC=3D <span style=3D"color=
: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'N=
oto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Sego=
e UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial; display: inline !important; float: none;"><span styl=
e=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica=
 Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emo=
ji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16=
px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #=
ffffff; text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">=
${BUILD_CC} and &nbsp;<span style=3D"color: #333333; font-family: system-ui=
, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', '=
Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; orphans: 2; text-align: start; text-indent: 0px; text-transform: non=
e; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spac=
e: pre-wrap; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;"><span style=3D"color: #333333; font-family:=
 system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation =
Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI =
Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
white-space: pre-wrap; background-color: #ffffff; text-decoration-thickness=
: initial; text-decoration-style: initial; text-decoration-color: initial; =
display: inline !important; float: none;">${BUILD_CFLAGS}</span></span><br =
/></span></span></span></span>it will be err in step make -C =EF=BC=9A<br /=
><br />make -C /home/sam/work/qemu-buildsystem/buildsystem3.0/buildsystem/s=
ource/kernel/linux-6.1.83/tools/lib/bpf OUTPUT=3D/home/sam/work/qemu-builds=
ystem/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/=
1.0-r0/bpftool-1.0/bootstrap/libbpf/ &nbsp;DESTDIR=3D/home/sam/work/qemu-bu=
ildsystem/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpft=
ool/1.0-r0/bpftool-1.0/bootstrap/libbpf prefix=3D &nbsp;ARCH=3D CROSS_COMPI=
LE=3D<strong> CC=3Dgcc</strong> &nbsp;<strong>-isystem/home/sam/work/qemu-b=
uildsystem/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpf=
tool/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe</strong> LD=3Dld AR=
=3Dar /home/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tmp/wo=
rk/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/bootstrap/libbpf/libbpf.=
a install_headers<br /><br /><br /></span>

--V9wsYvHcYCGUOkf3H5nU--

