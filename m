Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E667CF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 16:00:55 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.40427.1727107254569763063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 09:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FpbAoLQL;
 spf=pass (domain: linaro.org, ip: 209.85.128.169, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e129c01b04so8811987b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727107254; x=1727712054; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ldbXy2aBdUvxcLkC3gJcbU6VC5dq5TN4btsMV0BfGoU=;
        b=FpbAoLQLmPclqA6yw+jQJrzRk+2ZAyElfv4R+MwIP5fJ0zfWVe+aqitIE2azHuCabw
         2VdM330tdXGR/KtJinDqgwlSJtJxmc1J3ebi1zuoRIIhBcj7i/dKi2aJy6KD7umpK7am
         KFWJ896TXIjcUaTiIaxDmqV5hIr+MgrgoZhhs6xVw9HR7oS2fndiRZDX1HA1MaRkdr5Q
         JBQiZVAFAA+ehjT+U/L/A0R+ZmOdWULsWJiBrq+QCI2uICGGx+QrZ3OOMMWhrJdikEBd
         BgzIZ93JnqFEivOVzu/fvddbkNTUC1Cw6AcmlpM3+BvvYsgDBQo8Wpy5TKFHpz/kiHUq
         O0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727107254; x=1727712054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldbXy2aBdUvxcLkC3gJcbU6VC5dq5TN4btsMV0BfGoU=;
        b=KtOJhMsh8rjvvaHkkP9y0u/DglXR0zzCI0NkeuQaZnPG2ZU7ARxMY/V41uSIVqbvcC
         QsaMYGkuoJlHji8zLvD7D3gZ93yrAsMheKwaS9wORLxxqAh6ADJkAQ03h7b2sDiQUWB1
         5daL1RIj9n/9EQEoBRpRKgC9s+vPb/rylsif4LBk25IfDX46LB6a0Vnq/wl4R0QByWUd
         MzxbFp22p1PZUC2PHkYvCtyBzcAbikfy9he2Bw8yA1mjeCZwVPkdMiluXW6YJDQBnx7w
         cU2WjXxGHqtDL3zhM9K2SsPN/d84S8rE5AoVgyn8GypvAtaTPFwng74IywYluIEQwfKn
         UI6g==
X-Gm-Message-State: AOJu0Yx0WoBHCM5zO3KmmhmPCLtHT5yIeO5fIHPzYMaYPm2npbC51roy
	ywUcWHBzxXNzGUZ+vacPWp3jRJyRbic+g5TIxOgiTg34XHe5hPJDbhgxdiqWy1zVYJpff4FI4y9
	aScswBLRqrZx6oAujRanJ+E7KWvh53HAgrobZpA==
X-Google-Smtp-Source: AGHT+IHmOZGXi5/9M7MjYTMJUr7B1Z5Ke7sr5M/0EYd6sxCP60M7V7RsjQWVfNUer9Wj3GCd0F9xuWrLAfXl+wHRNO8=
X-Received: by 2002:a05:690c:399:b0:685:3ca1:b9d8 with SMTP id
 00721157ae682-6dfeeed172fmr91767897b3.30.1727107253432; Mon, 23 Sep 2024
 09:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240923155430.1723757-1-quic_raghuvar@quicinc.com> <20240923155430.1723757-3-quic_raghuvar@quicinc.com>
In-Reply-To: <20240923155430.1723757-3-quic_raghuvar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Sep 2024 18:00:41 +0200
Message-ID: <CAA8EJprqeQUd8yFPZ3VXkB886mcx7xeVxVQ_w5jUwC5EyGCGvw@mail.gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH 3/3] android-tools: Create flag file /etc/usb-debugging-enabled
To: Raghuvarya S <quic_raghuvar@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 16:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112461

On Mon, 23 Sept 2024 at 17:56, Raghuvarya S <quic_raghuvar@quicinc.com> wrote:
>
> Location of the file that systemd uses to check whether to
> start adbd or not has been updated from /var to /etc in
> android-tools-adbd.service. This change changes the path
> of creation of usb-debugging-enabled flag file in
> android-tools recipes from /var/usb-debugging-enabled to
> /etc/usb-debugging-enabled
>
> Backport-of: 2a3d4be9994e ("android-tools: create flag flag file for adbd at a proper location")
> Fixes: a29c6386d576 ("android-toold-adbd: Fix inconsistency between selinux configurations")
> Fixes: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
> ---
> This is a backport of 2a3d4be9994e ("android-tools: create flag flag file for adbd at a proper location")
> from master to scarthgap.
>
>  .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
>  .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

This one still doesn't have authorship preserved. You can see the
difference in git log on the master branch vs your local branch.


-- 
With best wishes
Dmitry

