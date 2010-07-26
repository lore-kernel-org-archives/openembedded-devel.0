Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdISq-0005JD-Mk for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:51:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdISQ-00084z-Sa for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:50:42 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 09:50:42 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 09:50:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jul 2010 09:50:35 +0200
Message-ID: <i2jeob$pqe$1@dough.gmane.org>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
	<i2fjoo$iiu$1@dough.gmane.org> <20100724212502.GA4218@gmail.com>
	<i2gsqi$8sv$1@dough.gmane.org> <i2h6dv$1ni$1@dough.gmane.org>
	<i2harj$e6t$1@dough.gmane.org>	<AANLkTik9ZnjaXvx6vxnjzxx013ms+cDjVv1FvsK31r5u@mail.gmail.com>
	<i2hk5h$86q$1@dough.gmane.org> <1280073236.13006.125.camel@rex>
	<AANLkTim8kQzq4_BxEAU4rtOqVdieD6q5s4dnr219LRbO@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTim8kQzq4_BxEAU4rtOqVdieD6q5s4dnr219LRbO@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Mon, 26 Jul 2010 07:51:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-07-10 21:43, Khem Raj wrote:
> On Sun, Jul 25, 2010 at 8:53 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>> On Sun, 2010-07-25 at 17:10 +0200, Koen Kooi wrote:
>>>> And cacao:
>>>>
>>>> | configure: error: armv7a systems are not supported at this time
>>>> | ERROR: Function do_configure failed
>>>>
>>>>> yes I was expecting that kind of problems. openssl also has similar issues.
>>>>
>>>>> another idea that struck me was that we could change the target triplet to drop
>>>>> TARGET_VENDOR and replace it with TARGET_SUB_ARCH and TARGET_SUBARCH
>>>>> could be anything
>>>>> we could even make it same as MACHINE_ARCH which means you will build
>>>>> toolchain per machine
>>>>> and they will live together.
>>>>
>>>>> then the tool names will be something like arm-v7-linux-gnueabi-*
>>>>> powerpc-e500-linux-gnu
>>>>> mips-mips2-linux etc. instead of *-angstrom-*- or *-oe-*-
>>>>
>>>>> or arm-beagleboad-linux-gnueabi-* etc if we go with MACHINE_ARCH
>>>>
>>>>> that would keep all recipe configury happy as the arch detected from
>>>>> config.guess will be what
>>>>> we had (arm, mips, mipsel powerpc etc) so no changes needed but we
>>>>> will have to drop the brand
>>>>
>>>>> does it sound good ? bad?
>>>
>>> I don't think abusing target vendor for that is a good idea. And I'm
>>> quite attached to my angstrom branded toolchains, tbh.
>>
>> Note that you can still append your angstrom string to the vendor part
>> of the triplet...
> 
> arm-v7_angstrom-linux-gnueabi-  etc. is a possibility

that would work for me :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMTT5KMkyGM64RGpERAiNNAJ4pWZ3QzrdsF0zioWrU1oAmTuAF8QCghWiA
jYNyaUoeD+N7muCWMbilM78=
=tcjx
-----END PGP SIGNATURE-----



