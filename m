Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OqyEQ-0005mq-Sl
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 03:05:17 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OqyDk-0001vs-Ep from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 18:04:04 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 1 Sep 2010 18:04:04 -0700
Received: from [172.30.80.207] ([172.30.80.207]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Sep 2010 19:04:03 -0600
Message-ID: <4C7EF7FE.8080405@mentor.com>
Date: Wed, 01 Sep 2010 18:03:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283352730-17975-1-git-send-email-clarson@kergoth.com>	<AANLkTi=U6qLKy-Oxk_05YF4p+9BJxx0d5=O3cRr4OiZQ@mail.gmail.com>
	<AANLkTim4MZ_jPZDnGzV7wKgeC_aQFN_uj2Pjxks2Ms8g@mail.gmail.com>
In-Reply-To: <AANLkTim4MZ_jPZDnGzV7wKgeC_aQFN_uj2Pjxks2Ms8g@mail.gmail.com>
X-OriginalArrivalTime: 02 Sep 2010 01:04:03.0366 (UTC)
	FILETIME=[BC0C1C60:01CB4A3A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] do_unpack, do_patch: shift some responsibility around, clean things up
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
X-List-Received-Date: Thu, 02 Sep 2010 01:05:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Wed, Sep 1, 2010 at 7:57 AM, Chris Larson <clarson@kergoth.com> wrote:
>> On Wed, Sep 1, 2010 at 7:52 AM, Chris Larson <clarson@kergoth.com> wrote:
>>
>>> - Move unpack functions from classes into oe.patch
>>
>> Why do I never notice the typos until after sending it to the list?  This
>> should be oe.unpack, of course.
> 
> Looks good.
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>
> 

Put this past a -c patchall -k world and then reproduced the failures 
w/o the patch (by hand, hopefully didn't miss anything).

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


