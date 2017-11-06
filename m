Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id C3A746076F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Nov 2017 16:37:40 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id i196so338890ywc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Nov 2017 08:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fLEFF2ONs2vALmLxt7+XkyEBB2eK+MFgc9inDuFUe9Y=;
	b=ZUoo4CP4Q11sjiTh7IJK9aP0fjoTAVMOtdDI/6d8ABMWuuFExgW41vpoEHAUdirQFu
	Mm4XiPLrp8K02s7ZB/BY5hKUvKQUJoLrCleWbofhdhVXmv2guQYDq14M/o6VZS27paJv
	gnjGh2kLo0FJxAcJGpIOYkm3qomYLvAOwx42XoimZ5rOaGJO7aCH/v6yjIXzNiEJGM3M
	6oOhjJjZnnypfAqZG9bIeOLaHx8PTiQsa9GzuCsaYTxJWId7e/XlKjbdtZs+zHUHoomE
	d8lrZIpC98cDIywevtqDZyW+hBCVVTZ2oHWIpj03Ybw6O3fLaZZk826Bo3Hanyct9AAe
	bWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fLEFF2ONs2vALmLxt7+XkyEBB2eK+MFgc9inDuFUe9Y=;
	b=skKHs2Pbd7YRJYcqu49y0un9PHnoE6xSJ2jlKor0Qf4uuYQ73We3xY4eJBjBU6zEBX
	g6JsTqCpjTI6YdX2P4coEQ/k8xAOrBCckLNilgIlZFomL62e1grVmb8nTuhSdkJfFQiC
	+mrtBLoEjVLa71B9AKC7JjcOHywpzN2ZYz2a72JJqys+dxLc+lsG5yonnHo3Mpr4rQTH
	GEGiWAyAcVqKZ8q6cYTDW2wPjtTfZLrdF6AHS4icLmzOEwKrHOpuUY51dPAwkOH+64PQ
	DxAahjoZYd9JgB7P6CzJSQm1wzRv7C4WaPLMEQaYhNCK4kNLzTn4fYZrOqdUfUJdIiqE
	9RxA==
X-Gm-Message-State: AMCzsaViQoG/XM6yHuudbAAhPzMPEpJGLZ++FlLo+j26eNcV7txhwrqf
	bqWSbUInL7/5lKeXzJr6hHtlRT5RqdwoHphbjpc=
X-Google-Smtp-Source: ABhQp+SzvmiAm2XfZq9rWLK1K7EQetq64P+Qx6ijHn418rsHH77wfvl6Kfw53CN0yh0mRGM85dtsPFBOAvvAylBDkJ0=
X-Received: by 10.129.117.9 with SMTP id q9mr10454261ywc.79.1509986261606;
	Mon, 06 Nov 2017 08:37:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.162.136 with HTTP; Mon, 6 Nov 2017 08:37:40 -0800 (PST)
In-Reply-To: <CA+chaQeX1+VVVLmoqrwESKGZ8Go=d=sMDbDBy5CZoCU584dAHQ@mail.gmail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
	<20171102103129.3703-2-schnitzeltony@googlemail.com>
	<CAMKF1spbF2bJDQK_htfwpEKRgh1MzZEpkxpyde1x1dfoaqNYhw@mail.gmail.com>
	<CALbNGRRrpSkAy8vkVQ33P-ONLdWqXnT_Oa1tViORfBx2R_Wjbw@mail.gmail.com>
	<CALbNGRSy0-Y=oLGbR+ON0jSitnEzkyMJevYtMhf--1+i-p7JhA@mail.gmail.com>
	<CALbNGRTFUBUKNtZueSi_cDWOMiqMPxf482NR3kjyvduTA33oMg@mail.gmail.com>
	<CA+chaQeX1+VVVLmoqrwESKGZ8Go=d=sMDbDBy5CZoCU584dAHQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 6 Nov 2017 17:37:40 +0100
Message-ID: <CALbNGRRGG5j+kgwDTaOB57U0X1m+XBDWDQq--ou1qytRUNvj+w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/10] tumbler: make thumbnails work again
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
X-List-Received-Date: Mon, 06 Nov 2017 16:37:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 6, 2017 at 5:23 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi Andreas,
>
> I'm ignoring all of them now, Armin is now taking care of master branch as
> well.
>
> BTW: your e-mails often end in my gmail spam with:
> *Why is this message in Spam?* It has a from address in googlemail.com
> but has failed googlemail.com's required tests for authentication.
>
> I don't know if there is practical difference between @gmail.com and @
> googlemail.com for you, but google doesn't seem to like the later.
>
> Regards,
>
> OK - I see...

Regarding gmail/googlemail: I tried to swap many years ago but that did not
work - will check again later - thank you for letting me know.

Andreas

