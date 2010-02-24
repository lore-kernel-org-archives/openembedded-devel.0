Received: from exchsrvr.syntech-fuelmaster.com ([199.44.250.2]
	helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1NkLvp-0007Ij-S4
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 19:26:01 +0100
Received: from Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234]) by
	Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234%14]) with mapi;
	Wed, 24 Feb 2010 13:22:32 -0500
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Feb 2010 13:22:31 -0500
Thread-Topic: [oe] linux 2.6.33-rc8 do_stage failed
Thread-Index: Acq1LP3Z/Fg+yKM+Rmuzea4iSWFjTQAUU8cw
Message-ID: <6C2434209962DC46B88345CA85C334A285D6439B58@Courier.syntech.org>
References: <6C2434209962DC46B88345CA85C334A285D6439A81@Courier.syntech.org>
	<cdd918981002240039y4dd88944u24df6e1328d8589d@mail.gmail.com>
In-Reply-To: <cdd918981002240039y4dd88944u24df6e1328d8589d@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 199.44.250.2
X-SA-Exim-Mail-From: mbutsch@syntech-fuelmaster.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: linux 2.6.33-rc8 do_stage failed
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
X-List-Received-Date: Wed, 24 Feb 2010 18:26:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks, that did the trick.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of David MOUSSAUD
Sent: Wednesday, February 24, 2010 3:39 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] linux 2.6.33-rc8 do_stage failed

Hi,

I had the same problem yesterday and I've solved it by modifying the
kernel_do_stage() function of my kernel.bbclass.
The problem comes from the fact that the newer kernels does not use
the same symlinks for include files.

Here is the one I've used, it is mostly the function of the
org.openembedded.dev branch :

BR,

D.MOUSSAUD.

kernel_do_stage() {

if [ -e include/asm ] ; then
# This link is generated only in kernel before 2.6.33-rc1, don't stage
it for newer kernels
ASMDIR=3D`readlink include/asm`
mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
fi

=A0 =A0 =A0 =A0# Kernel 2.6.27 moved headers from includes/asm-${ARCH} to
arch/${ARCH}/include/asm
if [ -e arch/${ARCH}/include/asm/ ] ; then
if [ -e include/asm ] ; then
cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
fi
install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/

# Check for arch/x86 on i386
elif [ -d arch/x86/include/asm/ ]; then
if [ -e include/asm ] ; then
cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
fi
install -d ${STAGING_KERNEL_DIR}/arch/x86/include
cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
fi

=A0 =A0 =A0 =A0if [ -e include/asm ] ; then
rm -f ${STAGING_KERNEL_DIR}/include/asm
ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
fi

=A0 =A0 =A0 =A0for entry in drivers/crypto drivers/media include/generated
include/linux include/net include/pcmcia include/media include/acpi
include/sound include/video include/scsi include/trace; do
if [ -d $entry ]; then
mkdir -p ${STAGING_KERNEL_DIR}/$entry
cp -fR $entry/* ${STAGING_KERNEL_DIR}/$entry/
fi
done


if [ -d drivers/sound ]; then
# 2.4 alsa needs some headers from this directory
mkdir -p ${STAGING_KERNEL_DIR}/include/drivers/sound
cp -fR drivers/sound/*.h ${STAGING_KERNEL_DIR}/include/drivers/sound/
fi

install -m 0644 .config ${STAGING_KERNEL_DIR}/config-${KERNEL_VERSION}
ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/.config
ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/kernel-config
echo "${KERNEL_VERSION}" >${STAGING_KERNEL_DIR}/kernel-abiversion
echo "${S}" >${STAGING_KERNEL_DIR}/kernel-source
echo "${KERNEL_CCSUFFIX}" >${STAGING_KERNEL_DIR}/kernel-ccsuffix
echo "${KERNEL_LDSUFFIX}" >${STAGING_KERNEL_DIR}/kernel-ldsuffix
[ -e Rules.make ] && install -m 0644 Rules.make ${STAGING_KERNEL_DIR}/
[ -e Makefile ] && install -m 0644 Makefile ${STAGING_KERNEL_DIR}/

# Check if arch/${ARCH}/Makefile exists and install it
if [ -e arch/${ARCH}/Makefile ]; then
install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}
install -m 0644 arch/${ARCH}/Makefile* ${STAGING_KERNEL_DIR}/arch/${ARCH}
# Otherwise check arch/x86/Makefile for i386 and x86_64 on kernels >=3D 2.6=
.24
elif [ -e arch/x86/Makefile ]; then
install -d ${STAGING_KERNEL_DIR}/arch/x86
install -m 0644 arch/x86/Makefile* ${STAGING_KERNEL_DIR}/arch/x86
fi
cp -fR include/config* ${STAGING_KERNEL_DIR}/include/
# Install kernel images and system.map to staging
[ -e vmlinux ] && install -m 0644 vmlinux ${STAGING_KERNEL_DIR}/
install -m 0644 ${KERNEL_OUTPUT} ${STAGING_KERNEL_DIR}/${KERNEL_IMAGETYPE}
install -m 0644 System.map ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSIO=
N}
[ -e Module.symvers ] && install -m 0644 Module.symvers ${STAGING_KERNEL_DI=
R}/

cp -fR scripts ${STAGING_KERNEL_DIR}/
}




On Mon, Feb 22, 2010 at 7:06 PM, Mark Butsch
<mbutsch@syntech-fuelmaster.com> wrote:
> Hello,
>
> I am trying to build the 2.6.33-rc8 linux kernel and keep getting a failu=
re in do_stage. The log file that it says to look in is empty (zero bytes).
>
> Any suggestions for troubleshooting/resolving this?
>
> I am using the stable/2009 branch, Angstrom distro and building for an i.=
MX27 board (phytec PCA100). I copied the recipe for linux_2.6.32+2.6.33-rc8=
.bb from the dev branch.
>
> Here is the output from bitbaking:
>
> [mbutsch@tuxoe phytec-mx27]$ bitbake minimal-image
> NOTE: Handling BitBake files: | (6709/6709) [100 %]
> NOTE: Parsing finished. 6405 cached, 1 parsed, 303 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 399 of 989 (ID: 539, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_setscene)
> NOTE: Running task 400 of 989 (ID: 540, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_fetch)
> NOTE: Missing checksum
> NOTE: linux-2.6.32+2.6.33-rc8: http://kernel.org/pub/linux/kernel/v2.6/li=
nux-2.6.32.tar.bz2 has no entry in conf/checksums.ini, not checking URI
> NOTE: Missing checksum
> NOTE: linux-2.6.32+2.6.33-rc8: http://kernel.org/pub/linux/kernel/v2.6/te=
sting/patch-2.6.33-rc8.bz2 has no entry in conf/checksums.ini, not checking=
 URI
> NOTE: Running task 401 of 989 (ID: 541, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_unpack)
> NOTE: Unpacking /home/oe/sources/linux-2.6.32.tar.bz2 to tmp/angstrom/wor=
k/phytecmx27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/
> NOTE: Unpacking /home/oe/sources/patch-2.6.33-rc8.bz2 to tmp/angstrom/wor=
k/phytecmx27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/
> NOTE: Unpacking recipes/linux/linux-2.6.32+2.6.33-rc8/defconfig to tmp/an=
gstrom/work/phytecmx27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/
> NOTE: Running task 424 of 989 (ID: 542, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_patch)
> NOTE: Applying patch 'patch-2.6.33-rc8' (tmp/angstrom/work/phytecmx27-ang=
strom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/patch-2.6.33-rc8)
> NOTE: Running task 425 of 989 (ID: 543, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_configure)
> NOTE: Running task 438 of 989 (ID: 544, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_qa_configure)
> NOTE: Running task 439 of 989 (ID: 545, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_compile)
> NOTE: Running task 479 of 989 (ID: 549, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_sizecheck)
> NOTE: Running task 480 of 989 (ID: 548, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_uboot_mkimage)
> NOTE: Running task 481 of 989 (ID: 546, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_install)
> NOTE: Running task 554 of 989 (ID: 554, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_deploy)
> NOTE: Running task 570 of 989 (ID: 547, /home/ad/mbutsch/phytec-mx27/reci=
pes/linux/linux_2.6.32+2.6.33-rc8.bb, do_populate_staging)
> ERROR: function do_stage failed
> ERROR: see log in /home/ad/mbutsch/phytec-mx27/tmp/angstrom/work/phytecmx=
27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/temp/log.do_stage.2905=
4
> NOTE: Task failed: /home/ad/mbutsch/phytec-mx27/tmp/angstrom/work/phytecm=
x27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/temp/log.do_stage.290=
54
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/ad/mbutsch/phytec-mx27/recipes/linux/linux_2.6.32+2=
.6.33-rc8.bb do_populate_staging failed
> ERROR: Task 547 (/home/ad/mbutsch/phytec-mx27/recipes/linux/linux_2.6.32+=
2.6.33-rc8.bb, do_populate_staging) failed
> NOTE: Tasks Summary: Attempted 569 tasks of which 558 didn't need to be r=
erun and 1 failed.
> ERROR: '/home/ad/mbutsch/phytec-mx27/recipes/linux/linux_2.6.32+2.6.33-rc=
8.bb' failed
> [mbutsch@tuxoe phytec-mx27]$
>
>
> Also, if I 'bitbake -c clean virtual/kernel' it can't find a couple of fi=
les. I don't know if this is related or a clue, but the path for the files =
looks wrong to me with the doubled glibc in ".../angstrom/deploy/glibc/glib=
c/images"
>
> [mbutsch@tuxoe phytec-mx27]$ bitbake -c clean virtual/kernel
> NOTE: Handling BitBake files: | (6709/6709) [100 %]
> NOTE: Parsing finished. 6406 cached, 0 parsed, 303 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1 of 1 (ID: 0, /home/ad/mbutsch/phytec-mx27/recipes/li=
nux/linux_2.6.32+2.6.33-rc8.bb, do_clean)
> NOTE: rm /home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc/glibc/ima=
ges/phytecmx27/uImage-phytecmx27.bin
> rm: cannot remove `/home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc=
/glibc/images/phytecmx27/uImage-phytecmx27.bin': No such file or directory
> NOTE: rm /home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc/glibc/ima=
ges/phytecmx27/uImage-2.6.32+2.6.33-rc8-r2-phytecmx27.bin
> rm: cannot remove `/home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc=
/glibc/images/phytecmx27/uImage-2.6.32+2.6.33-rc8-r2-phytecmx27.bin': No su=
ch file or directory
> NOTE: Removing staging package tmp/angstrom/deploy/glibc/pstage/angstromg=
libc/staging-linux-phytecmx27-angstrom-linux-gnueabi_2.6.32+2.6.33-rc8-r2_x=
86_64-linux.ipk
> NOTE: removing tmp/angstrom/work/phytecmx27-angstrom-linux-gnueabi/linux-=
2.6.32+2.6.33-rc8-r2
> NOTE: removing tmp/angstrom/stamps/phytecmx27-angstrom-linux-gnueabi/linu=
x-2.6.32+2.6.33-rc8-r2.*
> NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun=
 and 0 failed.
>
> Thanks in advance,
>
> Mark
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


