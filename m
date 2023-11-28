Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D156FC07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.14524.1701215733159179821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SXlUbOaX;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cf89df1eecso43153115ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215727; x=1701820527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYoSKV/fy4owtbruEsn44yMvF/5NqrX2HMFYEBkZ0/A=;
        b=SXlUbOaXJboROHONfwlaKrFDhP8eMygomA8N946yD1e2Hwnq9Jt0x/0kUhv/L/gxGH
         xkK5+IJIW65HOGnTwGvFnkQMxZtCRMixmGME2GR0EK/xX3gxZraa+LjtnIg55VoTN9h5
         N8dC0/gEvgXi2KTr18rs+XU8TmWBnS1qcE2AC4Ost9e+Hg7JsppO7XGteqTLgRyLtU02
         phRL5V6fsiM48qGOw94qdcmJ4Py85YI9+jQZwBpdbrTt99BHqQ3gm96vi4LPGt/ukLwZ
         gJ2tdIACi/bf1NSzxrPhY/q0hKOOGFTWK0HHkH3WoAyjGTsaSiKfe3FMRN4CNiN1MuRW
         A2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215727; x=1701820527;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYoSKV/fy4owtbruEsn44yMvF/5NqrX2HMFYEBkZ0/A=;
        b=c4DNS10B1mOUme3TRiop9ycPFz7uqhthywmjqzV/EBO0+Bm8ErRSP1wn2/XXAegMAx
         dibqPN7TEoRkyuRA2SSZRnN2CYm3T2D6Kha9t94yPIZAO1TtmijwVufGUvcBXw14dOWk
         pgRO0ZMOKMwvtuFjnlW920uKj6awsU3Vi3W/YvR+b/g+KaSJz4YWMf/OYnxVB1E/3heP
         8Cobyt1LA8jwzIbytgD66xNkuuxaqvSJwvS6OVo96FKbMQnMxW79Ltz4arRyDdxinNNg
         GA2urW2bP/3fU4rU6rxYfdcgdnDyLYjEYL/Wt3AiR6xCeXLmI5wMFSRru3QnCReaK5ZV
         TogA==
X-Gm-Message-State: AOJu0Yz65IJHO0T2HXGNriXGH3ymO667JbS8OkxuE13AgaSEcYb+FRBB
	okj7u6jiLRNvglzwPuAG3OJWl3bCxP8/JA==
X-Google-Smtp-Source: AGHT+IFSlJjx1cmQHPIw5St40MLax0A8SA0uKRMJUXPd5pxGYpyV8fK2GuTSr3qF/9WhwFTjNZIRzA==
X-Received: by 2002:a17:902:da84:b0:1cf:e9c5:7382 with SMTP id j4-20020a170902da8400b001cfe9c57382mr6259019plx.68.1701215727610;
        Tue, 28 Nov 2023 15:55:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160347-28222-1-git-send-email-wangmy@fujitsu.com>
References: <1701160347-28222-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-mypy: upgrade 1.7.0 ->
 1.7.1
Message-Id: <170121572640.1187527.7492707010568746245.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107118


On Tue, 28 Nov 2023 16:32:27 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] python3-mypy: upgrade 1.7.0 -> 1.7.1
      commit: d72f6cf2f202248eff2b70d8a7a878cab8be7e31

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


