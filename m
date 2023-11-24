Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235C0C636CB
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.121183.1700784062677787156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAgBbxUC;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-280351c32afso1172599a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784062; x=1701388862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dxUYJI6rEwwn9wGJ+/YJHxmJHkJDQszUSt2/oI+GhE=;
        b=hAgBbxUCIoR9b2BG5aHqVl30euyxqVjvftxMfKGI3fJpsBeOUlAzrgRKZXrd1yujKx
         30kcgH4Z/9F8fjYYmUG5GT1m2E0lSbg1hrxJLlaEWXSNkwS7zZemrfKQ6cmLcVfc+f45
         SSi78YHHQGO8APD1EVWZWlgTY3q3qJXWgl/h05VhwJXoqwS89UUipcpO/EnPAJEdw8Wb
         8AuOVR1cwH3EqSx3O9sv94ytaM8/u9rm1ncexCj6rYkD7Zdf64acGYcrO8rTP0hyFd+F
         /xbfQlueBXRtn1vOh58JQatrx7DL0ZBz8c4ibnf+5uSR3EeCIvMd5ESSdVYC7HKTXuIX
         Chag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784062; x=1701388862;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dxUYJI6rEwwn9wGJ+/YJHxmJHkJDQszUSt2/oI+GhE=;
        b=B3qZ7JJXH1BxGklwvOUM/a86H/D80UCdkp5LeANY7UieYOUY2l8N5LjNHEquHFBOJi
         ZVNkCtKq5Yi/uILY58C66bqL73J+NnuKf3suftZyTrqyJqIj6lVq01c25suBM4XLrR6F
         lRlbgC9vibU7Gw9+v8anBjxvfdVvZMlnRgHXvVO5nEH/mhWLfd29SLLKEKIQPRWtOJxQ
         yK0evhk9vkd7C9hM97juR03nudmTR54zPzbNDsJzoxVnCfzO1J/kueGehFWuJ4aptXs0
         UeQDF7cdv10x9pWKOAVnXAbcXLGQkMzVNsKlfRrU9wahXiYQOCu5cL87YOqgw3Rgwntr
         sgKw==
X-Gm-Message-State: AOJu0YwB97Elng/lxjiZ+PS5cPSL5BAWsfS/s4HZktWl9EF7AFquNpcI
	CDZbgO/a9U3rOmfPXZJXMUAMTgkFCQlhMg==
X-Google-Smtp-Source: AGHT+IELa2xi8zMcbaLBEk6VtlL29fV3uVWQagQyliS/TI6e8Ga4iBuUuzgE/cbp/w9t7wZhls/tRw==
X-Received: by 2002:a17:90b:38ca:b0:27c:fe72:6e9 with SMTP id nn10-20020a17090b38ca00b0027cfe7206e9mr990784pjb.27.1700784061759;
        Thu, 23 Nov 2023 16:01:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700633995-7871-1-git-send-email-wangmy@fujitsu.com>
References: <1700633995-7871-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] libwebsockets: upgrade 4.3.2 -> 4.3.3
Message-Id: <170078406068.3118595.8107964733229356962.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107031


On Wed, 22 Nov 2023 14:19:55 +0800, wangmy@fujitsu.com wrote:
> 0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch
> removed since it's included in 4.3.3
> 
> 

Applied, thanks!

[1/1] libwebsockets: upgrade 4.3.2 -> 4.3.3
      commit: bc1674784b4a957bd47cca32ecd63129c330c123

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


