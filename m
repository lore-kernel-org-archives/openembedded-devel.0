Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 448976E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 20:33:33 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so22400554igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=set92qe2GBd/ryBjjIHT+BhdVEISJYlodMgKvQapFNA=;
	b=l6+eg5CZmKnepjJBSYCu6useGwq6dLYQp3ohY7SYWzJm+LVBExSoRm5+5PkgylBWYh
	5U9JXxBfjGigfZzyeXIxMe//e6Xkkv5IEM4227Rcktd6vsvfpLRwzg46dbpdIDmYnyio
	o24W8/LbywiOR8e/r1gO634IXE/QlwB2ZfipShXGgzUGEvUbRI/nDFXNGTmJ9YEtmZ+7
	58jN+XYJ7/MwlmK5YK3L9tOUzXS0iv/JZTTBYs3ckXiI/dyMvxJAMELT3tTBlV9+q45g
	Z86Zol+bzG/XLuhC5/SiHiqTwWaHnw0MJieXz+1cxDLnRdnwcHNIEkLqX+RIOov7j0g7
	I+wQ==
X-Gm-Message-State: ALoCoQkfeaB5s+tKOUtF9zjVHu+iiXCovf127aXqnLYazzRqFCfaqH9Fa5aKC/7ML5fTvD8i2lCS
X-Received: by 10.50.62.81 with SMTP id w17mr10093826igr.0.1442349213190;
	Tue, 15 Sep 2015 13:33:33 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176])
	by smtp.gmail.com with ESMTPSA id au6sm391971igc.0.2015.09.15.13.33.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 13:33:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii196 with SMTP id i196so211701108ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:33:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr35617680ioe.37.1442349211572; 
	Tue, 15 Sep 2015 13:33:31 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 15 Sep 2015 13:33:31 -0700 (PDT)
In-Reply-To: <20150915180454.GB10507@mentor.com>
References: <1442339663-15101-1-git-send-email-fabio@bertux.com>
	<20150915180454.GB10507@mentor.com>
Date: Tue, 15 Sep 2015 17:33:31 -0300
Message-ID: <CAP9ODKou_0-g3pN6Kh4b9wT+3W5ZeJLP614FduLnxp456n4dvA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	Qian Lei <qianl.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking][PATCH] lldpd: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 20:33:34 -0000
Content-Type: text/plain; charset=UTF-8

Hello Joe,

On Tue, Sep 15, 2015 at 3:04 PM, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:
> [[oe] [meta-networking][PATCH] lldpd: Add recipe] On 15.09.15 (Tue 14:54) Fabio Berton wrote:
>
>> From: Fabio Berton <fabio.berton@ossystems.com.br>
>>
>> lldpd is a 802.1AB implementation, a L2 network discovery protocol.
>> It also supports CDP, EDP and various other protocols.
>
> I haven't looked at this in great detail yet, but it appears like it
> would provide the same functionality as lldpad, already in
> meta-networking:
>
> commit 6781f9b5dc60bbd39727aeaa74c13dd31eb73838
> Author: Qian Lei <qianl.fnst@cn.fujitsu.com>
> Date:   Thu Dec 11 17:36:20 2014 +0800
>
>     lldpad: Add new recipe
>
>     LLDPAD contains the Linux user space daemon and configuration tool for
>     Intel LLDP Agent with Enhanced Ethernet support for the Data Center.
>
>     Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> I've no objection to carrying two different implementations,
> particularly if one is more complete than the other or if one is more
> actively developed, but I do have a couple of requests for you given
> that you're the second one on the scene.

It seems the lldpd is way more actively maintained. We have a customer
using this in an environment with some thousands of network devices
with great success and we wished to upstream the recipe and avoid
maintaining a closed recipe for no reason.

>    - Can we move your recipe to sit beside the other lldp daemon?  (That
>      is, in recipes-daemons)

I think it does make sense. Fabio, can you please do so?

>    - Can you update your recipe (and the other, if necessary) to provide
>      an appropriate PROVIDES / CONFLICTS variable?

I am not sure we should. Being two alternatives nothing blocks someone
to install both.

To be honest, maybe this one could replace the old one for
meta-network future users, if Qian Lei agrees.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

