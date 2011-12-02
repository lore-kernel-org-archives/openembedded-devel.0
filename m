Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWPns-0002Ev-RF for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 10:53:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWPhM-0004EE-S2 for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 10:46:28 +0100
Received: from ip5451781a.direct-adsl.nl ([84.81.120.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 10:46:28 +0100
Received: from koen by ip5451781a.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 10:46:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 Dec 2011 10:46:14 +0100
Message-ID: <jba6p6$bep$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip5451781a.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
X-Enigmail-Version: 1.3.3
Subject: [meta-java] rpath problem for llvm libs?
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
X-List-Received-Date: Fri, 02 Dec 2011 09:53:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I installed openjdk + openjdk-shark on my target and I get:

root@beaglebone:~# java
dl failure on line 696Error: failed
/usr/lib/jvm/java-6-openjdk/jre/lib/arm/shark/libjvm.so, because
libLLVMARMCodeGen.so: cannot open shared object file: No such file or directory

The 'fix' I used:

root@beaglebone:~# for i in /usr/lib/llvm2.9/libLLVM*.so ; do ln -sf $i
/usr/lib ; done

root@beaglebone:~# java
Usage: java [-options] class [args...]
           (to execute a class)

I came up with a number of workarounds, but I'm not sure which is best:

1) do the for ; ln thing in a postinst
2) have llvm install into ${libdir} instead of ${libdir}${LLVM_RELEASE}
3) Use u-a for the libs
4) add rpaths
5) convince people java is evil and have them switch to C

I have a preference for 5), but I suspect Henning would like a different
solution :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7YnmQACgkQMkyGM64RGpHTCwCdGfG86k7u/9QRKqN8KQIT6D1F
Vq8An0Q/rjJ4C/oDX1OA/xzm8cop7/rq
=bnBj
-----END PGP SIGNATURE-----



