Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155CAC47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.31458.1704682037005751252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NBBCUV61;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cdfa676fa3so1452830a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682036; x=1705286836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6GKbiRCUe3OB9vXuqdj0c+yyETnVLTpKdApcYKr4b0=;
        b=NBBCUV61khog7+AnkRAXqOH2UV1ud/jJMZuy7/GlKWotSqX12hbfHnSlb0igkV3eFm
         oh97oiWnGgescIXBC/pdIgbEhV05Cv8PiIunOXOG+e1nVccJP4iBA4Fy/SNdHUUvCaZv
         bzbd9mkifFzIujxo4Zym51X6of+rTtmFrtu2TfQJuS2wUX+fonyVkJlcUSTlPrcvToVh
         teXwXRqW6lh96KrcE/Un2ysLP6CHzGU1rT2OU/9CWyt7VAX0HHeaC0IMhYfBuWZ4y9lJ
         Q2pyuAQ9MxnIuQInbjzTr7oJlcVAHg8VLihzzEp8xqNoMhztS7z3jmj8xXy47u9LMe4Q
         ad6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682036; x=1705286836;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6GKbiRCUe3OB9vXuqdj0c+yyETnVLTpKdApcYKr4b0=;
        b=fgxbJCffSRgnkqx2MC0WKH1nJP7l0a9J2RbgxPrnGSczT+QE3SiMjxLVi8/MzEXh9z
         KrtFvJJ1G6Z5fJEUqdSLM0de25JIAuMGnWQR1UmNszhTAPm07iq+vkCfb4k4+ntXdHyK
         QFjscSdS7B74wSHLTt9OH+FGRr6OGKLBSj1p52wVTrUg5yj8G1mQTxcjhX/+aJNlHtOu
         e7yx/hUfY5+gxN4gwAF8daA4z6GgmePiSMPp9I2j43sU7SckFnBHWT9rrQKRz0aqh5Ek
         rz4jGUBB+LzYFV94igS+pUME6x54NbpiHrK45uvsgOj//o+zNeAlPKXQ4GRYNxbvTL0X
         MjlA==
X-Gm-Message-State: AOJu0YzFF2J+6YF13MHjcVjwCif4XUfwfKe7jvJc0YzXdhqTUJihXre5
	o2PRNj+nO6tNlduZjasnAgstAqv2vLc=
X-Google-Smtp-Source: AGHT+IEDtwvIsIcQWTqou/Q4mYB5981Xh5RDBeeaJOcJGzqoUDUAj6+co3hCURW48fihGOtynZWn0g==
X-Received: by 2002:a17:90a:9f47:b0:28c:a56d:d161 with SMTP id q7-20020a17090a9f4700b0028ca56dd161mr6966662pjv.1.1704682036415;
        Sun, 07 Jan 2024 18:47:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20240105061240.27523-1-alperyasinak1@gmail.com>
References: <20240105061240.27523-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] clinfo: upgrade 3.0.21.02.21 -> 3.0.23.01.25
Message-Id: <170468203577.912276.7882735833482407181.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108121


On Fri, 05 Jan 2024 09:12:40 +0300, alperak wrote:
> Changelog:
> 
> 748c393 (tag: 3.0.23.01.25) Version 3.0.23.01.25
> 6ffc5f4 Keep track of the known flags
> 8a259ee Mark ARM extensions as such
> 315a45f Fix some extended versioning support
> fd78db3 cl_khr_mutable_dispatch
> 89581d9 Sempahore KHR extensions support
> 6dedc29 cl_khr_external_memory support
> 9e770d9 Cleanup and add TODO
> 3bb2d68 cl_intel_unified_shared_memory support
> 120b67c cl_khr_command_buffer support
> a38c9cc Update cl_arm_scheduling_controls support
> b43aa37 cl_intel_device_attribute_query support
> 5b0ebba cl_intel_command_queue_families support
> c8de099 Option to handle the NULL platform like a normal one
> a6862eb Correctly size some variables
> 62bbef9 Fix typo: comfornace
> d6f189d Makefile: Define and use `MAN1DIR`
> 95051d9 Makefile: Support staged installs with `DESTDIR`
> a2d2cfb Makefile: Simplify by removing targets and move them to install target
> 7870355 Revert "Makefile: Support staged installs with `DESTDIR`"
> a3729b0 Properly indent NV execution properties
> 77b4693 Don't fetch array values when there aren't any
> efdb0f0 Show ICD loader properties even if no platforms are present
> a10af94 Older NVIDIA drivers don't support CL_DEVICE_PCI_DOMAIN_ID_NV
> a5bda6d Makefile: Support staged installs with `DESTDIR`
> 72a1ee2 Some more ext vs (next) core things
> aabec89 Add missing extension checks
> 20b7053 cl_arm_controlled_kernel_termination support
> 11201e9 cl_khr_pci_bus_info support
> 78c53d0 Fix string buffer used to report error
> e36ff2b Support cl_arm_scheduling_controls
> d34bc1a (tag: 3.0.21.02.21) Version 3.0.21.02.21
> 
> [...]

Applied, thanks!

[1/1] clinfo: upgrade 3.0.21.02.21 -> 3.0.23.01.25
      commit: 9c91e6018dc32ee337b6d2f47538ffda3742cc58

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


