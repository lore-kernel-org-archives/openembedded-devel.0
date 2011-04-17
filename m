Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1QBWfj-0005WU-TI
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:26:14 +0200
Received: by vxd7 with SMTP id 7so3569953vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 11:23:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.123.130 with SMTP id p2mr1227406vcr.137.1303064628315;
	Sun, 17 Apr 2011 11:23:48 -0700 (PDT)
Received: by 10.220.177.139 with HTTP; Sun, 17 Apr 2011 11:23:48 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <BANLkTin=ptRRhu_WB=gDooxUEJLh64DNaA@mail.gmail.com>
References: <BANLkTin=ptRRhu_WB=gDooxUEJLh64DNaA@mail.gmail.com>
Date: Sun, 17 Apr 2011 14:23:48 -0400
Message-ID: <BANLkTim=qvmZLwmdYZtPH802PDBM-y7n1g@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Installing MAD-FCL using bitbake
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
X-List-Received-Date: Sun, 17 Apr 2011 18:26:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Apr 17, 2011 at 1:20 PM, Alberto Carrozzo <gilby985@gmail.com>wrote:

> Hello, I'm trying to install MAD-FCL (http://mad.cs.tut.fi/) in order
> to use the Flute protocol on Angstrom... to do it, I modified the
> "wscan_20091230.bb" recipe that you can find in
> "oe/openembedded/recipes/dvbtools/" folder...
>
> _________________________________________________
> ESCRIPTION = "Wscan is a dvb channel scanner that doesn't require an
> initial frequency table"
> LICENSE = "GPLv2"
>
> SRC_URI = "http://wirbel.htpc-forum.de/w_scan/w_scan-${PV}.tar.bz2"
>
> S = "${WORKDIR}/w_scan-${PV}"
>
> inherit autotools
>
> FILES_${PN} += "${datadir}"
>
> SRC_URI[md5sum] = "97cd83d5c174e386d01a364b2d280f2a"
> SRC_URI[sha256sum] =
> "1a5864559b6a0acb76b9fa66b4e1351acd7d06c4e4a9a2ba323e7eafa4d4788b"
> __________________________________________________
>
> It works perfectly and bitbaking it I can find the executable w_scan
> in the
> ~/oe/tmp/work/armv7a-angstrom-linux-gnueabi/wscan-20091230-r0/w_scan-20091230
> folder... So I modifed it in this way:
>
> ___________________________________________________
> SRC_URI = "http://mad.cs.tut.fi/download/mad_fcl_v1.7_src.tar.gz"
>
> S = "${WORKDIR}/flute"
>
>
The directory in the tar.gz file is named mad_fcl_v1.7_src, not flute.  As
such, your source directory (S) is set incorrectly.



> inherit autotools
>

I don't see any autotools artifacts in this tar.gz, so why are you
inheriting autotools?



>
> FILES_${PN} += "${bindir}/flute"
>
> SRC_URI[md5sum] = "71a0c9d856a9b949b2c7c25bfd91029e"
> SRC_URI[sha256sum] =
> "97c0abc3807e48b102fee85bf14aaaeabe39ce3f98bb4423daed9651978e62f0"
> ____________________________________________________
>
> ...but it doesn't work and it gives me the following error on the
> log.do_install file:
> ____________________________________________________
> NOTE: make
> DESTDIR=/home/gilby/oe/tmp/work/armv7a-angstrom-linux-gnueabi/flute-1.0-r0/image
> install
> make: *** No rule to make target `install'.  Stop.
> FATAL: oe_runmake failed
> ERROR: Function do_install failed
> ____________________________________________________
>
> Note: the log.do_compile file tells me "NOTE: nothing to compile"
>
> ... OK, so i added this on the recipe above:
> ____________________________________________________
> do_install(){
>        install -m 0755 -d ${D}${bindir} ${D}${docdir}/flute
> }
> ____________________________________________________
>
> and it work without errors... but the log.do_compile file tells me
> again "NOTE: nothing to compile" and i can't find the executable in
> the ~/oe/tmp/work/armv7a-angstrom-linux-gnueabi/flute-1.0-r0/
> folder... and the same thing happen if I delete the "inherit
> autotools" row...
>
> SO:
>
> 1) Why for some recipes it execute the makefile automatically and not
> for other ones?
>

Well, bad input => bad output.  You must fix your recipe.


> 2) How can I fix my prolems?


Gain more understanding of OE - like using S, PN, PV, etc in your recipe.
Fix S.
Drop the inherit autotools.
Figure out how to compile the package properly and implement that in the
recipe.



>
> somebody can help me? thank you so much
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

