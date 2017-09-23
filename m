Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id B554A78414;
	Sat, 23 Sep 2017 00:26:52 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id q4so2604505qtq.8;
	Fri, 22 Sep 2017 17:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=aOyFPAlzEO3Mr5lv0q7Xygn4DWe7/z+OhXbOAbb2eRo=;
	b=bnUifZBEn6YndlZF9iA6+q74zf9ciYK/rDKZ/q4btx15ZEJkf1SQdcY8Vng9bdmevp
	/XGLMYSbwxuy8/iPsq5CyNb1zQEtZ94nj8h/FrhD7svG76nUA7cY1onvFI7umXMb6lf8
	LcY2/5muGWKX+DBssZx+fwGsOy3AwnkG/elOfrQ/fWqUej2x9cLkK2YWPmyEpOJVmhJO
	6AavT2OFZEeRoA88gpjsjf2aIzbbgJGt00DAZLe85vM85t5cpoFVmczOXxaI68SYVc1Z
	dgzYXnqMZZOShpP3hNScpT7oZMsElrst2c23Tvwz31lLEuskaFfJ51HKSkK/3dFUcKbm
	hrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=aOyFPAlzEO3Mr5lv0q7Xygn4DWe7/z+OhXbOAbb2eRo=;
	b=DGmP3G+0EpEe/+aPiujoolZBOyoFroH2zsacogfzHjuRN0qszb82Q4N/pK9go+alNs
	XEEl5ElTDvpiiJdDIdl/wLY5jSgnP4RUff7s9h0JP5UtePiIK/s7LPkweG2P9wxiDdHL
	mcHVh/klNfHZsOwvxkcssZw2EokgDwcAxWlkQs2dMWmow6Q6LnPvGvNxsx0j831YG12Z
	qv5NcQSKQJJBSHyYqo51j8Jv4uDyb9S61lF68GQrWQzpQv7TLrWu48ndM2gMtRkVcGvM
	OercvOVlM2Nr/yuAY8qaIE6wt9mRK2TsuF5bO77dpsxAza0rs4vV+XQnTxDWtdublYWe
	RoXw==
X-Gm-Message-State: AHPjjUg5om8WtbgdXmBejIkMrOi8jZAy26/BDXdzbYN2VVYRWIqfBBcT
	2/F5n0ERwFl4y9ZxaZzeTBMSxQ==
X-Google-Smtp-Source: AOwi7QBUa+sMl/DC+crau0m96h1zOK1IP35jLSu7BfLhHqun1PN/IZdERDID+zTffiJF9a7TkKiKSQ==
X-Received: by 10.200.27.235 with SMTP id m40mr1427800qtk.228.1506126413338;
	Fri, 22 Sep 2017 17:26:53 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6071:adc5:e606:b58b?
	([2601:202:4001:9ea0:6071:adc5:e606:b58b])
	by smtp.gmail.com with ESMTPSA id m18sm844965qtb.77.2017.09.22.17.26.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 17:26:52 -0700 (PDT)
To: Jeff Osier-Mixon <jefro@jefro.net>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
	<CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
	<CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
	<CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
	<8eedf692-5a12-f5a6-b9da-8184849a7a50@gmail.com>
	<CA+YB3rZd0P6eVimXD5jN0UZMB=dH2h2mdScmeB8PtjSWLZNMfg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <01e52917-81d7-74c0-c899-b242e80d363c@gmail.com>
Date: Fri, 22 Sep 2017 17:26:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+YB3rZd0P6eVimXD5jN0UZMB=dH2h2mdScmeB8PtjSWLZNMfg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE general meeting before OEDEM next month.
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
X-List-Received-Date: Sat, 23 Sep 2017 00:26:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 09/22/2017 01:50 PM, Jeff Osier-Mixon wrote:
> Up to 36 now. I am in touch with the venue. The table was originally
> set for 30 and could comfortably accommodate 34 in boardroom style.
> Given natural attrition of 10% I think we are okay in this regard,
> with latecomers seated around the edges. If we grow much larger I will
> either have to pay for a larger room or ask them to seat the room
> theater-style, where it can probably hold up to 50. I'll see how we do
> later in the cycle before deciding.

thanks Jefro

- armin
>
> On Wed, Sep 20, 2017 at 5:57 PM, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Jefro,
>
>     We have 33 folks listed. Do we have room?
>
>     regards,
>
>     Armin
>
>
>     On 09/20/2017 11:24 AM, Jeff Osier-Mixon wrote:
>     > Zoom might be easier, as people can dial in or connect online.
>     We'll make
>     > it work.
>     >
>     > On Tue, Sep 19, 2017 at 12:13 PM, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>     >
>     >> On Tue, Sep 19, 2017 at 9:54 AM, Trevor Woerner
>     <twoerner@gmail.com <mailto:twoerner@gmail.com>>
>     >> wrote:
>     >>> On Tue, Sep 19, 2017 at 11:34 AM, Sean Hudson
>     <sean_hudson@mentor.com <mailto:sean_hudson@mentor.com>>
>     >> wrote:
>     >>>>   Meeting information, including dial-in numbers, is on the
>     wiki. [2]
>     >>> In addition to the above, we could also make use of the
>     little-used
>     >>> #oe-meeting channel on freenode (?)
>     >> +1
>     >>
>     >> I can dial in. Or someone can setup a zoom meeting
>     >> --
>     >> _______________________________________________
>     >> Openembedded-devel mailing list
>     >> Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     >>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>     >>
>     >
>     >
>
>
>
>
> -- 
> Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation


