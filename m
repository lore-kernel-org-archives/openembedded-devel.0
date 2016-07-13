Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 1765D6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:51:33 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3CA0B68A01C; Wed, 13 Jul 2016 15:51:34 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id BC15B68A019;
	Wed, 13 Jul 2016 15:51:33 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 71F9B6740256;
	Wed, 13 Jul 2016 16:51:33 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <5785F022.8030404@mlbassoc.com>
	<2056819.lo3LDqAOXZ@localhost.localdomain>
	<57864F34.2010704@mlbassoc.com>
	<2194432.uJc0j0dgcv@localhost.localdomain>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57865575.6060208@mlbassoc.com>
Date: Wed, 13 Jul 2016 16:51:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <2194432.uJc0j0dgcv@localhost.localdomain>
Subject: Re: nodejs: newer npm?
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
X-List-Received-Date: Wed, 13 Jul 2016 14:51:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-13 16:41, Davis, Michael wrote:
> I am building for intel core2-32 with an nginx backend.
> I believe the layer exists to keep packages more closely aligned with the
> upstream project.  I personally use it for the current 6.x releases of nodejs.
>

Fair enough (although I believe that this should be only in one place).

That said, I'm having issues with very simple angularjs application.  Any
ideas how I might debug it?  My target is ARM i.MX6Q (armv7-hardfp)?

> On Wednesday, July 13, 2016 04:24:52 PM Gary Thomas wrote:
>> On 2016-07-13 15:29, Davis, Michael wrote:
>>> I am currently using angular from a different meta layer.
>>> https://github.com/imyller/meta-nodejs
>>> It maintains newer versions of nodejs.
>>> It might be something you want to try.
>>
>> I have tried this and yes, the versions are newer, but my simple example
>> still does not work :-(
>>
>> What target/platform are you using?
>> Any idea why there is a separate layer for something that is in a
>> more mainstream (meta-oe) layer for the same things?
>>
>>> On Wednesday, July 13, 2016 10:11:05 AM Gary Thomas wrote:
>>>> On 2016-07-13 09:39, Gary Thomas wrote:
>>>>> The current (at least 4.4.4) nodejs recipe also creates nodejs-npm
>>>>> which is npm version 2.15.1.  I'm trying to run angularjs that needs
>>>>> npm >= 3.3.x.  I've not yet tried the update to 4.4.5, so if this
>>>>> fixes the issue just let me know.
>>>>>
>>>>> What needs to be done to get a newer npm?
>>>>>
>>>>> BTW, the current one segfaults when trying to install the
>>>>> attached package file.
>>>>
>>>> I have now tried nodejs-4.4.5 which has npm-2.15.5  It no longer
>>>> segfaults on the install step, but it doesn't really work :-(
>>>> Any access just returns 'Cannot GET /'
>>>>
>>>> Anyone have suggestions on how I might debug this?  It's a known
>>>> working (simple) application I got from
>>>> https://angular.io/docs/ts/latest/quickstart.html


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

