Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74800C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:26:35 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.7278.1743153988861372193
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfW7gvo8;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54af20849bbso2092291e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743153987; x=1743758787; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l6G9TWH/Rw9VQliiWlLjz02eIEhAsHs70PrvzF5lU8=;
        b=cfW7gvo8vRRh6wBTBAb7wwq0R/YXeEPmT4mIYZ/ZE2/vttu2A5rPCzyktjr+Vl+XkP
         AXdGBwMERfIV97U94mNoAy8nzEVqJkguxzFXhPdyfaI/Y9qx+yYWbzudnaywjgRHh5jA
         lWJ054jOsmmoRg2X4PayY4pDkLrtdUlQVkz+xEBDCDxaUYitQs/Mdb6gJHPMNzYSO/me
         gekutyTFl7aqlN/mnCATFCkgq1tTAV0clqG49XiV7u7UfICISZ+j+YOHpugMD5vKC1lW
         PLfFh4WhlMaHRsMtilnQLR6YjF/2A+8K88e4OQn+x1aXWjNaOtjRgoCPqJCBmCmlXL/Q
         O6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743153987; x=1743758787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4l6G9TWH/Rw9VQliiWlLjz02eIEhAsHs70PrvzF5lU8=;
        b=G9Tlsf1PcAK7NWAf6s/JgA+WpMAc1+COxh24K97iHLASKEJtXNZomZIPUz7+hUCTB1
         NFwk4ZqqaVNu9pjYvX5qv/32f2bWVOBQcs1yBFgziQPjmi3tPwHKNobN5ENMUov9kZjf
         A89et64xNw2oa7h74HWmHxk3kvqqP6U1kzw0ArnwPYj1v66aKv3v+C9pjqvc5cE1q/C2
         z46c34A2AFiFcZg0ATn9BEgXQL2c0wUC03/Am/XZs63HGsDJDaS8qQD3+ODmDo9lD/qD
         hwAhRmUQbcsVNNtLIKaQo7ZMlZDgen9fSdP8/fayquwGgUmmhg14Bgg2/P2UmZ2Zz8mK
         zQWA==
X-Gm-Message-State: AOJu0YyrlZH4uh99cWIWxdQhuAaCp7waTtWw7S6pgrXngZkNa+i5/eVM
	xyJ6cuUdyGNAomqofGiUvX9IpHY85kJWHbvnnQnydTq1mVPrZUrCGY4XUm49Om6XIyBcF+px5Fn
	DJ3e540soAQUlhS12RAF8rW8TWEo=
X-Gm-Gg: ASbGnct7E3w0Is5jk9oglYrnK6GXE1QvE1WLaWDxYf7HHPwx+XoOI+DGN2FQbVUwLTM
	RAxMbDAW4Jd/gCfFNWUb7mQ342IVrHjhPC5OihJzPgk8BYpbx0pMJpW5GHuQprA+iom6ipNFeN3
	BAB51K8Fh9BdABg+KwaR9GPj4hGZJb
X-Google-Smtp-Source: AGHT+IGi1w8c3iqHRrv0y/zxHA/x5OSeBZunDHqk8SXMo4rYJqG6nXyhxE92u0qddyFcmy9F0udH0ZDRUlobOHd+asg=
X-Received: by 2002:a05:6512:1115:b0:545:8c5:44cb with SMTP id
 2adb3069b0e04-54b0122198emr2950381e87.31.1743153986730; Fri, 28 Mar 2025
 02:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250327045016.3672121-1-raj.khem@gmail.com>
In-Reply-To: <20250327045016.3672121-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Mar 2025 10:26:10 +0100
X-Gm-Features: AQ5f1Jpdwotqn6U-DpUVvO6QPrkTO88Hht_HbRDAJgD2tppWUjMWCK03f6Qw4oE
Message-ID: <CA+chaQeFsyXhAHXzGODtm8NSu2HyrT7JQd=Yts5B=08=_udYXA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] Revert "jq: fix build with gcc-15"
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116349

On Thu, Mar 27, 2025 at 5:50=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> This reverts commit ec9a5598e48f1e4dad8f59e8a49bfe6657bc2284.
> ---
>  ...c-fix-build-with-Woverlength-strings.patch | 215 ---------------
>  ...-add-and-use-LIBM_DA-and-LIBM_DA_NO-.patch | 164 ------------
>  ...eck-builtin-cfunctions-in-function_l.patch | 249 ------------------
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   3 -

Acked-by: Martin Jansa <martin.jansa@gmail.com>

I'm fine with CFLAGS +=3D "-std=3Dgnu17", it was just one of failures
shown in world build gcc-15 and it's not included in any of our
images. Thank you and I'm sorry for not catching ptest issue earlier.

Cheers,

