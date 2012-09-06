Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9ddp-0000Us-AH
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 17:05:13 +0200
Received: from localhost ([127.0.0.1]:38277 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9dRo-0001kY-Od
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 14:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=PJfe7G19LDBYsPquyn2jWH
	w7fy0=; b=iqWSDSFPxhs19hHKRqNyVHcsR1QNjIrDnirtR17mV/XilYX1YJQLjL
	Zi71E2YyKBYNA+wSzAMuyqzAa4gPPRoS7P/7ODh/MzATTsrm4QV8oN7+Rf93UQGL
	4pE0A6r9n8EQeO4fXKX8RLWUNg/g72tIAonwUTh64PxSyzXs6xOaE=
Received: from [195.171.99.130] (port=61568 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9dRo-0001kV-Me
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 14:52:48 +0000
Message-ID: <5048B901.3060103@communistcode.co.uk>
Date: Thu, 06 Sep 2012 15:53:53 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 15:05:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm failing to be able to build tinyXML which it seems is required for 
XBMC after it was dropped from their internal tree. The package just has 
a Makefile and all in all seems a bit sketchy at best. Has anyone come 
across an error like this before:

    DEBUG: Executing shell function do_compile
    NOTE: make -j 7 -e MAKEFLAGS=
    arm-poky-linux-gnueabi-ld
    --sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi
    -o xmltest -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed tinyxml.o
    tinyxmlparser.o xmltest.o tinyxmlerror.o tinystr.o
    arm-poky-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
    arm-poky-linux-gnueabi-ld: use the --help option for usage information
    make: *** [xmltest] Error 1
    ERROR: oe_runmake failed
    ERROR: Function failed: do_compile (see
    /home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/tinyxml-2.6.2-r0/temp/log.do_compile.23734
    for further information)


Recipe so far...

    DESCRIPTION = "A simple, small, C++ XML parser that can be easily
    integrated into other programs"

    LICENSE = "zlib"
    LIC_FILES_CHKSUM =
    "file://tinyxml.cpp;endline=23;md5=b97285d8fafcc49b761ca785816cc397"

    SRC_URI =
    "http://ftp.debian.org/debian/pool/main/t/tinyxml/${PN}_${PV}.orig.tar.gz"

    SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
    SRC_URI[sha256sum] =
    "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"

    S = "${WORKDIR}/tinyxml"


Cheers,


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



