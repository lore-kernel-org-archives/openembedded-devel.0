Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376A3C5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.43624.1700452290710890647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gKQDHQ3T;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6c320a821c4so3260759b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452290; x=1701057090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DenO4V3RGsulm9zag4u1RhSXYYwB4V9xWJ0/aKvnWxs=;
        b=gKQDHQ3Tr0FZLmqYOvy9Li2YKpLFRXaOdnSTQ1ONIH6+kLWBwDJF/TAm9NrkhcEu6G
         ihs+0ru/hVcOI18GsGhv2wcNZCRTVn9KPCtvpUqfmT+fg4y78xnCLfsv2wox62zJRCKa
         2qIlyyfXDZZjjo44AvTYGJDaY++nsvpG+pfKlmDIrEAk+TfVFiScUEP9XCMhbwxTBwDM
         1/c96xuKwqsiRlwjdpWbIn7+NFViGwoq3V2slayqFbLZUvb24PINqk45mwXZsjDpjXC1
         a2zHnng0MlGLi2uNfUqf7PnN+mEDzICrYfsA8/vqsrRUPmemh9JxyEOH1zny1QCvKeb9
         NSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452290; x=1701057090;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DenO4V3RGsulm9zag4u1RhSXYYwB4V9xWJ0/aKvnWxs=;
        b=Z/QfHYFXQemqsjUJNDqOPE+Q4bRx+BpkE2OC8S8Ve3FTQYYCMETvw1mQTY3fkDOlF4
         D//V+uaI9yVgEB7zg+0168MQ8gxhwKgx6BHIf+xHmrv5KHmdNU+ZIL9QF1NgmwtiGK3R
         Uj9KB9gSOVsMf/xiRwYK96sntPIIOGuHCsk2+/Dk5slwyf8NuKD74z4yXfF2Mul6SqLK
         8j715Aa6BLzH6NTaA8DOI3Wt9x8KJownqIZMZo453fWWSiPcQgF7pV1JXgsp2vOJTkKD
         tmeKswULpPOfqQ9AZsZ1Xj13btuPvIO09jn8mY+QxJ9ROiTefsjrrDw3su3SdRFIW5XB
         goAw==
X-Gm-Message-State: AOJu0YwmAlCFHO4EFB/Gyxbt0C364NseNzt9N1PHnbiSNttxijbCzXYk
	dH0Hngl+Cepu5eBMrOzFe5dOxFyt2myXiw==
X-Google-Smtp-Source: AGHT+IHczsf8+kDwHbCHRfK4aki5v38FoOB/MTU/IPiHneG8Ze3/T2Y3+RXjsRoUQSwFVao/vpk9lg==
X-Received: by 2002:a05:6a00:3492:b0:6cb:a0dc:3d56 with SMTP id cp18-20020a056a00349200b006cba0dc3d56mr1425454pfb.0.1700452289852;
        Sun, 19 Nov 2023 19:51:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jan Vermaete <jan.vermaete@gmail.com>
In-Reply-To: <20231116184546.27787-1-jan.vermaete@gmail.com>
References: <20231116184546.27787-1-jan.vermaete@gmail.com>
Subject: Re: [meta-webserver][PATCH] README.md: was a Markdown paragraph
 and should be a list
Message-Id: <170045228904.1416826.9895176930322815336.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106945


On Thu, 16 Nov 2023 19:45:46 +0100, Jan Vermaete wrote:
> The Markdown was, at least at github.com, displayed as a paragraph.
> And it reads beter as a list.
> 
> 

Applied, thanks!

[1/1] README.md: was a Markdown paragraph and should be a list
      commit: 1739239813ec83207762536bf364d84450d135d8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


