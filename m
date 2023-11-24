Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A89AC6370B
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.120988.1700784066421700825
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=li0uIrPt;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cf89e31773so8975045ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784065; x=1701388865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJ07FS/ELBalKLFpfmPep0SSm+dTkw13/ZQCE2a4AUk=;
        b=li0uIrPt84TO57RTqE7LvBH5/GRCwsQm+jmi8TadRzEIkQ8k7r2Z+sY1pJ/EULsi2I
         Fjzs+WUVorFFpT0OXvmPpIHcfnzDkWeoLbASOPpW3GbwrzOBULYqS5LjZuSuN1EwMgYl
         f1uZErX64g5MYIIJET4m7tuxp3tGz8noyjy09/O9PAV/wo0ycExkjuf2CjBNVq+pLBza
         zm1te7x2Qxc8M9ywoOSDfULFD9QZWkU5o86M/9eIh3/5KMC6jz7fiuYAwjPmsr+A+jT8
         aX4uHIdL0BbjRL0ER8gk/t7W+Nu60hsEooapn+8v+5XKawcRem4/LB/ReDiA8x6hOM9C
         xWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784065; x=1701388865;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ07FS/ELBalKLFpfmPep0SSm+dTkw13/ZQCE2a4AUk=;
        b=sWqGhtF9U1ypeB5ND5OB41bKe8ve3GNkAM3dXpDk1lBeTBfBX5MZGU6glZx0Sa+M9I
         uzT7hq3wTV4k650dwO5rO+olqv5CYG1WntfZc0/j1+oW8r6ph5uLUo+XEObNBt/T+KoX
         bQrDeMXBzOebl9mA41jYo+2pH83vKHbMtVqpqauu5fUnJQa8nTepWTvhqGPa/0Ais9pO
         dv0kv8UE5Zj9GQQSgxkItJm5HnDYE3UYfv42gR5NkGjb3ztmmdr0XFe+kKyjo5blnqq5
         l9Sc/uwPcV0ogdIyD1rdjtzR0myt+k7DHdKAo/8PhXK13Mbrkp9HzDMK6BnGoVYqJXzr
         mqLA==
X-Gm-Message-State: AOJu0YxKF04UtnGXcuhHjvaIlEbMNIjsY6/nkNf6hbES+CBQKnL3oy3K
	qLPY39Ctbcq9+yk3qi4LWIMUviko7Or0eA==
X-Google-Smtp-Source: AGHT+IF5z99mHvj8f+xMWsf2svA4ZOAy8koJLvWyIVmwl73E8nmsAhUUPBk067FKFpcOq65l4sPMkw==
X-Received: by 2002:a17:903:1205:b0:1cc:5589:7dba with SMTP id l5-20020a170903120500b001cc55897dbamr853474plh.43.1700784065512;
        Thu, 23 Nov 2023 16:01:05 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634188-8037-1-git-send-email-wangmy@fujitsu.com>
References: <1700634188-8037-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.32.0 ->
 2.33.0
Message-Id: <170078406472.3118595.11045794029120539419.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107035


On Wed, 22 Nov 2023 14:23:08 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Update pyav plugin to reflect AV changes
> -Unpin Pillow and allow versions >=10.1.0
> -Support for AVIF image format
> 
> 
> [...]

Applied, thanks!

[1/1] python3-imageio: upgrade 2.32.0 -> 2.33.0
      commit: 3f54dcad53ab7081b0bd75c6503b8de2bf3939e7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


