Received: from [208.84.147.47] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hacker@klever.net>) id 1KiROn-0007Kv-Ms
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 12:15:09 +0200
Received: from [85.183.207.43] (helo=[192.168.150.156])
	by rhodos.klever.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hacker@klever.net>) id 1KiRLI-0007Pw-Tl
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 12:11:33 +0200
Message-ID: <48DA1251.30305@klever.net>
Date: Wed, 24 Sep 2008 12:11:29 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gb0738$dcq$1@ger.gmane.org>	<200809191645.13840.zecke@selfish.org>
	<gbct33$rh4$1@ger.gmane.org>
	<1222248100.15974.4.camel@ip6-localhost>
In-Reply-To: <1222248100.15974.4.camel@ip6-localhost>
Subject: Re: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Wed, 24 Sep 2008 10:15:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 24.09.2008, 10:17 +0200 schrieb Koen Kooi:
>> Holger Freyther wrote:
>>> On Friday 19 September 2008 14:48:40 Koen Kooi wrote:
>>>
>>>> Anyway, PE has been bumped, things should work again this the next EFL
>>>> 'upgrade' happens. I just need to find a way to get the past 2 hours of
>>>> my life back.
>>> Thanks!
>> I just fixed linux-openmoko as well, '0' is _less_ than '7', so changing 
>> PR from 'r7' to 'r0' is *bad*, I've increased it to 'r8' now.
> 
>> Seriously, is math that hard for openmoko people?
> 
> Much less the math but rather being used to reset PR on version updates.
> Alas this breaks with hash-based SCMs. I begin to regret the decision to
> use git in my projects.

What about using something like the output of `git describe --tags $(git 
rev-parse HEAD)` as a sortable key?

Love,
H


