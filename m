Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObVGP-0002i1-BE for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 11:06:54 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObVGD-0004M3-5h for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 11:06:41 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 11:06:41 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 11:06:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 21 Jul 2010 11:06:31 +0200
Message-ID: <i26dan$8jg$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Openjdk shark and cacao VMs not working
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
X-List-Received-Date: Wed, 21 Jul 2010 09:06:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-07-10 11:37, Koen Kooi wrote:
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

So, after yesterdays commits:

root@beagleboard-C4:~# java -shark Linpack
Mflops/s: 1.416  Time: 0.49 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
root@beagleboard-C4:~# java -zero Linpack
Mflops/s: 8.918  Time: 0.08 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
root@beagleboard-C4:~# java -cacao Linpack
Mflops/s: 20.808  Time: 0.03 secs  Norm Res: 1.43  Precision:
2.220446049250313E-16
root@beagleboard-C4:~#

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRriXMkyGM64RGpERAuaxAJ9uDgLjBWTeY6jIcrZ/9qYtM0DS+ACfUx14
VmZeDQWat8eU6BfK8Lm1U3I=
=zMJm
-----END PGP SIGNATURE-----



