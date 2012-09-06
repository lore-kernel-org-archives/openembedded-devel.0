Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XwX-0002Nb-0f
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 11:00:09 +0200
Received: from localhost ([127.0.0.1]:57300 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XkX-00075r-3i
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 08:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=9TNhoYv3gwGp3jn0BuWIaVfc5OU=; b=Y06Uh38YGht56ZMtt9/bD/YMXKsr
	Y8hRA7Fh+wxqSTkG5R/691Oh/SUyEx1dfipYWJbSPxjCuOmiKy/+EioRiUtRmRmn
	alKTDITyH7m2rzdez1KPvMH7sqUJ7nE/VxjfH72gtaD/hHs08RFzz9/Ixp2UzJE9
	cbOihz7xxL8+2HA=
Received: from [195.171.99.130] (port=23950 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XkX-00075o-1b
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 08:47:45 +0000
Message-ID: <50486373.5060609@communistcode.co.uk>
Date: Thu, 06 Sep 2012 09:48:51 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
	<1718555.hFmUFu8O5x@helios> <50485B04.4030002@communistcode.co.uk>
	<1477981.pb89MerWOV@helios>
In-Reply-To: <1477981.pb89MerWOV@helios>
Subject: Re: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Thu, 06 Sep 2012 09:00:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/12 09:30, Paul Eggleton wrote:
> On Thursday 06 September 2012 09:12:52 Jack Mitchell wrote:
>> On 05/09/12 22:32, Paul Eggleton wrote:
>>> On Wednesday 05 September 2012 21:28:18 Martin Jansa wrote:
>>>> On Wed, Sep 05, 2012 at 03:16:10PM +0100, Paul Eggleton wrote:
>>>>> It's not totally clear but it doesn't look like 1.8.2 has been released
>>>>> yet judging from their website; if that's the case then PV should be set
>>>>> to "1.8.1+git${SRCPV}".
>>>> Or rather
>>>> "1.8.1+gitr${SRCPV}"
>>>> like most meta-* recipes
>>> This was discussed not that long ago IIRC - the r is superfluous for git.
>>> In fact if you look at most OE-Core recipes that use SRCPV they do not
>>> precede it with r.
>>>
>>> Cheers,
>>> Paul
>> So even though it is the 1.8.1 release commit it should still be tagged
>> with the git SRCPV?
> Well, I don't personally think so - if it really is 1.8.1 (and it's pointing
> at the same revision as the "1.8.1" tag, so it ought to be) then I don't think
> it should be needed.
>
> Cheers,
> Paul
>

Ok, that is how I envisioned it - thanks for clearing it up.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



