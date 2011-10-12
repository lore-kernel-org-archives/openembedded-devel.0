Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RDxwD-0007QM-T2
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 14:29:34 +0200
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=XHlNlkW9QK3nqvm/CxTHl+MKbRmHKyJnEFEnLlAZ58tb7WrCDjHk0KdN
	D383bgAzb6IfmRQ4Jlmc/NmuKEOIRRXHkaJHu80/K0zP64oSkrP8hcg+3
	oUoIIP9v/yrRZvX0jxHvWA9aUPCaaHLzT+ga4oM868o5glDmVBZ5U9Ixr
	BrMTWZaG2zqj2pSjgYLybAlbrAat6yPYweOh3Q8oMmeodNe5OLmX6y7KP
	Sw2YHEaSiuY/nP1YRHccRY2Rdpvje;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1318422233; x=1349958233;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=1laNj8yDLr71TILolX5ZD7XZMNKH0PayWLzhwW6zGDw=;
	b=cDeGycRJSdrqSeUsOQwKfNpsDhiXyI+ZB3rbK4CuvOUJRtJh7Lq6ZpL/
	pN7TCjc3LlvNNkoMxpASBU2aY9dBk/mB7PnQMAR9byc5/o+74JfxYBX40
	Ms1vEpmicEz2LPbNswUlQw0KlbkzISWO02zcTldGrk1LSmWcVCJ/EIU2T
	LU00CMzhmGXDJB/DaGjXD6fdAgqSOR4hPHqNvYXuYf/r/VP2rAy5rLON1
	gDcH8qkXVUg61R2MoqRrKmB9zffgL;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,333,1315173600"; d="scan'208";a="76540194"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate20u.abg.fsc.net with ESMTP; 12 Oct 2011 14:22:48 +0200
X-IronPort-AV: E=Sophos;i="4.69,334,1315173600"; d="scan'208";a="121114281"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 12 Oct 2011 14:22:48 +0200
Message-ID: <4E958698.1030800@ts.fujitsu.com>
Date: Wed, 12 Oct 2011 14:22:48 +0200
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111004 Icedove/3.0.11
MIME-Version: 1.0
To: oe-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: OE beginner constantly failing to build anything
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
X-List-Received-Date: Wed, 12 Oct 2011 12:29:34 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi there,

the following lines might give you the feeling of a rant, sorry about
that but after 2 weeks of no success I need to write down quickly what
bothers me. Please don't feel offended by my deep desperation. ;-)

My build system is running Debian/Squeeze (amd64) and I also downloaded
the CodeSourcery Toolchain. Was able to compile a simple hello world
with that for Angstrom, but now I wanted to build Angstrom from scratch.

So I started with OE classic, tried the "getting started" from the PDF
docs and failed. I learned quickly that there are version dependencies
between bitbake and the version that I checkout of the OE tree. I also
learned that some of the failures come because I tried to bild "old"
images and meanwhile the sources that bitbake wants to fetch seem to
have moved to another place or got deleted. I tried according to the
wiki docs that said OE 2011.3 works with bitbake 1.12.0 but even then I
failed. Last failure had to do with building libtool-2.4-cross when the
build system told my that my compiler can't create binaries... after the
process has build around 60+ packets without any problem.

Well, I learned that OE classic is no longer maintained and that I
should switch to OE-core. So I said, lets start from scratch again and
see. I followed the Angstrome building instructions as they are written
here:
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/angstrom-layers/tree/README

Did everything that was described there and faild again. This time
with the following errors:
----------------8<-snip----------------------
bitbake base-image
Pseudo is not present but is required, building this first before the
main build
NOTE: angstrom DOES NOT support libiconv because the eglibc provided
iconv library is used                         | ETA:  00:04:17
NOTE: angstrom DOES NOT support libiconv because the eglibc provided
iconv library is used                         | ETA:  00:04:16
NOTE: angstrom DOES NOT support gconf-dbus because gconf-dbus has been
merged back into main GConf                 | ETA:  00:03:57
NOTE: angstrom DOES NOT support gconf-dbus-native because gconf-dbus has
been merged back into main GConf
ERROR: Error Method already seen: get_tls_setting in' glx-use-tls.inc'
now in 'glx-use-tls.bbclass'                | ETA:  00:02:59
ERROR: Could not include required file
recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
    | ETA:  00:02:01
ERROR: Command execution failed: Exited with 1
----------------8<-snip----------------------

Then I read "glx-use-tls" and remembered to saw that in the list archive
of today. There is a mail from Khem Raj
Subject: [oe] [meta-oe][PATCH 1/2] classes/glx-use-tls.bbclass: Delete

Yeah. I checked my meta-oe tree and glx-use-tls.bbclass is still there.
Then I checked where that tree came from, it comes from github, but
nevertheless, also the tree from http://git.openembedded.org at the
moment has no patch like that applied.

So I need to start questions:

1. Is there any *failsafe* procedure that lets me build some image for
my beagleboard? I'm relatively new to embedded linux and I need to read
a lot about bitbake and oe, but failing with every "getting started"
instructions doesn't give me much confidence that I will ever succeed.

2. How are patches applied in OE? The patch from Khem Raj is not yet in
the git-tree, so how can I patch it to my tree.

3. I tried to search for the bugs I encountered and found out that you
have abandoned a tool like Bugzilla in favor of reporting bugs on the
mailing list. From my perspective the mailing list is not very helpful
to *find* information about existing bugs and their status, so is there
a reason for this switch that I can understand?

I think there are solutions for my problem, the fact that Angstrom
exists and can be downloaded makes me think that somebody was able to
build it from the sources, but it seems that I got the wrong moment in
time for my attempts so all the sources and recipes that I'm depending
on are constantly changing and I always get lost in the gory details.

Ok, thank you for reading this, now I described my little problems and I
hope that someone on the list has answers.

Best regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html


