Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8CAC5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.43604.1700452263412037195
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dVeuRtOo;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9beb865a40so3687334276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452262; x=1701057062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7p9wlgGieigUBeXtlOicnR4xAMdyH2e2v4MWFAYP1aw=;
        b=dVeuRtOoYBoUY5CzVEHWIPcNOhXyuokPwETFe29393GyI5SOFoEzlDoP1CIRHgSY7L
         DyBp1BqL2oZMuPqnNCjfG2WbICcUkB7cgOM65mzTgIVQoW62m7jdyp0117V0k7bK4L35
         9C/MouPxjIfl1cIWzVf1mj/sWTC9vEGVgh3RE6RL+8HIchjoZq2mkoglFIxzwHwMQ+lG
         narxqqv2t+Vh+PFRmtf9ofrE/Xa6P+LI297q5A4zIUAroSmMu2nll68ugzppHfradPNF
         Hx7HPR3suYuZ7KATR5xVkz/0ESPvc0hVQkX39pVe5jwEpECJhmUNPDIOoFLlRCbwqISB
         SNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452262; x=1701057062;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7p9wlgGieigUBeXtlOicnR4xAMdyH2e2v4MWFAYP1aw=;
        b=ssAP0/Tff8jH0LAF+vj3APplC/10yf3yP8o88Emu9LDSk5z3NqlaQmkJWZBTYawZ/1
         hIu33dnhWmqnhMyPLRlvnyCAx37zIXXNBkbbZxWKjtufEkzJ9RFhMfbWEfsQ2jgXxqY8
         wx9HQ0tIQGmZ2M2BHjPfP3PkF9BEUyKLMzOL/HgDxKhrRaEbNAYR8j6wLxLlaPzjwQGc
         4S1vPQTSdDYXKr6vkySgEk0K1hDwPrgkZ5PXVCWrHCAsZ+raRZjy7oz1S/Kt8K4k4q+I
         li98HNANWYIt87Gi2fRMOhZ2O2r6T5McUzIIPwxFhZX0VhMtYwugyPs1bfZZSOvY3GkV
         9QTQ==
X-Gm-Message-State: AOJu0YwtA/zRvi+QS5kdu8kgXW9lHnyxqdGuOx9s/QtbOGHZ467c5bF9
	Ac/NC6vxrXPatGGQA5tvE1guI6CC3sYbSA==
X-Google-Smtp-Source: AGHT+IHKxBRCSivIrii9yzLz9ruMA9fhmnw3tfMwn4L36SjdWsM96jbxilZAHlpHAE9AMfVDHpJH4A==
X-Received: by 2002:a25:8a81:0:b0:da0:d005:6bb7 with SMTP id h1-20020a258a81000000b00da0d0056bb7mr5439028ybl.1.1700452262450;
        Sun, 19 Nov 2023 19:51:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116083050.132470-1-alperyasinak1@gmail.com>
References: <20231116083050.132470-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] ledmon: upgrade 0.93 -> 0.97
Message-Id: <170045226171.1416826.9963399304107160562.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106919


On Thu, 16 Nov 2023 11:30:50 +0300, alperak wrote:
> * License changed GPL-2.0-only -> LGPL-2.0-only
> 
>   - LIC_FILES_CHKSUM changed COPYING -> COPYING.LIB for LGPL-2.0-only
>   - Changed license headers in required source files.
>   - Changed copyright years to 2022 in modified files.
> 
> * 0001-Don-t-build-with-Werror-to-fix-compile-error.patch removed because fixed in the new version.
> 
> [...]

Applied, thanks!

[1/1] ledmon: upgrade 0.93 -> 0.97
      commit: f13feb0adfe150c922756eef366a69ccb1f1c49f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


