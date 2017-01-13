Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6FE460765
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 07:33:47 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id v186so4430426lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 23:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=fZMHgpSlUBGEytv2bqj8vYR0H+C8qkzj4BZkftGSEqI=;
	b=swcw4o/f2XKdplxScJnf2coSSRblGVKe6t/02QNVSRXZmrNfqpNs5PJxu3N2syjCdB
	goLQEiTpx9pZU5l6tcMkUS0sSIbq+3Al6CbMaESwiIErb2166xDqZmW0e0bGeoidLyvZ
	A1qfRV3NlxgRSEDpLEiI+yRRj8TVeZ2ngSxKWmTXQp0Q6WTj0JAVpT+FatTyntWVLvLB
	n2I7dfKJYl+Sjm6GCgEm7OAWj93pKdciOPQMfcQeUhHNoz7AZA3tF10566Cce2xLJWuc
	yfKigpPWX4J0culCoqRYU0widJ4Ty+Xd7Vvs1cRJqI1Ct5/GtxNocIgTXSDyuo0b8E5o
	7DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=fZMHgpSlUBGEytv2bqj8vYR0H+C8qkzj4BZkftGSEqI=;
	b=r8kG+F2VI9h90xeMZJtmYh59e9c3u3oL+VUk5MRrknnJqx5FbHSHvr2pERaKYSPDwQ
	2lHKkavb/qxY+pDWO7j/87B1RRbc4URKtCqmELRJki3ssyoObrKA+yTU4QTMCvP+8Y0s
	cCCQIZSiwd4X6w2/j81oN5GqS3czUQ1WNWlB4NMn3OLtvDOgKm2xnM3g/ZRx9uu8S3YE
	Vg7fchube/xstZmPJjieLnggf3FBKxBpIuv2FelA4jTRp4GamVlc3rDNQcLPvjDEmWHh
	9w/9ARaI0SpseOa9B46XxqzElfcn4x1aEe71moN7v+xRXYBry6JqhKbppvvekLJ/Ss1D
	YxqQ==
X-Gm-Message-State: AIkVDXKtamddmIUE/YcQq1QKCFsrLCAUE42mnjsllZhktlH71C1PYEWJy462GQbSBTd7NDkNW9odrWgXRXVCxQ==
X-Received: by 10.46.74.26 with SMTP id x26mr6352476lja.51.1484292827485; Thu,
	12 Jan 2017 23:33:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.215.102 with HTTP; Thu, 12 Jan 2017 23:33:46 -0800 (PST)
In-Reply-To: <CA+chaQfEh=VfEvF_1HAZJinRC+ddsvYHC+X=jf46J2_STd4VKg@mail.gmail.com>
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
	<2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
	<20161220150507.GH3275@jama>
	<bc4be429-a64c-ba6d-163b-79c791fa7dfe@gmail.com>
	<20170102184751.GC3954@jama>
	<CABXoSoUXF7y7w76bH7pWZa6oPwXzOtcSKeyRhoy-dHWQqb+ikQ@mail.gmail.com>
	<d4475f50-e24b-6326-6f4c-c7fd21155e6d@gmail.com>
	<CA+chaQfEh=VfEvF_1HAZJinRC+ddsvYHC+X=jf46J2_STd4VKg@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 13 Jan 2017 09:33:46 +0200
Message-ID: <CABXoSoWThbkW2-kE=x1JHZD3g5zhB2thPMWNjv8KX0X27_yRnA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Fri, 13 Jan 2017 07:33:49 -0000
Content-Type: text/plain; charset=UTF-8

The webengine bug has been reported, but it's still unresolved:
https://bugreports.qt.io/browse/QTBUG-57705

On Thu, Jan 12, 2017 at 9:08 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> v5 is fine, will you also include the fix for qtwebengine on qemux86?
>
> Thanks
>
> On Thu, Jan 12, 2017 at 12:20 PM, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>
>> The release date for Qt 5.8.0 is fast approaching (current target 17th of
>> January).
>> Would you prefer a v5 patch of this one or a new patch on top of v4?
>>
>> -samuli
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

