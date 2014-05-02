Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 052B3606D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:45:06 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id u14so360744lbd.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6Yuge8n+ILRxx1I+11UA2mJR7hf4I4a77u2I83rz6So=;
	b=cabfLj/562x0FpLS+GTxhJcEyu+KnAbHbJAzaRiPDrwB4rlv0By0PIS777PzegIauS
	YSBjSD8kvSH4Nin7J+AiNDpYid6NNZSTS/mh5DTrD73NhO+vz8+K96Ge+3UaEnbT/NBp
	lrBwj1YqAWn46o1g6tL6BsWrZKf9a+gROmD+Ljw37kxvGWjwT7FBQoWSlcowyXhXHIKH
	PjLbw4rHgx52NxQBycL34n9WY+hAbMZZxo5+lVOaGB3NSXxz07a9qBJFOd7WmC2ND446
	I2lYw+/+v89sxMoFdcG+xPRKjebNiD0hMu7bi3GRABkhNN3mQseAVV3tCeFl92YzDs4j
	vuWQ==
MIME-Version: 1.0
X-Received: by 10.112.146.234 with SMTP id tf10mr10736515lbb.1.1399020307177; 
	Fri, 02 May 2014 01:45:07 -0700 (PDT)
Received: by 10.112.35.234 with HTTP; Fri, 2 May 2014 01:45:07 -0700 (PDT)
In-Reply-To: <1399019890.12731.28.camel@ted>
References: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
	<1399018873.12731.21.camel@ted>
	<CAAQYJAtY33YvGL7RVYpBiKtOkt3OxV7h=XV0EyY8yovZwDFdtg@mail.gmail.com>
	<1399019890.12731.28.camel@ted>
Date: Fri, 2 May 2014 10:45:07 +0200
Message-ID: <CAAQYJAuE69=Bg-F_=05FasU3EX0RD3n2bpDvU6vhsBYEBKh03w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klcc_cross: move in target sysroot as crosscript
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
X-List-Received-Date: Fri, 02 May 2014 08:45:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 2, 2014 at 10:38 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-05-02 at 10:34 +0200, Andrea Adami wrote:
>> I probably misunderstand that part.
>>
>> I could not see any difference in the produced klcc.cross scripts with
>> or without the mangling.
>> Tested runtime on 3 machines.
>> What I did not yet try is a rebuild from sstate but I expect it to be rebuilt.
>
> The easy way to reproduce a problem is to build for MACHINE=A and then
> build for MACHINE=B where the two machines have the same architecture.
> You will find that whilst it will switch the commented line at the top
> to refer to the new machine, the encoded lines do not get changed.
>

I did exactly build for c7x0 and poodle, two armv5te, and armv4 collie.
The 2nd line *and* the furter references to prefix et.al. were
apparently correct.
I'll retest.

> You would also find that if you run a build in dirA, then a build in
> dirB using the sstate cache from dirA, the paths would reference dirA,
> not dirB. After this change they will reference dirB.
>

Ah, I was fully unaware of that ! I'm not reusing the sstate cache.

> Cheers,
>
> Richard
>
Thanks

Andrea

