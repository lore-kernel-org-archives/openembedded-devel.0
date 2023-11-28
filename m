Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC90C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.14743.1701215710848162104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbg/kkH+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cfc9c4acb6so24411005ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215710; x=1701820510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT/i6MqRjzDnpCaUMyl8zYKSJvKrQWz6qYoA3vf+0VQ=;
        b=hbg/kkH+usVu2OxReZiYw4Fclj9LNACZdu0TUJBEFuzgOALN9LCxA2/suCNc0/7Bma
         fOx8Rc34pDJd9QVbIDqCrlYFQ6pscNDTFQ+aq2uiHdsvPycSLsfobhlYeyGyEAa0U4dA
         X5sxKg2pSbZOqwK9ZPo5JOzRrO7cLiXxuLCtebfFaPl9Qn1HPNk820rDo6DfizknDQay
         w2fT6MlIxiz6uDrdVe8+esFJMv+jjQvkm/aCRniMJiXTUVOp1oXUzqE0PH5KobikTGk/
         HvYHWEXtYX1Q6djBbBULIuJ9Xl82ODQOeQJ1NeodZF6dUFgzJ6ZtG4cn1Dx5gaLUZWFd
         glQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215710; x=1701820510;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT/i6MqRjzDnpCaUMyl8zYKSJvKrQWz6qYoA3vf+0VQ=;
        b=t0KI3JRB6jGrjEX5Ewt3254yJUKPXoV7QzPSo9y1u1GhFesUXw5Ac/qmfx/zIWciJX
         qSZBDZjNRtPp5BQm5IZt96pPLJyMObV/GlRBM063JizAIl97irXonXPVDjBS673aRlTA
         r7bNiNu9UozaUfY0X5PK2AJp6AAJwxhQs/wFeUy2cDoulNYDcHaP9u2csxlayuPJXeC9
         tQrch3qFXeQn69OaNVOXTI14hf0yvAhiNLQy9YIK5SYMXMutT+u1XBHFRzcULu8d1HA2
         o6L7DBXcKtRJW+Btm7w2ApCuYqnE9mQtASvnuLHLoC66LDgy/Vnh0IGN1A9m9IbKr0pp
         uvrA==
X-Gm-Message-State: AOJu0YyZBndNNdkzi1BiUxHD72zHnBdxn5/0RLU7nt/itvi/l48vEVx+
	7ay/WSGAWkl5KX9dzI3Kn6jXBAeNc5Wc3w==
X-Google-Smtp-Source: AGHT+IEv6KYo0KAar/TBbupHxpurDIJU1D7zxXuWMuM4/U4WrXMHQuUpDACZDQaTICgwMlbUAye+pw==
X-Received: by 2002:a17:902:e5c8:b0:1d0:16b3:dff4 with SMTP id u8-20020a170902e5c800b001d016b3dff4mr113451plf.51.1701215710192;
        Tue, 28 Nov 2023 15:55:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
In-Reply-To: <20231128081643.860449-1-hongxu.jia@windriver.com>
References: <20231128081643.860449-1-hongxu.jia@windriver.com>
Subject: Re: [meta-networking][PATCH V2] freeradius: make sub packages to
 runtime depends on freeradius
Message-Id: <170121570890.1187527.7892652101654848252.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107101


On Tue, 28 Nov 2023 16:16:43 +0800, Hongxu Jia wrote:
> Otherwise install packages reported warning at do_rootfs
> ...log.do_rootfs...
>   Installing       : freeradius-ldap-3.0.26-r0.corei7_64              1235/1236
> warning: user radiusd does not exist - using root
> warning: group radiusd does not exist - using root
>   Installing       : freeradius-krb5-3.0.26-r0.corei7_64              1236/1236
> warning: user radiusd does not exist - using root
> ...log.do_rootfs...
> 
> [...]

Applied, thanks!

[1/1] freeradius: make sub packages to runtime depends on freeradius
      commit: c6dc0174389ebf20f36f40286c0550ee0f815e53

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


