Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4F5C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 23:11:58 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.32356.1640646717515203569
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 15:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y8nFVBPR;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id q14so14709026qtx.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 15:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCwHkzyiNhiR7BN2QNf7jdkgGTQzAuVNN3HF9x/saOU=;
        b=Y8nFVBPRDkjMYLD7LLCFYe14O9nxr+rMtJHnN2Llv35njJWR0+TeojsxGRZ8Av69JU
         QWqSB3i+X7iK7pklg486gLf5936P57H4LEOIy6gY0Z2ZooFMKmQD7D9b4vf2ZTElz3xB
         VYbXCAuEed9Xv5wGsXvHA6xaTTAhpO8b0OtMR5TVxXKMs5znDQjSs9vkCVPeonjyCyCC
         JtbcAgwQ8Sp5CFkUHLl5/e0qah5Bn29YDGpiZcNM/0gFbFjWdwR2Obed4oDNbURyb6Ot
         ma1A+bpzzUjRQwDT8S3/CQDy1Q+BNDdGb67JIp6R01C/lfF/xowfXoaAhG7ACBRS5Mz9
         BLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCwHkzyiNhiR7BN2QNf7jdkgGTQzAuVNN3HF9x/saOU=;
        b=g/p2GS85Xdyki3lv3OfPhpTP4dEm9majUsChwzZluJMNV81g3mfsbSVVQ/xzpxXpLy
         gUATIxQ9z+Qj8bukdkL/98xjsw7NPYTafspCu6Xm4ZFq2G7H7OKEp/Dg2FmsU82UCcDs
         v+7Lr+QkHVAfGKf3dDyhHpoJ4uRsY23V8niFb7yFQvVsQCsVGnZs9tvwZA3C1vKkLk+p
         t4mhCh6a5Y1NO1rlgVVN4yFm/v2tOmYklpdntK+dvLHqGjo2bXCGotuIq0B9sxvNhBP0
         946X6GnS5TfWQjMHIXdL1/SVTftAZGmNzt117vLuA1VhjS4Qfj4GYqwAY37Xrgdpz3ST
         b8Fg==
X-Gm-Message-State: AOAM532N6tECPRdYEMHoQaYmkteAF/p8KSaOh701ucx+WfNk6tTTmKr1
	z62vWjP4uWpWo6G8hNVpO7FjPwaIdyW/vziGLJw=
X-Google-Smtp-Source: 
 ABdhPJzKzyihbvn3jjglVo6MpoIxBESUll8dSux16jZLseMdEfER1/A2w9E61IEBRYUMCwbhmgMamGK4A536hxM4XFY=
X-Received: by 2002:a05:622a:1386:: with SMTP id
 o6mr16676251qtk.64.1640646716561;
 Mon, 27 Dec 2021 15:11:56 -0800 (PST)
MIME-Version: 1.0
References: <bf5e2809-fb5c-dc05-9ca6-7548ff9c724a@gmail.com>
In-Reply-To: <bf5e2809-fb5c-dc05-9ca6-7548ff9c724a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Dec 2021 15:11:30 -0800
Message-ID: 
 <CAMKF1srkBWbqYgaHw_u9Pw3YCAYMq2eHs-M_3gWNhxHg_kuX5g@mail.gmail.com>
Subject: Re: hardknott-next merge request : Dec 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 23:11:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94525

merged thanks.

On Mon, Dec 27, 2021 at 2:48 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit f72a73b42fa740130b388ba8555cdbefdee8d37d:
>
>   ifenslave: Add branch=main (2021-12-05 11:32:16 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to 475ff6954c7c78ea0b2bf6741c46973b1756d3c1:
>
>   nss: fix CVE-2021-43527 (2021-12-27 14:44:57 -0800)
>
> ----------------------------------------------------------------
> Changqing Li (2):
>       syslog-ng: adjust control socket location
>       redis: add back missing patch
>
> Mingli Yu (1):
>       libteam: switch to python3
>
> Peter Kjellerstedt (1):
>       googletest: Switch branch from master to main
>
> Sakib Sajal (1):
>       nss: fix CVE-2021-43527
>
>  meta-oe/recipes-extended/redis/redis_6.2.6.bb                   |   4 +
>  .../libteam/0001-team_basic_test.py-switch-to-python3.patch     | 101
> ++++++++++
>  .../0001-team_basic_test.py-use-python3-interpreter.patch       |  28 ---
>  meta-oe/recipes-support/libteam/libteam_1.31.bb                 |   2 +-
>  ...1-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch | 297
> ++++++++++++++++++++++++++++
>  meta-oe/recipes-support/nss/nss_3.64.bb                         |   1 +
>  .../files/syslog-ng.service-the-syslog-ng-service.patch         |   2 +-
>  meta-oe/recipes-test/googletest/googletest_git.bb               |   2 +-
>  8 files changed, 406 insertions(+), 31 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-switch-to-python3.patch
>  delete mode 100644
> meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch
>  create mode 100644
> meta-oe/recipes-support/nss/nss/0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch
>

