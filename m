Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3D22177B41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 18:56:19 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id h125so46582858lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 11:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=DTgAtqMmr2O9nqtbx8P6KTwkz3yuy4ROse4SC3EPxcw=;
	b=Y6PP/WfA+EYy8H9T83iCdk6APdpKab5nkEe4Yy9bHKXOh6V2va4Xg5kGTgR9QH9EfG
	C9NPKWr4ONi/sHKXepstLvViqXVC4Q68/w82hw8nFAnawmBdS9ALPXBIL4dNQ69mXZYu
	I+BO+ipPCbzWdASkPjgQY+si5L7g1JIxSdVmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DTgAtqMmr2O9nqtbx8P6KTwkz3yuy4ROse4SC3EPxcw=;
	b=SSh6TYB3FwHYle80+3DpzT9yAqccNiP1P8cf5P2WTY8Vu2THBE5Q8gTLeuHEEkTPNC
	vevB9kgFo/RXqTU8PkV0qaIafcjN4uM3TLkBpIoagPePUJs0G+fKY32bCXSuTmsSONuN
	JeVVMX9PnLsOthAJ9TjXHNydz0Tg9RRMRMEG8ik+1swdCTdeX+4Oi/oh+ZfBp3pnwh5g
	aE7Ky3FoWqxU2DBpxQkFSrxCYcXp3mvB5NKkmej9rauMiK1DIJCevk0U5jNFtIp22Hbj
	5+/aNKuyMtKnm/+pZrhYtl3WamA5kDuF4xgMwtl7unLHcHvKXxBAROYyFRe/SeZU3JmZ
	TJYw==
X-Gm-Message-State: AFeK/H12sGQjTyrMtRwdTCKVOcAMFtxmnmXqrOgUZRYnlXqWZcDlTLbec/Df4r9AZE3cqMtv
X-Received: by 10.46.22.92 with SMTP id 28mr11980627ljw.55.1491591380784;
	Fri, 07 Apr 2017 11:56:20 -0700 (PDT)
Received: from [192.168.11.27] (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	n82sm1121569lje.12.2017.04.07.11.56.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 11:56:19 -0700 (PDT)
To: Fathi Boudra <fathi.boudra@linaro.org>, Trevor Woerner <twoerner@gmail.com>
References: <20170403183815.2997-1-twoerner@gmail.com>
	<CA+chaQeaHRpRBQ_AEe7GDM2fxHZc81jkYcJbfBsf72XGEu_aeA@mail.gmail.com>
	<CAHUNapR=5Tj+jAF5_hMgZ1MMSaEiGbNRrj36YL12zcETqhzBYA@mail.gmail.com>
	<CAGNsrLCHkTi903CpRKq5CaWYwMWm1RmkZ9F2v9BMmLLb2UUypg@mail.gmail.com>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <58E7E0D3.2070004@linaro.org>
Date: Fri, 7 Apr 2017 21:56:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAGNsrLCHkTi903CpRKq5CaWYwMWm1RmkZ9F2v9BMmLLb2UUypg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: 52.0.2743.76 -> 54.0.2810.2
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
X-List-Received-Date: Fri, 07 Apr 2017 18:56:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/07/2017 11:08 AM, Fathi Boudra wrote:
> Hi Trevor,
>
> On 6 April 2017 at 23:37, Trevor Woerner <twoerner@gmail.com> wrote:
>> On Thu, Apr 6, 2017 at 3:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> In my world build it (surprisingly) didn't fail, good job Trevor!
>>
>> Sadly, it does fail with one specific PACKAGECONFIG: ignore-lost-context
>>
>> I have a fix which I've build-tested both for x11 and wayland with a
>> bunch of different targets, which is just waiting for run-testing:
>> https://github.com/twoerner/meta-browser/tree/contrib/twoerner/chromium_54_pkgconfig_fix
>>
>>> Are you willing to check 2 QA issues which might be there in older version
>>> as well?
>>>
>>> chromium-54.0.2810.2: ELF binary
>>> '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
>>> has relocations in .text [textrel]
>>> chromium-wayland-53.0.2785.143: ELF binary
>>> '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
>>> has relocations in .text [textrel]
>>
>> Yes, I'll have a look.
>>
>> Currently I'm trying to figure out how to move past this version.
>> After 53.0.2810.2 the current method OE uses to build chromium starts
>> to fail because (as is my understanding) it was around this point that
>> the chromium build switched from gyp+ninja (what we're using in OE) to
>> gn+ninja (ninja is like "make" and gyp/gn are like the autotools)
>> Therefore the gyp support starts to break down due to lack of upstream
>> maintainership. I'm starting to be able to do successful chromium
>> builds from tarballs on the cmdline (outside of OE) up to
>> 57.0.2987.133 but I need to figure out how to translate that into a
>> recipe.
>
> I think Zoltan looked into it at some point but I can't remember what
> was the outcome...
>
>> Oh, and it'd be nice to have an aarch64 build too.
>
> Andrey in CC is looking at submitting the changes needed to get Aarch64 added.

To my surprise just enabling aarch64 in the current chromium recipes was enough
to get the browser running (tried playing some videos from youtube and the horse
example from threejs.org [1]).
After checking the chromium sources, it looks like at least some of the aarch64
fixes mentioned in [2] are present in the 53 and 54 versions used in meta-browser.

I'll post my aarch64 patch to the list shortly.

Thanks,
Andrey

[1] http://threejs.org/examples/#webgl_morphtargets_horse
[2] https://bugs.chromium.org/p/chromium/issues/detail?id=613452


