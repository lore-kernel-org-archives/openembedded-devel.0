Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1ObUgf-00029b-4j
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 10:29:58 +0200
Received: from [192.168.1.106] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id 0ACF530E33E;
	Wed, 21 Jul 2010 10:29:42 +0200 (CEST)
Message-ID: <4C46B05D.5070608@zafena.se>
Date: Wed, 21 Jul 2010 10:31:25 +0200
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Thunderbird/3.0.5
MIME-Version: 1.0
To: pete.flugstad@gmail.com
References: <AANLkTikfJXHbnzhuMjT24zl0E08hw66CLeYzm_r21HB_@mail.gmail.com>
In-Reply-To: <AANLkTikfJXHbnzhuMjT24zl0E08hw66CLeYzm_r21HB_@mail.gmail.com>
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org, jalimo-info@lists.evolvis.org
Subject: Re: [jalimo-info] problems with latest openjdk - fixed
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
X-List-Received-Date: Wed, 21 Jul 2010 08:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Pete

I have back-ported fixes to the oe.dev llvm2.7 from the upstream
llvm2.8svn branch to fix the
"ARMCodeEmitter::emitPseudoInstruction  UNREACHABLE executed at
/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/llvm2.7-2.7-r6/llvm-2.7/lib/Target/ARM/ARMCodeEmitter.cpp:554!"
that you have been hitting.
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=d1dcd08e4ec0b65aaaef149bace47da16acf7626

Using these back-ports the "whet" test-case runs fine on my overo earth
summit armv7 test board:
I have been using openjdk-6-jre-6b18-1.8-r8.6 in combination with
llvm2.7-2.7-r7 from oe.dev.

xerxes@overo:/usr/src/openembedded/shark-test/testcases$
../21jul-2010/j2sdk-image/bin/java -shark whet
WHETSTONE - using 64-bit floating-point data
1. Test (time for 100 cycles): 23108 millisec.
2. Test (time for 110 cycles): 26833 millisec.
3. Test (time for 120 cycles): 18822 millisec.
4. Test (time for 130 cycles): 20303 millisec.
5. Test (time for 140 cycles): 21822 millisec.
6. Test (time for 150 cycles): 23978 millisec.
7. Test (time for 160 cycles): 25144 millisec.
8. Test (time for 170 cycles): 26511 millisec.
9. Test (time for 180 cycles): 28057 millisec.
10. Test (time for 190 cycles): 29609 millisec.
Number of Runs 10
Average time per cycle 172.8574 millisec.
Average Whetstone Rating 5948 KWIPS
xerxes@overo:/usr/src/openembedded/shark-test/testcases$
../21jul-2010/j2sdk-image/bin/java -shark -version
java version "1.6.0_18"
OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
OpenJDK Shark VM (build 14.0-b16, mixed mode)

Please report if you run into any new Shark issues.

Cheers, and have a great day!
Xerxes

On 2010-07-19 16:58, Pete Flugstad wrote:
> Okay, I updated to latest OpenJDK from the feed directory.  Looks like the
> default changed to using -shark.  Now I'm having issues with javac and java:
>
> $ javac whet.java
> ARMCodeEmitter::emitPseudoInstruction
> UNREACHABLE executed at
> /OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/llvm2.7-2.7-r6/llvm-2.7/lib/Target/ARM/ARMCodeEmitter.cpp:554!
> Stack dump:
> 0.      Running pass 'ARM Machine Code Emitter' on function
> '@"com.sun.tools.javac.zip.ZipFileIndex$ZipDirectory::readEntry"'
> Aborted
>
> I built the whet.java on another machine (Linux), and I get a similar error:
>
> $ java -cp . whet
> WHETSTONE - using 64-bit floating-point data
> 1. TestARMCodeEmitter::emitPseudoInstruction
> UNREACHABLE executed at
> /OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/llvm2.7-2.7-r6/llvm-2.7/lib/Target/ARM/ARMCodeEmitter.cpp:554!
> Stack dump:
> 0.      Running pass 'ARM Machine Code Emitter' on function '@"whet::p3"'
> Aborted
>
> This is on a beagleboard/C3.    whet.java is attached.
>
> If I run with -server, then whet.class runs and completes.
>
> Is there something I need to re-install - LLVM or something?  Or is
> there something I can do to
> help debug this?
>
> Thanks,
> Pete
>
> PS: I had to edit the /usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg
> to remove blank (garbage?)
>       lines at the end
>   
>
>
> _______________________________________________
> jalimo-info mailing list
> jalimo-info@lists.evolvis.org
> https://lists.evolvis.org/cgi-bin/mailman/listinfo/jalimo-info


