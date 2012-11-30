Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <andreasnagel@gmx.net>) id 1TeOmb-0005UB-DB
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 12:29:26 +0100
Received: (qmail invoked by alias); 30 Nov 2012 11:08:27 -0000
Received: from host-80-81-19-29.customer.m-online.net (EHLO [192.168.10.98])
	[80.81.19.29]
	by mail.gmx.net (mp012) with SMTP; 30 Nov 2012 12:08:27 +0100
X-Authenticated: #13192847
X-Provags-ID: V01U2FsdGVkX191bHJNxiN14F+O4NpBa6oaglRtRsz7TI3fROQsrB
	mOlM//wjSrrygT
Message-ID: <50B8943B.2060503@gmx.net>
Date: Fri, 30 Nov 2012 12:10:51 +0100
From: Andreas Nagel <andreasnagel@gmx.net>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
Subject: Undefined reference to '__init_array_end' and '__init_array_start'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 11:29:26 -0000
X-Groupsio-MsgNum: 41826
Content-Type: multipart/mixed; boundary="------------080906000009040103020904"

--------------080906000009040103020904
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am trying to bitbake the packages from the 'meta-ti' layer. As I am 
using DMAI in my application, I just bitbake 'ti-dmai' and it will also 
build all its dependencies. At some package, the build fails at the 
linking stage. Depending on the versions of these packages, it's always 
another package that fails to link but always with the same error:

--------------------
... libc_nonshared.a(elf-init.oS): In function '__libc_csu_init':
.../elf-init.c:123: undefined reference to '__init_array_end'
.../elf-init.c:123: undefined reference to '__init_array_start'

.../ld <file>: hidden symbol '__init_array_end' isn't defined

../ld: final link failed: Nonrepresentable section on output
--------------------

The complete log of this error is attached as 'error.txt'.
Somehow these symbols cannot be resolved during linking. Somethings 
probably missing.

--> How can I resolve this problem?


Some more information:

The standard versions (see standard.txt) of the TI packages that come 
with OE can be built successfully, but the performance in my application 
is bad.

Before that, I used the TI stuff from their DVSDK. Performance was good 
with that. So I modified the recipes, to get those versions (see 
dvsdk-4_01.txt) in OE and check performance again. All packages except 
DMAI built fine, but when it came to building the example applications 
of DMAI, it failed with the above error. As my application is similar to 
these examples, it will probably also fail to build.

Recently, there was DVSDK v4.03 released. It was updated to 2.6.37 
kernel along with some packages. Tried to get those versions (see 
dvsdk-4_03.txt) into OE but the error appeared much earlier this time. 
Something is definetly not right here.

We use OE with Angstrom distribution v2012.05, eglibc 2.12 and Linux 
kernel 2.6.37. Maybe these don't match together quite well... ?

I hope, someone can help. It'll be much appreciated.

Kind regards,
Andreas

--------------080906000009040103020904
Content-Type: text/plain; charset=UTF-8;
 name="dvsdk-4_01.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dvsdk-4_01.txt"

biosutils_1_02_02
cgt6x_6_1_14
codec-engine_2_26_01_09
codecs-omap3530_4_00_00_00
dmai_2_20_00_14
dspbios_5_41_03_17
dsplink_1_65_00_02
edma3lld_01_11_00_03
framework-components_2_25_03_07
linuxutils_2_25_05_11
local-power-manager_1_24_02_09
xdais_6_26_00_02
xdctools_3_16_03_36


--------------080906000009040103020904
Content-Type: text/plain; charset=UTF-8;
 name="dvsdk-4_03.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dvsdk-4_03.txt"

biosutils_1_02_02
cgt6x_6_1_14
codec-engine_2_26_02_11
codecs-omap3530_4_02_00_00
dmai_2_20_00_15
dspbios_5_41_03_17
dsplink_1_65_01_05_eng
edma3lld_01_11_02_05
framework-components_2_26_00_01
linuxutils_2_26_02_05
local-power-manager_1_24_03_10_eng
xdais_6_26_01_03
xdctools_3_16_03_36


--------------080906000009040103020904
Content-Type: text/plain; charset=UTF-8;
 name="error.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="error.txt"

make -C /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v201=
2_05-eglibc/sysroots/taoboard/kernel M=3D/home/andreas/tmp/entwicklungsumge=
bung-test/build/tmp-angstrom_v2012_05-eglibc/work/taoboard-angstrom-linux-g=
nueabi/ti-local-power-manager-1_1_24_03_11-r121e/local_power_manager_linux_=
1_24_03_11/packages/ti/bios/power/modules/omap3530/lpm ARCH=3Darm CROSS_COM=
PILE=3Darm-angstrom-linux-gnueabi- clean
make[1]: Entering directory `/home/andreas/tmp/entwicklungsumgebung-test/bu=
ild/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/kernel'
make[1]: Leaving directory `/home/andreas/tmp/entwicklungsumgebung-test/bui=
ld/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/kernel'
rm -f modules.order
rm -f Module.symvers
cat  /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_0=
5-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/export/=
BIN/Linux/OMAP3530/RELEASE/Module.symvers >> Module.symvers
make -C /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v201=
2_05-eglibc/sysroots/taoboard/kernel M=3D/home/andreas/tmp/entwicklungsumge=
bung-test/build/tmp-angstrom_v2012_05-eglibc/work/taoboard-angstrom-linux-g=
nueabi/ti-local-power-manager-1_1_24_03_11-r121e/local_power_manager_linux_=
1_24_03_11/packages/ti/bios/power/modules/omap3530/lpm ARCH=3Darm CROSS_COM=
PILE=3Darm-angstrom-linux-gnueabi- \
        EXTRA_CFLAGS=3D"-DUSE_UDEV -DOS_LINUX -DLINUX_KERNEL -DOS_LINUX -DM=
AX_DSPS=3D1 -DMAX_PROCESSORS=3D2 -DID_GPP=3D1 -DOMAP3530 -DPROC_COMPONENT -=
DPOOL_COMPONENT -DNOTIFY_COMPONENT -DMPCS_COMPONENT -DRINGIO_COMPONENT -DMP=
LIST_COMPONENT -DMSGQ_COMPONENT -DMSGQ_ZCPY_LINK -DCHNL_COMPONENT -DCHNL_ZC=
PY_LINK -DZCPY_LINK -DKFILE_DEFAULT -DOMAP3530 -DOMAP3530_PHYINTERFACE=3DSH=
MEM_INTERFACE -DGPP_SWI_MODE -I/home/andreas/tmp/entwicklungsumgebung-test/=
build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplin=
k-tree/dsplink/gpp/inc -I/home/andreas/tmp/entwicklungsumgebung-test/build/=
tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree=
/dsplink/gpp/inc/usr -I/home/andreas/tmp/entwicklungsumgebung-test/build/tm=
p-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/d=
splink/gpp/inc/sys -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-=
angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsp=
link/gpp/inc/sys/arch -I/home/andreas/tmp/entwicklungsumgebung-test/build/t=
mp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/=
dsplink/gpp/inc/sys/arch/OMAP3530 -I/home/andreas/tmp/entwicklungsumgebung-=
test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-d=
splink-tree/dsplink/gpp/inc/sys/arch/OMAP3530/Linux -I/home/andreas/tmp/ent=
wicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard=
/usr/share/ti/ti-dsplink-tree/dsplink/gpp/inc/sys/Linux -I/home/andreas/tmp=
/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taob=
oard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/inc/sys/Linux/2.6.18 -I/home/=
andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sy=
sroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/gen -I/home/an=
dreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sysr=
oots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/gen/Linux -I/hom=
e/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/=
sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/gen/Linux/2.=
6.18 -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012=
_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/o=
sal -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_=
05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/os=
al/Linux -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v=
2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/s=
rc/osal/Linux/2.6.18 -I/home/andreas/tmp/entwicklungsumgebung-test/build/tm=
p-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/d=
splink/gpp/src/pmgr -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp=
-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/ds=
plink/gpp/src/pmgr/Linux -I/home/andreas/tmp/entwicklungsumgebung-test/buil=
d/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tr=
ee/dsplink/gpp/src/pmgr/Linux/2.6.18 -I/home/andreas/tmp/entwicklungsumgebu=
ng-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/t=
i-dsplink-tree/dsplink/gpp/src/api -I/home/andreas/tmp/entwicklungsumgebung=
-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-=
dsplink-tree/dsplink/gpp/src/api/Linux -I/home/andreas/tmp/entwicklungsumge=
bung-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti=
/ti-dsplink-tree/dsplink/gpp/src/api/Linux/2.6.18 -I/home/andreas/tmp/entwi=
cklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/u=
sr/share/ti/ti-dsplink-tree/dsplink/gpp/src/ldrv -I/home/andreas/tmp/entwic=
klungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/us=
r/share/ti/ti-dsplink-tree/dsplink/gpp/src/ldrv/Linux -I/home/andreas/tmp/e=
ntwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sysroots/taoboa=
rd/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/ldrv/Linux/2.6.18 -I/home/a=
ndreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/sys=
roots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/ldrv/DRV -I/hom=
e/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/=
sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/ldrv/DATA -I=
/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-egl=
ibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/ldrv/MPC=
S -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05=
-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/src/ldrv=
/MPLIST -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2=
012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp/sr=
c/ldrv/MQT -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom=
_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/gpp=
/src/ldrv/IPS -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angst=
rom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dsplink/=
gpp/src/ldrv/SMM -I/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-an=
gstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree/dspli=
nk/gpp/src/ldrv/RINGIO -I/home/andreas/tmp/entwicklungsumgebung-test/build/=
tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink-tree=
/dsplink/gpp/src/ldrv/POOLS -I/home/andreas/tmp/entwicklungsumgebung-test/b=
uild/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/usr/share/ti/ti-dsplink=
-tree/dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal" modules
make[1]: Entering directory `/home/andreas/tmp/entwicklungsumgebung-test/bu=
ild/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/kernel'
  CC [M]  /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2=
012_05-eglibc/work/taoboard-angstrom-linux-gnueabi/ti-local-power-manager-1=
_1_24_03_11-r121e/local_power_manager_linux_1_24_03_11/packages/ti/bios/pow=
er/modules/omap3530/lpm/lpm_driver.o
  CC [M]  /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2=
012_05-eglibc/work/taoboard-angstrom-linux-gnueabi/ti-local-power-manager-1=
_1_24_03_11-r121e/local_power_manager_linux_1_24_03_11/packages/ti/bios/pow=
er/modules/omap3530/lpm/lpm_omap.o
  CC [M]  /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2=
012_05-eglibc/work/taoboard-angstrom-linux-gnueabi/ti-local-power-manager-1=
_1_24_03_11-r121e/local_power_manager_linux_1_24_03_11/packages/ti/bios/pow=
er/modules/omap3530/lpm/tal_dsplink_gpp.o
  LD [M]  /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2=
012_05-eglibc/work/taoboard-angstrom-linux-gnueabi/ti-local-power-manager-1=
_1_24_03_11-r121e/local_power_manager_linux_1_24_03_11/packages/ti/bios/pow=
er/modules/omap3530/lpm/lpm_omap3530.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2=
012_05-eglibc/woERROR: Function failed: do_compile (see /home/andreas/tmp/e=
ntwicklungsumgebung-test/build/tmp-angstrom_v2012_05-eglibc/work/taoboard-a=
ngstrom-linux-gnueabi/ti-local-power-manager-1_1_24_03_11-r121e/temp/log.do=
_compile.4513 for further information)
rk/taoboard-angstrom-linux-gnueabi/ti-local-power-manager-1_1_24_03_11-r121=
e/local_power_manager_linux_1_24_03_11/packages/ti/bios/power/modules/omap3=
530/lpm/lpm_omap3530.mod.o
  LD [M]  /home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2=
012_05-eglibc/work/taoboard-angstrom-linux-gnueabi/ti-local-power-manager-1=
_1_24_03_11-r121e/local_power_manager_linux_1_24_03_11/packages/ti/bios/pow=
er/modules/omap3530/lpm/lpm_omap3530.ko
make[1]: Leaving directory `/home/andreas/tmp/entwicklungsumgebung-test/bui=
ld/tmp-angstrom_v2012_05-eglibc/sysroots/taoboard/kernel'
making all: Wed Nov 28 15:29:54 CET 2012 ...
=3D=3D=3D=3D=3D=3D=3D=3D .interfaces [./packages/ti/bios/power/utils] =3D=
=3D=3D=3D=3D=3D=3D=3D
making package.mak (because of package.bld) ...
generating interfaces for package ti.bios.power.utils (because package/pack=
age.xdc.inc is older than package.xdc) ...
.interfaces files complete: Wed Nov 28 15:29:58 CET 2012.
=3D=3D=3D=3D=3D=3D=3D=3D .libraries [./packages/ti/bios/power/utils] =3D=3D=
=3D=3D=3D=3D=3D=3D
.libraries files complete: Wed Nov 28 15:29:58 CET 2012.
=3D=3D=3D=3D=3D=3D=3D=3D .dlls [./packages/ti/bios/power/utils] =3D=3D=3D=
=3D=3D=3D=3D=3D
configuring bin/ti_platforms_evm3530/linux/debug/lpmON.xv5T from package/cf=
g/bin/ti_platforms_evm3530/linux/debug/lpmON_pv5T.cfg ...
clv5T package/cfg/bin/ti_platforms_evm3530/linux/debug/lpmON_pv5T.c ...
configuring bin/ti_platforms_evm3530/linux/release/lpmON.xv5T from package/=
cfg/bin/ti_platforms_evm3530/linux/release/lpmON_pv5T.cfg ...
clv5T package/cfg/bin/ti_platforms_evm3530/linux/release/lpmON_pv5T.c ...
configuring bin/ti_platforms_evm3530/linux/debug/lpmOFF.xv5T from package/c=
fg/bin/ti_platforms_evm3530/linux/debug/lpmOFF_pv5T.cfg ...
clv5T package/cfg/bin/ti_platforms_evm3530/linux/debug/lpmOFF_pv5T.c ...
configuring bin/ti_platforms_evm3530/linux/release/lpmOFF.xv5T from package=
/cfg/bin/ti_platforms_evm3530/linux/release/lpmOFF_pv5T.cfg ...
clv5T package/cfg/bin/ti_platforms_evm3530/linux/release/lpmOFF_pv5T.c ...
.dlls files complete: Wed Nov 28 15:30:14 CET 2012.
=3D=3D=3D=3D=3D=3D=3D=3D .executables [./packages/ti/bios/power/utils] =3D=
=3D=3D=3D=3D=3D=3D=3D
clv5T src/onoff/lpmON.c ...
lnkv5T bin/ti_platforms_evm3530/linux/debug/lpmON.xv5T ...
/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-egl=
ibc/sysroots/taoboard/usr/lib/libc_nonshared.a(elf-init.oS): In function `_=
_libc_csu_init':
/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-egl=
ibc/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r28/eglibc-2_12/libc/csu=
/elf-init.c:123: undefined reference to `__init_array_end'
/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-egl=
ibc/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r28/eglibc-2_12/libc/csu=
/elf-init.c:123: undefined reference to `__init_array_start'
/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-egl=
ibc/sysroots/i686-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.5.4/ld: bin/ti_platforms_evm3530/linux/debug/lpmON.=
xv5T: hidden symbol `__init_array_end' isn't defined
/home/andreas/tmp/entwicklungsumgebung-test/build/tmp-angstrom_v2012_05-egl=
ibc/sysroots/i686-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.5.4/ld: final link failed: Nonrepresentable section=
 on output
collect2: ld returned 1 exit status
make[1]: *** [bin/ti_platforms_evm3530/linux/debug/lpmON.xv5T] Error 1
gmake: *** [packages/ti/bios/power/utils,.executables] Error 2

--------------080906000009040103020904
Content-Type: text/plain; charset=UTF-8;
 name="standard.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="standard.txt"

ti-biosutils_1.02.02.bb
ti-cgt6x_7.2.7.bb
ti-codec-engine_2.26.01.09.bb
ti-codecs-omap3530_4.00.00.00.bb
ti-dmai_svn.bb
ti-dspbios_5.41.11.38.bb
ti-dsplink_1.65.00.03.bb
ti-edma3lld_01.11.01.04.bb
ti-framework-components_2.26.00.01.bb
ti-linuxutils_2.26.01.02.bb
ti-local-power-manager_1.24.02.09.bb
ti-xdais_6.26.01.03.bb
ti-xdctools_3.23.00.32.bb


--------------080906000009040103020904--
