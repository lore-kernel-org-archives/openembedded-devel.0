Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB9C960C68
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:40:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d8so28063631qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IrbCkFVpxl7PzFdQv76x4UaywqRwiTDWbSrxzzItEUw=;
	b=dLMY2rkamKnUNC2C0DTVma1CwXiRcDaEPn1k57X6uw88fADgFrqcEENlT9Ql07Z1GE
	WT+M6byr6VDWhiV9ZgcqqbMp1cH/eg+Gp+7+WzDZStI6fMBZ7roMBzCGyPEO70fxIyfF
	NxYNj4k9BLOkFKHwLEzdMcaJawYgO/eoICb6TJGWQPyEGXrgIE45oCfwQMdikr6wg42w
	T7cQVba2BcD/Aj4+u0oOOaX46ZnzR8PaWfoUy2S+bEbZY+xdAloO9XcPK60BJm239SD3
	uMs6ZQTM8ndY4VUeHZVwsEu+jwkua7y5N/Cq2UnwUTn6qjvdH7eksR8U/esRZ2NAOK7k
	BmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IrbCkFVpxl7PzFdQv76x4UaywqRwiTDWbSrxzzItEUw=;
	b=SqxGovXc+7qIEh0IYbr2EQBuSnz/NaZ+lRnulKZGX81iasWPDCDUufhKv3s6urk8dk
	KI2gaUOO0MSFrktm9+d7FebByedOE/PHGxMZxdRRG8bAnxbndrb8+EKGyQwRK3IxoJ8M
	vf9RjAaPid/vO0tYdGRJ39t91x0DXlgScpG+e/cdu09F+EwQC2/IyghnCnnyT/hRSiiY
	VwKvBlA0/6gBDXg9LqWo72qLAgNg8yAfQHq8qlKyoPQIi1xI0DBUxzC3XTH9R3ASDwAX
	ym1R+cuA+bQ+3qnNLsfL2Eyk4uu9RB62FEXGTy5RTLybdDhDU4lzXqYxk6n28ALo/mEd
	hmtQ==
X-Gm-Message-State: ANhLgQ1u6AIKJ5aNMcda5fzK1aVrrKKTssu2mYVbdyO+GBaYk0A6qubD
	JHfXovykHOvqTgWgM3M6YsRi5MaJST95Qkne7Tpkk6zRK9k=
X-Google-Smtp-Source: ADFU+vt/Sw8R1I1I177meB1bYPOfJXC9OnvHaxVFMOvEp0eXDAy+K7XzL6bG9x0CQYiUtCYzIPYeOLlRAhzAyCMvHnw=
X-Received: by 2002:a37:a746:: with SMTP id q67mr1122300qke.215.1584384043161; 
	Mon, 16 Mar 2020 11:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200316000654.1093220-1-raj.khem@gmail.com>
	<20200316080239.GB14992@localhost>
In-Reply-To: <20200316080239.GB14992@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2020 11:40:16 -0700
Message-ID: <CAMKF1spSV3c41nr59xj2qKSXUtrP22bgYVvZKy6MaZGSOeaCPA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] flashrom: Fix build with clang
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
X-List-Received-Date: Mon, 16 Mar 2020 18:40:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 16, 2020 at 1:02 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sun, Mar 15, 2020 at 05:06:54PM -0700, Khem Raj wrote:
> >...
> > +clang complains like below
> > +
> > +libflashrom.c:191:43: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
> > +                        supported_boards[i].working = binfo[i].working;
> > +                                                    ~ ~~~~~~~~~^~~~~~~
> > +libflashrom.c:229:46: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
> > +                        supported_chipsets[i].status = chipset[i].status;
>
> Please patch out the -Werror instead.
>

I was basing my solution on an upstream commit
https://github.com/flashrom/flashrom/commit/71b706f5
and I have also proposed my patch upstream lets see what feedback
flashrom devs have
if you are interested you can follow the pull

https://github.com/flashrom/flashrom/pull/133

> >...
> > +However these enums are exactly same so they can be typecasted
>
> If they are the same, the correct fix would be to have only one enum.
>

its not that straight forward and I would leave that to flashrom experts.

> >...
> > +Upstream-Status: Pending
> >...
> > +-                    supported_boards[i].working = binfo[i].working;
> > ++                    supported_boards[i].working = (enum flashrom_test_state)binfo[i].working;
> >...
>
> Working around a compile warning by making the code worse is not
> an improvement.
>

If you think it make it worse, feel free to improve it.

> Even worse when this is an OE-only workaround.
>
> cu
> Adrian

