Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEB4C61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:29:03 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12691.1788524939229872619
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g1ZovTx+;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-45e2fd33133so661862fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 05:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788524938; cv=none;
        d=google.com; s=arc-20260327;
        b=jjyIkQIpSVik4dyup59QHhkYuZB4+S5xO4rFr3DnlXe4T4NSOcrTlf/h8ayBkvgnLL
         O1j3m7TQzqnD/VrznBQJGz4dP5L1Jh2+NsFyvKLZKSKXtRq8r4lEPP6gsNVouxzotzrs
         uB784JNC+xrSSWw0OpW2cn3Y6AY6ymhmP3fqqvc0n+vEK5SB8IJbytqT/8WX9ifpi8tR
         bhMNTh9mQws+mPThwnwgfCmstcKGqsalOPdkVl3IQT2C+qtsoPo5ufWdMKYG+ArWQi1W
         5juQpDWIiDmCzcky8K+D/q7F8udBSKPg7d2XGLNtFLuSVwXRaCGXMAUryXA8FQHMGkcn
         foRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s6jLnt6pEMeINpyfmoXJuzXW7f1d2lExodrIKVpvuYo=;
        fh=3mwa7JdgkqbzdLre9XSV4s+lFwAFaRKco3r+FK2eOZs=;
        b=Vqf2AV1n1ae543zZEn6p3XaTtEg1o61z12DyzI9G5SiwSCltIW9QeLYJRcSi3yECr8
         MpNQynt+FnZe0to8+3gD6TV/g97iwcGWTJx8Li37/vzldU14rB4dELbymlzuC4cxsCeK
         4iWnfNHbo5spjRMuUtZoxWk1bOS3kZTv3KE2FPHV6MKA3xe7W1ynTqH2CQd9HGeR/3OE
         xguKCms/Hjo0rS9SKWGr82KGa3iPFqOAz+C2O54gJBz30p2Xqe/QM+9veHLSjVJPFvi3
         uUjHItqYzYSa+Ak9zDUGd/KuoVMf+7MJcyQmYDK9AwmbAlm5JDQq1AcHY0qRRBrXk/7j
         MUMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524938; x=1789129738; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s6jLnt6pEMeINpyfmoXJuzXW7f1d2lExodrIKVpvuYo=;
        b=g1ZovTx+7hFSI0NmTMJC9kObpqTFUwQh2OZRv6dvIi6fzLKp7G1jZZmpDtOdpbLV3i
         /xvYHHx9q/9KByf2k/rMPnLGXn3KGv8GMz4w6syFY0lxo2ZkPFzTcb+LGhztOffiOwXH
         J49OfcuHChRktFZHnGJQUeXN3bSOfq/gXq6XK2gwQkZ9nRsy7MFh4C/EZwL+G/j+cSsO
         yj4WHjQVeUVFREro4W98JqgMq+z11wU2c2wKa6FGCaZGnSLmcsANhu9eqhIpxKQ1BUvs
         WeAdMNsX4r0wHnEJ/mS8oLtxzWxRdrmrDnubjY/wNu1RPBln5lsBP6OCst2n5mEbTiGa
         h7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524938; x=1789129738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6jLnt6pEMeINpyfmoXJuzXW7f1d2lExodrIKVpvuYo=;
        b=SkE4UBGIYcIFrYszTKuvj7DTMxCD3qdbJsYuWtrA0Kl6WQ/aw4WHvAnOMCtqSLlt95
         zEXkYFjpe/1SE4Yak9/w8tbLZVy7SwGVtAAm1oF23TmBl7umIb6ocK8KXmlGJSYzwVqs
         9kginc81pdnOIdtlNRv0ba6gpqjBfJZxCj+UpjPHG28pDZN7mcgXThn5prv5QQv2yS9N
         3/0LrTCO0S2TkcNpztvi8wE0hkPUBI2v5QUuNmvSuuR/CUlINV8COET8Y07kCZBLl5Sv
         ibHXqaC3dHxGUqIrhVyVP/fqwXtpLRFnADooH68DJaEodnPcH+upIDmn/r6/LLARam8n
         HqLg==
X-Gm-Message-State: AFuF++mtIii1QpVSGW/3yK1bwa1kH9rr6Dcb0ptdKWcxZBKDhSq+ZN2E
	LjfNpJPGiX7UQfGX1wzf8/pfY3cB+0aGpLw8HVeIf32KhhVdVb4CnQof5oRvsd+U420QUUgyIiZ
	VmNkykwc+1z+2TwcucxukkMJCQjMr7YI=
X-Gm-Gg: AYBFou3hgpycf/wApZypD5Zu644tinEkAnaWUSIg5GGSuwXfiL+BruQi5e4jPl9gHx6
	3RdNa0sVqWxNcU7lYq3XmDeYYklTY9I/KL62woXWmKQTzHAjdciPw4nKJhQATfYXrKbDqWfskX5
	K2WNL2ybroIX6PkMbDUERYpDrrD6S/dWcbNfZxoohWzce/ahW9wl+nBrL1gJ8YnmNU1DCzsLPpD
	L/xbsza7UmJPyYDGgLIU4GjmfmF/zA6aM9Q7/LgRDoi/7Q7/7juG20G8gzkla2n7oG5nlbXV2nv
	6Eh6H2z7EErydumqDqAQ+Pv9IGVKzJIbQBSLL8ogCBdayHxlKNzrNdrx5A==
X-Received: by 2002:a05:6871:729:b0:475:a153:2dc0 with SMTP id
 586e51a60fabf-475a1537c5bmr2445395fac.22.1788524938247; Fri, 04 Sep 2026
 05:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0FCxCM8MSTnqMumLytDUY4xXfJHpu=aXdciOtuVf9TCng@mail.gmail.com>
 <DL6DT4T5SRTL.32Y0IZSRXUWCH@smile.fr>
In-Reply-To: <DL6DT4T5SRTL.32Y0IZSRXUWCH@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 5 Sep 2026 00:28:47 +1200
X-Gm-Features: AcwNN1V1CyLK7PS-aiUKSL3HlJ3muCrKCB_yX5AbJi2lpidxFshLsI2LV_M3ZQw
Message-ID: <CADySD0G5prm9Ezp+enoU8JSgE=02FTRDx7nbqCA5tETNpBAg-Q@mail.gmail.com>
Subject: Re: [oe][meta-oe] CVE report wrynose branch 31 Aug 2026
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 12:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129764

On Fri, Sep 4, 2026 at 8:16=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Fri Sep 4, 2026 at 2:59 AM CEST, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > Hello,
>
> Hello,
>
> > Since we no longer receive periodic CVE report emails, release
> > branches are getting stale with lot of unpatched CVEs.
> >
> > I am trying to set up a process to resurrect automated emails but that
> > will take more time.
>
> FYI, I recently moved my own weekly OE-Core CVE mail processs from "a
> bunch of scripts run locally" to "a bunch of scripts run scheduled on
> our CI". I'd love to move all that to the autobuilder but that's low
> priority for now, so, won't be done soon.
>
> My plan (if that is of interest to you) is to reuse the data already
> generated by the autobuilder:
> e.g: https://git.yoctoproject.org/yocto-metrics-meta-oe/commit/?id=3D6aa2=
64fbdb1622caee64c646dddf123e9948ed90
> We could:
> * pull from our respective metrics repos,
> * compute the CVE delta from last week,
> * and send that.
>

Thanks Yoann, good to know that.
I am also not in a rush, so will wait when you are ready and would
like to understand a bit more then.

> > For now, I have the summary below and if some recipe is of interest to
> > you then will appreciate any help in patching some CVEs.
> >
> > [...]
> >
> > cheers
> > Ankur
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>

