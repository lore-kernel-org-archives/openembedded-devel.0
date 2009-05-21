Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1M7Fgu-0004hS-Cb
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 23:20:40 +0200
Received: from [0.0.0.0] (asshur.mvista.com [10.0.0.11])
	by hermes.mvista.com (Postfix) with ESMTP id 7E116192D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 14:13:00 -0700 (PDT)
Message-ID: <4A15C3B2.7020709@mvista.com>
Date: Thu, 21 May 2009 14:12:18 -0700
From: Christopher Larson <clarson@mvista.com>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gv4d2h$oft$1@ger.gmane.org> <gv4ea5$sbp$1@ger.gmane.org>
	<4A15C20E.6020509@balister.org>
In-Reply-To: <4A15C20E.6020509@balister.org>
Subject: Re: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Thu, 21 May 2009 21:20:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> Koen Kooi wrote:
>> On 21-05-09 22:20, Rolf Leggewie wrote:
>>
>>> I think that, eventually, "bitbake world" should be working again and
>>> usable as a test case.
>>
>> A laudable goal...
>>
>>> I suggest to use COMPATIBLE_MACHINE because I
>>> assume that to be the more common issue.
>>
>> NAK, we have a perfectly good EXCLUDE_FROM_WORLD = "1" for that, 
>> which is already used in lots (well, 23) recipes and classes.
>
> Good point, after thinking about the COMPATIBLE_MACHINE idea, I was 
> thinking it would also need to be paired with COMPATIBLE_DISTRO also. 
> Using the existing EXCLUDE_WORLD would be simpler solution in my mind.
>
> I'm still interested in what other people think. 

Sounds like EXCLUDE_FROM_WORLD + DEFAULT_PREFERENCE would be all that's 
necessary to get nonworking-style functionality without moving the 
recipes, indeed.  At least this way we ensure the recipes stay 
*parsable*, which is more than we can say for the current bits :)

-Chris


