Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3A26011C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 12:00:17 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 15C7168A01C; Wed, 25 May 2016 13:00:16 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 6BB4168A019;
	Wed, 25 May 2016 13:00:15 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 91DD067402C1;
	Wed, 25 May 2016 14:00:13 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <5745392B.4030307@mlbassoc.com>
	<57456352.2080407@pseudoterminal.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <574593CB.7090504@mlbassoc.com>
Date: Wed, 25 May 2016 14:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <57456352.2080407@pseudoterminal.org>
Subject: Re: [meta-qt5] build error
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
X-List-Received-Date: Wed, 25 May 2016 12:00:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-25 10:33, Carlos Rafael Giani wrote:
> Is this a qtbase build with X11 enabled?
> EGL with X11 on i.MX6 might be broken. I know it was once before.
>
> "#error qtextstream.h must be included before any header file that defines Status" indicates as much. "Status" is one of
> those wonderful X11 definitions with super generic names. If the Vivante EGL headers include X11 headers it might be
> causing problems here.

Yes, I do have X11 enabled.  If I disable that, what will I get (I've
not tried wayland/weston yet)?

>
> On 2016-05-25 07:33, Gary Thomas wrote:
>> I just tried to build qtbase for my i.MX6Q target and it failed
>> miserably (tons of compile errors).  I'm using Poky master(c7e614c438706)
>> with GCC 4.9.3.  Error log attached.
>>
>> Any ideas what I'm missing?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

