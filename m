Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLZ3L-0007Zc-Hv for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:36:51 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLYqk-0000OC-2L for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:23:50 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 14:23:50 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 14:23:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 14:23:43 +0200
Message-ID: <k51502$he4$1@ger.gmane.org>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
	<438b1be4a4a437a034365729a873964b7e44d0e8.1349608252.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <438b1be4a4a437a034365729a873964b7e44d0e8.1349608252.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH 1/3] apache2: fix configuration
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
X-List-Received-Date: Tue, 09 Oct 2012 12:36:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-10-12 13:13, Paul Eggleton schreef:
> * Include conf files in /etc/apache2/modules.d and conf.d * Add -D PHP5
> to options so that PHP is enabled if installed * Fix "reload" action in
> initscript
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

This is more likely related to your previous patch, but:

| /bin/sh:
/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/apr-1.4.6-r1/apr-1.4.6/arm-angstrom-linux-gnueabi-libtool:
No such file or directory
| make[3]: *** [unixd.lo] Error 127
| make[3]: Leaving directory
`/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os/unix'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os/unix'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see
/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/apache2-2.4.2-r1/temp/log.do_compile.591
for further information)
ERROR: Task 6
(/OE/tentacle/sources/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb,
do_compile) failed with exit code '1'

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQdBdPMkyGM64RGpERArmdAJ9DLRsJRcukSsV2bZlHNnovkpSSEACeOerO
6XGE5EYT0PCe3bRmWTwW8KU=
=TfsA
-----END PGP SIGNATURE-----



