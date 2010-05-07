Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OAMy0-0004HQ-8G
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 14:47:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 82D66A446C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 13:43:54 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 4q7Ngfkq-Roq
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 13:43:33 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id DB86FA43F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 13:43:33 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 1F2C62C905; Fri,  7 May 2010 13:43:28 +0100 (BST)
Date: Fri, 7 May 2010 13:43:28 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507124328.GC2900@xora-desktop.xora.org.uk>
References: <hs0mho$rst$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hs0mho$rst$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: perl build problem in .dev
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
X-List-Received-Date: Fri, 07 May 2010 12:47:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I see exactly the same issue as below on my build machine!

Graeme

On Fri, May 07, 2010 at 11:29:28AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> I'm unable to build perl_5.8.8.bb:
> 
> | ln -s hostperl miniperl
> | ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
> | ./miniperl: error while loading shared libraries: libperl.so: cannot
> open shared object file: No such file or directory
> | make[1]: *** [lib/Config.pod] Error 127
> | make[1]: Leaving directory
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
> | make[1]: Entering directory
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
> | ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
> | ./miniperl: error while loading shared libraries: libperl.so: cannot
> open shared object file: No such file or directory
> | make[1]: *** [lib/Config.pod] Error 127
> | make[1]: Leaving directory
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
> 
> koen@dominion:/OE/build$ !find
> find /OE/angstrom-dev/sysroots/ -name "libperl.so*"
> /OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/perl/5.8.8/CORE/libperl.so
> 
> I tried doing
> 
> - -export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
> +export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/CORE/"
> 
> which didn't help. Any ideas?
> 
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFL4914MkyGM64RGpERAteUAKCW8Cf+LkADEX+c2dA1YzfdC46Z1QCePo3v
> wVqb3heMrT9O+8HZ5qkAJdc=
> =jVgC
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


