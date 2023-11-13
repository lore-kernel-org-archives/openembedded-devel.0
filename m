Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98333C07CB1
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3140.1699900422787765565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N+jj63Qu;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso4132580b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900422; x=1700505222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDxw1SWhPQp3sVn4Rilfaz/kjZ7JsBIOFEYQdPVqK3w=;
        b=N+jj63Quf9+9LWl024D1Kc7hmynwxp/9ISJ+cQ2iz6kI4hoc1CZd+ZBnrZsgrLYnlH
         YGtHmHglwS7hNsdDfV/gS+b2nkdPvbO8oeoFfw2nuc9i6zqV27ve4ajGdJ9mA66zlEMx
         zgc0ESPoY1Uyn9qPyPCttvDj7VwxycHI+U9VZkAJDqc2KrgHHwJwzAWAXFnzEGziG0B2
         LoOKQeTQmHA2k6nzKlBTFsenLwhwUdzcPGqmKr6dHTcVjGQdK2+QFvMBDryLVFfBe1hl
         tStlhaAvBhMQwflb1XG9ouizKPKdRykUgqzzuQ6mtpzoWsQFUvhdss5H0iIcTFnB+/xo
         nNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900422; x=1700505222;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDxw1SWhPQp3sVn4Rilfaz/kjZ7JsBIOFEYQdPVqK3w=;
        b=Y8d5c9tRhHxGJSpVGfdweINuG3pXmREEOwD91Jp5t33fnqEj7a/Etmt3ZEB9tizaAh
         5H0rr3mjaj26ZY1KqK8QWjeHXb8ojKueIEoONZanxbbgtq8WKdXY3M6A4J1rfABRGkCf
         MXiq7uyOmIf2t31k/t8wClJ3YtnY2xcsXNxZGXv6qYgYgB4YmfnO6C0x+Yj62NOYQaZO
         tZ+AlkOI6yVF8lZOKn7pECtXRpCAsg+XHHJgPLoTypzjnYVueOYR2uYp0JSsgkcH4tgW
         wArf/cxk6TBeKW50Zs9Dm1LIwYQrtuqKPSiB4KV7v0rE12Ga6nlsQ1efOltoGqvYJZvR
         sppQ==
X-Gm-Message-State: AOJu0YwjmcCxq9r0sITxa2gRsX79tNrkmy3WGp9soOmBrBMgrcjdT1aJ
	BJcJAWxh83xaSJvRL5Oj0q5HuDSM9eyU5A==
X-Google-Smtp-Source: AGHT+IFgWpAH8+/7mhK+LQNjxBNTKRvA0iXEfiMutAHPlpr0OeIEjFWXjqKdOCSUn80O8wYfun4FVA==
X-Received: by 2002:a05:6a21:19d:b0:15a:bf8:7dfc with SMTP id le29-20020a056a21019d00b0015a0bf87dfcmr5713519pzb.15.1699900421880;
        Mon, 13 Nov 2023 10:33:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231111221848.1363223-1-f_l_k@t-online.de>
References: <20231111221848.1363223-1-f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH] cups-filters: Fix for current gcc
Message-Id: <169990042133.4418.1549428955837335836.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106647


On Sat, 11 Nov 2023 23:18:48 +0100, Markus Volk wrote:
> std::string_view is part of c++17
> 
> This fixes:
> error: 'std::string_view' has not been declared
> 
> 

Applied, thanks!

[1/1] cups-filters: Fix for current gcc
      commit: ba28b8f98713fb5b009ccbf8f12a0638598444cb

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


