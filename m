Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Md5N4-0003hv-1w
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 18:48:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E54E81422AA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 18:22:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKVe8I6a4cuh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 18:22:26 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id B78861416BA9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 18:22:26 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250458415.4215.178.camel@lenovo.internal.reciva.com>
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242507547.4226.1.camel@lenovo.internal.reciva.com>
	<4A867CCA.7060609@atmel.com>
	<1250329051.4215.167.camel@lenovo.internal.reciva.com>
	<1250330779.4406.9.camel@utx.utx.cz>
	<1250458415.4215.178.camel@lenovo.internal.reciva.com>
Date: Mon, 17 Aug 2009 18:30:46 +0200
Message-Id: <1250526646.4956.43.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Mon, 17 Aug 2009 16:49:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Sat, 2009-08-15 at 12:06 +0200, Stanislav Brabec wrote:
> 
> > libxcalibrate does not compile on images with xserver-kdrive.
> 
> I can't think offhand why libxcalibrate should care what xserver is in
> your image.  What's the error you get?

Well, I didn't it debug in deep yet, but I see:
| xcalibrate.c: In function 'XCalibrateScreenToCoord':
| xcalibrate.c:233: error: 'xXCalibrateScreenToCoordReq' undeclared (first use in this function)
| xcalibrate.c:233: error: (Each undeclared identifier is reported only once
| xcalibrate.c:233: error: for each function it appears in.)
| xcalibrate.c:233: error: 'req' undeclared (first use in this function)
| xcalibrate.c:234: error: 'xXCalibrateScreenToCoordReply' undeclared (first use in this function)
| xcalibrate.c:234: error: expected ';' before 'rep'
| xcalibrate.c:236: error: 'sz_xXCalibrateScreenToCoordReq' undeclared (first use in this function)
| xcalibrate.c:236: error: expected expression before ')' token
| xcalibrate.c:236: error: 'X_XCalibrateScreenToCoord' undeclared (first use in this function)
| xcalibrate.c:241: error: 'rep' undeclared (first use in this function)
| make: *** [xcalibrate.lo] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: /OE/build/tmp/work/armv5te-angstrom-linux-gnueabi/libxcalibrate-1_0.0+r0+gitr209d83af61ed38a002c8096377deac292b3e396c-r0/temp/log.do_compile.1481

Playing a bit with versions, recipes/xcalibrate/xcalibrate_git.bb is
built instead of recipes/xorg-lib/libxcalibrate_git.bb and the build
succeeds.

Notes:

Tested with patched libxcalibrate, that fixes its PV scheme.

zgrep -l xXCalibrateScreenToCoordReq ~/sources/*
git_anongit.freedesktop.org.git.xorg.lib.libXCalibrate_209d83af61ed38a002c8096377deac292b3e396c.tar.gz
git_anongit.freedesktop.org.git.xorg.proto.calibrateproto_1da6fd1e2c7a49648245c98481fabea8b9690a8c.tar.gz
xorg-server-1.6.1.tar.bz2


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



