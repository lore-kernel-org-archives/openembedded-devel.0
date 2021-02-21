Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.23375.1613930555328502296
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 10:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lcUBdYMB;
 spf=pass (domain: konsulko.com, ip: 209.85.222.177, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f177.google.com with SMTP id 204so5629418qke.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Feb 2021 10:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=gZ92J8F7+vbJtz9KGTBXFaF4C8XJ5DOz1PMfvOUwHL0=;
        b=lcUBdYMBo9JNPM+glEoILH9/K/ie+I/w0yZi9oZ5TkJx6I2QmP2ZPPQsTRd+wzX72G
         LU4n0lG1BCecsivqbw98WBwB/EXklJL1nm/7hDoofFKvydOQfFHxGFNF9ebGBuNTpmWE
         FKB8fa40EgK4VGgumIWtd+vKWlekdTn5r+tuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=gZ92J8F7+vbJtz9KGTBXFaF4C8XJ5DOz1PMfvOUwHL0=;
        b=M+TPifPJIuqVD/0mza9kEYJLWDWqv+d+CYQbGXMATZOj0SDpn5qKkz1SFJlqNlvb8f
         4GFt75UNiGIKnJobCISrJsPVVA24+NZ8kTrLmL5l99g0YSjCrEENTLjCQ/VZs/qsFSDJ
         q9B+GGyIi1RjSASE1Nvw6d5SpBCFxEOnjlpjsJhzxu04y6ZI8d/nYbVDOkEmPlbMzPaA
         TK91AQ7TyyHSR6QBQMOftpCuSAPZHaveFQoJ1CgsHgyddICAJMKWbgd72ENMgCXS4JOh
         T4BRg0IrXeNzdmvmyOQu6M5dC4AWimKZAexM3Zr2RriqnAss4VhLWtKX4DibluPN4xYx
         tovw==
X-Gm-Message-State: AOAM5303clMBfNAgqo3XiTiJ7WnwwjsOt0azxGeD42F8SqFN/Z26Vkop
	PbXib+NT5tZbT7UWQk0Rk5bNaw==
X-Google-Smtp-Source: ABdhPJygDpYqRxwiDeak47OCwcdB4XwG968asnw84aucGZxmjUgfERdII6l4R7VIDeZFJrntvnsoPA==
X-Received: by 2002:a37:65d8:: with SMTP id z207mr17505323qkb.479.1613930554424;
        Sun, 21 Feb 2021 10:02:34 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id v4sm140652qtp.72.2021.02.21.10.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 10:02:34 -0800 (PST)
Date: Sun, 21 Feb 2021 13:02:32 -0500 (EST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] [meta-oe] kernel-fitimage: Fix CVE-2021-27138
In-Reply-To: <20210220214042.4882-1-klaus@linux.vnet.ibm.com>
Message-ID: <5a8c8c64-137f-ba2-63b9-59e878f3307f@spiteful.org>
References: <20210220214042.4882-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 20 Feb 2021, Klaus Heinrich Kiwi wrote:

> Das U-Boot 2021.4-rc1 has the following commit:
>
>     commit 3f04db891a353f4b127ed57279279f851c6b4917
>     Author: Simon Glass <sjg@chromium.org>
>     Date:   Mon Feb 15 17:08:12 2021 -0700
>
>         image: Check for unit addresses in FITs
>
>         Using unit addresses in a FIT is a security risk. Add a check for
>         this and disallow it.
>
>         CVE-2021-27138
>
> Adjust the kernel-fitimage.bbclass accordingly to not use unit
> addresses. In addition to fixing a CVE, this is also required before we
> can bump U-Boot to 2021.4.
>
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
[snip]

Please send this to the oe-core list since kernel-fitimage.bbclass is in
it, not meta-openembedded.  I would also perhaps be inclined to not
describe this change itself as "fixing a CVE", since it is the change in
U-Boot that actually does that IMO.

Thanks,

Scott
