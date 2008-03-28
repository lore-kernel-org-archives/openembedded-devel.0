Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JfJYI-0001Oq-IS
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Mar 2008 19:43:46 +0100
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 56BBD3EA0C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2008 19:43:46 +0100 (CET)
Received: from sharky.jerryweb.org (vau75-7-82-234-248-119.fbx.proxad.net
	[82.234.248.119])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 3AD823EA0EB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2008 19:43:46 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id D716018405E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2008 19:45:53 +0100 (CET)
Message-ID: <47ED3CE1.7020000@bolloretelecom.eu>
Date: Fri, 28 Mar 2008 19:45:53 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.9) Gecko/20080109 Thunderbird/2.0.0.9 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: uImage generation: kernel.bbclass vs linux.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2008 18:43:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

With the recent changes to kernel.bbclass it seems that uboot-mkimage is
called twice:

linux.inc: do_compile_append()

1/ uses uboot-mkimage to generate generates arch/${ARCH}/boot/uImage


kernel.bbclass: do_deploy()

1/ copies arch/${ARCH}/boot/uImage to
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin

2/ does package_stagefile_shell
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin

3/ uses uboot-mkimage to generate
${DEPLOY_DIR_IMAGE}/uImage-${PV}-${PR}-${MACHINE}.bin

This seems pretty inconsistent! Also, why the hard-coded uImage-xyz file
name, shouldn't we be using KERNEL_IMAGE_BASE_NAME?

To make things a bit more interesting, KERNEL_IMAGE_BASE_NAME is set
differently in kernel.bbclass and linux.inc:

kernel.bbclass :
KERNEL_IMAGE_BASE_NAME =
${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"

linux.inc:
KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"

Where do we go from here?

Cheers,
Jeremy


