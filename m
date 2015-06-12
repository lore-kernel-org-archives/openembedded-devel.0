Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7C17B60670
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 10:51:31 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so21977479ieb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 03:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KpCX5qTackNhR2tUSa8MokfU0dsRDe2YQ+NTwrKtcRM=;
	b=BSY+3AVKjFPhqaYuYtvQc1tE2Qsc8u4grE/C9YQL3mP0H3kjzKSXmrrugTTxQtvNBy
	Gxc5I8jLxRoBio4y+oUK1wgxn194UYzLL1KD4Z9dnhP/s4OUsYF711oGp+g9dZWBNVJb
	aJ++tR9jXjOLO9wVa4aDlSRk5wyoBvH6cYg5H3x3fKI3AeY96Yfpf2noTu36qBun+y9E
	ieEQ99sJEXDjFxFrpyi0aquM4fHY8x/bFFGNm59yUKN8pfXpyfo99RFjU8xAifiA5TVH
	JhR+nlmKcwoNCtQ8pacL0pEPnF/WtWxd6gpZq6IDE6LjeZJt0yZv4jF846F7wbh4j3OM
	mUiw==
X-Gm-Message-State: ALoCoQkrhxCUSlxQXKjJ84TP24UIcJ7JsCPuDjZNPHcMsgZ/SZsG6GI9UY4IYRNe88Y2fA1TIkNk
X-Received: by 10.42.144.131 with SMTP id b3mr15668161icv.35.1434106293013;
	Fri, 12 Jun 2015 03:51:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.109.129 with HTTP; Fri, 12 Jun 2015 03:51:12 -0700 (PDT)
In-Reply-To: <557AB88E.8020300@mail.bg>
References: <5579F20D.5040900@mail.bg> <557A817E.7070709@mail.bg>
	<557AB88E.8020300@mail.bg>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Fri, 12 Jun 2015 12:51:12 +0200
Message-ID: <CAAzKXniLmUw0LFqPt8gDbYTwsx2nq37OpM1QS1jxDe1te579uQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: meta-freescale@yoctoproject.org
Subject: Re: [meta-freescale] Chromium crashes on HTML5 video tag
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
X-List-Received-Date: Fri, 12 Jun 2015 10:51:34 -0000
Content-Type: text/plain; charset=UTF-8

Any crash logs?

On 12 June 2015 at 12:46, Nikolay Dimitrov <picmaster@mail.bg> wrote:

> Hi gang,
>
> On 06/12/2015 09:51 AM, Nikolay Dimitrov wrote:
>
>> Adding openembedded guys in the loop.
>>
>>
>> On 06/11/2015 11:39 PM, Nikolay Dimitrov wrote:
>>
>>> Hi gang,
>>>
>>> Chromium tabs are crashing when they see an HTML5 <video> tag, like
>>> this one:
>>>
>>> <video width="320" height="240" controls>
>>>    <source src="movie.mp4" type="video/mp4">
>>> </video>
>>>
>>> (Code is from http://www.w3schools.com/html/html5_video.asp)
>>>
>>> I'm pretty sure that this worked fine some weeks ago, so it's a recent
>>> regression on Fido, 100% reproducible on imx6q sabresd. At this moment
>>> I still can't point to a specific commit in meta-fsl-arm or
>>> meta-browser.
>>>
>>
> Commit 30b8d6b3d0d6501c56ef6967a2fa73a3d4bf5fe9 is the last known good
> commit. After it the component either doesn't compile, libs are missing
> or video tag isn't working.
>
> Looks like it's a "revert time" for the customer builds...
>
>
> Regards,
> Nikolay
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

