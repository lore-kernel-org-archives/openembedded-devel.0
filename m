Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1F66777A8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 23:34:11 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id u1so116841494wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 16:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qEEpwBIwQiwM91+mxjHLvxRYrRv21hPQXTo7MaX4jJg=;
	b=I0jS1Zccu1MxYmC47T5T+kCHCRkMOq17jH2BWBU+gzgcF5o64uUEpriQFGxcDIvxM9
	fTaxy88vA9n8Dp84hNoBzAvQBGvx1/ynOIHLG9Wd/+7oz/ByLikJjX3RBKwScZdz/+M4
	BmUYctsJ8DjSpWmwx5FOEDSJigQ7/KKAL7iwAUDduda/bYxxCAEKX03vecWaMskmwKdf
	dgnV+8east5wKAZQU3GoGqygwdFvz/bHsM0Np7VyUnhYcdybP5mOQoasqTcqKa6US+Lf
	eJ3ju8w29dFWbzwx4fpH7UuYUWKHYA7bt2h1twuusFU4zhux+yw+nVkoQ0bZOhF5OoJ0
	Ehww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qEEpwBIwQiwM91+mxjHLvxRYrRv21hPQXTo7MaX4jJg=;
	b=kzPyIXLB7fj+zmd4GQjIg0N/5FGkProhPO3ex+XcElh+y6UTN9SafNMZdVUnLBT9X4
	YyyWQI9fQ7Dbi3knK1+zVfiiZgg7Qq//QRLXZcn4W0L6WoyJpydrxXl9tzcQH8Qwnu/V
	vGQM7GVvCro2bI9mP+NG5JChKBtKeEnC4XBoTXx2UyhsBLG7sQufLBhm8OVbaYURAxEF
	gZeH9LAAvggXUMefcs0sWiqKZdw0px3muzgYZ10HAyuLJ91tW/LuEgASOLVelB1Rr5An
	kSE72G0Ww40WcNgN7hVKD0ea50MNk7I3bvc90s8VHNLid+sM4GOFWElGZQqrH0JMoYhr
	1psA==
X-Gm-Message-State: AFeK/H24MI+bnZYGPeQwQENUY4LucxrUR/DK9p1qOwHYu/bh6jHfC+ORyay/rMByvu2ptbfVZDN3zZBbg51FGA==
X-Received: by 10.223.152.237 with SMTP id w100mr18565404wrb.72.1490744052530; 
	Tue, 28 Mar 2017 16:34:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Tue, 28 Mar 2017 16:34:12 -0700 (PDT)
In-Reply-To: <CAMKF1sr-PJeiDoL1_m2X9=k6KNFx16XuZ7UdYC4R3xxjpEt6oA@mail.gmail.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
	<1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
	<68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
	<CAJ86T=Uj+xCZT29k4ti9K4_Eaa3L9=CeCuqMbqqWRKiWbnJHZA@mail.gmail.com>
	<8c827e6f-f739-0913-f38c-fa2ffcea62e2@xevo.com>
	<CAJ86T=U2f7ZhM0hbd4x2-qwPwHB=crJd4QtP2Oh1WcWgdTagkw@mail.gmail.com>
	<2eef3d1c-7180-c75f-e3a6-74fb485d8f7e@xevo.com>
	<CAMKF1sr-PJeiDoL1_m2X9=k6KNFx16XuZ7UdYC4R3xxjpEt6oA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Mar 2017 16:34:12 -0700
Message-ID: <CAJ86T=V3FCCm1qoARNLb1SmDoQag3a-dkNgFWANeuL2Jd+=rDg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Kelly <martin@xevo.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest: add -fPIC
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
X-List-Received-Date: Tue, 28 Mar 2017 23:34:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 4:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Mar 28, 2017 at 3:14 PM Martin Kelly <mkelly@xevo.com> wrote:
>>
>> On 03/28/2017 02:32 PM, Andre McCurdy wrote:
>> >
>> > Right. So the question is if security flags are enabled (and therefore
>> > -fpie is passed into the gtest build via CFLAGS) then why do you see
>> > an issue?
>> >
>>
>> Looking at this more, I see that I hit the issue in dlt-daemon because
>> it was trying to compile a shared version of gtest, resulting in this
>> error:
>>
>> command:
>> [snip]-g++  -fPIC [snip] -shared -o libgtest.so [snip]
>>
>> out:
>> [snip]/ld: CMakeFiles/gtest.dir/src/gtest-all.cc.o: relocation
>> R_X86_64_PC32 against symbol
>> `_ZTVN7testing8internal17TestEventRepeaterE' can not be used when making
>> a shared object; recompile with -fPIC
>>
>> However, looking at the gtest version in meta-oe, I see only static
>> libraries, as you say. Thus unless we start building shared versions of
>> gtest, it looks like this patch is applicable to dlt-daemon but not
>> gtest, so we can drop it. Thanks!
>
>
> Is there any reason not to build shared version though ?

The cmake build defaults to static libs but support for shared libs
seems to be there too. Maybe just try it and see...

>>
>>
>

