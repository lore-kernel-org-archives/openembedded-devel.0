Received: from promwad.com ([83.149.69.23])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vladimir.davydov@promwad.com>) id 1Nylkd-0000Pk-FP
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Apr 2010 14:50:17 +0200
Received: from [195.222.85.229] (helo=intranet.promwad.com)
	by promwad.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <vladimir.davydov@promwad.com>) id 1NykpQ-0001sI-6g
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Apr 2010 14:50:52 +0300
Received: from [178.124.121.51] (helo=linux-x8hi.localnet)
	by intranet.promwad.com with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <vladimir.davydov@promwad.com>) id 1Nykop-0002Xf-4h
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Apr 2010 14:50:16 +0300
From: Vladimir Davydov <vladimir.davydov@promwad.com>
Organization: Promwad
To: openembedded-devel@lists.openembedded.org
Date: Mon, 5 Apr 2010 14:50:08 +0300
User-Agent: KMail/1.13.2 (Linux/2.6.31.12-0.2-desktop; KDE/4.4.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201004051450.08298.vladimir.davydov@promwad.com>
X-SA-Exim-Connect-IP: 83.149.69.23
X-SA-Exim-Mail-From: vladimir.davydov@promwad.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: how to enable the linux kernel in separate directory?
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
X-List-Received-Date: Mon, 05 Apr 2010 12:50:26 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

I need your suggestionts, how to enable the linux kernel most correctly in my 
custom case.
I have a directory with unpacked linux kernel source tree.
This tree is under SVN control and used for development.

Now common tree is following:
./kernel-source-tree
./openembedded

I have created bb file for my linux config:
#=========
DESCRIPTION = "Linux Kernel for the mycustom dev platform"
SECTION = "kernel"
LICENSE = "GPLv2"
PR = "r1"
PV = "2.6.31-rc4"

COMPATIBLE_HOST = "arm.*-linux"
COMPATIBLE_MACHINE = "mycustom"

S = "${WORKDIR}/linux-2.6"

inherit kernel

export ARCH="arm"


do_fetch () {
   cd ${WORKDIR}
   ln -sf ${MYCUSTOM_KERNEL_PATH} ${S}
}

do_configure() {
     install -m 644 ${S}/arch/arm/configs/mycustom-did_defconfig ${S}/.config
     make ARCH=${ARCH} oldconfig
}
#=========

MYCUSTOM_KERNEL_PATH is the path to the kernel-source-tree directory.

It uses creation of symlink to the kernel source in the workdir.
Is it very ugly?
Could you suggest more useful variants for my case?


Best regards, 
Vladimir



