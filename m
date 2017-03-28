Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29A6F77BB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 21:32:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so1901825wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h/4ZAg7pWdC42z60cGQd+3zTdm/QzTwbih9/SEMCzR4=;
	b=qbO1j1obTJLo8ZLpcjbrT2uZadXq24CtPcSrNx28T6xS/xjSaSNOGyzd19zLS+3nQJ
	QoDJIPPqDNJ6jKc/gMqj3F8umKsU0eQckg0GtYZI4GF/xdcUPKnz23F6N3AH+nrZOM8+
	72dGHI7ppztqdO31OtV0hyMQXc/d9ha9TXAw+/VUIjkpP1ebu4fAi45EMqqFStGN/x0F
	KjlBuw1GJewOTGdjOXLztBVnZbhZ6qOffTepkZ5bRo4d05AeHhCx/C10gcTcAQW+Kl5h
	ykmwcFGjbjmqxt9nCKtkgtf7X2AQdjI6BkZsnsqqex8yjbr+ocecezoA+wHhi4cA0BEX
	7GyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h/4ZAg7pWdC42z60cGQd+3zTdm/QzTwbih9/SEMCzR4=;
	b=Xb9G7n9lJewotr0Rt/DavbuEi0YfF8aqvkWxMclm4dLY9Z2MaYGoZbxaosliIL9Rts
	d61IuQboP1w1R155LMQ6Jk0YWaGijxiBLxaXSRPXgZQO7JGvYizYoDqMWpFMnWqUa9dp
	1RlbzqvjTibBV3zDE7TADx7tEuNFb0Y5svcXzTbSKTi97krlmA74jea6I67F+DJzk8za
	4n/Oma9LQYR3Ujam4LRKB0SkUZgs533ybawrbzVkmL6ftKB3l8Yy3COM+rmGDw3KDqu7
	lOQFRSwrjPlbPLQk1hHISAIqGkuIq4UxILGHvkB/dpyHQwu3RszTTLeGxLpo0cmENz6i
	0xGw==
X-Gm-Message-State: AFeK/H2CDzHMXoB9IapT381X93awnsUwXzK/RdwqWvrrGm5PmKJELM7djP3JRoMTeVfwS9oKIg/mlnvVTvpYQg==
X-Received: by 10.28.215.18 with SMTP id o18mr16522931wmg.98.1490736766888;
	Tue, 28 Mar 2017 14:32:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Tue, 28 Mar 2017 14:32:46 -0700 (PDT)
In-Reply-To: <8c827e6f-f739-0913-f38c-fa2ffcea62e2@xevo.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
	<1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
	<68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
	<CAJ86T=Uj+xCZT29k4ti9K4_Eaa3L9=CeCuqMbqqWRKiWbnJHZA@mail.gmail.com>
	<8c827e6f-f739-0913-f38c-fa2ffcea62e2@xevo.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Mar 2017 14:32:46 -0700
Message-ID: <CAJ86T=U2f7ZhM0hbd4x2-qwPwHB=crJd4QtP2Oh1WcWgdTagkw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Martin Kelly <martin@xevo.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 21:32:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 2:17 PM, Martin Kelly <mkelly@xevo.com> wrote:
> On 03/28/2017 02:05 PM, Andre McCurdy wrote:
>> On Tue, Mar 28, 2017 at 1:55 PM, Martin Kelly <mkelly@xevo.com> wrote:
>>> On 03/28/2017 01:47 PM, Khem Raj wrote:
>>>> On 3/28/17 1:37 PM, Andre McCurdy wrote:
>>>>> On Tue, Mar 28, 2017 at 12:33 PM, Martin Kelly <martin@xevo.com> wrote:
>>>>>> From: Martin Kelly <mkelly@xevo.com>
>>>>>>
>>>>>> I tried turning on the Yocto security flags and hit a compilation
>>>>>> error due to gtest not compiling. Adding -fPIC fixes the issue.
>>>>>
>>>>> Since gtest only creates static libraries, compiling everything with
>>>>> -fPIC might not be the correct solution.
>>>>
>>>> it still is going to be linked with a PIE binary then it should be PIC
>>
>> Wouldn't compiling all gtest objects with -fpie work in that case too?
>
> I am no expert in this, but from the gcc manpage, it looks like -fPIE will
> work only when linking with executables, while -fPIC will work in either
> case.

Right. So the question is if security flags are enabled (and therefore
-fpie is passed into the gtest build via CFLAGS) then why do you see
an issue?

> Thus I suppose it depends on whether we want to support linking gtest
> against a library.

If gtest needs to support linking against an .so then it would need
-fPIC, regardless of any security flags. That seems like a separate
question.

