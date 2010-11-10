Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PGDZ7-0008OC-Tc
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 17:30:30 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PGDYB-0001ED-18 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 08:29:31 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Nov 2010 08:29:30 -0800
Received: from [172.30.80.211] ([172.30.80.211]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 10 Nov 2010 09:29:30 -0700
Message-ID: <4CDAC864.7050803@mentor.com>
Date: Wed, 10 Nov 2010 09:29:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>	<1287157281-31597-1-git-send-email-kergoth@gmail.com>	<i9aai3$tmj$1@dough.gmane.org>	<AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>
	<1289399216.1272.415.camel@rex>
In-Reply-To: <1289399216.1272.415.camel@rex>
X-OriginalArrivalTime: 10 Nov 2010 16:29:30.0335 (UTC)
	FILETIME=[7333EEF0:01CB80F4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Wed, 10 Nov 2010 16:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Fri, 2010-10-15 at 12:44 -0700, Chris Larson wrote:
>> On Fri, Oct 15, 2010 at 12:37 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 15-10-10 17:41, Chris Larson wrote:
>>>> From: Chris Larson <chris_larson@mentor.com>
>>>>
>>>> Given the current implementation of OVERRIDES in bitbake, the variable is
>>>> expected to contain elements in the order least specific to most
>>> specific,
>>>> however, our current usage of it does not match that.  As one example,
>>> "local"
>>>> is supposed to always be the most specific override, yet currently it's
>>> the
>>>> least specific.  As another example, currently the target architecture is
>>> seen
>>>> as more specific than the machine, which is also clearly wrong.
>>>>
>>>> Big thanks to Chase Maupin for investigating and identifying this long
>>>> standing issue.
>>>>
>>>> It becomes clear that a reversal of the current value will bring us to a
>>> more
>>>> sane behavior, and avoids the need for the dual overrides hack mentioned
>>> in
>>>> the comments, so this implements this reversal, and drops the unnecessary
>>> and
>>>> confusing comments.
>>>>
>>>> This also introduces a MACHINE_OVERRIDES variable as a generic mechanism
>>> to
>>>> inject overrides elements which are more specific than the distro but
>>> less
>>>> specific than the machine, which is where things like MACHINE_CLASS or
>>>> SOC_FAMILY or the like would go.  This variable is *space* separated, to
>>> make
>>>> it easier and more convenient to assemble the variable incrementally.
>>>>
>>>> Reported-by: Chase Maupin <chase.maupin@ti.com>
>>>> Signed-off-by: Chris Larson <chris_larson@mentor.com>
>>> Acked-by: Koen Kooi <k-kooi@ti.com>
>>>
>> This is now in master -- thanks to all for the acks, review, comments -- let
>> me know if any problems result from this.
> 
> You do realise the damage this potentially causes for compatibility of
> metadata between OE and Poky?
> 
> This change is pretty serious and potentially alters the handling of any
> double override. Poky uses them a bit more extensively than OE does. Its
> effectively an architecture change to OE yet no discussion was had at
> any TSC meeting :(.
> 
> I even asked about this a while back and was *told* that "local" was
> meant to be weak, I therefore added a strong version to Poky, in the
> spirit of maintaining compatibility.
> 

(a) Eeep! and (b) That's pretty much the opposite of what the rest of 
the thread / discussion was, which is to say "local is supposed to be 
the final winner, why isn't it?"

Now... what do we do here?

-- 
Tom Rini
Mentor Graphics Corporation


