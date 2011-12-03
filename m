Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWsLy-0008CN-Dl for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 17:22:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWsFS-0003ZE-G7 for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 17:15:34 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 17:15:34 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 17:15:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 03 Dec 2011 17:15:21 +0100
Message-ID: <jbdhuo$pe4$1@dough.gmane.org>
References: <jba6p6$bep$1@dough.gmane.org>
	<CA+M6bXk94ukVFEva8Ab-RbvNe3pWuYkJWZkk-WS8CpKca83F4Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CA+M6bXk94ukVFEva8Ab-RbvNe3pWuYkJWZkk-WS8CpKca83F4Q@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-java] rpath problem for llvm libs?
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
X-List-Received-Date: Sat, 03 Dec 2011 16:22:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-12-11 16:42, Tom Rini schreef:
> On Fri, Dec 2, 2011 at 2:46 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Hi,
>> 
>> I installed openjdk + openjdk-shark on my target and I get:
>> 
>> root@beaglebone:~# java dl failure on line 696Error: failed 
>> /usr/lib/jvm/java-6-openjdk/jre/lib/arm/shark/libjvm.so, because 
>> libLLVMARMCodeGen.so: cannot open shared object file: No such file or
>> directory
>> 
>> The 'fix' I used:
>> 
>> root@beaglebone:~# for i in /usr/lib/llvm2.9/libLLVM*.so ; do ln -sf
>> $i /usr/lib ; done
>> 
>> root@beaglebone:~# java Usage: java [-options] class [args...] (to
>> execute a class)
>> 
>> I came up with a number of workarounds, but I'm not sure which is
>> best:
>> 
>> 1) do the for ; ln thing in a postinst 2) have llvm install into
>> ${libdir} instead of ${libdir}${LLVM_RELEASE} 3) Use u-a for the libs 
>> 4) add rpaths 5) convince people java is evil and have them switch to
>> C
>> 
>> I have a preference for 5), but I suspect Henning would like a
>> different solution :)
> 
> Well, what's Fedora or Debian/Ubuntu look like here?

They seem to lack the shark jre, but the 'llvm' package looks like this:

root@dominion:/data/ssd# find /usr/lib | grep llvm | grep Printer | head -n2
/usr/lib/llvm/lib/libLLVMCellSPUAsmPrinter.a
/usr/lib/llvm/lib/libLLVMXCoreAsmPrinter.a

So if we were to follow that option 4) seems to be the way.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7aSxcACgkQMkyGM64RGpGD4wCfQojBBu41NzAvjl9mT8vjPE+Y
lcUAnA6Bfne8yFGuw+5m9QSZbQ0fktht
=4DKv
-----END PGP SIGNATURE-----



