Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1B9C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:02:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.25794.1683615728726335574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=nZodEI7U;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: jun.nie@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso6180908e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615727; x=1686207727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nJZcTI1xHmLEPfYtSeSYSinpuJ7oC+m07R40GqeTmdo=;
        b=nZodEI7UwgNcqhJVWpfe0s/NineK2YlayYzUKw5KO+QQ+X8i8ZkY7gr8OJpOyNxQj2
         cdkWs/+Okbv2bBL9FPhUmJU4pV1zoTuPG6ospCWMur/KYGgg8yacXAjGgmbVXUEHghja
         pYGpcw4kY6SFeSvma1jBFtYaYcsZIcCaxag9TRSt+gCUs5SuZJKCgkIuV+iSOkGGiXJn
         NCO8NA/YyXcPgAr6zWZjl88LgKpAi8MG6SEpGb0mRWko6OuyGTvVUXP+lnUh1PujXvMC
         yl6juis+Ry5uqJA6PDSmJpLiMFr2ZIVEGscBllEd4DqvdZeiKO0waZ6o4+JY/tG0Ht8R
         +ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615727; x=1686207727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJZcTI1xHmLEPfYtSeSYSinpuJ7oC+m07R40GqeTmdo=;
        b=KC6O7qKIkTbjZHHxy/1JsFsesTIyEdUceJhNUCo/n7vA/OS6YYp5nks6hQdZCyJod/
         +a0k4LCl59qV8yNsAPvgloCIzWBNpr7VzWQBTcsO8NS9CYkdA/0jqSY9ivpEnUKKVapx
         zoCtpqYVBbUItUYEHWzOm69omMl5OQ8UbkjEwhZ3SCTEWKki4e1hwg1lwoZ7MlZybXt8
         9nUYLAWFnEkmf6lulJtqGufcxXjk59/Vy3oTpG5/oi98G8t8zoB4YISglvjpRv8znBbn
         p28TtgJ5caMEF+9gGb8cR7mZEVf9BmzRP1bv1R4NIhOhZh/0q9W5U0d8r/W5dxpfPfgm
         f4Lw==
X-Gm-Message-State: AC+VfDxAtVKtnGw6Fb3f1hONpahVwzsMrE+zo9eNyJ7jUsaAtH3lwaF9
	olrp5NXaev7Ez555yjuW0LP1DxtvidawCpZ99d/edg==
X-Google-Smtp-Source: ACHHUZ4W9IV7HpoYiXyujLc7X7s3peAfRQ0Xnrpdf4dqDVnIt7NKsM3E2EbEO4EC9L2dK59pcfwS9hBUDBzBEjE9Zsw=
X-Received: by 2002:a05:6512:38a7:b0:4ef:d573:c8a9 with SMTP id
 o7-20020a05651238a700b004efd573c8a9mr463002lft.4.1683615726848; Tue, 09 May
 2023 00:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <175D6764FA66605D.26836@lists.openembedded.org>
In-Reply-To: <175D6764FA66605D.26836@lists.openembedded.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 9 May 2023 15:04:21 +0800
Message-ID: <CABymUCP5MBU+T1q8WTf1oraeC0OJq2W5XLFoDT4jW3P1wh3MVQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe 0/3] Add necessary lib and python tool to handle
 CoSWID tag
To: jun.nie@linaro.org
Cc: richard@hughsie.com, raj.khem@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102468

Sorry for the un-aligned title pattern. I do not find any option in
manual of git-format-patch to generate "[meta-oe][PATCH 1/3]" like
title. Please help indicate how to generate that if you know. Thanks!

- Jun

