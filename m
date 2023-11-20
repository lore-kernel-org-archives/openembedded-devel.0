Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588D5C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:46 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.43628.1700452296939594202
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkzKtxOA;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-da41acaea52so3680694276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452296; x=1701057096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMfT8eYIlY7vPNx+b+PXlDiJWwPdrB9737JSIEo7V3I=;
        b=jkzKtxOAa13s/l1xUEfXInxca91i56DNyrLJQvtDdfGZ4jb6GP3gkwbnVcF8XAw9dK
         +A+oa0A6SbpA/c1kbSvnvXJof4+ZHOBe7RyLDYC9zH5eAgSVZ6b+xJ5oEKTGmY+sqRvn
         bXU4NDiO8+OqRxbrbxsppd61hY1+6sSAqwGRTzzLoRtVw7DlNSzWRlAyDkot9EElKjwE
         iKo97Rl3i0LwzQHXL141BgcQaLiVa5ddzwpDg+1Xej9jX0koowejTy7oBh+wnOQkKTXK
         8ISn62Ev/Fw90lcT1EngrjoWk/JwfB/jCjFILkBlr1gMePRFR+hS0FQFNF7eP65X+f6/
         P0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452296; x=1701057096;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMfT8eYIlY7vPNx+b+PXlDiJWwPdrB9737JSIEo7V3I=;
        b=Ky3hEhaDzPA7JKiuTde2K6iFZkDioQG/2NjYFCiiAF+RpqKL4dEbbuyFCnAUPwUGDG
         NSN26l5p6kHuhnlVkt3dpAo0DM+ptHFoK0ZDYZCjTM9CR2V/+yEFD9A6rc9WVCNTcjjC
         wMy1SktA+5w37JL3/pT8SZxFB13QfAsFnOUBqyb0Ej8H4pr/8gYlXD0P8451TGa48l7n
         zPPRiq7kQlWqIZWXOpalRpFLqGKAntTnihudxLYyK83F/zSYUs4P9WTqWPI160hndKQs
         cWg1VMQtLIlIXq/003jo9uryc9fkkPqwXeSetvoaKb7rWzRpuwhm8LGvsOjzZJljOofc
         UD2g==
X-Gm-Message-State: AOJu0Yx2uib+kl5JiYPP0lNYnHSO5aElYd5crk+mFEfgMayEAsIRz7eR
	MKX8AaELzr8aUQLiovF0jWA=
X-Google-Smtp-Source: AGHT+IEf9CXbuV21S1i5LiHq1lUNijZv2wh5E997Sq+CygqlXS816PB2THfbAB9nTSznUWLl/IWTwQ==
X-Received: by 2002:a25:1684:0:b0:dae:4b98:16f9 with SMTP id 126-20020a251684000000b00dae4b9816f9mr6010965ybw.0.1700452296056;
        Sun, 19 Nov 2023 19:51:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, 
 openembedded-devel@lists.openembedded.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20231117021055.23607-1-brgl@bgdev.pl>
References: <20231117021055.23607-1-brgl@bgdev.pl>
Subject: Re: [PATCH] python3-gpiod: fix the required version of libgpiod
Message-Id: <170045229503.1416826.14697517491067786870.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106951


On Fri, 17 Nov 2023 03:10:55 +0100, Bartosz Golaszewski wrote:
> This version of python3-gpiod requires libgpiod v2.1 so fix RDEPENDS.
> 
> 

Applied, thanks!

[1/1] python3-gpiod: fix the required version of libgpiod
      commit: eed63a472767a6a0fa097feea0ac482a6da179c9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


