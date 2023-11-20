Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B59C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.43628.1700452255798914141
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aHn4E86c;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b40d5ea323so2791210b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452255; x=1701057055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdzITQAQ+LU7MBoQCgrGfJbbWl3CjrZL1vu3ko7omzM=;
        b=aHn4E86cy6dGd7M+U8yf8bWsnNANPbChhTmJkWUnfMV5UjIteSemulQlq47G7jSK7q
         5lQSbcXHkYJGvIdR8SR1nW2SjEVacj3XVObDJ8yMxZ4spaTbDJHh2867QniSPQWouCRg
         s2hnJN/yHycNVugl1qgXNz9N+7pmfY1NqxwVrk5Qtu7crYEwQ2IutVBpgtsurFSe1rSV
         /E15obgYrywC7l5rfq3/iNY0S8Mva6uV0Odbx9+edCEuwTPTtzaXvj9KcOmXngqz/++w
         iYZX5TxW6j4KKVc4EH2eEIKkg0la4aelhWjVBdW1yih0Bp0yr0B/Cy36EorSbRAF3o8c
         HE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452255; x=1701057055;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdzITQAQ+LU7MBoQCgrGfJbbWl3CjrZL1vu3ko7omzM=;
        b=hCDiAHoqrAGUwFpesFFvLJeMZpPRTngohpjkkXGht11OfyjX0flfk8vnSWhK9mz2VR
         L8eHG1B9RcfmB+UKDIkfjscjPVet79E7nGd7mpbV3g9Hi4c7hoy9ZMIktOaCAzqAJvXW
         H6qtQius3PaVaKj3q47HtSvfileyeKVuJM+wANBOfhUTH77PsjboM+SZ3jahST2obNUl
         EYJicE8X815ZZpqolA1xUHFr/7q17KO4C8NvdCaNQjQKbLVIwNHcUUsUbaYZVx8/sk6D
         POylHxQ6s79bbxIQbBVa79N3QJOcbsC7KgCtUFRRouyfsnih3PsbAPT4MRQ9+lvuSx43
         /b6g==
X-Gm-Message-State: AOJu0YwazMG8ogSBsgktIDuDMoPyQkBzmK7p1QeHQIwjzC3wTl37EkQw
	KvJkxZOTdogF88PKK7+b61qdyFqB+O6dVw==
X-Google-Smtp-Source: AGHT+IEj6/dxV5wYph8SF5tKCEGm2lgTSrDOcV43AsWDQG2QtdztMLzeo9CB/Oll/t8IxuWZHoLFVw==
X-Received: by 2002:a05:6808:1642:b0:3a3:95f9:c99b with SMTP id az2-20020a056808164200b003a395f9c99bmr7663038oib.35.1700452255038;
        Sun, 19 Nov 2023 19:50:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122555-22095-1-git-send-email-wangmy@fujitsu.com>
References: <1700122555-22095-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade
 2.12.0 -> 2.14.0
Message-Id: <170045225400.1416826.3020591108520018156.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106912


On Thu, 16 Nov 2023 16:15:55 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Support with_call for wrapped rpcs
> -Update async client to use async retry
> -Add caching to routing header calculation
> -Add warning to retry target to avoid incorrect usage
> -Drop usage of distutils
> -Ensure exception is available when BackgroundConsumer open stream fails
> 
> [...]

Applied, thanks!

[1/1] python3-google-api-core: upgrade 2.12.0 -> 2.14.0
      commit: a8be218b216225d322456f023d33639fb87f8465

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


