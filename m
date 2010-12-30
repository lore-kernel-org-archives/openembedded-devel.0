Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYNMJ-0007Bj-0W for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 19:36:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYNM2-0005xx-ON for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 19:36:02 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 19:36:02 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 19:36:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 30 Dec 2010 19:35:48 +0100
Message-ID: <ifije4$p3n$1@dough.gmane.org>
References: <4D1C4E4A.5000705@eukrea.com> <ifhrie$a01$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <ifhrie$a01$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
Subject: Re: ti-c6accel-1_01_00_01: link error
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
X-List-Received-Date: Thu, 30 Dec 2010 18:36:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-12-10 12:48, Koen Kooi wrote:
> On 30-12-10 10:18, Eric Bénard wrote:
>> hi,
> 
>> using today's master + angstrom 2010.x + beagleboard I get the following
>> error :
> 
>> .../...
>> Linking c6accel_app from appMain.o c6accel_testfxns.o
>> ../c6accelw/lib/c6accelw_omap3530.a470MV c6accel_app_config/linker.cmd..
>> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
>> warning: c6accel_app_config/linker.cmd contains output sections; did you
>> forget -T?
>> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
>> .gnu.attributes not found for insert
>> collect2: ld returned 1 exit status
> 
>> Any idea on how to fix this ?
> 
> This is a combination of a bug in xdctools and c6accel, could you open
> an issue on e2e.ti.com for this so the right people (e.g. Gagan for
> c6accel and Sasa for xdctools) can have a look at it?
> There was a work around for a codesourcery bug in xdctools that broke
> any non-CSL toolchain when building codec-engine, and the fix seems to
> have some side effects, like the one you are seeing.
> 
> You can get the command it's trying to run by commenting the 'VERBOSE =
> @' in the Makefile in soc/app/something.

FWIW, the full commandline is:

| Linking c6accel_app from appMain.o c6accel_testfxns.o
../c6accelw/lib/c6accelw_omap3530.a470MV c6accel_app_config/linker.cmd..
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc
-
-L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/lib
-
-L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
- -Wl,-O1 -Wl,--hash-style=gnu -lm -lpthread -o c6accel_app appMain.o
c6accel_testfxns.o ../c6accelw/lib/c6accelw_omap3530.a470MV
c6accel_app_config/linker.cmd
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc
-
-L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/lib
-
-L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
- -Wl,-O1 -Wl,--hash-style=gnu -lm -lpthread -o c6accel_app appMain.o
c6accel_testfxns.o ../c6accelw/lib/c6accelw_omap3530.a470MV
c6accel_app_config/linker.cmd
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
warning: c6accel_app_config/linker.cmd contains output sections; did you
forget -T?
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
.gnu.attributes not found for insert


And the linkerscript is:

INPUT(

/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/usrp-e1xx-angstrom-linux-gnueabi/ti-c6accel-1_01_00_03-r95a/c6accel_1_01_00_03/soc/app/c6accel_app_config/package/cfg/c6accel_app_xv5T.ov5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/universal/lib/release/universal.av5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/lib/release/ce.av5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/alg/lib/release/Algorithm_noOS.av5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/alg/lib/release/alg.av5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/ipc/dsplink/lib/release/ipc_dsplink_3530.av5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/osal/linux/lib/release/osal_linux_470.av5T

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/acpy3/lib/release/acpy3.a470MV

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/dman3/lib/release/dman3Cfg.a470MV

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/rmm.av5T

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/smgr.av5T

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/rmmp.av5T

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/smgrmp.av5T

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/shm.av5T

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/memutils/lib/release/memutils.av5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/utils/xdm/lib/release/XdmUtils.av5T

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/utils/trace/lib/release/gt.av5T

staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/node/lib/release/node.av5T

staging/usr/share/ti/ti-local-power-manager-tree/packages/ti/bios/power/lib/release/lpm.av5T

staging/usr/share/ti/ti-dsplink-tree/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib

staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/scpy/lib/release/scpy.av5T

staging/usr/share/ti/ti-linuxutils-tree/packages/ti/sdo/linuxutils/cmem/lib/cmem.a470MV

staging/usr/share/ti/ti-linuxutils-tree/packages/ti/sdo/linuxutils/sdma/lib/sdma.a470MV

staging/usr/share/ti/ti-xdctools-tree/packages/gnu/targets/arm/rtsv5T/lib/gnu.targets.arm.rtsv5T.av5T
)

SECTIONS {
    xdc.meta (COPY) : {*(xdc.meta)}

}

INSERT BEFORE .gnu.attributes

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNHNEEMkyGM64RGpERAg6kAJ4jzEirkwTUT/UzHfBnMoNdqRaSlACfWQJC
a0cHcgDlPFC8wTecJiOMVpE=
=owMO
-----END PGP SIGNATURE-----



