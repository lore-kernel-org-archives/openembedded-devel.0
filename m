Return-Path: <rcagley@gmail.com>
Received: from mail-yh0-f53.google.com (unknown [209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id AAF0F65D0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 20:58:06 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id i57so2189259yha.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 13:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xUtbZwdh8n1DCxGJ8vLCLCzKXLmLbpo152WKIVQjkNA=;
	b=p8d6RjU6s7iIQz1EDegYFlOY1TCnorgkf1p5fy0SYAscS+FL+dwWsWB72tUnbuafZ9
	89QgwkTxT3wcPmEUDy+L+gS9n/lLsiZhf0Vz9GvC5aEhtpwqnOjyNK9ZETISbFDvFQ6q
	XTH7DcvXUpVSX/HIgDszY5XKaJ0767S6PUHgN14e03Ks7qssJP9S1Ml8/75WcayAc3pg
	100zHswwsJzrFL4BKQpZuiBIHACf6iIv+0YDBa6bYgV2RdIRHRONSqrCqB35veI0mihN
	dfrc/ToegFj//WLo3/wvOe1GjBYfyexFjUYwKpcK4xpGcpaYZrTkGBb5uVKJEe040eCY
	MJ3w==
MIME-Version: 1.0
X-Received: by 10.236.147.232 with SMTP id t68mr30343261yhj.127.1400705887864; 
	Wed, 21 May 2014 13:58:07 -0700 (PDT)
Received: by 10.170.110.8 with HTTP; Wed, 21 May 2014 13:58:07 -0700 (PDT)
In-Reply-To: <537D0D26.8070505@balister.org>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
	<CFA27259.284985%rcalhoun@shotspotter.com>
	<CAN-NoH3B+3+9QuWOLaMpcjxD0FhkETFqyDr1CKRPO7kXU0UFXg@mail.gmail.com>
	<537D0D26.8070505@balister.org>
Date: Wed, 21 May 2014 13:58:07 -0700
Message-ID: <CAN-NoH1coG9-Go6qqOQU_-vu3QqhdE30znM-PCgMPZtAd5To+Q@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: how to create a new layer
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
X-List-Received-Date: Wed, 21 May 2014 20:58:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 21, 2014 at 1:31 PM, Philip Balister <philip@balister.org> wrote:
> On 05/21/2014 04:05 PM, Richard Cagley wrote:
>> On Wed, May 21, 2014 at 12:26 PM, Robert Calhoun
>> <rcalhoun@shotspotter.com> wrote:
>>>
>>>
>>> On 5/21/14 2:26 PM, "Richard Cagley" <rcagley@gmail.com> wrote:
>>>
>
>> 2.) Do I need to change the machine name? If so, how to I inherit
>> zedboard-zynq7?
>
> Make a conf/machine/me.conf.
>
> You can use one of the zynq machines as a starting point.
>
> You'll need a conf/layer.conf also.

1.) copied meta-xilinx/conf/machine/zedboard-zynq7.conf to
meta-me/conf/machine/me.conf
2.) changed MACHINE in my build/conf/local.conf to "me"
3.) copied meta-xilinx/conf/layer.conf to meta-me/conf/layer.conf

Now:
1.) in layer.conf should I change "xilinx" to "me"?
2.) What about the new machine file me.conf? Do I need to edit it or
by not editing it does it just inherit everything from the other meta
layer?

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

