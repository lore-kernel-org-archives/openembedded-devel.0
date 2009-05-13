Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4I5X-0000Vb-VE
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 19:17:52 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4Hz1-0002E1-Ie
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 17:11:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 17:11:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 17:11:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 May 2009 19:10:56 +0200
Message-ID: <gueuv0$mjh$1@ger.gmane.org>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>	<guen3q$p5u$1@ger.gmane.org>
	<20090513151848.GI7973@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <20090513151848.GI7973@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices
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
X-List-Received-Date: Wed, 13 May 2009 17:17:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-09 17:18, Tom Rini wrote:
> On Wed, May 13, 2009 at 04:56:58PM +0200, Koen Kooi wrote:
>> On 13-05-09 16:46, Marcin Juszkiewicz wrote:
>>> From: Marcin Juszkiewicz<hrw@openembedded.org>
>>>
>>>
>>> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>
>>> ---
>>>    conf/distro/angstrom-2008.1.conf |    1 +
>>>    1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
>>> index a466834..b5dbc48 100644
>>> --- a/conf/distro/angstrom-2008.1.conf
>>> +++ b/conf/distro/angstrom-2008.1.conf
>>> @@ -101,6 +101,7 @@ ANGSTROM_GCC_VERSION_bfin			= "4.1.2"
>>>
>>>    ANGSTROM_GCC_VERSION_486sx      = "4.3.3"
>>>    ANGSTROM_GCC_VERSION_armv7a     = "4.3.3"
>>> +ANGSTROM_GCC_VERSION_geode      = "4.3.3"
>>>
>>>    # Uncomment this if want need to build an armv7a kernel with CSL toolchain (<2.6.27 don't boot with mainline gcc)
>>>    #KERNEL_CCSUFFIX_armv7a= "-4.2.1+csl-arm-2007q3-53"
>>
>> NAK, this would interfere with an outstanding patch that Graeme and I
>> are testing:
>>
>> http://dominion.thruhere.net/koen/OE/angstrom-dev-toolchain.diff
>
> wrt that patch, is there a reason you aren't bumping ppc as well?  As an
> old PPC guy, that's always had me perplexed..

When adding PPC support I had loads of troubles compiling gcc and glibc 
due to sqrt and type size problems.
My efika is too busy serving stuff to serve as a testbed and my 
dht-walnut lacks a psu currently, so I'm a bit apprehensive about 
bumping toolchains without runtime testing them.
If console-image actually builds with gcc 4.3.3 + binutils 2.18, that 
would be a *huge* step forward.

regards,

Koen




