Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAJw3-0007VB-Kw for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 11:33:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAJsN-0007O3-LG for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 11:29:43 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 11:29:43 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 11:29:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 07 May 2010 11:29:28 +0200
Message-ID: <hs0mho$rst$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: perl build problem in .dev
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
X-List-Received-Date: Fri, 07 May 2010 09:33:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I'm unable to build perl_5.8.8.bb:

| ln -s hostperl miniperl
| ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
| ./miniperl: error while loading shared libraries: libperl.so: cannot
open shared object file: No such file or directory
| make[1]: *** [lib/Config.pod] Error 127
| make[1]: Leaving directory
`/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
| make[1]: Entering directory
`/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
| ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
| ./miniperl: error while loading shared libraries: libperl.so: cannot
open shared object file: No such file or directory
| make[1]: *** [lib/Config.pod] Error 127
| make[1]: Leaving directory
`/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'

koen@dominion:/OE/build$ !find
find /OE/angstrom-dev/sysroots/ -name "libperl.so*"
/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/perl/5.8.8/CORE/libperl.so

I tried doing

- -export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
+export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/CORE/"

which didn't help. Any ideas?


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4914MkyGM64RGpERAteUAKCW8Cf+LkADEX+c2dA1YzfdC46Z1QCePo3v
wVqb3heMrT9O+8HZ5qkAJdc=
=jVgC
-----END PGP SIGNATURE-----



