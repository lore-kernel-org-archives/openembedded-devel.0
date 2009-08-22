Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MesKj-0000an-8M
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 17:16:45 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A7285AE0022B2AE for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 16:59:12 +0200
Message-ID: <4A9007BF.8060904@atmel.com>
Date: Sat, 22 Aug 2009 16:59:11 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8FBCA1.9050601@atmel.com> <4A8FF9CB.6020607@atmel.com>
In-Reply-To: <4A8FF9CB.6020607@atmel.com>
Subject: Re: Cleaning up the "linux" directory - Available in origin/ulf/linux-2.6.30.2
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
X-List-Received-Date: Sat, 22 Aug 2009 15:16:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ulf Samuelsson skrev:

Just pushed this stuff to my private branch
Also added at91bootstrap-2.14-rc4 (which enables user reset)
a tftpboot recipe, which copies the results to /tftpboot/Angstrom/${MACHINE}
Added the gnome scripts to the scripts/nautilus-scripts directory.

BR
Ulf Samuelsson


> Ulf Samuelsson skrev:
>> As everyone knows, the kernel directory is a mess:
>> I have been thinking about what to do about this,
>> and with the ability to include files in subdirectories,
>> I think I have found a nice solution.
>>
>> New variables
>>
>> CPU_FAMILY
>> KERNEL_MAJOR
>> KERNEL_MINOR
>>
>> For future kernels,
>>
>> Did not try this, yet but this looks promising...
>>
> I have tested a recipe which configures itself based on CPU_FAMILY.
> The recipe is totally CPU/Architecure independent!
> 
> 
> ----------------------------------------------------------------------------
> linux-2.6.30.2.bb contains:
> 
> SECTION = "kernel"
> DESCRIPTION = "Linux kernel 2.6.30.2"
> LICENSE = "GPL"
> 
> KERNEL_MAJOR = "2.6.30"
> KERNEL_MINOR = "2"
> PR = "r0"
> 
> DEFAULT_PREFERENCE = "-1"
> 
> require all-linux-v2.inc
> 
> ----------------------------------------------------------------------------
> As you can see, there is only ONE require/include,
> and that is to a totally generic file,
> which configures the build based on
> 
> CPU_FAMILY
> KERNEL_MAJOR
> KERNEL_MINOR
> 
> The directory structure used to support the at91 for 2.6.30.2:
> 
> 2.6.30
> 	2.6.30.2		# common , currently does nothing...
> 		linux.inc
> 		patches
> 			network_files
> 			SRC_URI_append.inc
> 	at91			# at91 specific
> 		at91.inc
> 		logo_linux_clut224.ppm
> 		2.6.30.2
> 			patch-sets	# Not called "patches" by design
> 				network_files
> 				SRC_URI_append.inc
> 				<patches>
> 			boards
> 				at91sam9g45ek
> 					defconfig
> 					logo_linux_clut224.ppm
> 	The "2.6.30/2.6.30.2" directory can normally be copied to
> 	"2.6.30/2.6.30.3" and renamed if the next kernel version is
> 	needed. No need to edit, if this is pristine.
> 
> 
> It supports adding yet another level of directory in the "patch-sets"
> directory, so that you can have one directory per patch-set.
> 
> 
> 
> 
> ----------------------------------------------------------------------------
> all-linux-v2.inc contains:
> 
> require	linux.inc
> CPU_FAMILY ?= "dummy-arch"
> KERNEL_MAJOR  ?= "${PV}"
> #${FILE_DIRNAME}/
> KERNEL_MAJOR_DIR = "linux-${KERNEL_MAJOR}"
> require ${KERNEL_MAJOR_DIR}/version.inc
> 
> KERNEL_VERSION_DIR = ${KERNEL_MAJOR_DIR}/${KERNEL_VERSION}
> KERNEL_CPU_FAMILY_DIR=${KERNEL_MAJOR_DIR}/${CPU_FAMILY}
> 
> S = "${WORKDIR}/linux-${KERNEL_MAJOR}"
> 
> KERNEL_SOURCE_DIR="${KERNELORG_MIRROR}/pub/linux/kernel/v2.6"
> SRC_URI = "${KERNEL_SOURCE_DIR}/linux-${KERNEL_MAJOR}.tar.bz2 "
> MINOR_PATCH=${KERNEL_SOURCE_DIR}/patch-${KERNEL_MAJOR}.${KERNEL_MINOR}.bz2
> 
> # Include ${MINOR_PATCH} and any other common patches for this minor version
> require	${KERNEL_VERSION_DIR}/patches/SRC_URI_append.inc
> # Any customizations for this minor version
> require	${KERNEL_VERSION_DIR}/linux.inc
> 
> # Customize for the CPU_FAMILY
> # Note that this can contain further includes for minor versions
> require	${KERNEL_CPU_FAMILY_DIR}/${CPU_FAMILY}.inc
> require	${KERNEL_CPU_FAMILY_DIR}/${KERNEL_VERSION}/${KERNEL_VERSION}.inc
> require
> ${KERNEL_CPU_FAMILY_DIR}/${KERNEL_VERSION}/patch-sets/SRC_URI_append.inc
> 
> 
> ----------------------------------------------------------------------------
> I ran into one problem:
> SRC_URI_append_at91sam9g45ek =         "
> file://linux-2.6.30/at91/2.6.30.2/boards/at91sam9g45ek/defconfig "
> 
> moves the file to ${S} and not to ${WORKDIR}
> 
> 
> I took the easy way out with a workaround:
> 
> 	mv ${S}/defconfig ${WORKDIR}/defconfig
> 
> What do I do wrong?
> 


-- 
Best Regards
Ulf Samuelsson



