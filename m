Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id A7EC46FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 09:37:11 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3E23368A01C; Thu, 10 Mar 2016 09:37:11 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E0C6168A019;
	Thu, 10 Mar 2016 09:37:10 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 9D5B06740554;
	Thu, 10 Mar 2016 10:37:10 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <56E13B20.8010902@nedap.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56E14046.8090203@mlbassoc.com>
Date: Thu, 10 Mar 2016 10:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56E13B20.8010902@nedap.com>
Subject: Re: Updating configuration files, how to
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
X-List-Received-Date: Thu, 10 Mar 2016 09:37:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-10 10:15, Jaap de Jong wrote:
> Hi All,
>
> I am wondering what the best approach is for creating 'standard' packages with updated configuration files.
> As an example: I want to have a package with an updated /etc/network/interfaces file to reflect my systems hardware.
> Should I create a init-ifupdown_1.0.bbappend recipe with the updated file?
> What other options do I have?
> What are you guys using for this?
> And how about the package name in such a case. Append something to its name?

I use a init-ifupdown_1.0.bbappend in my target machine (BSP) layer,
this way these settings only affect the particular machine(s).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

