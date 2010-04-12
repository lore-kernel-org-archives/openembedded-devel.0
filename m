Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1S2f-0003Qz-P1 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 00:23:42 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1RzG-000469-BX for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 00:20:10 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 00:20:10 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 00:20:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Apr 2010 00:19:57 +0200
Message-ID: <hq06ad$tnf$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex> <hpum4g$18m$1@dough.gmane.org>
	<1271090705.14344.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <1271090705.14344.16.camel@localhost.localdomain>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Mon, 12 Apr 2010 22:23:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-04-10 18:45, Joshua Lock wrote:
> On Mon, 2010-04-12 at 10:37 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-04-10 17:33, Richard Purdie wrote:
>>> I've been aware that Poky and OE have been diverging slightly and I'd
>>> like to correct this. There are some patches that I've promised for a
>>> while too such as the rename from do_populate_staging ->
>>> do_populate_sysroot.
>>>
>>> With some help from Joshua Lock, I have a branch I'd like to propose be
>>> merged into OE.dev:
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress
>>
>> Joshuas last 3 commits to poky seem to fix Toms issue with binconfig and
>> my issue with chrpath, which only leaves the cross staging lamangler
>> stuff to get fixed.
> 
> I've just pushed an updated version of the tree with the recent Poky
> changes you have observed and a merge of the autotools.bbclass to get
> the lamangler stuff.
> 
> It builds a console-image fine here but the testing hasn't been
> stringent as of yet.

OK, I reproduced the abiword failure, it's in enchant:

| /bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=CC
- --mode=link ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a
- -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-
-isystem/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
- -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
- -ggdb3 -module -avoid-version -no-undefined
- -L/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
-
-Wl,-rpath-link,/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
- -Wl,-O1 -Wl,--hash-style=gnu -o libenchant_aspell.la -rpath
/usr/lib/enchant aspell_provider.lo -Wl,--export-dynamic -pthread
- -lgmodule-2.0 -lrt -lglib-2.0
- -L/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
- -laspell ../../src/libenchant.la
| /bin/grep:
/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la:
No such file or directory
| /bin/sed: can't read
/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la:
No such file or directory
| arm-angstrom-linux-gnueabi-libtool: link:
`/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la'
is not a valid libtool archive

The file referenced
(/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la)
doesn't exist since it is located in
/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la
instead.

Any clues in which direction I should look to debug this?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLw5yNMkyGM64RGpERAiy6AJ9gkciNcKUwUJhSmRmRRGpzuEl8wwCgguCI
U0/KNvdOafbnrJeqhOz6Zt0=
=mlkL
-----END PGP SIGNATURE-----



