Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB69C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 03:18:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.11546.1705029521552359637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 19:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5C84EpF;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6d9ab48faeaso1020087b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 19:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705029521; x=1705634321; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqHTAdaokQGrNKQwCqi1hjo+x1tnuhZP7NHH2WcLBXc=;
        b=d5C84EpFyLjAAeU9Yv93Q1PsBIPyzW6cI4NJ4M/biBj0btQWRZ/y+QTD/6vyD+wkTA
         b5KyJ/9BxpghlDkYfnHSCYrRS0L8k57oEk4vOqSw9lLI+JOLO/u95OOcyN3l02FizvGm
         5EPbvU13aHHrGRRuVF3NGyb6gXgUE8GIs93SPOzox5SXKSwLsLJbfOrS0dbIEk8FJF4x
         1qfZo2BenqE0k11uWS+patVlqe42DWRS4wxkvk8r4+Sr/hj6cyl+bLxUHpE7fPhdHzdr
         O4isKZUOYlnXZkRZ2je+OrhN3dn7pReqbHRL0fH8EpDnZYXLVMO5SewJ/2bxvRM+6fV4
         K6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705029521; x=1705634321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqHTAdaokQGrNKQwCqi1hjo+x1tnuhZP7NHH2WcLBXc=;
        b=b4UcGk/oTScVR8vg1JqqsXLsbdZud6MUboXQzoxx2Jnm4RhkYq1SHT8FFDjX8holY8
         GLo0FOW+KT2vQ8NV9a7ypobpfzB4buhItQdW3ZvioF0lp1WKbqKe4A5h1zE9SiBgOZXT
         n0Crldmsk8/X7V9ST8f3OVMxIqTFDf5qv03abADN605++CXYrmKq2/JSC22tyNRbllnC
         o2/Vsw+aFD++Sl/Dr9ZCQdADNQIasYhxiJewpkiBIZSEwhJaDje13mVeImtV+sCn7A9T
         j8nLEkEHy7KZAieYPrbGkPqb47BgORhmibvEO5YKrjvhSMsiU4ps5mBzYRbZ2tr9MRTI
         TwKQ==
X-Gm-Message-State: AOJu0YzFCP4enWjz25f+/rSMzaFFpoCUitRk2M6sIICS+1H2+7ky/K9m
	5EeklhV+weyoIN9xafIxeVddQqe4Bqn5wJKas6w=
X-Google-Smtp-Source: AGHT+IF9WPUDVtT+MbDMT8d0D+/OHSaNmd6cLbLQJ+/M5T99SgI0Gb0QvxLLsBSAAvF13DoVah04/7gaPpvfrQUOo0s=
X-Received: by 2002:a05:6a21:99a5:b0:195:2f06:c6f0 with SMTP id
 ve37-20020a056a2199a500b001952f06c6f0mr719727pzb.0.1705029520869; Thu, 11 Jan
 2024 19:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20240111040734.112703-1-festevam@gmail.com> <CAMKF1sp=0T4Ow_F=DwOL7BxZU=j8D4z2eaP9qXa44kwOo9Ha1A@mail.gmail.com>
 <CAMKF1somcAJpnMW9822wNy0M2a3Yd5SFCgeouSVUg_0HW0HdFA@mail.gmail.com>
In-Reply-To: <CAMKF1somcAJpnMW9822wNy0M2a3Yd5SFCgeouSVUg_0HW0HdFA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Jan 2024 00:18:29 -0300
Message-ID: <CAOMZO5CF41YpSU0Zdz5PUpHvHpMuGFWt999+FBC_b2hcUe5x_w@mail.gmail.com>
Subject: Re: [oe] [PATCH] v4l-utils: Update to 1.26.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 03:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108232

Hi Khem,

On Thu, Jan 11, 2024 at 5:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I meant to say without systemd ( using sysvinit )

Yes, I have sent a patch to v4l-utils to fix this bug.

Thanks

