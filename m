Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92948C47073
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.198925.1703983129303821184
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cj1OnrJy;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7ba737ee9b5so576552739f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983128; x=1704587928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4wFLXxbIn9cIqBgtcCyTCV6+L5n4VmTgxmH/FR/Nb8=;
        b=Cj1OnrJyLYewNHAeDTqTybsm9PsGZaNcv6Ju2Ov04lJ0NYPU5KbhnugTVprsQwewiX
         n1mDITvkzxaooVj42ZkqjEHVkPABcUbutwOrUKmDKWpht4VhBeN0LIVwaXy2dr1FSlUd
         uYBYrMhxDazn643DUtIvi0LoOlQahPy7FwfmT2Cuunjv/RvBZhq0VGbbtkPdxmCJ7PYs
         Uv6U8qBIMOwqZN82mMB6rJ1F/qjHEPy7moKfmYiKrDj6WilyKsc1ZQ+wkpOtLwN11IY6
         DgidRf2A8lIjqRj+CgJiJWbqNX0rv7G3tyyFdO0B7IY9NGpCEXMxshNCE4YAvToXRDlX
         RQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983128; x=1704587928;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4wFLXxbIn9cIqBgtcCyTCV6+L5n4VmTgxmH/FR/Nb8=;
        b=NVXK89Uaqr/ehAQngybkTbt+UOeB1JOVihnWUqWpXuUrSbWyQSt9rJR2LqPMsRD7IV
         CLcv6vkjAOmmeW0UvXKoVWCkaRAGaNvslAvPqPbrX9UHSlGtb5bFhTdKdojNCQBbrM9z
         EE7wo/+/Gw3RxrqoGe5zv11RaC9yppiZ9GHrqrp0sE8kkotHSBru4B7J8KqexO+cHAhF
         /kzWlYcjR4MWYkk9XyaOIbO52RJ1gFzC8UuhnKZWOkpggbAM4lhlN/T48eLGuWZbbau7
         afgkTktYQRH6z7OYdayyAZccaTH1sGhroM0pXdbxe9PbxIbfKIJAnV6gfvRPpW25+Vyu
         M+pQ==
X-Gm-Message-State: AOJu0YwBU9z+VSOO0n2vDi2Cp1bbCShIjQfP9qPiRaYYv+gGZWRUEOkS
	5bOOctNQvMkYSj0Dc8hg865jV2VRKNc=
X-Google-Smtp-Source: AGHT+IFk2Hy6WiNCmvciDooTNZT51hnB5vfroX4ORYeyvll7BBf/cyUwCPV3k9hwxdGe+iqYyBhRog==
X-Received: by 2002:a05:6e02:1d0c:b0:35f:c538:8aa7 with SMTP id i12-20020a056e021d0c00b0035fc5388aa7mr23612540ila.91.1703983128539;
        Sat, 30 Dec 2023 16:38:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231229192407.2736363-1-derek@asterius.io>
References: <20231229192407.2736363-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH 1/5] python3-kmod: add comment about
 update to version 0.9.2
Message-Id: <170398312772.873206.11843343871406446350.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107945


On Fri, 29 Dec 2023 19:24:03 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/5] python3-kmod: add comment about update to version 0.9.2
      commit: 844635d0c20def5dfe8eac67434f88b3fc842bdd
[2/5] python3-engineio: update to version 4.8.1
      commit: 4a1abfaa6d6cea1e91f9c1635abbd560d78c046f
[3/5] python3-sqlalchemy: update to version 2.0.24
      commit: 7b757a77d12dbebdeec2d3a1d686983dfb1b59dd
[4/5] python3-pdm-backend: update to version 2.1.8
      commit: 304034bec199404135feaf5bebfedcbda8349ad9
[5/5] python3-cantools: update to version 39.4.1
      commit: 8fe935960010678c741c73fc3f2b76b90d226482

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


