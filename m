Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NWEaa-0001NF-Uj
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jan 2010 20:45:44 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NWEYS-00061B-Rp for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jan 2010 14:43:28 -0500
Date: Sat, 16 Jan 2010 14:42:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.1001161439340.13406@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: what's the purpose of tarballs in the OE repo?
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
X-List-Received-Date: Sat, 16 Jan 2010 19:45:44 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  following up on a thread from the bitbake dev ML, what is the
purpose of actual tarballs in the OE dev repository?

$ find . -name *tar.gz
./recipes/firmwares/marvell-gspi-fw/9.70.3-p37.tar.gz
./recipes/firmwares/marvell-sdio-fw/9.70.3-p37.tar.gz
./recipes/x-load/files/x-loader-03.00.00.01.tar.gz
./recipes/sgalib/sgalib-0.1.0/sgalib-0.1.0.tar.gz
./recipes/qpealarmclock/qpealarmclockapplet-1.0.9/missing-files.tar.gz
./recipes/zaurus-utils/files/gnu-tar.gz
$

$ find . -name *tar.bz2
./recipes/powervr-drivers/omap3-sgx-modules/omap3-sgx-modules-1.3.13.1607.tar.bz2
./recipes/supertux/files/supertux-smallsize-data.tar.bz2
$

  i assume they're there because they're not available for
unrestricted download from somewhere on the net, but is that the case
for all of them?  shouldn't some of them be moved into a net repo
somewhere?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


