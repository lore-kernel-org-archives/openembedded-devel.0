Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFF971D7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 15:51:42 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id w64so117497942wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 May 2017 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gI5QsCTt3R1RH3WtBuoU1rj+efuk8mHnXdjDtC0oxHE=;
	b=ClExoGCiXext350bb2FPlVLEKBLv6aVGIDZO8Zr9Ge+IqQNTQE6smtBZN8h1EjxjXq
	UrXKyjlneeZoZDU7tOoxMBpkbUEimNi4MMT4A3Mo3wxa5ulQKeVD5k6GKu8YqWVyJZb3
	dRGSwUdsk5eY3jrrVelYor18+SXLw8mYxi17RGvXtTNw2PN3Dy4Yun7ofQQjP8L6Faks
	vAeuMH5Nj827PL5YoNO+ciF3kpLKVzaFFM2p0fClX6TdJP1qjzn9XR1HTtNlsmyl5ls4
	OpF2LTz8jOyrEQ7+cwbHC18JLtkYdzW3+witpQ70Fl3qiVvqMvr8GHFqnBoSVgZWuKAL
	mgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gI5QsCTt3R1RH3WtBuoU1rj+efuk8mHnXdjDtC0oxHE=;
	b=Fs5JhKncPYCU1SqQjKmA9PwIi9oeXwdEL+fnOmoK5wcgQxTlsAM/0Y0pFktTJztGrU
	CD1XS/IUAsRZAsFHB2p+TA93ClO3sycbOGbrnzGaslyDo3DMNflFSQMxvBEnm1A+Swld
	R/jODh2UmZHYVS/QEKrvRL05QBGcKgMsXCrWNEPw8GiaQzJtAu2KPvQN1a8e62DnB9zU
	CZkDGtecrCDn2x6uyu66eHdjPVaIOjlU5ST6xEdLlmOoZfGDVMWqfdSRdfjpB9LSI4JX
	NF2smzl8Peby/VXscWGuYY3ox7Kl2WMt2nk0sM/1ZuzL6x7qcfz8bt0EpQVE+uVHJg4h
	UnKA==
X-Gm-Message-State: AN3rC/4DnE06VW4Y00nMSehJn6RjOq/naA3OzEFdVzD/wKrw4v3Td0Rg
	/L2bSJwq8rhDOzfK31trM39Iuzr/LQ==
X-Received: by 10.80.173.203 with SMTP id b11mr24944434edd.110.1493740303841; 
	Tue, 02 May 2017 08:51:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 2 May 2017 08:51:43 -0700 (PDT)
In-Reply-To: <d7748196-b2a1-c5fd-c350-315ee1628c66@windriver.com>
References: <20170427013329.7827-1-Randy.MacLeod@windriver.com>
	<d7748196-b2a1-c5fd-c350-315ee1628c66@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 May 2017 17:51:43 +0200
Message-ID: <CA+chaQdT1Th0AcLMFWT2nuAGyTT1_2GtnMn1FtV4UzNjLagqkw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] opencv: disable broken Intel FP16 detection
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
X-List-Received-Date: Tue, 02 May 2017 15:51:44 -0000
Content-Type: text/plain; charset=UTF-8

--- are normal separator of commit message, so all git handling tools would
strip this as did patchwork as you can see:
https://patchwork.openembedded.org/patch/139481/

I'm fine either way (leave the complete message only on ML or you sending
new patch with fixed formatting and I'll apply it together with revert of
previous version.

On Tue, May 2, 2017 at 4:57 PM, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2017-04-26 09:33 PM, Randy MacLeod wrote:
>
>> The configuration worked in opencv-3.1 so revert two commits to
>> drop the FP16 detection even though it may make opencv slower.
>> The only change in the configure log is:
>> --- FP16: Compiler support is available
>> +-- FP16: Compiler support is not available
>>
> > ...
>
> Martin,
>
> Thanks for merging this fix.
>
> My long log was truncated by the line beginning with "---" above
> but the code changes are fine.
>
> It seems that either I need to learn how to format my email
> or you have a bug in your patch handling tools or both. :)
> I suspect that indenting those lines would work-around
> the problem.
>
> Should I send a fix that reverts the truncated commit log
> and then modifies the log formatting?
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
> Canada, K2K 2W5
>

