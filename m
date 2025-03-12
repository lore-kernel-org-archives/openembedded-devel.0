Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3BBC35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:07:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.21.1741798581963696531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 09:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=HBY3KceH;
 spf=pass (domain: 9elements.com, ip: 209.85.214.173, mailfrom: naresh.solanki@9elements.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22337bc9ac3so1520435ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1741798581; x=1742403381; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=62b4R69fzdYFsgWE++tLyGqrH9930aSa4jMK+1iOmkU=;
        b=HBY3KceH6s7+cdfwAi/ww8fQsK9TVApJD/S2ukUAUtCABsJa8hxH0IY5hiQuaPK+J/
         LywLZGLU6JJMDmvxLHRimyQi9mgIoOGH5i3YRSKBZPHN/9aUiUY7LpdCbSl1uRtm4IL1
         JRkHeJczLQGMBGHIV/AVm1OWE4HQ7rzf8eKCDCbeooC98rDzBhAmwpKuM3tdkKgPFQgV
         +KYRNlGZaBaVbBxZ4a9EN8OdPw8w7uid8c7FyCcljjzAtiQFiMwT0XehAr2tCPUT75XW
         D8a65jVdVY/4vz5LUjwOvAozrbKJ+Mc91ddalSqtXgTsyomASTVgGUHVUyghE0Q6A4lG
         CJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798581; x=1742403381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62b4R69fzdYFsgWE++tLyGqrH9930aSa4jMK+1iOmkU=;
        b=otBAFmrD+JQHcFfuSlDsM45a/BOw9rdwS5nqwqiZldgkdNJteOKv76mhLBsakTQFVC
         0Yj+A1xVz8QDOrmC8/ZeDFmhEDg5XZgP6mvQQVN17tCg8baZdXdrZZ1UNE2BjPRUbuHU
         o77lIhTFGGTZOdPZm441FPCQP1xaYJfjyh6X1nGGGZ6EWN5/GzqvH1BD4dbfIdXQRtyq
         mhpMPBLpvOPlAjwgtq/IN/jpRmsp00CpNE771PQV0btbzHPYExz9p3wAsToMtKX+kCCw
         TTtgIv6I/e9hAglm8dlvctJ2s3dZJisU3J1Pp4fzzxB2ZGuI/bwvD9w+hiW2pgOGxn4L
         So8A==
X-Gm-Message-State: AOJu0YyfmgrXKvSp/PfLAc/Et3vK8Z7A5+lKcdVv667M5+F7nz3cnMCo
	OYxTNfOtYqjp6lEIL2SG7jL/vNw4my/R2QQFZPB2irmIZ0M5CVpeT3x1bkmf1o0CGvb7Tgm2Xip
	0Wjuq3wWws8wLWfODJn+rXvhZMGysUvGskbmclA==
X-Gm-Gg: ASbGnctC+cWccUcxhsXGpdDlO4AxGotJKHIBxTyg+ow8rY58sIJGa/EsoQYLV2k5EF2
	3gYE/DRP1qVDv2bmuZ+nk2C8YOK+r/QKyOp2TZt4vgka0lTFYLo+sQsJcqJGj459LbpsOFu9wE4
	Fixzhj77XuQNE/mEk1I9KNb2HrGA==
X-Google-Smtp-Source: AGHT+IExbQYuCNBZPP1B6JIhiHxs93ZddF8J0UMzuxxb8jPFKIoz7ExYudY6AlveYxLwfAae8aP8+F6s3SlMqWdNuD0=
X-Received: by 2002:a05:6a00:464f:b0:736:32d2:aa8e with SMTP id
 d2e1a72fcca58-736eb7d74b7mr10791497b3a.6.1741798581312; Wed, 12 Mar 2025
 09:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250312111915.2970032-1-naresh.solanki@9elements.com>
 <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com> <CABqG17im5hO7xv-r16mFhJwcXyXt-6OKA_vTaRdc7kuQrdZyzA@mail.gmail.com>
 <130308e4-b9c5-4e6c-97d2-c36f9edc1f43@gmail.com>
In-Reply-To: <130308e4-b9c5-4e6c-97d2-c36f9edc1f43@gmail.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 12 Mar 2025 22:26:10 +0530
X-Gm-Features: AQ5f1Jri6R9xF74D0GbMUnYCMb6VPU7r_RcAo1b9iZOD2_nQLzIyU_MqECihmvY
Message-ID: <CABqG17hBviQ64jXgZ1fa5+ir37YPyK62LZvMgrSGADOxSTFo-w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to v1.4.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org, 
	"Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115936

Hi

On Wed, 12 Mar 2025 at 22:09, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>
> On 12.03.25 17:03, Naresh Solanki wrote:
> > Hi Gyorgy,
> >
> > On Wed, 12 Mar 2025 at 19:47, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
> >> On 12.03.25 12:19, Naresh Solanki via lists.openembedded.org wrote:
> >>> -Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
> >>> +Upstream-Status: Inactive-Upstream
> >> Is that really the case? I mean it is just being updated to a new
> >> version, it doesn't look that inactive. That PR seems to be abandoned by
> >> the submitter at the first superficial sight, is this not the case?
> > Yes. its being inactive for long time.
> The last commit date in the main branch of
> https://review.coreboot.org/flashrom is "Sat Mar 1 19:19:16 2025 +1100"
> - less than 2 weeks ago, with last release just before Christmas. It's
> not as busy as Yocto, but doesn't look abandoned.
>
> Or am I looking at a wrong repo?
Your right.
I can work on flashrom 1.5.1 release. Please let me know.

Thanks,
Naresh
> >>> +
> >>> +EXTRA_OEMESON="-Dbash_completion=disabled -Dtests=disabled"
> >> Nitpick: Could you please fix the whitespaces around the equal sign?
> > Sure.
> >
> > Regards,
> > Naresh

