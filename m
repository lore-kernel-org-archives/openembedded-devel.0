Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmR08-0003M0-4t for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 13:15:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmQxO-0001ZT-Pg for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 13:12:10 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 13:12:10 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 13:12:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Mar 2010 13:11:58 +0100
Message-ID: <hmivaf$h8j$1@dough.gmane.org>
References: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>	<19c1b8a91002191026p3b06577ay9375f944daa661c1@mail.gmail.com>
	<20100302105623.GA28921@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <20100302105623.GA28921@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PACKAGE_ARCH in PACKAGE_ARCHS needed? (bitbake.conf) was: [PATCH 1/4] tune-ppc440.inc: add ppc440 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Tue, 02 Mar 2010 12:15:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-03-10 11:56, Stefan Schmidt wrote:
> Hello.
> 
> On Fri, 2010-02-19 at 10:26, Khem Raj wrote:
>> On Tue, Feb 16, 2010 at 8:32 AM, Adrian Alonso <aalonso00@gmail.com> wrote:
>>> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
>>> ---
>>>  conf/machine/include/tune-ppc440.inc |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
>>> index feca186..0c41db4 100644
>>> --- a/conf/machine/include/tune-ppc440.inc
>>> +++ b/conf/machine/include/tune-ppc440.inc
>>> @@ -1,4 +1,4 @@
>>>  TARGET_CC_ARCH = "-mcpu=440"
>>>  BASE_PACKAGE_ARCH = "ppc440"
>>>  FEED_ARCH = "ppc440"
>>> -PACKAGE_EXTRA_ARCHS += "ppc440e"
>>> +PACKAGE_EXTRA_ARCHS += "ppc440 ppc440e"
>>
>>
>> I wonder why this would be needed, I would think that PACKAGE_ARCHS
>> consists of PACKAGE_EXTRA_ARCHS and PACKAGE_ARCH (which is default
>> arch constructed from  BASE_PACKAGE_ARCH)
>> if that was the case then ppc440 would be added to supported archs
>> list already but it seems there is a disconnect between PACKAGE_ARCH
>> and  PACKAGE_ARCHS I am not sure if it
>> is deliberate or an oversight. If it is an oversight then it should be
>> fixed in bitbake.conf and that would avoid this patch.
> 
> Can somebody with more insight in bitbake.conf give us some insight here?
> 
> Right now bitbake.conf does not include PACKAGE_ARCH in PACKAGE_ARCHS.
> 
> PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
> 
> If it should stay this way, would Adrian's patch be ok? I would rather get his
> contributions in then having them sit to long around. Need to keep people
> motivated. :)

The patch is OK, but for clarity we should change existing contructs like:

FEED_ARCH = "armv7a"
PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a"
BASE_PACKAGE_ARCH = "armv7a"

to

BASE_PACKAGE_ARCH = "armv7a"
FEED_ARCH = "${BASE_PACKAGE_ARCH}"
PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7
${BASE_PACKAGE_ARCH}"

So the patch in question would become:

- -PACKAGE_EXTRA_ARCHS += "ppc440e"
+PACKAGE_EXTRA_ARCHS += "${BASE_PACKAGE_ARCH} ppc440e"

Does that clarify the situation?

regards,

Koen

PS: bonus points for the person that spots the missing arch in the
cortex-a8 example

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLjQCOMkyGM64RGpERAl42AKCuoPRI8gqMgp0SFtT5uYZsRtkgCgCeJ3iz
T/QmrHoo8dnoZmVfVGvuQio=
=jx83
-----END PGP SIGNATURE-----



