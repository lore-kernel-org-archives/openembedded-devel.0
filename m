Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E790BC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:54 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.43601.1700452253713513453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVaKmUTm;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1ef36a04931so2492340fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452253; x=1701057053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgYMd1mWJEL6vukpPBlgCnVSt3QWyDkvwawp1zmiFT8=;
        b=kVaKmUTmqVhjRjEu8HissCTbIGRKoSLM9NAqmLQpQcYTXfaPEMWnmXCEUy55x/un+G
         gpEjgz6ZIlJ9HPRIbYACs4zLnrPVm1okwEFtDQ5r/DWOZ4ChfTrv6By3T8X47LsGgPib
         pnBxSZV3Lojdgipkwc3pdoIKdqB7LMqBkPjWYRICh8bOxeHFMbccjxrOdBBQcWynotcP
         olGswM4eSWP485gSPN5SY1p394hKVDyA6hHmSQCuR/VYW43tydScO5T+PDzMtFo4nmi0
         LEnstZaPY4GzpDKknPrHHwXboi2XLotvGqEZQKSfppQZz1L6Yheisl29uzD7+IWlPrmz
         pDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452253; x=1701057053;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgYMd1mWJEL6vukpPBlgCnVSt3QWyDkvwawp1zmiFT8=;
        b=ErY7sBtQ0A1kZ5XiWS3dqmyZhYdxF8oh+No+x2+Zf+ld0iBqwhCQY3vFA0GEiB0nzl
         u6cZco0eZsnFr9pef6e37Y5iCDhLGEFj3pgcgkoo/3P4wM50MH5B1w93NSz85TOiAFFD
         47kblpT/7nzkOr7vsbQQahEYAmzav4q7fJYKAwUg1w2yEOvCj501pcanGywO0w0ks/1P
         FA7cy3nRRPIvRm6mtRDBrRuNHPfwwxGRnFWdYhX/Ze/VaBvMIxVxL/IGhfzJMKnekcQB
         835KbQmEmbQcP6wAI4O4B5eZ4EjiHhSr7u5YCGDj51/9L5S4nOCwP+LXq5qglteVgdVr
         Qw1Q==
X-Gm-Message-State: AOJu0YyEE7SRzJNGgTQV8tyeDx3/8qqB5o2KK304bCAgDzepvWPhwKYm
	vIA5gU6LNAy3Xj/3qpC2kpGGzcsSDAfQvg==
X-Google-Smtp-Source: AGHT+IHPzHLCCeZU2JkQcmXKfMsK07FFMiDtoxjctN9NrgHFmoOo+cAOAkLXkGheh5UdgzN+5zXn/Q==
X-Received: by 2002:a05:6870:330a:b0:1f5:cf59:1ed1 with SMTP id x10-20020a056870330a00b001f5cf591ed1mr7521223oae.4.1700452252942;
        Sun, 19 Nov 2023 19:50:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122438-22002-1-git-send-email-wangmy@fujitsu.com>
References: <1700122438-22002-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-eth-utils: upgrade 2.3.0 ->
 2.3.1
Message-Id: <170045225214.1416826.7055803472883292900.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106910


On Thu, 16 Nov 2023 16:13:58 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =============
> -ome users were experiencing encoding issues when parsing the networks json.
>  Use UTF-8 explicitly.
> -Fix character encoding issue
> -Fix and add new test cases for invalid Network chain_id values.
> 
> [...]

Applied, thanks!

[1/1] python3-eth-utils: upgrade 2.3.0 -> 2.3.1
      commit: 31d5f1ba5a57ec05a5a372ea7f514b0a1cf2362a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


