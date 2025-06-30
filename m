Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36215C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:49:59 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.35738.1751276996494111746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8g21k2Z;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d3efcb9bd6so413800085a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276995; x=1751881795; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pmKvRs3TGm0vTdFi7cA24M/O+pdtb9lDLlNIAfelBTw=;
        b=M8g21k2Zl0V+njbi90RtBQIyeIjFz+0kx12eVuAT/c6amDeRyrCfMNHPt5AI5p4oCQ
         Fmx6R6jhF5zHkKRxL+F0JClwcda69ZCWHEuiS3DhLohvoGQlPwD4fnROx+OtYMRTFrR1
         jJAiHBYu+iXXhxxtc3DAzOSxI5IDkuTL4BMiyX98gxk+nSOaVDpWj/idj/u7IQhaHds6
         sHtusXM4JXMd64PM+IYymwKs2EQnRXPTytMypt0MYgnOpqBQUPnfF+8FezZlgtP1RIdU
         ia1wmrB9dCtqMufC0oMj7Yk1tZwZSZkFrBT2N5DWwoANTCh1F+tRtgHlabatZt6ZT3TW
         JH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276995; x=1751881795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmKvRs3TGm0vTdFi7cA24M/O+pdtb9lDLlNIAfelBTw=;
        b=XJgTcMXmf1AAnzxTuWGakRuc+7DVHsaSO/DnlqwQl6KMVQi3ilPxQjGzqlTrEJX0U2
         sAdqa/b4FJJdM2ovXKq0Tuw3tO0Yctbl1OCqa1d/tdEXVzFrA7RQA7Hs80L+8qsTFYlG
         nsF5TQ6PniHxLPYJSNFEI1ADAPouM+dVMKMSlXrRWlpuiY0FRBFa7C840YGxXFihN2kz
         p89JdgP2nYZiIydeoQ2Jax9/0HFqOgfWVDVsDSfr1kHbuKSrjFRlEZoekQsLgsuFsIiI
         I8D700+og0H9Zqcfq5TFVdNXKdvC3BSRRqrTb4cMiOrUE3X4Y7JasL4Xa6Vp+XrCUGZ5
         KGXg==
X-Gm-Message-State: AOJu0YwlaVffQCMYZX758U6hsPLVrnrJXAFeRosEjG557HUDwFCSzc82
	g1cU/z1M6xzDvfeA8D5xsqSrSsmFfKelmIc7qRleUa1YZm8UacaKfWcjkHdgWjh4kTcHUCmFafu
	h3h5sB2k5UUJk/8K1g79v35ybhCaDDcU=
X-Gm-Gg: ASbGncuuxn4WMZfWmcXJXSdi7egzvcDv3vVXFT6t+N4cyjy++DA430uDltP/gvK7xaG
	/JTXwzDr/SKpo/Zq9ODLSYyNEffWwMCoDhSyTAXCP0yDEt2F2J1gSV9+hpARuzIX4woIrEUQelC
	gaaMU6FbkJyFBzCu7XjK8aYRojT0ED4io3M8gIfpQMaTq2xRXSu6T2Uyse6/3mF88suogqTyWpE
	oQdXg==
X-Google-Smtp-Source: AGHT+IH81odjIFOz6vMkAMmIChDvhZDDCMxbxSLnxgAczyRV6at3p7sQ6oeOrdHSy5OULAR0XkkGOsNVNFRT+pyQBKw=
X-Received: by 2002:a05:6214:3214:b0:6fb:66cb:5112 with SMTP id
 6a1803df08f44-70012eda7dbmr202256386d6.43.1751276995236; Mon, 30 Jun 2025
 02:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250627140633.354460-1-skandigraun@gmail.com>
 <CANNYZj_K1AT8nov3Wz30bUVdReE=c=DNvgKEQ5tKAygVb1MshQ@mail.gmail.com> <bd09d601-b551-4621-aa6d-ca9d05473280@gmail.com>
In-Reply-To: <bd09d601-b551-4621-aa6d-ca9d05473280@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jun 2025 11:49:44 +0200
X-Gm-Features: Ac12FXxnbqiQB9ieILzwBY5yXI-7rNE6fTM4OrDRUACJPuArhSNRecjnzLiOyxc
Message-ID: <CANNYZj9cDCB6Y5yi18p_+MfTtfeokgrqniwdKRhFi=rTXVtu=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: inherit qemu class conditionally
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 09:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118173

On Mon, 30 Jun 2025 at 11:46, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
> Though I thought I do, apparently I don't have a step-by-step
> reproduction (yet?) unfortunately. I keep looking at diffsigs and then
> bitbake -e, and hope to catch it (which usually point to QEMU_OPTIONS &
> co, but yeah. there seems to be more to this).
> Until now I thought that it happens just by simply building
> nodejs-native for different targets, but now that I tried to observe it
> in a targeted way, it doesn't seem to be the case. Keep building images
> that have nodejs-native as their build dependency :S

If you're unable to reproduce on demand, you can't confirm that this
patch is indeed fixing the issue either :-/

I can try to help you, but only if the starting point is specific
instructions on how to see the problem, otherwise I'd only get
frustrated at wasting time trying to get there first.

Alex

