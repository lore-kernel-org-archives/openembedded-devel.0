Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P6l7x-0006jG-7i
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 16:19:22 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P6l7P-0005lh-3C from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 07:18:47 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 15 Oct 2010 07:18:46 -0700
Received: from [172.30.80.89] ([172.30.80.89]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 15 Oct 2010 08:18:45 -0600
Message-ID: <4CB862BE.9070908@mentor.com>
Date: Fri, 15 Oct 2010 07:18:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<AANLkTimjtmWvRCypjwRfyFc7VnaJUL4R_0miq3aC3MRW@mail.gmail.com>
In-Reply-To: <AANLkTimjtmWvRCypjwRfyFc7VnaJUL4R_0miq3aC3MRW@mail.gmail.com>
X-OriginalArrivalTime: 15 Oct 2010 14:18:46.0094 (UTC)
	FILETIME=[E0EE3EE0:01CB6C73]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 14:19:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Thu, Oct 14, 2010 at 8:36 PM, Chris Larson <kergoth@gmail.com> wrote:
>> From: Chris Larson <chris_larson@mentor.com>
>>
>> Given the current implementation of OVERRIDES in bitbake, the variable is
>> expected to contain elements in the order least specific to most specific,
>> however, our current usage of it does not match that.  As one example, "local"
>> is supposed to always be the most specific override, yet currently it's the
>> least specific.  As another example, currently the target architecture is seen
>> as more specific than the machine, which is also clearly wrong.
>>
>> It becomes clear that a reversal of the current value will bring us to a more
>> sane behavior, and avoids the need for the dual overrides hack mentioned in
>> the comments, so clean those up as well.
>>
>> This also introduces a MACHINE_OVERRIDES variable as a generic mechanism to
>> inject overrides elements which are more specific than the distro but less
>> specific than the machine, which is where things like MACHINE_CLASS or
>> SOC_FAMILY or the like would go.  This variable is *space* separated, to make
>> it easier and more convenient to assemble the variable incrementally, and it's
>> then translated to : separated when used in OVERRIDES.
>>
>> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> 
> both things look nice to me. We might need to document MACHINE_OVERRIDES though.

Yes, no new variables without updating the docs.

-- 
Tom Rini
Mentor Graphics Corporation


