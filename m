Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OFZ6u-0001Zq-O8 for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 22:46:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OFZ2y-0001Z2-5O for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 22:42:20 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 22:42:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 22:42:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 21 May 2010 22:42:05 +0200
Message-ID: <ht6r6t$niu$1@dough.gmane.org>
References: <4BF69D04.5060506@mlbassoc.com>
	<AANLkTik1pMbRIMYx01oR0eA4xwruqMaSI8qoggbgPHwd@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <AANLkTik1pMbRIMYx01oR0eA4xwruqMaSI8qoggbgPHwd@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: staging problem
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
X-List-Received-Date: Fri, 21 May 2010 20:46:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-05-10 22:27, Khem Raj wrote:
> On Fri, May 21, 2010 at 7:47 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> Trying a clean build
>>  MACHINE="beagleboard"
>>  DISTRO="angstrom-2008.1"
>>  org.openembedded.dev 2c153f33b8ebb807a622ad9ae92ed5341a356740
>>
>> I get failures like this (in many packages):
>>  /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:138:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
>>  /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:298:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
>>  /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:307:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
>>  /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:309:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
>>  /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:310:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'size_t'
>>
>> The problem is that the compiler include file <regex.h> is
>> not the standard/default one, rather the file from tcl!
>> I replaced the bogus regex.h file with the correct one and
>> my build completes & runs.
> 
> its tcl dev package bug it should have installed its version into
> /usr/include/tcl<ver> instead of overwriting the existing version in sysroot.
> 
> I can see the problem in the recipes if you are using 8.5.8 then
> try this untested patch and let me know if it helps
> 
> diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
> index 220e858..dd5c810 100644
> --- a/recipes/tcltk/tcl_8.5.8.bb
> +++ b/recipes/tcltk/tcl_8.5.8.bb
> @@ -33,7 +33,8 @@ BINCONFIG_GLOB = "*Config.sh"
>  do_install() {
>         autotools_do_install
>         # Stage a few extra headers to make tk happy
> -       install -m 0644 ../generic/*.h ${D}${includedir}
> +       install -d ${D}${includedir}/tcl8.5/generic/
> +       install -m 0644 ../generic/*.h ${D}${includedir}/tcl8.5/generic/
>         install -m 0644 *.h ${D}${includedir}
>         ln -sf tclsh8.5 ${D}${bindir}/tclsh
>  }

I have a different patch, but yours is better. If TK builds after yours,
feel free to add my ack and push it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL9vAdMkyGM64RGpERAsNhAKCFHUduJmKs6TYcYIlKkgfiwgOsuwCeLRQS
VIpCFAdPJnx5451XhNHFW3A=
=TbNQ
-----END PGP SIGNATURE-----



