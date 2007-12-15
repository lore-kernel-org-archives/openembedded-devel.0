Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J3ZLX-00013p-JK
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 16:54:35 +0100
Received: by fg-out-1718.google.com with SMTP id 22so70302fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 07:49:58 -0800 (PST)
Received: by 10.86.78.4 with SMTP id a4mr4333248fgb.0.1197733798276;
	Sat, 15 Dec 2007 07:49:58 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id e32sm14343491fke.2007.12.15.07.49.57
	(version=SSLv3 cipher=OTHER); Sat, 15 Dec 2007 07:49:57 -0800 (PST)
Date: Sat, 15 Dec 2007 17:55:05 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <316414004.20071215175505@gmail.com>
To: Carsten Haitzler <raster@openmoko.org> (The Rasterman)
In-Reply-To: <1910714040.20071215125524@vanille-media.de>
References: <20071215151907.d0e45e41.raster@openmoko.org>
	<1910714040.20071215125524@vanille-media.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: AAAARGH! openembedded..... pcmciautils. SOLVED!
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
X-List-Received-Date: Sat, 15 Dec 2007 15:54:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Michael,

Saturday, December 15, 2007, 1:55:24 PM, you wrote:

> [Sorry, TOFU alarm. NOTE: Cross-posted: please watch your replies]

> Well spotted! Congrats :)

> Fwiw, I've forwarded your mail to
> openembedded-devel@lists.openembedded.org, since I think you got a
> valid point here.

>> note - it's running yes - then the compile line - yes just spews out its cmd
>> line args ad-infinitum to OE's log files - filling my disk

   Bwa-ha-ha! This is really worth recording in OE's hall of curiosities!
Btw, recently I caught export issue for TARGET_ARCH too, and looking
at the unexport list we have already:

    # Make sure MACHINE isn't exported
    # (breaks binutils at least)
    bb.data.delVarFlag('MACHINE', 'export', d)
    bb.data.setVarFlag('MACHINE', 'unexport', 1, d)
                                                               
    # Make sure TARGET_ARCH isn't exported
    # (breaks Makefiles using implicit rules, e.g. quilt, as GNU make has this
    # in them, undocumented)
    bb.data.delVarFlag('TARGET_ARCH', 'export', d)
    bb.data.setVarFlag('TARGET_ARCH', 'unexport', 1, d)

    # Make sure DISTRO isn't exported
    # (breaks sysvinit at least)
    bb.data.delVarFlag('DISTRO', 'export', d)
    bb.data.setVarFlag('DISTRO', 'unexport', 1, d)

Thought about this too:
   
>> any good reason OE doesn't entirely clear ALL
>> environment variables from the user EXCEPT ones known to be desirable on build
>> so you have a clean and fresh environment that is known and fixed?



>> ok.

>> i need to vent.

>> pmccia utils - have never built for me. it has ONLY succeeded in doing 1 thing.
>> filling up my disk with multi-GB log files.

>> i found out why now.

>> from the pcmciautils Makefile:

>> .c.o:
>>         $(QUIET) $(CC) $(CFLAGS) -c -o $@ $<

>> from the build log:

>> make[1]: Entering directory
>> `/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014'
>> Building ccdv yes ccache arm-angstrom-linux-gnueabi-gcc -march=armv4t
>> -mtune=arm920t
>> -I/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014/src
>> -isystem/home/raster/moko/build/tmp/staging/arm-angstrom-linux-gnueabi/include
>> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -c -o
>> src/pccardctl.o src/pccardctl.c ccache arm-angstrom-linux-gnueabi-gcc
>> -march=armv4t -mtune=arm920t
>> -I/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014/src
>> -isystem/home/raster/moko/build/tmp/staging/arm-angstrom-linux-gnueabi/include
>> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -c -o
>> src/pccardctl.o src/pccardctl.c ccache arm-angstrom-linux-gnueabi-gcc
>> -march=armv4t -mtune=arm920t
>> -I/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014/src
>> -isystem/home/raster/moko/build/tmp/staging/arm-angstrom-linux-gnueabi/include
>> -fexpensive-opti

>> note - it's running yes - then the compile line - yes just spews out its cmd
>> line args ad-infinitum to OE's log files - filling my disk

>> why this?

>> well my environment had QUIET=yes set:

>> [  3:15PM
>> ~/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/temp
>> env | grep QUIET QUIET=yes

>> why? well /etc/init.d/rc's environment is inherited by users when they log in
>> as it spawns dameons/processes that handle logins:

>> # Should we also output to the console?
>> # /proc won't be mounted if we don't have an initramfs, but then we're
>> # dealing with custom systems so it's their own fault that they'll get
>> # output from rcS  
>> if grep -w -q quiet /proc/cmdline 2>/dev/null; then
>>     QUIET=yes
>> else
>>     QUIET=no
>> fi
>> export QUIET

>> (from /etc/init.d/rc).

>> a harmless environment variable of "QUIET=yes" broke the build. it's taken me a
>> while to track this down. any good reason OE doesn't entirely clear ALL
>> environment variables from the user EXCEPT ones known to be desirable on build
>> so you have a clean and fresh environment that is known and fixed?  

>> anyway. pcmciautils built now. i can finally build myself an os image. woot.







-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



