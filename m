Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F201C07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.14512.1701215717425596926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpFmqlV3;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cfc1512df1so24538525ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215717; x=1701820517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D7jFAWelMBo4ngOc4ymuypMpP8B7S9ApEVpgyGYIZY=;
        b=mpFmqlV3fuq6K18jx9RGp1eclOnbdLLRFHA+1xqzJDyPRXzc+UcaDYBqoGk3hu6Jmq
         sa4VaV2gvsVjwacCLpPQX8HnLwFahWoF74pjyjsuKw/DVnHcqBpIamoo+aEOquxuzStG
         xS+5gQBilzJIhvYw92vewCUFBJyshSKqjcWlnV5wp2IxQs1WE0amdwWWOUnIf6HPtRLH
         TLCE28f62UMt7FyB7aw2XRD7IfnMeShZvPzYAudAeJ56239ZsCEoTuTyB/4FEcj5o/eB
         23qQCT/9bpGRh/5GdUtxTBq0UEy8hTRdGgJlq5fS9RhW1mUAvBciEdmwvMZ825F0uHGm
         1dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215717; x=1701820517;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D7jFAWelMBo4ngOc4ymuypMpP8B7S9ApEVpgyGYIZY=;
        b=vAAuck2FyQIxR7U4BrJLT9ROSXS475NQI3ntqSfupovNk7z6fIqEXF4j4M/t77d/NV
         nyNn/aQ/jLP7krZxYfpzanKomrtIsnQulB3HdXuEu2XbTEvs1pSX/unKYvESQEK0RBuh
         2NTAQxgppQVLsaIdXap7quCWiD7HvlFU8yPXrLUJeaePLOTnjV9Mkx/tH0tg1nwD59Ty
         390T0m7vJg/OVCmF511w0bd9Ntpcv6XJh8cu8/tjEenh9dDFqZBsjHZqhwEd8Sa4/ynk
         BCDqBx6EPp4b3+W/8s07sVUPpJSg3Aa37XwIeQRtDwqH/RqtekL/YTtdmGrrPLiE0moU
         TJ/A==
X-Gm-Message-State: AOJu0YwZqq8N5/QGIpt6fBTZ2hcS4yB6yYpMTXAeZeBDhMHsM8pU7qng
	Pw9Dwarx94iKMD/kLSfLiJ91B059EO1H8g==
X-Google-Smtp-Source: AGHT+IHd54w4jRvHIVnwdaT27UCRlY7F6guVfMEdDHWJTnPIjJc0u0gERqJXfMJMBjam9d2hZ9yNGA==
X-Received: by 2002:a17:90b:3005:b0:27d:3be:8e13 with SMTP id hg5-20020a17090b300500b0027d03be8e13mr16436694pjb.12.1701215716652;
        Tue, 28 Nov 2023 15:55:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159642-27881-1-git-send-email-wangmy@fujitsu.com>
References: <1701159642-27881-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] libbpf: upgrade 1.2.2 -> 1.3.0
Message-Id: <170121571548.1187527.6753646554935628395.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107106


On Tue, 28 Nov 2023 16:20:42 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> https://github.com/libbpf/libbpf/releases/tag/v1.3.0
> 
> 

Applied, thanks!

[1/1] libbpf: upgrade 1.2.2 -> 1.3.0
      commit: 9d050771dfcc6be60d8e0c136b96b7c5620b2dfd

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


