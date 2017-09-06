Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id B3DD777E8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:35:49 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id l24so15937155uaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w+rqK2y80ZM4jQYS5RYqs8DMcv+MHBl6zh2df2/6FLs=;
	b=nTlNgX1h4F/Px08EcKJEKK/miVi6VN0w7QUS2ohSqhzG6S33qnUTJfha0KWEL3irya
	EVaCziAcnivtPnM33W+EH0kxdiou1cZqrkf52TYr6XEPxQ6p1YYs4si8LHd8EFR0jTcM
	ArMPKkCF70gqX37VnMCRo/cuCmeYo5yUpkamO2jzzi1jdPHiA5vBNeXWBIO9BjL3Ul4V
	P8XTTpl/J30GuVQPp9LkuhY8JmGukhnD7S2f8dlrKRtyqJnVsQWGb4C3ds/4Z5R7wbE0
	33x0W3aDyiL2ABaFczOChpmOthA78uHQKkeFqI8PVrLWWnCmULSBljE8SmKKEQt30FSb
	Lliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w+rqK2y80ZM4jQYS5RYqs8DMcv+MHBl6zh2df2/6FLs=;
	b=A3B1lX/OIs01pjNopX/wb61g/C35VQkfVhMuk5c01PGuu9rteeGpRUuIpPB2oKfqmg
	VGJJnQ3f+C4ohO32pjam5S9zfx2D10c2X35tYM1T64ewhNyfDla56mDP9lHdLDabKBaZ
	QEz+Edo/ZJBZP4OIY14BXye69jqLhkxzhLLozudN4T/wxa/vQbQmU8bvrKFqPxc9KW0t
	/aymyg2Rz8nT7uSb161ZcfsU0L7M5bbH5dBlTOgtfOiwYu5OWUfuOB33Qsqm3/Z/+byt
	yOoP/sl2AYAsWIbglPqDp8mw5lXQw9L195eE9GhhYeBxp0K7HB4SIU4xljm1Qn2CENo0
	UXog==
X-Gm-Message-State: AHPjjUh6/eY3E6ER57FtcELYiD+8v3ngcE1qYJPOHfPdXzqEsh/5AHid
	vg1D6GAYDvVWLusc9vJXicddr7v8fA==
X-Google-Smtp-Source: ADKCNb62ryLPr+KziEuJW5p606spVmP7tcxWi8sB+OfDZ9smmrm0fKVJjlgGB3ZfpgFJAcV0xtIP/LbgGkDpczOf1pc=
X-Received: by 10.176.67.35 with SMTP id k32mr259455uak.203.1504730150444;
	Wed, 06 Sep 2017 13:35:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Wed, 6 Sep 2017 13:35:49 -0700 (PDT)
In-Reply-To: <65cc49bb-5a7e-c3f6-1e08-09a6bcb8ccab@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
	<CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
	<9fab8446-0159-e7c8-b81f-a4e7fa3a5882@windriver.com>
	<CALbNGRRQAKUNR-X1U=vdc4dEzpobc5k+b_F8cS=u2VOi04s7MA@mail.gmail.com>
	<65cc49bb-5a7e-c3f6-1e08-09a6bcb8ccab@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 6 Sep 2017 22:35:49 +0200
Message-ID: <CALbNGRS260modGqY+bkNV+R5XiONyVcdSQpE-eYLoR47VxqsRg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
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
X-List-Received-Date: Wed, 06 Sep 2017 20:35:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 6, 2017 at 10:21 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> You are missing the point.  We DO need a replacement.  However, I was unable to
> find one.  With the few references I found when searching that there was no
> replacement, and it was effectively obsolete (and removed in other
> distributions), I followed their example.
>
> As I said in the header, I don't believe this set is completely right.  But it's
> a first stab and what it took for me to pass the testing script.
>
> I am retesting with this patch and the removal of gstreamer removed from the
> test set (it will take a while, I've got -30,000- tasks to run through for a
> test).  It's possible that something else in the system was triggering a fault
> that caused gstreamer-0.10 to fail and that was resolved elsewhere.
>
> I tested the original work against master, but rebased to master-next after
> talking w/ Martin... I then spot checked the modified recipes that they were
> still working after the rebase.
>
>> And please don't even think about running your magic script for
>> meta-qt5-extra or send patches.
>
> Again, you are missing the point here.  Someone has to start this work.  It's
> the layer maintainers decision to accept or reject the patches, not mine..  but
> I feel it's my obligation as a community member to submit the patches I create
> to the community layers that I use.  I also feel it's my obligation as a patch
> submitter to explain why (or why not) they are necessary for my specific
> use-case.  (In this case, passing a specific compatibility test script.)
>
> --Mark
>
>> Over and out
>>
>> Andreas
>>
>
I am sure that I miss the point again but fedora - for me
reference/inspiration many times - has no problem with xfce4-mixer
[1].

[1] http://pkgs.fedoraproject.org/cgit/rpms/xfce4-mixer.git/tree/xfce4-mixer.spec

Andreas

