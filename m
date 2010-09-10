Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OuANm-000120-32
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:39:38 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OuAN3-0002OL-Nc from Tom_Rini@mentor.com ;
	Fri, 10 Sep 2010 13:38:53 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 10 Sep 2010 13:38:53 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 10 Sep 2010 14:38:52 -0600
Message-ID: <4C8A9755.1060308@mentor.com>
Date: Fri, 10 Sep 2010 13:38:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>	<1284024609.28520.1446.camel@mill.internal.reciva.com>	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>	<AANLkTimOLsxX_hf6rsOyOCJgFdBrkrL=2LsT9ToCfazv@mail.gmail.com>	<4C88EC2B.2090208@balister.org>
	<20100910185004.GF28148@denix.org>
In-Reply-To: <20100910185004.GF28148@denix.org>
X-OriginalArrivalTime: 10 Sep 2010 20:38:52.0465 (UTC)
	FILETIME=[2E210A10:01CB5128]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: tsc@openembedded.org
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Fri, 10 Sep 2010 20:39:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Thu, Sep 09, 2010 at 10:16:11AM -0400, Philip Balister wrote:
>> On 09/09/2010 10:06 AM, Chris Larson wrote:
>>> On Thu, Sep 9, 2010 at 3:11 AM, Frans Meulenbroeks<
>>> fransmeulenbroeks@gmail.com>  wrote:
>>>
>>>> Signed-off-by: Chase Maupin<chase.maupin@ti.com>
>>>> Acked-by: Denys Dmytriyenko<denys@ti.com>
>>>> Acked-by: Koen Kooi<k-kooi@ti.com>
>>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>>>
>>>> I would suggest modifying the commit policy disallowing these kind of
>>>> things, saying the two Ack's must be from two developers not
>>>> affiliated with the same company.
>>>>
>>> I'd agree with this quite strongly.  I'm generally pretty careful to let
>>> others review the changes from my coworkers, to avoid any bias.
> 
> Chris,
> 
> Not to point any fingers, but mishaps happen and numerous reverts would be a 
> living proof of that in the repository... :) Nobody's perfect.
> 
>> This would be a good topic for OEDEM.
>>
>> For the record, I am really happy to see the .com people actively 
>> participating in the the OE project. I am also glad that they are pushing 
>> stuff into .dev and not keeping it in private repositories. This is a very 
>> good thing.
> 
> As I just replied to Frans' post in this thread - as a company, we are trying 
> to follow review procedures closely and give enough time for feedback on the 
> patches. I personally would like to apologize for the misunderstanding and 
> promise to do a better job in the future.

That it seems that you're doing Ack/SOB in-house first is a good thing, 
I think.

> As an active OE e.V. member on the other hand, I'm all in favor of this 
> modification to the commit policy, as long as there is time limit on review 
> period and if there are no strong objections, it can be pushed even if only 
> acked by the same company. Let's discuss it further and vote at OEDEM.

So long as there's exceptions for limited area of expertise places. 
There's both things like packaged-staging where Chris and I and RP have 
dealt with it the most, and then there's also TI recipes that's really 
you guys.

-- 
Tom Rini
Mentor Graphics Corporation


