Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A2DC5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.43602.1700452258544998929
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8aAn2p0;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso3521945b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452258; x=1701057058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOjMtixbq1aFNp6g44TJ0VGOjWRsN9LjNVsi1id6KOk=;
        b=T8aAn2p0/KaZlpaZGkjfPTm3P/nCwT+AZDXJjb9q5akRtzVpsUUJmFFzg/v4g4UZvs
         WvGH3YO0s09d/27IEwa6JA0MpwlWuq0vbwFFjIFv+FSB2mJsAuHAVNEyeD1UiMNeUmPf
         Gg3W0Jogk2SRMSvvfziDGxmsDLMYFYCAqgVGy8hiYpxXMtWUvBB4+8vpteivl49V8dqb
         HW5VjVtaznChWZyJTXYG78KRryltrQALa6oBIGI7Tw+hBwEHXAZmEM/WWuNwd89Mul36
         GxJ/t1kdQfP9STlvgyikPzLrOOrpYZZYKAclmE68nfBfvHIwrXwvlqFKVqZHNJ3aao5n
         q/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452258; x=1701057058;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOjMtixbq1aFNp6g44TJ0VGOjWRsN9LjNVsi1id6KOk=;
        b=Krapzstdk4jCuZREzaTRc6vbLkmDfJMI4u/FPtdEA4m7lL7TpB0T5rO4qq7z5YQ6+H
         SKuSLGYT4NwktGLixY/F+izs6wN0pyMMH3Lzo7ymKCb7y/H71L8fZz/Mi7nWfjmRVkbo
         6YiCCZIsfTRdmCnMj6zJTMiQYKMStThvwApHQEqVsENNMI8J5IVRMUZIKvo+fN6JvAGU
         Kxb+87FuQmvyXtNxRJTb9oKLqbubobymg0ELjCDs2sl+zsPK2eURsXQG9A1SHJbkGYoe
         bPEg4/i3HxpZAmW2X7H5xgW2t0IqdPLtbXzZWYu5w/xt1SR4Em9iyRvodncKLn3YjbE/
         xCPA==
X-Gm-Message-State: AOJu0YxDFGtk255BoN55NVjvXRISOChjm8pEbrhRtKZ0o5ePndK3KxqO
	n9EOvWyb0NiKYFAiKLf+oxRXNYCvlwk6Qg==
X-Google-Smtp-Source: AGHT+IH+IexvG01gpfTtIdQ0JjYWb+k1kah0fvfOcZVioyxh2WeVXvk7FUZyb7XdNj76DW3PIw/trw==
X-Received: by 2002:a05:6a20:8f08:b0:159:c07d:66f0 with SMTP id b8-20020a056a208f0800b00159c07d66f0mr8466354pzk.6.1700452257818;
        Sun, 19 Nov 2023 19:50:57 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122799-22227-1-git-send-email-wangmy@fujitsu.com>
References: <1700122799-22227-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade
 3.11.0 -> 4.0.0
Message-Id: <170045225698.1416826.14038335893061165501.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106915


On Thu, 16 Nov 2023 16:19:59 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  site_cache_dir: Use /var/cache again instead of /var/tmp on UNIX
> 
> 

Applied, thanks!

[1/1] python3-platformdirs: upgrade 3.11.0 -> 4.0.0
      commit: 00a2bf791c041cd48a6b82581210507ef9fedc26

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


