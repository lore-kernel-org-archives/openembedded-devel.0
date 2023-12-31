Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5E3C47422
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.198913.1703983113162231415
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AsI9xftp;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d4a2526a7eso5376575ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983112; x=1704587912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWOP5FvH8LtKUu8k7r/vN6Z83HorBdkBtMnY9mUgiYk=;
        b=AsI9xftprW8yVq3SyFT1HqYdJkso+UhfzfdFPv8DKPxjPWJ97kb0euqPISPCOJ0Bro
         GRVc3L8KJDLxFB9OzEEy9H5b64KChN8MdE5ruiDSgVSSi2iqpamhzuS+FhjkzT3w0+p8
         i7zYcNHiIY7fRjamlxj3niT9gA7jM0Bu3ZZ5+sZqq/zHT455K8csQc8LKMK14Zj7nM2/
         3mfcE9eqCUO9xpCjzr5zvqlQEGTI1vlxk18/ZOBJvocSRBfLEvRbPo1+QIf/IlpmaNd2
         z/I8KXONamvZ/zNpTiqhyJye2W6bGqqo7nS1om1eg3UymrsJ03ZSnpVcXgtcv4hLw+2B
         9nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983112; x=1704587912;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWOP5FvH8LtKUu8k7r/vN6Z83HorBdkBtMnY9mUgiYk=;
        b=uK4kdwBMU2+nS7zRQzOj6RcnKfJheog1Qkd7hFmirA+4jJM7H40VMLMYNz9/CZJH9o
         uyYP3WGCFiSXcQogZ05C7PM7U1w4YVlr0Q9hwIJsvdqS3Cq8rkQt6eDXu70n8l235/bh
         sZj4O0O6wnQMRiLeIuejmiMXj43N3rP1s9i1xUdeL6Oph3TJMDfgm5u1IXatHhkOXufM
         8CLEI4yZFlYiEjox8fKEy1TMLwR6gF4K35aOHxwYODSoo+Te0O+laD3nbfiJ35yjkXgB
         XM7/xgahhggNQXvHNLzSiBvMng6h+0z9KePNEdRfzdD4/B3aTiSIWaMlqSdU5DghViGX
         Pclg==
X-Gm-Message-State: AOJu0YwGrcml6GuO77kZq7eIhSQBGSPzDh6HdQXZTUBrZCX/rHwkm2mD
	9hm1R9KBfr3tywVUl3KwP8GgJ/nDKL8=
X-Google-Smtp-Source: AGHT+IFQAOTsDci0QrRHHGzcHuKVlpsqoUHQ54Dd8ZTZI3m5q9QMlfKEHNFxL2m5gitRcvhTmCDO9g==
X-Received: by 2002:a17:90a:8501:b0:28b:d2f9:c421 with SMTP id l1-20020a17090a850100b0028bd2f9c421mr4555382pjn.7.1703983112081;
        Sat, 30 Dec 2023 16:38:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574404-12977-1-git-send-email-wangmy@fujitsu.com>
References: <1703574404-12977-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] valijson: upgrade 1.0.1 -> 1.0.2
Message-Id: <170398311137.873206.8466296099690202123.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:31 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107927


On Tue, 26 Dec 2023 15:06:44 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] valijson: upgrade 1.0.1 -> 1.0.2
      commit: bd86be802a4947266f04e014344f41853493c15d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


