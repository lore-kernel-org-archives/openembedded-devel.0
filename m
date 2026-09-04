Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1326AC79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:16:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9131.1788509797336113161
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tJw4cI03;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so9970585e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788509795; x=1789114595; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O75+YpJvsbbckbFl0VG10xnC3XAEDBFaEcg+OoIvCh4=;
        b=tJw4cI033xuHvYuR4NOxUbEu/SmkOBV8L5xbWAs9Ggb8cfgsHFnO8vfiv4aZnXG/kf
         kzkNu4pgDzAftitZp1OVhGHIPx+mymugOmOaay8q/qBwd8t5yY3/j9msgFVs8TdqpKlr
         AJ9suZoDsrgzdQKIpOVqSPfL4v7kHq6A10F3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509795; x=1789114595;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O75+YpJvsbbckbFl0VG10xnC3XAEDBFaEcg+OoIvCh4=;
        b=Ew20GRDqF8poLOJ360F+TaEaLbYwdw2lhveRxXI/5oD4okBHsFqJZFhm7VJ3Rf5wF+
         pnjkE0N05SfzKLoJmE8wul1CADoy3lq26QfbkA/BtrgUr9spvCljuqM3idsq3WHibl4O
         Srrem5TyN5jIz0a+AzgI1nrcu9xxuegXhQDLn9tQcdheZLOqszvfd0TzXjZcLW49jgXm
         9Gxo6u8WK8wtbSY9uC94k8f9OOVWTU9a0zAi7fkLZRMiuH9gmJ+pkmVLOssWzmT6ZE+8
         s6+Sz5eEaPL5Rmqv6IuK5WHC44+Iqeh+YUle1ktYp1jmxOAYLnaoJ741NTVsJNE9aVFB
         gyNg==
X-Forwarded-Encrypted: i=1; AKwUvBxAlelJqdhsA0GDPWt399D9JFkbg3dJH924eR4FsAdDeV0UxL7V3BAe00y4s7UL1cf+Mo51tS1aS1evExLLZbyvVOg=@lists.openembedded.org
X-Gm-Message-State: AFuF++mrUSoDP+1DmF2JDDclgvJwKfGT51HvSwZRSXl5ux+pyIJaE2fc
	Zp/A5n4uxiX1AeMxVNiSl+BI0F7n3Tr6eT3UMW1zxJARRjD1j59tG/4qQpoGS8Git7U=
X-Gm-Gg: AYBFou0rbBsI94V7lYL2xjWEQKPofMkkN5/9rrUUO/bMMqh+jkAFMVOqoasDSBPCD6k
	xrCB4gCbGA2U9Vayw+NdyQQr4baWm3XTk770hAuLrKHgNIUGmf1FwXRaWT79MpRuy0RHo1XsRsj
	Tv4QsNJvpftHlVZ40eVE9SKlurJqcrw3xKv2SwXt3oyaJU1pVqDqIkHV3vhVzZtSy49p833gNPj
	AHb9+CLeLkvMMyRyJONB+uxuCSNSNSD5wvnzKhoDpU44EcXosg4HAyeyINTCNvIwReBKM5JxBDy
	zQ248a0ABFumkvpgduKC5LuBXv2njoOFRNQEE4fBCxLgRN7pDGEQvOmVd44q7NbWbH6y4dq20wy
	CjIYC4fyPIuPJWllnyGSD1fXmw24fHlDGpOFbCW2mV4Vaoyd8oR9rqQ7WzdygDEwv9pgp2UYDef
	q/USKgCH+9dCJyZASkhKyYdHdNGJgyuSXqjUicf8C76nusahkGCX4KAUE6SdKTqCnbDTNXJVTI/
	25yTDY39MQFFys/QjDNOnRodUESkSl03V+PW5+a68eoMdbQ/R8=
X-Received: by 2002:a05:600c:5247:b0:49c:ee3b:723d with SMTP id 5b1f17b1804b1-49cf81f69ddmr30054765e9.0.1788509795615;
        Fri, 04 Sep 2026 01:16:35 -0700 (PDT)
Received: from localhost (2a01cb001331aa009911d943005f4464.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9911:d943:5f:4464])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm135706895e9.7.2026.09.04.01.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:16:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 10:16:34 +0200
Message-Id: <DL6DT4T5SRTL.32Y0IZSRXUWCH@smile.fr>
Subject: Re: [oe][meta-oe] CVE report wrynose branch 31 Aug 2026
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ankur.tyagi85@gmail.com>, "openembeded-devel"
 <openembedded-devel@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <CADySD0FCxCM8MSTnqMumLytDUY4xXfJHpu=aXdciOtuVf9TCng@mail.gmail.com>
In-Reply-To: <CADySD0FCxCM8MSTnqMumLytDUY4xXfJHpu=aXdciOtuVf9TCng@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 08:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129752

On Fri Sep 4, 2026 at 2:59 AM CEST, Ankur Tyagi via lists.openembedded.org =
wrote:
> Hello,

Hello,

> Since we no longer receive periodic CVE report emails, release
> branches are getting stale with lot of unpatched CVEs.
>
> I am trying to set up a process to resurrect automated emails but that
> will take more time.

FYI, I recently moved my own weekly OE-Core CVE mail processs from "a
bunch of scripts run locally" to "a bunch of scripts run scheduled on
our CI". I'd love to move all that to the autobuilder but that's low
priority for now, so, won't be done soon.

My plan (if that is of interest to you) is to reuse the data already
generated by the autobuilder:
e.g: https://git.yoctoproject.org/yocto-metrics-meta-oe/commit/?id=3D6aa264=
fbdb1622caee64c646dddf123e9948ed90
We could:
* pull from our respective metrics repos,
* compute the CVE delta from last week,
* and send that.

> For now, I have the summary below and if some recipe is of interest to
> you then will appreciate any help in patching some CVEs.
>
> [...]
>
> cheers
> Ankur

Regards,
--=20
Yoann Congal
Smile ECS


