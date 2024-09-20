Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15674CF395E
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 10:10:09 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.14891.1726826999840077559
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 03:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uBjaPSPW;
 spf=pass (domain: linaro.org, ip: 209.85.128.171, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6db67400db4so18424287b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726826999; x=1727431799; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OiD0wxvoIWFsNRTe/Ij4N0QkqXEzhjoVhoZqE6mqA1g=;
        b=uBjaPSPWtPxlqXNkBKQtjkkiH7IKaEC1FBrKIyyEp8xligkmQ0N+MfkujWsz6cOy9Z
         kHttepXH2PDSG/JKWQ7nrtU9wg2N6Sfnq4lrV03vqrSiBgm14WP8XTdJxbiBfEe+a1pQ
         110z7BvWqsAALWDZhvTfx97C9vrX4Uobt9/Jbqe9dzss8xifUMuFno5iE6YxLRviN/BO
         xhc9EX8M+xr1XnT3ndaLag/eAeX8aT7g3akAz5CH8dNNynD7xDFnVEr+7PdIxYRB5AD4
         3bvhut/ZvjA++wvkl1bZpygYzSNOeTwtF96DiWjAD5KECOM7qoHyHXjT7ZD3x3S/QhJz
         QxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726826999; x=1727431799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiD0wxvoIWFsNRTe/Ij4N0QkqXEzhjoVhoZqE6mqA1g=;
        b=UUle/PwxpujzyQpH/XdxyL2kYRXsCpyk2j0MmycWd23m85FPmtU6O3u8daFxIYl/9X
         EX1bhpdOrnZgYjXR4U1htfBg+6/00kUnBeP8FQ7w6ypApn5O1eEz2MYjCGiw85IDGRnb
         q+Lalz+3u9dbt/yVGloP6rp828BmyIiipFrVgxaQDIyC7od+2+3ZyKUN2u2Ql95j0bhH
         o+WkPEijHGt2rGW1mN0pN4Ffr+bICrmXJZ3NqXdSkd8Q1EAUwTErsJ7ZLzxVYHdF5qW0
         mQuAAfozOI37dxLBdrxsh4QVI5y8Y38s7Q2zaEQkUQPxtNLTcEJzCoIRRYv5P9g3zs07
         6DYg==
X-Gm-Message-State: AOJu0Ywy3qP/Lh8CEdG1rvHo1KpVAwTV1fFfhbdQWIUlBT9p/7R2iWkL
	K6VaAXpDWCtMSKrk+maI9JAogDznDefusuI/JG2Ey4Zj1h9HUjQhL36Z2/OWAflypGtb+Q5SfdJ
	usugZvX2yT/nI3HnE+jMcqyN/WPtLe4XQ+3TfIg==
X-Google-Smtp-Source: AGHT+IHceneYL9sguGEIeZc2hAAr7rf8guKmyApNRFP/9GYMxErdw4RIgnS5I3+tQRIAtDofTu4YB2/9S50fATeGbUM=
X-Received: by 2002:a05:690c:101:b0:6dd:bba1:b86d with SMTP id
 00721157ae682-6dff2824886mr13585067b3.10.1726826998956; Fri, 20 Sep 2024
 03:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240920093750.4000239-1-quic_raghuvar@quicinc.com> <20240920093750.4000239-3-quic_raghuvar@quicinc.com>
In-Reply-To: <20240920093750.4000239-3-quic_raghuvar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Sep 2024 12:09:47 +0200
Message-ID: <CAA8EJpr7d-ooQPo98rqyAb8VLEWRmM1vqTFmW9xjggkA9xRzHA@mail.gmail.com>
Subject: Re: [PATCH 3/3] android-tools: Create flag file /etc/usb-debugging-enabled
To: Raghuvarya S <quic_raghuvar@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 10:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112399

On Fri, 20 Sept 2024 at 11:38, Raghuvarya S <quic_raghuvar@quicinc.com> wrote:
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

This is incorrect, you've lost author information for this patch.

> ---
> This is a backport of 2a3d4be9994e ("android-tools: create flag flag file for adbd at a proper location")
> from master to scarthgap.
>
>  .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
>  .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry

