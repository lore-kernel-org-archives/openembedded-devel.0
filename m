Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A693E6057A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 10:26:19 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id k186so32862693wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=E8FHWeRBYtg05PbYVL9gC8BZQwkSbkv71V18aWh5XBA=;
	b=ogFpq7nUAsLnVmKREYH8sQrkbWjj9q4YCayc3WK1C4VyFxgkcURUcUVfbxq5ZIgUmA
	xpeU5pzvZbfA0awMnp5APYRXLM3BcMCjQ1DBUM60mQIigRgCw29pUwHEYpS2b8btwVPp
	BIoN3BMLa4c+pUeXQSOHtRHikvaH9lTsFXaxP61t2ye1NOMfi2D5SKchSpNWAii/aBia
	uvPGb6ATwGO1WKb2obOkud0D5ud4k3LzTCkiTO5hY8yX0bLADQZV8oYDqSoMR9hxzr4S
	CQkcjP3gG9eAX+JftvJoTeeX0DXvZ7RxqnZ/aSbOTw1z7kjtBoSpOySt+Y8/Zc4XJB4R
	7zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=E8FHWeRBYtg05PbYVL9gC8BZQwkSbkv71V18aWh5XBA=;
	b=CZSTc2L1zvVAQ4NzocrWRtlUFXoexJ6wW/XNvorrjdvDJLkiaVjFtGjyG1dBV/UsSq
	1oko9Ur14AjSaor89DXc4qFvqF+oJJW5VB+Irvm24tEutzv+mNHV2LBD+jIayEiYKb6B
	gDeQmyuOrF6+FvxFm8QRDDVjvZsW9FCUIRnj5H9Uj0HSIO8+y61YwvFa6Tha1i33LKUs
	5bGXZStkYoXQMqbgUvrYofgKJcNSDqBoOWwcFMOWpKn6YvFpkNuTezynMLfhA1REX0eY
	/BvPtERbow4wfhAHA9sQ6Cg0o4oi6Ws3OUFDGmd2NJz4XGX4Fe7g51+4DwKhTALUrE5z
	VXEA==
X-Gm-Message-State: AE9vXwPDAdOBd6WjiuezRkJ1eYC4OwZt3B93wWhex+fSRSHvQN3LRhvJIuw7BJ4wuYxfnY7elY+q0Iws17nH2A==
X-Received: by 10.194.133.104 with SMTP id pb8mr12536281wjb.139.1474021579349; 
	Fri, 16 Sep 2016 03:26:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.143 with HTTP; Fri, 16 Sep 2016 03:25:58 -0700 (PDT)
In-Reply-To: <CAJTo0LYM0OX4A3512Q1Y7TnmdWuj7ROxGYB+Drr2Dh5T4-urGA@mail.gmail.com>
References: <CAPybu_2CDc4eD=vRuEL7TOL2eb0mN=ygDrx0jX8WxmLqqAYnnw@mail.gmail.com>
	<CAJTo0LY7k+XDcwumMzfZLzOj_iOeKG_svL=QK_drDv_hHdbXhA@mail.gmail.com>
	<CAPybu_2uCKcpvtba7Yrrs3trmSQ13w6Q9o+VsEXXFHJJO-EyUQ@mail.gmail.com>
	<CAJTo0LYM0OX4A3512Q1Y7TnmdWuj7ROxGYB+Drr2Dh5T4-urGA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 16 Sep 2016 12:25:58 +0200
Message-ID: <CAPybu_2AtV3MX60jVqOiLVrVtHYgN9UvQ+wwmW0azUiUj2gywA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: update_font_cache intercept: qemu: uncaught target signal 4 (Illegal instruction)
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
X-List-Received-Date: Fri, 16 Sep 2016 10:26:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi Ross

That was the issue! thanks

For the record, this fixes the problem for bobcat architecture (at least for me)

QEMU_EXTRAOPTIONS_bobcat-64 = "-cpu Opteron_G3,check=false"


Thanks!

On Thu, Sep 15, 2016 at 6:27 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 September 2016 at 09:34, Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com> wrote:
>
>> MACHINE is qt5022, which is:
>>
>> x86_64 + -march=btver1 -mtune=btver1
>>
>
> So the compiler is probably using instructions that qemu doesn't recognise.
>
> If qemu can pretend to be that machine then you can pass the relevant
> options to qemu in your BSP, see the QEMU_EXTRAOPTIONS variable assignments
> in e.g. tune-corei7.inc.  If qemu can't execute target code then you can
> either ignore the messages or extend qemu.bbclass so that it is possible to
> say "qemu doesn't work" in a BSP.
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

