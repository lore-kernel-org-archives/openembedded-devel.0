Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46218CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:25:13 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.11384.1755602701336385017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 04:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZprunfLi;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-333f8d3e67dso39524511fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 04:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755602699; x=1756207499; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHcTY30LEXCdijBjxZUPjt3fXl3N1MOIchlqlvjH478=;
        b=ZprunfLikMIJ2eMRQFL819/SJjd14k26aPKyjdg5bD5t2IL0fzuT+YX79CTJm4egaE
         CgppnEoS7ywy/X7lpJvGHi7H/S7THG316HDQP2Jj4PnAxPPbNLv9WpRBncdLRjcu4phX
         Bvy1BSEUba9m7L8zWfbbhAv5HKuqS6a5tRiToWTZi/rZgmM7juSgiubLTZAzA6LaYv1a
         b8YVWzCQVTvimd/p0de+LjaxG/a8M9k+IM4Ly8Pd8y0+qOkTQKPfD+eeLmgxMASGGxh0
         Oo0OEOCTR+KIWfwuEX5x0VjmG7L/Bj6MV8cqF3Uy+vm4E2BvVtTmnP13YuOaa9Oc3D3r
         MOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602699; x=1756207499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHcTY30LEXCdijBjxZUPjt3fXl3N1MOIchlqlvjH478=;
        b=w7K2jTPxVSxiHdi4ablAjqPV/d/LilwDiTzKjNjAKtex8xt1mtmHS0aPogEELdDcli
         jkPhDUwMYXS72g3XzBriVYwnLRixwI7hj9XCIx22bJnpph+1TyCumiiHvMy3rlUd+hvL
         M0vgKfOcYRFJW5UejxlwiLKRNFKQh9TPNKkEsK0g8SM1natwiEgDR5Ljxger5VMXeLN4
         AL1lZ+BjVmsK7zyxG+V8zCXJwKaAoSNRlSR9UYflCuzuFonlCGF9RnRHGXIGsybKk42F
         tZji2t+doi/pAMu3kBiWag0m0DNxBezIK+wgTJg9SxQ6bUznupQVT4rSohesxqE1ABIj
         H1gg==
X-Gm-Message-State: AOJu0YwZVBnXd0yqNfCtNIbVGkVzTCMHF1o1jOBWzzlhxspv/04Bm/Y9
	aIwjAe6rX/ayogYitUlQsBJDcQlMDgVAO/FV1SyAhJb+d+Zxpd9tfPSsvpkhhAfaFlzjlbrtxfv
	fFmVlBk2abMCXE+NCiC6wRBu0QcwiSNY=
X-Gm-Gg: ASbGnctomv2ncNdUYTZ9Yq/P0Ze5+BiX2e5bRh48trD/APDrMCX9bcnE5hTnMh/4wFg
	9on4cuX2qGpTjl03694ybd/W2kBT8OpuwGMXHZhsozRZ8Wzj6M3C6hD/6p5d3AFTeNfQKTBCQuu
	Q+xYACy0VLxiLGATqxjVk7CBRBFSBoiix6DAfRT/PXjFG/bB/t3gssE5Ch3inHojNwTBZT7v4WN
	7N/YVIQmH1Dtq1BCJ9m
X-Google-Smtp-Source: AGHT+IHKKHpJZOF0iGbOsPPMF8jINxo09DdRkM+M2w2rE5DU25Jozsz8J1HnQ1BIdU1e2qCMQvcKz7JaeFlyDtZc8AM=
X-Received: by 2002:a05:651c:553:b0:332:1de5:c4f7 with SMTP id
 38308e7fff4ca-335304b96c6mr6133321fa.6.1755602699130; Tue, 19 Aug 2025
 04:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250815105844.584334-1-karn.jye.lau@intel.com> <04cd09ff-cb1d-4948-a198-7b2b7a244f16@gmail.com>
In-Reply-To: <04cd09ff-cb1d-4948-a198-7b2b7a244f16@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Aug 2025 13:24:45 +0200
X-Gm-Features: Ac12FXzBlhaUTirYxJwSlhVIz5pCndA8dDkbUy6zZ2G1CjgzhAtoxBNa0HQibaA
Message-ID: <CA+chaQdBWW2jkTrUw0ipruVzRT8NWyn-1a5WmQMtH0BpZBy5oQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: drop tag
 parameter from SRC_URI.
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	"akuster808@gmail.com" <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 11:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119003

On Tue, Aug 19, 2025 at 12:44=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Armin, Khem,
>
> Would that be possible to prepare an unscheduled fix-release with this?
> It keeps tripping people, I see reports on all channels.

Khem already merged the fix yesterday. Thanks Khem!

