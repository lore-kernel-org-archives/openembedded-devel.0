Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C14C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 08:42:15 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.4779.1718095333216639720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 01:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5H3eHDC;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc335e49aso1113997e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718095331; x=1718700131; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d0cwUuzA6wrrVBizyz1ZkEmj3pT9Z9zo50lShp8Djug=;
        b=S5H3eHDCtFPEoIeCRH5MCv/X8Y/fc0i61rrOQpFwHHIf45F3nnRM3aaW1TStT9STRG
         N4Qq2dvAGFcQ0PNIyVnL+lnybuAu+4sH9DiUbJwQ+wEvKj58gQJ9tzjtNN2QUdSD+6RQ
         W6OuL2WkzscJzv204mFItVXbDvygSFDHHTyXYQi7Lqtju58K0uuRYqXR4FMoNCYiUSkk
         0e0xWeDUrHwhmlEpwNSf3XyngeLd0IbmKDgR+NrLD9zFjGrM40tBtQM/MtK7Y0KGVUSs
         GXJSUiNvI6l8c24V/NCl0W2wL48YRcEgPITLVXoa5F69m9hYat3nA8e7HRv1mgV8tPUw
         +vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718095331; x=1718700131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0cwUuzA6wrrVBizyz1ZkEmj3pT9Z9zo50lShp8Djug=;
        b=J/56gpK8ourIM3QBvKyDeAg5PKlqE0wjGmIqHQit1PdJz9YVCCsSRzKILETStlgvNV
         xIUl7nhosljPPBsHTjTu+chGnTZTk1c2I91CmcBppeO7PzsC7a/yrOheM7FsE9lZh068
         /YxKswfLPMTD/0kB/f9bxgg9UAeYgbPhQrfb6Yq8l/PF1yWsHKGyO3w1HoQyUksasYxb
         Rm6s66kjukA2Ulns5J627KRku1NejrZFCLPqwXEItmxZ+nW2PMTD6sRoJyOGI37g0YYq
         dPhT93l8iewcghTjxNg2jiFnb91DW+Qjltrv8a43GJPNmnVMYMPsTi3W3O4Frb2MvGok
         AMQA==
X-Gm-Message-State: AOJu0Yxvu9brRCyOi7ea8Umz8B21J/j5V/z2icNUhRXIDgqet/jjRISL
	UkXIHCZg4/+BR1siYCU3MIVkm8M88PvAOsWKpATt8S4j0SaRID1+ey7RjzhcuSEEOhJlz3pcnn/
	cC842vNyjkErdUuv+DYnlEEb2jB0=
X-Google-Smtp-Source: AGHT+IGtuM7L9clnDY9qTEdTtXC5qm12SRFZLYSiRaOP1nItWbfdgirjHGSt3jWuruqRcC31oTkluslG3pVelbaFIQQ=
X-Received: by 2002:a19:c20f:0:b0:52c:1297:9af with SMTP id
 2adb3069b0e04-52c12970a0dmr5045523e87.60.1718095331069; Tue, 11 Jun 2024
 01:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9cu_TU0ZaNrcFYn0SkNaBU1_BaojyM0nBCeJzLJGXbvg@mail.gmail.com>
 <20363.1718094378871141577@lists.openembedded.org>
In-Reply-To: <20363.1718094378871141577@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jun 2024 10:41:59 +0200
Message-ID: <CANNYZj9rfegU7e-zfjpJLbzUHUbnmh0e2wHEUNeZ70v+8pERjA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] tree broken source link
To: egyszeregy@freemail.hu
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 08:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110821

I said that only about meta-xilinx. If you want things fixed in
meta-openembedded, then please send a patch. Maintainers for meta-oe
are unpaid volunteers and do not owe you a fix.

Alex

On Tue, 11 Jun 2024 at 10:26, Livius via lists.openembedded.org
<egyszeregy=freemail.hu@lists.openembedded.org> wrote:
>
> You said it need to be reported and maintainer will solve it, i am not a maintainer for this. Now it is up to you to solve it, please do it.
> A patch would be most welcome also from the real maintainers who have to care about it.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110820): https://lists.openembedded.org/g/openembedded-devel/message/110820
> Mute This Topic: https://lists.openembedded.org/mt/106603732/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

