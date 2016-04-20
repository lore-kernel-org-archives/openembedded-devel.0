Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 94A3C60616
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 09:56:57 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 60EEC68A019; Wed, 20 Apr 2016 10:56:56 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id C62FC68A01B;
	Wed, 20 Apr 2016 10:56:55 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 833D56740509;
	Wed, 20 Apr 2016 11:56:55 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <571750DA.5010307@elfin.de>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57175267.3020504@mlbassoc.com>
Date: Wed, 20 Apr 2016 11:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <571750DA.5010307@elfin.de>
Subject: Re: [meta-multimedia] libav missing
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
X-List-Received-Date: Wed, 20 Apr 2016 09:57:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-20 11:50, piotr.lewicki wrote:
> Hello,
> I'm trying to build some image for raspberry pi and one of my dependencies is "libav".
> Unfortunately it's missing from "meta-openembedded".
> I found a commit which says that it has been moved to oe-core, but I have also cloned "openembedded-core" and there is
> no "libav" either.
> I'm using layers:
> - meta-openembedded
> - meta-raspberrypi
> - openembedded-core
> - poky
> (all of them on master branches).
>
> Could you help me locate a recipe for libav?
>

libav in OE-core has been replaced by ffmpeg.

What recipe are you missing libav for?

> commit 30ba23377ec568a58c43e466582506980b67baad
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Tue Aug 13 22:30:03 2013 +0000
>
>      libav: remove
>
>      This is now in OE-Core.
>
>      Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

