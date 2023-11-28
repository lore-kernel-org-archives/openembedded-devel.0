Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CA6C46CA0
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.14756.1701215732943473391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GEh4IjZg;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cfb83211b9so30074655ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215732; x=1701820532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vVR8bH82rz43Rz4RtVsrl9yCIqS0yN6Msj5/v9jN8I=;
        b=GEh4IjZgU5t5WOjdXoEoYhjYL048OOwAVBCKtipUreWcHhled4fNlJG7Dfc99K8Szl
         gJ7HnENAW5t+gxQ9R5X2A/XEYbFV77rJXNeZWSBNrbEum1+taKGJIwTCYto44Arwmaqi
         eVN3aUxVAl4h4uTkLfQ3pcP8d9YJsYkbz11UYJtzYanhDaMD3KvnQ5Tbf6Ob3QKHuAzC
         XIV4uvLOamALS44TqGe77mfQZ6iYdh4iCDzS4M7tLVnKjZE4v6JPgI0LhkF6E3ugyx4N
         9xMN5o5507eswdcJ04LsnptGDSOHm/XufzCOMSqeHhZSqKz2/9xna3GcbA1OU98e0oin
         HOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215732; x=1701820532;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vVR8bH82rz43Rz4RtVsrl9yCIqS0yN6Msj5/v9jN8I=;
        b=VaCP+fKfeEQKkaG+u9qiuwedCGh404y+HrRkudORtjOTthq8SOj9d4uNBF6pDM/ulP
         cH+GbLjHxb+bQ1VdeJOEuvhomnd7FanbjkpyHMsbg0ODhPkPs54Scbtqq3p78ePVEE7P
         XV/oZ+x4bGOQop+LjYiXe6tmZY3BE0dsBi4vEhB1J+WPiHtraNv6adt/c8+lRwkFhk+p
         p+vsUxvVMhn4bd5d08qxhS6+dhNvBF/hJorEAxcy5KkFZJyD8xWteNt+/VQwfPoWGStv
         FzsIXROXz6t1mCF3m/kKL7uWnPekPEyD0fk/eb0GsC2+YqDt8SNTTn8ATXPoNNdP5Tm2
         GEOA==
X-Gm-Message-State: AOJu0YzNJZp4TIzhlFgawIi0lis39rUPBUOm0251C6Wd0mntc60poLQY
	7QwN0NvAkplomh5ZvaPg039mi3QRs7YfLQ==
X-Google-Smtp-Source: AGHT+IFy7AgCc4eQ1/hwHU7xouHKyW8mH31Mno85krn4dbtoNhTfHtWsJ6v6S1P8AJXMOPnLycRDOw==
X-Received: by 2002:a17:902:ecc5:b0:1cf:c2c8:7f96 with SMTP id a5-20020a170902ecc500b001cfc2c87f96mr11978164plh.48.1701215732104;
        Tue, 28 Nov 2023 15:55:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160714-28412-1-git-send-email-wangmy@fujitsu.com>
References: <1701160714-28412-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.1 ->
 2.5.2
Message-Id: <170121573096.1187527.4630232823668380798.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107117


On Tue, 28 Nov 2023 16:38:34 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -uprev pydantic-core to 2.14.5
> -Add ConfigDict.ser_json_inf_nan
> -Fix validation of Literal from JSON keys when used as dict key
> -Fix bug re custom_init on members of Union
> -Fix JsonValue bool serialization
> -Fix handling of unhashable inputs with Literal in Unions
> 
> [...]

Applied, thanks!

[1/1] python3-pydantic: upgrade 2.5.1 -> 2.5.2
      commit: 0260e1498e475899d1c13c05f928c5a886d151c4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


