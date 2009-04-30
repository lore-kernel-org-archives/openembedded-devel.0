Received: from [147.162.13.20] (helo=pcimg12.dei.unipd.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bott@pcimg12.dei.unipd.it>) id 1LzWtw-0001kK-3D
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 16:06:12 +0200
Received: by pcimg12.dei.unipd.it (Postfix, from userid 1000)
	id 23109806F87A; Thu, 30 Apr 2009 16:00:50 +0200 (CEST)
Date: Thu, 30 Apr 2009 16:00:50 +0200
From: Ottavio Campana <ottavio@campana.vi.it>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090430140050.GA7313@pcimg12.dei.unipd.it>
MIME-Version: 1.0
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: is ti-codec-engine-broken?
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
X-List-Received-Date: Thu, 30 Apr 2009 14:06:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I have  ti-codec-engine for  dvevm6446 working with  a three  months old
checkout of openembedded.

Today I checked  out the stable/2009 branch, and I  tried to rebuild the
whole system, but it fails on ti-codec-engine.

The error I get is

| make[2]: Leaving directory
`/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstro=
m-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/package=
s/dsplink/dsp/src/samples/mpcsxfer'
| make[1]: Leaving directory
`/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstro=
m-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/package=
s/dsplink/dsp/src/samples'
| NOTE: make -e MAKEFLAGS=3D
| make -C
/db/toolsrc/library/toolsC38/vendors/mvl/arm/dm6446/REL_LSP_02_00_00_010/=
montavista/pro/devkit/lsp/ti-davinci/linux-2.6.18_pro500
M=3D/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angs=
trom-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/pack=
ages/ti/bios/power/modules/dm6446/lpm
ARCH=3Darm
CROSS_COMPILE=3D/db/toolsrc/library/toolsC38/vendors/mvl/arm/mvl5.0/monta=
vista/pro/devkit/arm/v5t_le/bin/arm_v5t_le-
\
|         EXTRA_CFLAGS=3D"-DUSE_UDEV -DOS_LINUX -DLINUX_KERNEL -DRELEASE
-DOS_LINUX -DMAX_DSPS=3D1 -DMAX_PROCESSORS=3D2 -DID_GPP=3D1 -DDAVINCI
-DDSPLINK_LEGACY_SUPPORT -DPROC_COMPONENT -DPOOL_COMPONENT
-DNOTIFY_COMPONENT -DMPCS_COMPONENT -DRINGIO_COMPONENT
-DMPLIST_COMPONENT -DMSGQ_COMPONENT -DMSGQ_ZCPY_LINK -DZCPY_LINK
-DKFILE_DEFAULT -DDM6446GEM -DDM6446GEM_PHYINTERFACE=3DSHMEM_INTERFACE
-D__KERNEL__ -DMODULE -DTRACE_KERNEL -DDDSP_DEBUG
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc/sys/arch
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc/usr
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc/sys
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc/sys/Linux
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc/sys/Linux/2.6.18
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc/sys/arch/DM6446GEM
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/inc/sys/arch/DM6446GEM/Linux
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/pmgr
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/pmgr/Linux
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/src/pmgr/Linux/2.6.18
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/BUILD/INCLUDE
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/BUILD/INCLUDE/USER
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/BUILD/INCLUDE/KRNL
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/export/INCLUDE/Linux/DAVINCI/internal
-I/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstr=
om-linux-gnueabi/ti-codec-engine-221-r19/codec_engine_2_21/cetools/packag=
es/dsplink/../dsplink/gpp/export/INCLUDE/Linux/OMAP3530/internal"
modules
| make: ***
/db/toolsrc/library/toolsC38/vendors/mvl/arm/dm6446/REL_LSP_02_00_00_010/=
montavista/pro/devkit/lsp/ti-davinci/linux-2.6.18_pro500:
No such file or directory.  Stop.
| make: *** [default] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/ottavio/Projects/stuff/openembedded/tmp/work/davinci-dvevm-angstrom=
-linux-gnueabi/ti-codec-engine-221-r19/temp/log.do_compile.16647
NOTE: package ti-codec-engine-221-r19: task do_compile: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/ottavio/Projects/stuff/openembedded/recipes/dsplink/ti-codec-engine=
_2.21.bb
do_compile failed
ERROR: Task 7
(/home/ottavio/Projects/stuff/openembedded/recipes/dsplink/ti-codec-engin=
e_2.21.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 435 tasks of which 435 didn't need to be
rerun and 1 failed.
ERROR:
'/home/ottavio/Projects/stuff/openembedded/recipes/dsplink/ti-codec-engin=
e_2.21.bb'
failed
NOTE: build 200904301548: completed
ottavio@debian2:~/Projects/stuff/openembedded$=20

So, as far as I understand it is looking for
/db/toolsrc/library/toolsC38/vendors/mvl/arm/dm6446/REL_LSP_02_00_00_010/=
montavista/pro/devkit/lsp/ti-davinci/linux-2.6.18_pro500
which does not exists.

Is the receipe broken? Or do you have an idea of what the error might
be?

Thank you,

Ottavio

--=20
Non c'=E8 pi=F9 forza nella normalit=E0, c'=E8 solo monotonia.


