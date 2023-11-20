Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF80C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:25 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.43645.1700452282713687038
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IkVafY5/;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dae7cc31151so3556412276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452282; x=1701057082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GR4lWqvpLCUINnmXlbwihyXFqj0mogpDAgROnxcG+yk=;
        b=IkVafY5/7GwSiiRYSupUDuVSYWT8QqXve7uG0hY0zsawIz45QyNxLb0+NOMGeMkmfB
         S+HgJIbHaSzu32auw7PVcHg0l7CcvTE130sOA1g+2oilCh8m6tcR0O8xHSBgJ4PMwaAt
         5nQvHjQwoKSlfRniLDBrqSZkPG1mdEAYsUBOhNta8FfRBSsQFGyvaCDdAD4eroY6bVIz
         yb8lkPfHvXqR5EQXzlkmoNA1tPSPTOfH4605F1xzFaviFzradS2LgihrrpVoZokHsXsN
         6LeC9mj/MoWG9rWvXJIlJSCGRBp6CgxVI7bbGosH97VGPRAjadjzqSLpsTqol0zZTzlL
         IMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452282; x=1701057082;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR4lWqvpLCUINnmXlbwihyXFqj0mogpDAgROnxcG+yk=;
        b=ilfOg0ZNIuRQZ3UJ4dF1L0KKlqSbUYKO/oQzo8eMu1U+vJFKFBnI9bGiv00IBnoPoP
         RdpdHqMi6mveYP5fKD+fJ4JkRpdWOJ+poy4KDLiWqZIub0dr10jdfj4vhaftdfTo4ydO
         PdGfyUVhWnvsQKDgxEaiGRANW90f6CB8NAWp6qvBgrRsQhytt2pIeSwLCHOZKEm5nD03
         daXkERtKZWCEZudbaNKqtJHm4vyHKEN7ynYuVG6eUOA4/ofkPxLVyNofYUcFvtHLHRdY
         ad6PHCkMVuHlci7uUH7GvPVUIBL6ZYfqYbg+QiwVQqqnPtw9Xq1hQ0IXzNkUWJawy7sm
         zHbA==
X-Gm-Message-State: AOJu0YzNX8N5ed9rPLUfOm7LcAB9TnXtOtOcKmfyKFlWHSQKXwGslTv7
	4kWvfvYd14FfsK4373m+Z37/N7eBgvQYiA==
X-Google-Smtp-Source: AGHT+IGHbclk6ICHGmsne9cHCDYQgIKj5UNdN+GU0i9itmfHLxfralbY1vM7GHDbD/JNGb4K16dP8Q==
X-Received: by 2002:a25:cc3:0:b0:da0:7c0c:edb7 with SMTP id 186-20020a250cc3000000b00da07c0cedb7mr4401147ybm.1.1700452281764;
        Sun, 19 Nov 2023 19:51:21 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116140603.1063254-1-alperyasinak1@gmail.com>
References: <20231116140603.1063254-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] botan: upgrade 2.19.3 -> 3.2.0
Message-Id: <170045228109.1416826.2725675647834885319.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106937


On Thu, 16 Nov 2023 17:06:03 +0300, alperak wrote:
> License-Update: Copyright year updated.
> 
> Changelog:
> 
> https://botan.randombit.net/news.html#version-3-0-0-2023-04-11
> https://botan.randombit.net/news.html#version-3-1-0-2023-07-11
> https://botan.randombit.net/news.html#version-3-1-1-2023-07-13
> https://botan.randombit.net/news.html#version-3-2-0-2023-10-09
> 
> [...]

Applied, thanks!

[1/1] botan: upgrade 2.19.3 -> 3.2.0
      commit: b18bbc7467b9ececc9f20ee4b084dee50ff085a5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


