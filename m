Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id C635C78AD0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 08:14:24 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id r16-v6so9142416oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2018 01:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QRY+Tfn5h3CWm0w35N9gRNa1+imcnuYNZCFhQFnTRQs=;
	b=OEXMnoi3ncPJeNwyd+KdvbGU/ScriwT/6tIrQQx1a/G73xmsQcdzz70lM4lpH4j1Xl
	fAuuC4n2s3WuVESkr2Elf2Lqyvep0XUZiyrHSQs3L7OynQe/HIpLr5QlpOYNbIUVCJp/
	Qg+zrdLIlAdGFhUpfBItdhZW/WX7IsUeGEhMil3/AJZzbBxcIgbtLO1r+arBhVqKwItI
	6pyQRshQgAI+wzB9RvSXOSFgflYEcbt2elL0gmx/t9VBFO+yM72iphJAa0vAr9kG2E9s
	ohZnLLhMhjpLoE3b6pRJNy7FGA0b3kgez9D1wajSsuGb3w4VmV7FwvfnK+DYMewEcLgO
	tpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QRY+Tfn5h3CWm0w35N9gRNa1+imcnuYNZCFhQFnTRQs=;
	b=MhdXKLGKb2zjt3UCdJoBEP7sne1Ofur4j883djUoGuUGd53M+5QpJC+GrtWk3CTTia
	dLDRh+sZbXyAJpP1P3Do1dbS4HHSeAMZWMbLiLNrmTSsmlIN/iBt1UQESlOHH1r7WLl/
	iO+QTAUhJgv1uCkdeE/vZXn+hep7m0UTi2nodXAO01NnchCeA93L5RrvxIB4mdH8FCDy
	n2bMfTRGji1nhAhuZUFQXn/d9AZ2Wk6Ts+0SMz44jORpqY79zoU5B6iYG6vvUhgbZmq3
	RETpU/axOxK6o3qLHZAllFdVwfkKrS80RcRBcmJHyO9lcYFmiH7wSrOdPxFsIoDXC5sy
	abDQ==
X-Gm-Message-State: APt69E0Z1W3qkZukcju+IwTJGStoH93oJv1liWK3XBjseGmpaTmmbN/C
	T/05Wbml2bpiLrdanOSucuGvkAUKGzaJJVfLgHE=
X-Google-Smtp-Source: AAOMgpcqDJHHYmlXYRZ6WzfeN7DNLBra12Z9Adb9ZJdN4zMgrXZZejtKzXXf7RKF0FAAuVARBpplPTmSXHPvzpXqpRg=
X-Received: by 2002:aca:4fd1:: with SMTP id
	d200-v6mr1177181oib.224.1530692065821; 
	Wed, 04 Jul 2018 01:14:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:1115:0:0:0:0:0 with HTTP;
	Wed, 4 Jul 2018 01:14:24 -0700 (PDT)
In-Reply-To: <dfe56414-fbbe-458e-38ea-b4144a225cdf@windriver.com>
References: <20180621075845.5422-1-kai.kang@windriver.com>
	<20180621075845.5422-2-kai.kang@windriver.com>
	<38fa69a5-e34a-4eae-ae74-5fa5066e40d4@gmail.com>
	<b550f031-050f-eb5e-d872-b690cf91f064@windriver.com>
	<CAMKF1spryTnonVcRU+SW7K9oUvMPWY7UubT=-HnQNtucE02vLg@mail.gmail.com>
	<dfe56414-fbbe-458e-38ea-b4144a225cdf@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Jul 2018 10:14:24 +0200
Message-ID: <CALbNGRTCj9rznByfdvghLd2T4ptB2QEeiACXS6e2mDcTTmpejA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mozjs17: exclude mips64 from COMPATIBLE_HOST
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
X-List-Received-Date: Wed, 04 Jul 2018 08:14:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 4, 2018 at 9:50 AM, Kang Kai <Kai.Kang@windriver.com> wrote:
>>> WARNING WARNING WARNING: This is a prerelease on the road to polkit
>>> 1.0. Public API might change and certain parts of the code still needs
>>> some security review. Use at your own risk.
>>>
>>> So I suppose we should not upgrade to 0.114 and the follwing 0.115. And
>>> it seems
>>> version 1.0 will not be released soon, that why I send this
>>> COMPATIBALE_HOST patch.
>>>
>> I checked that few other distros, archlinux and fedora are already using
>> 0.114, I am still leaning towards the update if you are ok with it.
>> Chances are we forget
>> the masks when they would need to be unmasked.
>
>
> Fine. I'll update polkit and mozjs.

Thanks in advance - it was on my never ending TODO for a while

Andreas
>
> Regards,
> Kai

