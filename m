Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D00C54E71
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:29 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.27097.1710706704252632846
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VYfJtBKR;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so2274633a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706703; x=1711311503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFdEVAMSXrCJ88sbURiYSI4u0eEPBKDYagIuU+ZwIEs=;
        b=VYfJtBKRI253HvZ1aQe2p+mmqhQ8yQ60w+nd+j/2gQuZ7aF2VBJOVYVhbT66I82E04
         AWTXcSNcq0VjR8LvFtGyALkTH1ZjpFVC/OVzSVRcvPmOsdKMuy8n0bKb2+JnEVJOty/4
         M55NQCcNoFwLlViiF0AoawISn25g8IjT1jlSzypOzM8ECU9IeFrHF4yHJfUFWBSLTLS7
         6djvNVvZAuKv0iKG8fRjBF8MjzQdYOVOrJXM8Wm1ufXonpDLD0NrM+3shAT4GO2jfxS3
         uFogaWjQScBdIXKx6n+mXt3dXd+2tazLB98lF+T+sAfbCO3kFPDGcrKmXZxHEO22/w1N
         mTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706703; x=1711311503;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFdEVAMSXrCJ88sbURiYSI4u0eEPBKDYagIuU+ZwIEs=;
        b=v/h1EE/oTfaAzsVRmLTKsssV3++BfHrPXBSMmwwVrZx4DLS2SlTcppnLNiGLqsppB/
         90lvCCJEGapn8QoTNrsbo3U/saLfMwmRcZ0OIU30H0hEHqB9ZQA+Ut/z+PkUTHUMfCkA
         FQI70Oo54tMMgNShgOz1XYe5oGNpagDlufOCIvMjW7xC9SOwN5Z2dKGTEmzeKmCznDBE
         527a2aHQ3o6t1Asu37VKSJnb4fZvGBExYp4LqbYMafRdAoFkf8ICNfYxJLeLq4taxfD4
         78FUtwYM0gZAiKYkRIcWX2+XIkTN5dTY4f7LQA0gdfhUyuBfObFk4V4iW+A6e1mIHWIx
         IDvw==
X-Gm-Message-State: AOJu0YwjFcrfZtYVSLVW6KTQAHgI7iZHaJZsf2/jEex7y/ELULMyZ3g1
	To6PmEC3+smjtyE1xjvBg8ds4dYGAgRnOBseZBDeGO1g+mlz57ZmS+APOYm8
X-Google-Smtp-Source: AGHT+IF/cNOWgXuqeYE1LoXg1bCDmSJafH0DYcfPpz1HsorTp/Vvw27Gqr+Up/3wJyBWYbYTdiN9Fg==
X-Received: by 2002:a17:902:b405:b0:1dd:651d:cc47 with SMTP id x5-20020a170902b40500b001dd651dcc47mr10413895plr.28.1710706703463;
        Sun, 17 Mar 2024 13:18:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, changqing.li@windriver.com
In-Reply-To: <20240314072215.6854-1-changqing.li@windriver.com>
References: <20240314072215.6854-1-changqing.li@windriver.com>
Subject: Re: [meta-oe][PATCH] postgresql: fix a runtime error
Message-Id: <171070670280.939783.10383485128998104107.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109382


On Thu, 14 Mar 2024 15:22:15 +0800, changqing.li@windriver.com wrote:
> initdb on target will fail with below error:
> 2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library "/usr/lib64/postgresql/dict_snowball.so": /usr/lib64/postgresql/dict_snowball.so: undefined symbol: CurrentMemoryContext
> 
> Refer [1][2], for cross compile, --export-dynamic is assumed as not
> supported, and cause above error. For oe, both gcc and clang support
> --export-dynamic, fixed by set LDFLAGS_EX_BE directly
> 
> [...]

Applied, thanks!

[1/1] postgresql: fix a runtime error
      commit: 8aec805ac4b5f59a7716dad18461eeeb84872181

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


