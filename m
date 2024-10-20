Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5D9D3C92D
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 20:15:13 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.31883.1729455312711760127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Oct 2024 13:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=izJtqkuS;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5eb5be68c7dso1914393eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729455312; x=1730060112; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flu+6GRLIjyK1o5WnHqlASNmed+ETaLC6+LMND7kJH8=;
        b=izJtqkuSxiVt11R4JnFtN7xkzDO10GHVo4id2Fx/qPmByut6wlYvYZjDtYiHBSAD+X
         oKHZyEoUuW97pKBJ9yLlqp9eNXAtj30qLOkisQ4jWSOjFVkv4bSpgH35o6vSyHQ9CBsZ
         vMx8uQSbN97hwSzcNmRlJDcuJi+Q/Hm5Z5f+G+CqhQAyiMoU5Z3q2+nCtIAlnlqpe1w4
         45qRbKlaCNiYSha7orQAVGAWEII6HkEDX/rmIKRj2UTGKVQbUyvPAnwVqQn6mDHYytnA
         vygjQhKxm53tKrHFipzg2OATH4ouz81CHUrQW9q9QL/Hrs4zNCgi89TrXuLl1qCOp/1l
         xDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729455312; x=1730060112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flu+6GRLIjyK1o5WnHqlASNmed+ETaLC6+LMND7kJH8=;
        b=bX7tXAIutuhYskm0qiE2mMmUvrguvHiteIyKw0GwDxE6ch1V5jOqALCz3GugDCgaha
         SPkIGPo0vtrH8EKVW/fuAjaHI8Z9j+BhPyR1XBut6LYRAHA6h80miDJq5vfPDUE0Opga
         s95iXawmCprdGzYCBhdi7413ncylbTbgQu1QjmXJiquNqu2XagrmnAyP01PLIUS/YeZu
         xZn8iPzzEDuLK6Z26LrWkV1p0rAEcqE3BBXwqy/SBumSBet4NU9wleBOO6YGLVpK3tON
         MacXDtza0G99vg04mofEH8RhhukfGPjRIyc2+3SxFAbvurxFNTWQ5mtEyqEIq+7LGGbq
         fylA==
X-Gm-Message-State: AOJu0YyqcGhz7oW54r/6Dkj4teMTDOXOSe2Grq1bwH2Yb2nZg8L/yppN
	ZA9PCwHZNLOPgOI0OaUg1HyR/2jdTVRnFvLS/nOCJrZAy8jk2Mdkwphqnn4VWAUWstLwvoqGmyn
	9cuL8Mn2Catj6DXeakQI1dDvNWqc=
X-Google-Smtp-Source: AGHT+IHAHTxla+TWrdzABQlYnMNATAaNBk/fiuGkP7LqRiUCUIhFFkEL9Qc+d1dBGwZ4BtYoxdlBbZXNvHdT9fR0/QQ=
X-Received: by 2002:a05:6820:151a:b0:5e5:d0c8:8030 with SMTP id
 006d021491bc7-5eb8b551749mr6391812eaf.3.1729455311933; Sun, 20 Oct 2024
 13:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <5dddf64d-d959-4d55-9cb9-8aa260b28dd1@gmail.com>
In-Reply-To: <5dddf64d-d959-4d55-9cb9-8aa260b28dd1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Oct 2024 13:14:45 -0700
Message-ID: <CAMKF1sp4OPgit-n0F9PHSTF6F0fOWqgFg3hWPtdB06nCyBOkxQ@mail.gmail.com>
Subject: Re: scarthgap merge request: Oct 20th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 20:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113069

merged now thanks Armin.

On Sun, Oct 20, 2024 at 9:53=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 72018ca1b1a471226917e8246e8bbf9a374ccf=
97:
>
>    rocksdb: Add an option to set static library (2024-10-06 07:29:13 -040=
0)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 2e3126c9c16bb3df0560f6b3896d01539a3bfad7:
>
>    xmlrpc-c: update SRCREV (2024-10-15 16:59:45 -0400)
>
> ----------------------------------------------------------------
> Andrej Valek (1):
>        externalsrc: fix support in various components
>
> Martin Jansa (1):
>        xmlrpc-c: update SRCREV
>
> Ryan Eatmon (1):
>        kernel-selftest: Update to allow for turning on all tests
>
>   meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb           | 2 +-
>   meta-oe/recipes-kernel/cpupower/cpupower.bb                     | 2 +-
>   meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb | 2 +-
>   meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb       | 26
> ++++++++++----------------
>   meta-oe/recipes-kernel/spidev-test/spidev-test.bb               | 2 +-
>   5 files changed, 14 insertions(+), 20 deletions(-)
>

