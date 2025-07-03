Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B26C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 08:49:04 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.17729.1751532537464582083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 01:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=llhNTliL;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-700fee04941so43981356d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532536; x=1752137336; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tighXhNm7MJ9SqSFhA0DItd5uvTSoOVMdTKZt26SNm0=;
        b=llhNTliLyLbfpjlAifB0aPGc4+Kiy9nAehukDurd6ckSrNaAiBMzvIHJg1Vilf8cOl
         u8Ggf6pz5yFCA3lXPxUzkaHK+Szlm6b4xcNrOdj6N8ppxi+bgAfsGdmSFgheRzNjONqA
         7n5yeT0No3Y+6BJ1krSA9ERjBh6St8V5fCL/R91+ron1kQGT1sIQrrXb1mA0bkRK6WF4
         KR9P/BZBsL2SHosOI9nI8BMk3i6EFii8E+bTD1RyweAZTSEuLKpqkZia3Q3L673TYYVO
         AZUZeA/c7LclaE7kSFTrFZ+WwSP0MjA8NqOE0slFL701QrLNDsGZmjc+/HPvEvhyIqcg
         fbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532536; x=1752137336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tighXhNm7MJ9SqSFhA0DItd5uvTSoOVMdTKZt26SNm0=;
        b=QVLZ4P90cg2Sq2LRAZpUEa8uyTVy4+HbVnisOnoTrIXRVP8hPtYmhNWKX7QrDtxeZx
         dmR4i/RJxZNgUT1ggoiKB2O9s8IP9Tu+xmmbSA9nuFAFop6Ums6EB/D7LFE+OiJXUnEk
         NauI4NUfoEWIh7p+lZiXRbckAR4OuMyHT2cKLjq4iqpNU6Zok5lgN2rZAFtavShDAUh7
         PumGGvfXiz67Z5sZ/t876pxKVXaGTC9c9z9+hTzsy7cnR5JNk9teVr1VxmsdMfGIFCH6
         M+G598wpn2Djcn3ODLIxCm9ShAlBkL0tek/EyS2j2sMvDCKWN3TJBfA8o5VsDe+pLpQ/
         SCtw==
X-Gm-Message-State: AOJu0Yz9RpCjYOc4C6sqdGrYInw19q6XoIFfhLW/V/0Rx5ywPkWq12Eg
	RTxounZllIuFiH7Y7xYS6UjkoYeitHdjAdVECvDYDXDrsRci7Fwx2ydyg/1VCrukp/N1z+JKLZJ
	+/zFdXA6SYvUO72+Tny81p5C73kBFnZg=
X-Gm-Gg: ASbGncsAdLFqxT0Akofm+7bUkmi4VkmgPU9qVlbxVpqlxdjjZg7NdDMRNdwBhvSQ64s
	YoBrv/g0SbIHC0bHHoXeYf+rjU3ofiIYnNCP8WQblAdRn1iMnIDrXZjtAIhrNC6o+2eD2vRHPgo
	T1SNNey4lk1VfkkrDyCsjdwegzrHBDWiwbxQoQ9tb6KgesdsCiaChnEV8O9+qjTLMLr61YlzgZX
	QtEU+/0wbt7
X-Google-Smtp-Source: AGHT+IFZAhWpxVnrVFuelVCGy5jSccvKDU8NFuMag54hBcj2njznMVgP3/Hs4AMUokVFxR3vvcu6XrW9K8x2IHQqh48=
X-Received: by 2002:a05:6214:1d06:b0:6fd:1687:2e1b with SMTP id
 6a1803df08f44-702b1bab0e2mr105018906d6.27.1751532536270; Thu, 03 Jul 2025
 01:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <184EB1345CA463A8.15677@lists.openembedded.org> <5042bc5b-59ad-4ec8-9e6c-7bb1b55c7c08@gmail.com>
In-Reply-To: <5042bc5b-59ad-4ec8-9e6c-7bb1b55c7c08@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Jul 2025 10:48:46 +0200
X-Gm-Features: Ac12FXwdsgPKHLU3_VO0eoyVjgA91K_U3HPPj8nitSgIaQ-uHTz-e07qWE-xDk4
Message-ID: <CANNYZj9XpCRxX4FqjzmpmF4bTBxgVvRRFOG9GZfytDwrERnwHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mozjs-128: avoid using build host's rust toolchain
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 08:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118215

cargo class is intended for components that use cargo as the top level
build tool.

If they use something else, and cargo usage is 'hidden', then the
correct class to inherit is cargo_common - if it misses the needed
bits or does too much, then that class should be fixed.

E.g. see how librsvg recipe works.

Alex

On Thu, 3 Jul 2025 at 10:43, Gyorgy Sarvari via lists.openembedded.org
<skandigraun=gmail.com@lists.openembedded.org> wrote:
>
> Alternatively, instead of inheriting rust class, cargo class could be
> inherited. This would set up the correct environment also, but would
> also need to override the do_compile task, with something like
>
> do_compile(){
>     oe_runmake
> }
>
> Though IMO it is technically slightly more correct, I find the two
> variables in the patch easier to grasp. But if someone would prefer this
> (or an other solution), I can submit a v2.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118214): https://lists.openembedded.org/g/openembedded-devel/message/118214
> Mute This Topic: https://lists.openembedded.org/mt/113962964/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

