Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2f8P-0007d0-IZ for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 09:43:41 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2f0E-0006tA-57 for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 09:35:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 09:35:14 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 09:35:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 29 Feb 2012 09:35:05 +0100
Message-ID: <jiknvo$vve$1@dough.gmane.org>
References: <1330473755-21491-1-git-send-email-Chase.Maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1330473755-21491-1-git-send-email-Chase.Maupin@ti.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCHv2] nbench-byte-2.3.3: import recipe from oe-classic
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
X-List-Received-Date: Wed, 29 Feb 2012 08:43:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-02-12 01:02, Chase Maupin schreef:
> * Import the nbench-byte recipe from the oe-classic git repo at 
> git://git.openembedded.org/openembedded commit id: *
> 6fe7cef27069415f2eba36bc640cf59013d4979b * Update LICENSE checksums *
> Tested on an AM335x EVM which is the same processor as the beaglebone.
> 
> * Original Author: * Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> *
> Modifications by: * Koen Kooi <koen@openembedded.org> * Martin Jansa
> <Martin.Jansa@gmail.com> * Chris Larson <chris_larson@mentor.com>
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com> --- * Updated in
> version 2 * Addressed commit message comments by Paul Menzel * Changed
> the PR down to r0 --- .../nbench-byte/nbench-byte/nbench_32bits.patch
> |   46 ++++++++++++++++++++ .../nbench-byte/nbench-byte_2.2.3.bb
> |   26 +++++++++++ 2 files changed, 72 insertions(+), 0 deletions(-) 
> create mode 100644
> meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch 
> create mode 100644
> meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> 
> diff --git
> a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch
> b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch 
> new file mode 100644 index 0000000..1b8a4dc --- /dev/null +++
> b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch 
> @@ -0,0 +1,46 @@ +From 81f4043a6787060029ef20eed21cdcf3e50337df Mon Sep
> 17 00:00:00 2001 +From: Chase Maupin <Chase.Maupin@ti.com> +Date: Tue, 28
> Feb 2012 14:58:35 -0600 +Subject: [PATCH] nbench: modify Makefile for
> 32bit + +* Patch taken from OE classic git repository as of commit id +
> ad42bf9065928b2902d7d9534709d3ccea7ec956 and was added by: +    * Marcin
> Juszkiewicz <marcin@juszkiewicz.com.pl> +* Notes from original patch
> were: + +BYTE Magazine's native benchmarks (also called BYTEmark)
> designed to +expose the capabilities of a system's CPU, FPU and memory
> system. + +http://www.tux.org/~mayer/linux/ + +Recipe from old Atmel
> overlay. + +Upstream-Status: Inappropriate [no upstream] + 
> +Signed-off-by: Chase Maupin <chase.maupin@ti.com> +--- + Makefile |    8
> ++------ + 1 files changed, 2 insertions(+), 6 deletions(-) + +diff --git
> a/Makefile b/Makefile +index 5045c77..915866d 100644 +--- a/Makefile ++++
> b/Makefile +@@ -119,12 +119,8 @@ emfloat.o: emfloat.h emfloat.c
> nmglobal.h pointer.h Makefile + 	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\ +
> -c emfloat.c + +-pointer.h: pointer Makefile +-	$(CC) $(MACHINE)
> $(DEFINES) $(CFLAGS)\ +-		-o pointer pointer.c +-	rm -f pointer.h +-	if [
> "4" = `./pointer` ] ; then touch pointer.h ;\ +-	else echo "#define
> LONG64" >pointer.h ; fi ++pointer.h: Makefile ++	touch pointer.h ; + +
> misc.o: misc.h misc.c Makefile + 	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\ 
> +-- +1.7.0.4 + diff --git
> a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb new file
> mode 100644 index 0000000..daee7b1 --- /dev/null +++
> b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb @@ -0,0
> +1,26 @@ +DESCRIPTION = "BYTE Magazine's native benchmarks (also called
> BYTEmark) \ +designed to expose the capabilities of a system's CPU, FPU,
> \ +and memory system." +HOMEPAGE = "http://www.tux.org/~mayer/linux/" 
> +LICENSE = "freely distributable" +LIC_FILES_CHKSUM =
> "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
>
> 
+SECTION = "console/utils"
> + +SRC_URI = "http://www.tux.org/~mayer/linux/${PN}-${PV}.tar.gz \ +
> file://nbench_32bits.patch" + +PR = "r0"

Please remove that one, setting it to the default is bogus

> + +TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}" +do_compile() { +	oe_runmake 
> +} + +do_install () { +	install -d ${D}${bindir} +	install -m 0644
> NNET.DAT ${D}${bindir}/ +	install -m 0755 nbench ${D}${bindir}/ +} + 
> +SRC_URI[md5sum] = "285dfab361080759d477ea1fe7d3093a" +SRC_URI[sha256sum]
> = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed9101ac"

Those need to go right below SRC_URI

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9N4zUACgkQMkyGM64RGpGGkgCfWGVo9HG/Sc2B6iOB826wLjxs
h10AmwRzhhCadWcgqe+wZDcm3DVeFKyt
=Np32
-----END PGP SIGNATURE-----



