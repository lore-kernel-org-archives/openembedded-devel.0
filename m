Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D230BC4725D
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.198921.1703983123028094386
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKm9shei;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7ba903342c2so553771439f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983122; x=1704587922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iswOehfCajivEkMOhqf7AfTHFy2cSpz7r1Myduh8M0=;
        b=kKm9sheiuxkYhvlvhbDaGfNyJkGiwE214n78ikdlVlMHHbCudVvw5vsuytiEC7cjJm
         ZiXygKroawJs4Ag4IWokL5CCPs4PTDJWFwgqxW3vLKvAjCV664o/LuK9HKOplgJcmvZO
         EAYBp2filCxCDz9pr0/94/z6vmBZ1CCJsLFaVGfCCuM/Ig1wnrnWM2xrhPwVuDlaQAEk
         ktj3FdAH4QZ50i89fjncNPc93QHMSx7/2dPM/old+9uUlyv7IzTCUMF/Zdli35EWzCFN
         TCY83ysZtsT9BZbJRbi4E2e2h2BdOOQfj7mxLWfNPfppfuB3zb3SVYPbhqXhW7y7Iq9L
         gkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983122; x=1704587922;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iswOehfCajivEkMOhqf7AfTHFy2cSpz7r1Myduh8M0=;
        b=oD4vRXiwEP9NUo1MnawY2opLEFiiou5X21gygVqbiMx44Ys4S0EbIRHFx6IKNtTF2q
         t3V4pV+wwZ/PBkHwQBNziQyRbNzxxRq6HT0mZwgdqcj8xxA3Zp68zNP+9qNfYJ8uzRj+
         J5Gj7BHLKPN0vAtcmJwMsXawC1kEmUAAnYIWoQIfW6aqNrhGj6UYyF5hLyHdrqPLMrUS
         0Givramd6aSbE/33c7y07/qH+QvQ9HVWj7ivDb4C12Vc/yfOmfPmGewpluNITNOeSUyk
         6SEQQ6SDi0UjC1HQjtpxIfC57F1TfE3BunXMB2lDtKtM/wZp/QlVnPUiZDr5bcru6NpF
         KYSw==
X-Gm-Message-State: AOJu0YwXFOG9xdfcfIsXdJeHmx41UuaBJ3pJctwur96lJS+XdxktKWGO
	a2LWxfK594ytNi4o40bSBeodEKqCBDs=
X-Google-Smtp-Source: AGHT+IF14QC3ti3DgaGjKp4eI9E8L2bxBUq4g3PotTIPT8mJSk/JDtw5QIVu65vL68nl0+1cmKnn+g==
X-Received: by 2002:a05:6e02:1baf:b0:35f:f11a:4655 with SMTP id n15-20020a056e021baf00b0035ff11a4655mr20579968ili.71.1703983121835;
        Sat, 30 Dec 2023 16:38:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703580069-13948-1-git-send-email-wangmy@fujitsu.com>
References: <1703580069-13948-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.3.2 -> 1.4.0
Message-Id: <170398312110.873206.11953825017481170900.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107938


On Tue, 26 Dec 2023 16:41:09 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] zchunk: upgrade 1.3.2 -> 1.4.0
      commit: c0de3223bed81f9c0d2c5e11931091b72357957f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


