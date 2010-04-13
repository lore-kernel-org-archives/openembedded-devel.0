Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1aFy-0008Ff-Vg for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 09:09:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1aCf-0007bb-6x for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 09:06:33 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 09:06:33 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 09:06:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Apr 2010 09:06:20 +0200
Message-ID: <hq155c$8o8$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex>
	<hpum4g$18m$1@dough.gmane.org>	<1271090705.14344.16.camel@localhost.localdomain>	<hq06ad$tnf$1@dough.gmane.org>
	<1271130396.15813.131.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <1271130396.15813.131.camel@rex>
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
X-List-Received-Date: Tue, 13 Apr 2010 07:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-04-10 05:46, Richard Purdie wrote:
> On Tue, 2010-04-13 at 00:19 +0200, Koen Kooi wrote:
>> OK, I reproduced the abiword failure, it's in enchant:
>>
>> | /bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=CC
>> - --mode=link ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a
>> - -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
>> -
>> -isystem/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
>> - -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
>> - -ggdb3 -module -avoid-version -no-undefined
>> - -L/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> -
>> -Wl,-rpath-link,/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> - -Wl,-O1 -Wl,--hash-style=gnu -o libenchant_aspell.la -rpath
>> /usr/lib/enchant aspell_provider.lo -Wl,--export-dynamic -pthread
>> - -lgmodule-2.0 -lrt -lglib-2.0
>> - -L/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> - -laspell ../../src/libenchant.la
>> | /bin/grep:
>> /OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la:
>> No such file or directory
>> | /bin/sed: can't read
>> /OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la:
>> No such file or directory
>> | arm-angstrom-linux-gnueabi-libtool: link:
>> `/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la'
>> is not a valid libtool archive
>>
>> The file referenced
>> (/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la)
>> doesn't exist since it is located in
>> /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la
>> instead.
>>
>> Any clues in which direction I should look to debug this?
> 
> Sorry I've not been able to spend the time I'd like on this stuff, work
> and travel have got in the way and are probably going to tie me up for a
> while yet if I'm realistic. Anyone at ELC should say hello btw! :) 


> Jet lag prevents me thinking too clearly at the moment but whats
> happening above is that the sysroot is starting to look more like the
> real target filesystem and libstdc++ is moving to what I would say is
> the correct place for it. This is good but it seems something, probably
> a .la file has the incorrect path? Is this a build from scratch or an
> old build? I suspect it would work with a build from scratch but if this
> was one, there is some more subtle problem :/.

It's a complete build from scratch (rm tmp -rf ; bitbake abiword).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLxBfsMkyGM64RGpERAiykAJwNRGHh69Gq4cO+ey3U/+MiPqo+tQCfeKzS
G2KKVQZabSMFEkaoC/9CIXs=
=eBAr
-----END PGP SIGNATURE-----



