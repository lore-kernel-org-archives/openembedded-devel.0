Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXXmW-0008Tn-3r for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 13:36:28 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXXfy-0003SY-5c for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 13:29:42 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 13:29:42 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 13:29:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 05 Dec 2011 13:29:28 +0100
Message-ID: <jbidf8$54c$1@dough.gmane.org>
References: <jba6p6$bep$1@dough.gmane.org>
	<CA+M6bXk94ukVFEva8Ab-RbvNe3pWuYkJWZkk-WS8CpKca83F4Q@mail.gmail.com>
	<jbdhuo$pe4$1@dough.gmane.org>
	<20111203163423.GA3821@mail.familie-heinold.de>
	<jbdr82$3ri$1@dough.gmane.org>
	<20111204111425.GA4871@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <20111204111425.GA4871@rhein.zuhause.netz>
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
X-List-Received-Date: Mon, 05 Dec 2011 12:36:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-12-11 12:14, Henning Heinold schreef:
> On Sat, Dec 03, 2011 at 07:53:53PM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 03-12-11 17:34, Henning Heinold schreef:
>>> On Sat, Dec 03, 2011 at 05:15:21PM +0100, Koen Kooi wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE----- So if we were to follow that
>>>> option 4) seems to be the way.
>>>> 
>>>> regards,
>>>> 
>>>> Koen
>>> 
>>> Hi,
>>> 
>>> our original Idea was, that you can install diffrent llvm versions at
>>> the same time. We need to discuss if we have still the case or really
>>> only one version of llvm. If not we can use directly /usr/lib if not
>>> solution 4 with rpath is my favourit. Besides this llvm should go to
>>> core, but I wanted to wait for the 3.0 release and christmas holidays
>>> to do it.
>> 
>> - From the llvm website: "December 1, 2011: LLVM 3.0 is now available
>> for download!"
> 
> I know ;)

FWIW, even after 'fixing' the llvm problems with ln shark still shows some
problems:

root@beaglebone:~/java# javac -O Linpack.java
javac:
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/llvm2.9-2.9-r0/llvm-2.9/include/llvm/Support/Casting.h:202:
typename llvm::cast_retty<To, From>::ret_type llvm::cast(const Y&) [with X =
llvm::ConstantInt, Y = llvm::Value*, typename llvm::cast_retty<To,
From>::ret_type = llvm::ConstantInt*]: Assertion `isa<X>(Val) && "cast<Ty>()
argument of incompatible type!"' failed.
Stack dump:
0.	Running pass 'ARM Instruction Selection' on function
'@"com.sun.tools.javac.zip.ZipFileIndex$ZipDirectory::readEntry"'
Aborted

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7cuSYACgkQMkyGM64RGpGM/wCcCekfcU2mGzHYPmY3pCk9ExXO
68kAnitsMmhDfADPCYA6NsTNRHP8Bujc
=qnMt
-----END PGP SIGNATURE-----



