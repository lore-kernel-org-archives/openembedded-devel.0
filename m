Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391E0C61D85
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.121187.1700784069960613856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8PtxK/i;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cf6af8588fso11348105ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784069; x=1701388869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgmNrKr2g+yucEoBIifnsMbbBcZJGyJoZbq1D1hjEzY=;
        b=G8PtxK/i4g7Iax0lSLWSiuaewMZjkfK/Z8ADMvdQ4SjC1CuknIhVB6uEXP2kIjH8Or
         A2N2qkb83sn5goAWAXfoYDca4wxHFfj8Y0mKkKNNiLvArAiBx1bmK4Xr0z6U36/aUdfa
         B6kPODdCPNQAcLxUuJQi/UJul3DEgg54MRmq2NGpR1ho0LI/nYf0WNqLm5XhiAJKmH7z
         irVzv77ybBbSYkXxWYKkwkScB5Wc/hZXpAxAYxlNUMN2Rs61VES8OGH6WPFVE+UUbHmM
         vN4VVi2RO8EHHFGR5o8IjZyI+uMHxU8Km7C6oObTQsQxkIyjxAHsdq75ynawnYHG4vM9
         +8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784069; x=1701388869;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgmNrKr2g+yucEoBIifnsMbbBcZJGyJoZbq1D1hjEzY=;
        b=JUY7rtUOostG9ykGB5eLjGlOV2aDh+zY1XkpkUQg07ugmSEQdW8oofZr9x9xRYQVy2
         ua70rvTEKatqSYJtxPs/yegHWcB7YU/jEWzDzVq/549TLhKaINyKNHCFnSOXtKQgLSDA
         w5m7tttnSWd1ke3v/HxGPmQj7zRfRlPllut/X1TBf6vd816ylZ+lPcNs/6UnXFBs8h6l
         6USiPX0oj9N9iLrK9BcwmjTHxSztnklb1USCUHyYzRGeUs7RJfyO7+CiUAc8kV0AkV8d
         tfV35dFkvsEnu8UwW8ECGab34MM7raMM54eMYiXCuR41Tc7NjCQk3z326xGhYA7WgUhb
         H0LQ==
X-Gm-Message-State: AOJu0YyIYWhTOdryVu03f75+5DeykXIeW2ylnWAeLY8NYabzjXO9F4Zr
	LuiSmXK2KVPdS7lQH0Gzu0EyV7lTsm3iJQ==
X-Google-Smtp-Source: AGHT+IHrAmStp3ChF9DTSKLao6p/BM2sj9tin7omLDTN7W6MiDHyhDWqlFmHUZg2OHHh5iRtzrf4qA==
X-Received: by 2002:a17:902:e80a:b0:1cf:82de:4dfe with SMTP id u10-20020a170902e80a00b001cf82de4dfemr1148143plg.21.1700784069095;
        Thu, 23 Nov 2023 16:01:09 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634762-8233-1-git-send-email-wangmy@fujitsu.com>
References: <1700634762-8233-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.0 ->
 2.5.1
Message-Id: <170078406821.3118595.17692838125285623315.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107039


On Wed, 22 Nov 2023 14:32:42 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -uprev pydantic-core to 2.14.3
> -Fix package description limit
> -Fix ValidateCallWrapper error when creating a model which has a
>  @validate_call wrapped field annotation
> 
> [...]

Applied, thanks!

[1/1] python3-pydantic: upgrade 2.5.0 -> 2.5.1
      commit: 8c362c31388be42d8b4786592893aaf87eb501ca

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


