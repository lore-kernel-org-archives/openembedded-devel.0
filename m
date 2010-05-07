Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAPJ1-0002ZC-Cb for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 17:17:37 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAPFK-00041J-EI for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 17:13:46 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 17:13:46 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 17:13:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 07 May 2010 17:13:37 +0200
Message-ID: <hs1an1$a54$1@dough.gmane.org>
References: <hs0mho$rst$1@dough.gmane.org>
	<1273241033.457.319.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <1273241033.457.319.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 07 May 2010 15:17:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-05-10 16:03, Tom Rini wrote:
> On Fri, 2010-05-07 at 11:29 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> I'm unable to build perl_5.8.8.bb:
>>
>> | ln -s hostperl miniperl
>> | ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
>> | ./miniperl: error while loading shared libraries: libperl.so: cannot
>> open shared object file: No such file or directory
>> | make[1]: *** [lib/Config.pod] Error 127
>> | make[1]: Leaving directory
>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
>> | make[1]: Entering directory
>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
>> | ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
>> | ./miniperl: error while loading shared libraries: libperl.so: cannot
>> open shared object file: No such file or directory
>> | make[1]: *** [lib/Config.pod] Error 127
>> | make[1]: Leaving directory
>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8'
>>
>> koen@dominion:/OE/build$ !find
>> find /OE/angstrom-dev/sysroots/ -name "libperl.so*"
>> /OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/perl/5.8.8/CORE/libperl.so
>>
>> I tried doing
>>
>> - -export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
>> +export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/CORE/"
>>
>> which didn't help. Any ideas?
> 
> Yeah, when we mangle it for $ORIGIN, we just broke how target perl works
> since (expanding
> $ORIGIN) /OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r33/perl-5.8.8/../lib/perl/5.8.8/CORE/libperl.so
> doesn't exist.  Not sure how to solve this with chrpath, but I know when
> we link vs $ORIGIN we 'fix' this by still having a path based link left
> in (as the more common problem we run into is "build a util that's not
> installed, to build the final util that is installed").

Your suggestion on IRC fixed it:

 do_configure() {
         # Make hostperl in build directory be the native perl
- -        cp -f ${HOSTPERL} hostperl
+        ln -sf ${HOSTPERL} hostperl

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL5C4hMkyGM64RGpERAocBAKChtijAAMmmAI9JUSK/xKuC+25B2QCgkujg
2ZR+o433TkKBm6E3NKAs2B0=
=LiKy
-----END PGP SIGNATURE-----



