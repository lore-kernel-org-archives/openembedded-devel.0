Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45E4C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 20:29:47 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.97507.1754080178085779152
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 13:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvTKGPJV;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3323b99094fso10313121fa.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 13:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754080176; x=1754684976; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQx4t/USJ1pw9YG7YWxKzTMp2LzxXc/77FfbDMyy60c=;
        b=VvTKGPJVulJk7SbZq619w5nCb47k79HJ+L7g4+x6u9nmded1Y5WmOG31OZcBIy9D4c
         ASlgkrfpV41gP+6nO3sPr1GInQC7vzA8t/yjYtS8ZoK5xHofq7Lp8Cs9DY7e/YTDq9QY
         rFi2SZWeST8GSZmM1+gzlhOvFKoyav2gL0SXI5vQLRoj6B2vzOcFSimLpfqGxDPmwNG4
         SL0lncANq0/CNTdmsfStUCtrg+aaeRwOimtzawiDPmKLMefxm3BHoG6lpUl8xC/6AMa8
         P3BNO058XwMHis8Sb77VwUVbEmBpHDw4Cs60Lj76/dwo4hF7sn8DAg+6x1LUFM+mRJls
         oJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754080176; x=1754684976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQx4t/USJ1pw9YG7YWxKzTMp2LzxXc/77FfbDMyy60c=;
        b=pZr32zF4cygaCjaNL1GCR0XpkpuO0AOO1ZjBz2ga01XnGimAXzF2jmnJdMyNQYViy0
         23vlAinfSBXjgQ3aN4P8KURXPhmJucYVbdKXj6Kn7bFcyr9yChDZAq7nutbCMfBhbhm2
         r7a/MhoUALRaVWDNi6vRZqNP+Wufv6+bLN5qc3Uz9RmatB07FCQNsIOZ4ueCupuSHf1Y
         dhf7T6K+/2ZjklBzyYaIv2lqs3PXNwguwF1lUh/Swqtg2RPmdS6gDjfppQ+6DHUzL+R7
         mD3r1qPl635BDj3EtUn1rSMsk5yy3qQUYAjAVxABATg3mCuYSKIoqmExmBAmVHZNZddH
         PJ2Q==
X-Gm-Message-State: AOJu0Yydj103hdxvZIWvQ0OO6ScFxyPtyizTxt9ds8EWVa6csrM4a03m
	hOxYGnJdwlwPdVFfB0pbLOZWflxrjPHgkkfTuMH85P5jI+metcP5A5JEVSpx9oKvKRLpwjqgzjM
	y12H8DpncE/IzFWMqOeRReZo6BnA0gVc=
X-Gm-Gg: ASbGncsXaliJvoDaN4AiZE8jnnwcBnzyyZ8aThB4HEHLk3Dh2cWSWrj5ouQ5QdOMHoc
	0/VQlqFszOPO1Uq+fRZHdZqafUhlv+BIkvPTRLutgeGTVd1Xqx4utNdBM9QegQeBu3RvB8yljRI
	fA5hp53hMIuf31RH9THnGKo86uNAZixof4OsMYUvXinlGEQP6DYjsFZs+D0yy13JDyknpFynaoZ
	3zZ8q2bHA==
X-Google-Smtp-Source: AGHT+IGsJ/1w2/YGxypqFny4HEcK1OREIsqB8MCIbUpSXJXwcCQKTwM73niFvMMGsOzTLyia5KsexpIOAyLz+4af1jA=
X-Received: by 2002:a2e:b954:0:b0:332:1553:a5ee with SMTP id
 38308e7fff4ca-3325682af6bmr1402841fa.38.1754080175732; Fri, 01 Aug 2025
 13:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250708080158.50374-2-roland.kovacs@est.tech>
In-Reply-To: <20250708080158.50374-2-roland.kovacs@est.tech>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Aug 2025 22:29:24 +0200
X-Gm-Features: Ac12FXxMfRdK6p8fPQQChepceyGIeNHZf8IriEsv9agI_VR_P6yhnl7FAbqqk-I
Message-ID: <CA+chaQeH+HDZzNiWThCJk+o4gnwL8-PzspJGr7ev9tjjaF2CLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH v2 0/1] jq-1.7.1: Backport
 multiple CVE fixes
To: roland.kovacs@est.tech
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 20:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118823

Looks like v1 without Upstream-Status was merged to scarthgap, can you
please rebase this v2 and send follow-up patch adding the
Upstream-Status?

On Tue, Jul 8, 2025 at 10:02=E2=80=AFAM roland.kovacs via
lists.openembedded.org <roland.kovacs=3Dest.tech@lists.openembedded.org>
wrote:
>
> From: Roland Kovacs <roland.kovacs@est.tech>
>
> I forgot to run patchtest before sending v1, so this version includes the=
 missing
> 'Upstream-Status' and 'CVE' fields in the added patch files.
>
> Roland Kovacs (1):
>   jq-1.7.1: Backport multiple CVE fixes
>
>  .../jq/jq/CVE-2024-23337.patch                | 236 ++++++++++++++++++
>  .../jq/jq/CVE-2024-53427.patch                |  82 ++++++
>  .../jq/jq/CVE-2025-48060.patch                |  48 ++++
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   3 +
>  4 files changed, 369 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118301): https://lists.openembedded.org/g/openembedde=
d-devel/message/118301
> Mute This Topic: https://lists.openembedded.org/mt/114042961/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

