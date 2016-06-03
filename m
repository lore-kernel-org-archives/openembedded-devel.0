Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 191CE7741A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 05:47:51 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id B1FDE68A01C; Fri,  3 Jun 2016 06:47:51 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 4B63468A019;
	Fri,  3 Jun 2016 06:47:51 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id C875D67401CE;
	Fri,  3 Jun 2016 07:47:50 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <20160602182426.GW7939@vctlabs.com>
	<20160602182641.GX7939@vctlabs.com> <57510F9A.8080400@mlbassoc.com>
	<20160603053852.GD7939@vctlabs.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57511A06.3060309@mlbassoc.com>
Date: Fri, 3 Jun 2016 07:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160603053852.GD7939@vctlabs.com>
Subject: Re: [meta-python][PATCHv3 1/3] python-backports-abc: initial recipe for version 0.4 RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jun 2016 05:47:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2016 07:38 AM, S. Lockwood-Childs wrote:
> On Fri, Jun 03, 2016 at 07:03:22AM +0200, Gary Thomas wrote:
>> On 06/02/2016 08:26 PM, S. Lockwood-Childs wrote:
>>> Tornado 4.3 needs a couple more backport modules to prevent tornado/gen.py
>> >from bombing on import errors when running on python2 rather than python3.4
>>>
>>>    ImportError: No module named backports_abc
>>>
>>> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
>>
>> In my mind, this patch (and its sibling) don't really have anything to to
>> with Tornado, they are just new packages being added to make that package happy.
>> I'd prefer to see a commit message that reflects what this package is as well
>> as why it is being added.
>
>>> +SUMMARY = "collections.abc from Python 3.4"
>>> +DESCRIPTION = "A backport of recent additions to the 'collections.abc' module"
>
> What would you like to see, a repeat of the SUMMARY or DESCRIPTION lines
> added to the corresponding commit messages (if so, which)?
>
> Other than that, I don't know what else to say about them; if their absence
> wasn't breaking Tornado, I would not have picked either of these particular
> modules to submit. Neither one has much use yet outside of Tornado (found no
> other users of abc, while singledispatch is also used by rpy (python interface
> to R).
>

I would think the SUMMARY would be OK, along with a note that the package was
introduced to make Tornado happy.  (I know this is just "eye candy", but it does
help when searching through git logs...)

Thanks for doing this - I was about to make similar changes myself.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

