Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LxPum-0008Hq-Cl
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 20:14:20 +0200
Received: by yx-out-1718.google.com with SMTP id 36so790657yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2009 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=q8y0jjyI3HGtrhffwadzVDRpNs5l+uvgj7ygqG1ESow=;
	b=WXFBsmm+cjN4RbHQQcjNMz35SFTwYUMr24GZhyIs29lT/3qZNewmf9UNZXx5Rj5fk5
	EuGno0skqJe3p6lZgetUAJqlmxTdLcNS60WKuj1Fstt2DrH5zWe3HPfmLCXGFk4Ja54l
	W/JbuuEcRcccFSiBBQDhAcosgFWDroF2zihOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=km3+qREuqvmbFpFdYlb7uZY2bJtfu1RaTzXLjdhkVLRiSkUeUYfvVJ/FDWsnr5fiPu
	1djtRUX+ZRvJMWM+jQ5UFbi17xk5PdOqK53FA3tdjnTK+ON5KYjUUCKmByfGqjgqWRDe
	+ONRo3pWIoaoDKQSXE6jap/FOFhMesptrpZ/Y=
MIME-Version: 1.0
Received: by 10.151.68.3 with SMTP id v3mr2922413ybk.165.1240596575105; Fri, 
	24 Apr 2009 11:09:35 -0700 (PDT)
Date: Fri, 24 Apr 2009 14:09:35 -0400
Message-ID: <f96d234e0904241109m29424bb3h368e30e50d8ec660@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: does omap3-sgx-modules_1.3.13.1397.bb need DEPENDS=virtual/kernel
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
X-List-Received-Date: Fri, 24 Apr 2009 18:14:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I got this during a build:

ERROR: log data follows
(/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-1.3.13.1397-r31/temp/log.do_compile.19743)
| rm: missing operand
| Try `rm --help' for more information.
| NOTE: make -j 5 -e MAKEFLAGS=
KERNEL_PATH=/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel
KERNEL_SRC=/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel
KDIR=/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel
KERNELDIR=/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel
KERNEL_VERSION=2.6.29-omap1 CC=arm-angstrom-linux-gnueabi-gcc
LD=arm-angstrom-linux-gnueabi-ld  AR=arm-angstrom-linux-gnueabi-ar
BUILD=release
| make -C /build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel
M=`pwd`
| make[1]: Entering directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel'
| Makefile:313:
/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel/scripts/Kbuild.include:
No such file or directory
| make: Entering an unknown directory
| make: *** empty variable name.  Stop.
| make: Leaving an unknown directory
| make[1]: *** [_module_/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-1.3.13.1397-r31/omap3-sgx-modules-1.3.13.1397]
Error 2
| make[1]: Leaving directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-1.3.13.1397-r31/temp/log.do_compile.19743
NOTE: package omap3-sgx-modules-1.3.13.1397-r31: task do_compile: failed
ERROR: TaskFailed event exception, aborting

building virtual/kernel first fixed it.

Should DEPENDS=virtual/kernel be added to the recipe, or is there a
better way to fix this?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


