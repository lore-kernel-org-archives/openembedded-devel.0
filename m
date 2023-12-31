Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B0EC47DA2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.198989.1703983120124035884
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P7TMVya8;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f055438492so6067228fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983119; x=1704587919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phrc+Nc/UIuN/Prkp2VK2NzF+070Df+x+HdSXFy6rVU=;
        b=P7TMVya8lb0cZpAvyYaJYrol/S1hdNxkn4L9GjFbrsL2KqWwBXYHr2m5vRY+auOtFa
         UteT3T+6MCs3HWpLKlZ2JhVyroyDOHbJ9u2alNym7mC6DhLsOzDDV0dMtMTLTRN0sNR9
         w99kFNPPsXsW+rJZVp/78aH2DOj6K9xxpJ5cxhYXh5byqXLj3gtyAjlmq4CyYd7vf1MS
         aOlRw5ThY1yqvQJPR4kuU6YTSYKdmmvIIABB6vuh9j3g3kdI3xcyLXgj4N0Wf39Y6rbH
         6DGJ2d00wM9xVIoEZJvHvTixHIdoPzVxJOUxxbBwrYgBuqOTsWRvPen2UPjWoFbA9itK
         RhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983119; x=1704587919;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phrc+Nc/UIuN/Prkp2VK2NzF+070Df+x+HdSXFy6rVU=;
        b=F9iRzqx1DvpifgnWyrpt3nrzd6+w2ljZ0v7xCPIyZL8CST+gTiMdeL0e4FlikpqPfN
         gk+89LSAkmrOetCHd3PXZ7nNyhMq4rzV6wWYLhViTjwTBUrwVt6X2cGz+IK4+2QyikKh
         GJPeh80K4fNiWEAdup0CLTI3CxwOodwHQklAo57IP83BujRsdVJa+aNcnA3/VsjBjaz1
         vC88lOnSw0XDr93o2rD/DgbCXCDwTJGeNnRnJKo8cqevR/7/1+WoEmaOr2fEmv/Yk0mv
         A4G87qJsAa70OMlEKoMKqQHpEGzamyFrEJdfEPKE2LKlOh6sP/H1sA9GLD8+mnSWki53
         txKQ==
X-Gm-Message-State: AOJu0Yy1gChBFYrWMt2hXzNjsCGFzrqTzEyxrTz5R4wSrY0f8Q+lHUjF
	DQgD+EEaj6rR1yjo81sQm2d9ZW0d6sw=
X-Google-Smtp-Source: AGHT+IGYAn+EKRhiHH5LTUNagd8sJfnOSNupLAQslL4EToE+pOTefTZL/smKt1qKtbTGBCjNs7aY2A==
X-Received: by 2002:a05:6870:2183:b0:204:30ed:7785 with SMTP id l3-20020a056870218300b0020430ed7785mr16960409oae.14.1703983119287;
        Sat, 30 Dec 2023 16:38:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 archana.polampalli@windriver.com
In-Reply-To: <20231226082237.919088-1-archana.polampalli@windriver.com>
References: <20231226082237.919088-1-archana.polampalli@windriver.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] cjson: upgrade 1.7.16 -> 1.7.17
Message-Id: <170398311842.873206.7052965624694537185.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107935


On Tue, 26 Dec 2023 08:22:37 +0000, archana.polampalli@windriver.com wrote:
> The following CVEs are addressed in this release.
> CVE-2023-50471
> CVE-2023-50472
> 
> https://github.com/DaveGamble/cJSON/releases/tag/v1.7.17
> 
> 
> [...]

Applied, thanks!

[1/1] cjson: upgrade 1.7.16 -> 1.7.17
      commit: 884dca3f269cbd7d72c09317107fd0a4fc951a7c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


