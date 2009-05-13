Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M4Gno-0007jc-3a
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 17:55:28 +0200
Received: (qmail 5440 invoked from network); 13 May 2009 15:48:42 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 13 May 2009 08:48:42 -0700
Date: Wed, 13 May 2009 08:48:42 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090513154842.GJ7973@smtp.west.cox.net>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>
	<guen3q$p5u$1@ger.gmane.org>
	<20090513151848.GI7973@smtp.west.cox.net>
	<4A0AE5CC.5010407@balister.org>
MIME-Version: 1.0
In-Reply-To: <4A0AE5CC.5010407@balister.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Wed, 13 May 2009 15:55:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2009 at 11:22:52AM -0400, Philip Balister wrote:
> Tom Rini wrote:
>> On Wed, May 13, 2009 at 04:56:58PM +0200, Koen Kooi wrote:
>>> On 13-05-09 16:46, Marcin Juszkiewicz wrote:
>>>> From: Marcin Juszkiewicz<hrw@openembedded.org>
>>>>
>>>>
>>>> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>
>>>> ---
>>>>   conf/distro/angstrom-2008.1.conf |    1 +
>>>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
>>>> index a466834..b5dbc48 100644
>>>> --- a/conf/distro/angstrom-2008.1.conf
>>>> +++ b/conf/distro/angstrom-2008.1.conf
>>>> @@ -101,6 +101,7 @@ ANGSTROM_GCC_VERSION_bfin			= "4.1.2"
>>>>
>>>>   ANGSTROM_GCC_VERSION_486sx      = "4.3.3"
>>>>   ANGSTROM_GCC_VERSION_armv7a     = "4.3.3"
>>>> +ANGSTROM_GCC_VERSION_geode      = "4.3.3"
>>>>
>>>>   # Uncomment this if want need to build an armv7a kernel with CSL toolchain (<2.6.27 don't boot with mainline gcc)
>>>>   #KERNEL_CCSUFFIX_armv7a= "-4.2.1+csl-arm-2007q3-53"
>>> NAK, this would interfere with an outstanding patch that Graeme and I 
>>>  are testing:
>>>
>>> http://dominion.thruhere.net/koen/OE/angstrom-dev-toolchain.diff
>>
>> wrt that patch, is there a reason you aren't bumping ppc as well?  As an
>> old PPC guy, that's always had me perplexed..
>
> There are rumours of problems. But I suspect we do not know specifics.  
> Any testing would be great :)

OK, I've got a 405GP eval board dug up, I'll get a 'make check' going
sometime soon and report back.  That should cover the xilinx case too,
fwiw.

-- 
Tom Rini


