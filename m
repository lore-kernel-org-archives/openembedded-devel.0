Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1ObXeU-0000aP-W2
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 13:39:58 +0200
Received: from [192.168.1.106] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id 6CB9F30CF20;
	Wed, 21 Jul 2010 13:39:41 +0200 (CEST)
Message-ID: <4C46DCE3.1080207@zafena.se>
Date: Wed, 21 Jul 2010 13:41:23 +0200
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i216cf$pju$1@dough.gmane.org>
In-Reply-To: <i216cf$pju$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: Openjdk shark and cacao VMs not working - shark fixed
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
X-List-Received-Date: Wed, 21 Jul 2010 11:39:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Koen!

I have updated the llvm2.7 package to fix the shark
UNREACHABLE executed at ARMCodeEmitter.cpp:554! error
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=d1dcd08e4ec0b65aaaef149bace47da16acf7626

By using those fixes i was able to pass your Linpack testcase:

xerxes@overo:/usr/src/openembedded/shark-test/testcases$
../21jul-2010/j2sdk-image/bin/java -shark Linpack
Mflops/s: 1.063  Time: 0.65 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16

It worked but it looks a bit slow.. I checked why.
it seems Shark are still JITing when the test exits.

I tested to modify the Linpack testcase to run it several times in a row.
by changing the Linpack main to:

  public static void main(String[] args)
  {
    for(int i=0;i<100;i++){
      Linpack l = new Linpack();
      l.run_benchmark();
    }
  }

Now it looks much better:

xerxes@overo:/usr/src/openembedded/shark-test/testcases$
../21jul-2010/j2sdk-image/bin/java -shark Linpack
Mflops/s: 1.068  Time: 0.64 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.306  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.014  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.306  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.306  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
LLVM ERROR: ARMv6t2 JIT is not yet supported.

But as you can see I have hited a new LLVM ERROR, and this time because
we are trying to use the thumb2 jit on armv7 hardware.

I have updated the llvm2.7 package once again by backporting more fixes
from the llvm2.8svn branch
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=de16a3d10308c81c7e40886bbe0846604eebdf77

And now when using llvm2.7-2.7-r8 I am able to run the Linpack testcase
for any amount of iterations:

xerxes@overo:/usr/src/openembedded/shark-test/testcases$
../21jul-2010/j2sdk-image/bin/java -shark Linpack
Mflops/s: 1.066  Time: 0.64 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.306  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.014  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.306  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 14.306  Time: 0.05 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
... about 30 iterations later
Mflops/s: 17.167  Time: 0.04 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 17.607  Time: 0.04 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
Mflops/s: 17.607  Time: 0.04 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
...

I am quite happy with those results.
Once we get LLVM and Shark stable then we can drop the Assertions in
LLVM and that will make Shark JIT faster and hopefully get it warm fast
enough to generate good scores for the first iteration of the Linpack
benchmark.

Please report if you find any new Shark issues.

Cheers, and have a great day!
Xerxes

On 2010-07-19 11:37, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I built openjdk completely from scratch and installed it:
>
> opkg install openjdk-6-common openjdk-6-demo openjdk-6-java
> openjdk-6-jdk openjdk-6-jre
>
> opkg install openjdk-6-vm-shark openjdk-6-vm-cacao
>
> That needs to be done in 2 opkg commands since -cacao and -shark edit a
> jvm.cfg in their postinst which isn't in their Depends: line. Trivial to
> fix, need to sit down and see in which package it resides.
>
> So:
>
> root@beagleboard-C4:~# java -zero Linpack # [1]
> Mflops/s: 9.537  Time: 0.07 secs  Norm Res: 1.43  Precision:
> 2.220446049250313E-16
>
> So far, so good. Better than the 3 Mflops jamvm+classpath gets, but not
> as nice as the 16Mflops cacao+classpath can do.
>
> So lets try some other VMs:
>
> root@beagleboard-C4:~# java -shark Linpack
> ARMCodeEmitter::emitPseudoInstruction
> UNREACHABLE executed at
> /OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/llvm2.7-2.7-r6/llvm-2.7/lib/Target/ARM/ARMCodeEmitter.cpp:554!
> Stack dump:
> 0.      Running pass 'ARM Machine Code Emitter' on function
> '@"Linpack::daxpy"'
> Aborted
>
> OK, Xerxes blogged about debugging such issues, but the summer intern is
> too busy with other stuff currently.
>   




> root@beagleboard-C4:~# java -cacao Linpack
> java: avl.c:348: avl_find: Assertion `tree' failed.
> Aborted
>
> No idea on that.
>
> Do the java mages have some idea on how to get shark and cacao working well?
>
> regards,
>
> Koen
>
> [1] http://www.netlib.org/benchmark/linpackjava/LinpackJava.zip compiled
> with javac on osx
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMRBzPMkyGM64RGpERAiEJAJ4yeJVBcvuwHzVbS++Zt5iI9Rp11QCgm3aB
> Xqj79L9E1QpIz19c0QSxh6o=
> =OBoo
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



