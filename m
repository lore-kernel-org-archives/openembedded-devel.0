Return-Path: <rcagley@gmail.com>
Received: from mail-yh0-f41.google.com (unknown [209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id E373A65F1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 15:25:52 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so4394150yha.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mvLjPpiUByYUav6g6iyF54UHSm8xMCV9qFFeLucxOrs=;
	b=bNJ4nJnNnap8PM4xqwCcJQecMujQeSmnEMtBTS/yDbWVMDviQD9adEJUH2kXPEptOo
	+qlwJFQmHYlVI1JnKk1PW7qdt0jMQGUoOJT42z/lzXeQmsn8IB53ckqxUizkbzK+SCj/
	yTPQR401CyDa6iO+eAD/Z8dQzQjkcfxyoaYMxIxwHgsbEGDNFjiRy7A1w1jl7gf33xQN
	viUE40yJtnuLhEp2ckk7uSMUzumR4eGYAn+JlnSf3LWuw6bIY+ZL6m//m22RBezKyCxu
	FA6K6AvTH+ATlZwV8BkxT8CxXIwfUUAmIGbG9FxkcWRQGNirvUDDVcMxQ9ucxTvf7+ps
	6GHw==
MIME-Version: 1.0
X-Received: by 10.236.119.99 with SMTP id m63mr8031154yhh.65.1400858753840;
	Fri, 23 May 2014 08:25:53 -0700 (PDT)
Received: by 10.170.110.8 with HTTP; Fri, 23 May 2014 08:25:53 -0700 (PDT)
In-Reply-To: <1521334.KE7mPuYoZb@peggleto-mobl5.ger.corp.intel.com>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
	<1584812.c16lcQ9U8e@peggleto-mobl5.ger.corp.intel.com>
	<CAN-NoH0xVXhEAmSx6b8XMqchp4Q_qGe9onC3Gp6wT4HDJNW3xg@mail.gmail.com>
	<1521334.KE7mPuYoZb@peggleto-mobl5.ger.corp.intel.com>
Date: Fri, 23 May 2014 08:25:53 -0700
Message-ID: <CAN-NoH0dJN5KHecVz3wjLmeshHgOX99GGWXp1mAgik=auJi=Qg@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 23 May 2014 15:26:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 23, 2014 at 12:11 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 22 May 2014 15:46:01 Richard Cagley wrote:
>> > One other thing to note - if there are overrides for the previous machine
>> > (e.g. in bbappends you may see _zedboard-zynq7) you should change
>> > these to _me so that they still apply.
>>
>> What is the threshold for making a new machine? That is, if I just
>> have a .bbappend file I want, that should just involve creating a new
>> layer and putting the bbappend file in the correct location. I
>> shouldn't have to change anything else correct?
>>
>> For instance, if I just want to change the kernel configuration with a
>> frag file I can put linux-xlnx_3.8.bbappedn in
>> meta-me/recipes-kernel/linux and that's all I need?
>
> Yes, that should be all that is required - no need for your own machine
> configuration in this case.
>
>> I guess I'm just confused at what point I actually need a new machine.
>
> If you want to change the global configuration for the machine substantially
> from that in the original BSP, you may need to create your own machine
> configuration; but for the exact same hardware as the original BSP supports I
> would have thought that in most cases it would not be necessary.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

Thanks Paul. I think I got it....or I'm starting to get it.

