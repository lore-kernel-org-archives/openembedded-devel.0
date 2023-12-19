Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B815FC4706C
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6830.1702967261505136051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZVwGtOZP;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3cfb1568eso10308175ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967261; x=1703572061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnQE13w3zbRqiGyImllUVUbdlkKjRwTLV7dP3k6U16o=;
        b=ZVwGtOZPTvLVcJR60nEE1TjCaqMK/HECziy6xWYv1+n6pzd6+xR8R/oceriDL2a78v
         Vmt2/Fcp5BdPbeHKkA5r0ffpubVaw1rZh3xIB9F1irCpJ4jLXSVgNqaDAAcNHMu3SQzj
         6PLBPmjrvpO1XBEwizyKariCCu4vxWsr6YjkGmLKWTn39JuBl7mJfvKCJyYHVevcIisy
         zmdDNP/qgAjoQe7YcDcze+j9jXyyrpScFRXBb7tgzmYZglb0dhbttz08GixM8NTimwCN
         K5u8THsfJmPJNM+s0SWpT3gDHq8DLLVWA3n78mADnTyuV4CNgSaGrz6WzBjOsUHJlCNh
         xUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967261; x=1703572061;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnQE13w3zbRqiGyImllUVUbdlkKjRwTLV7dP3k6U16o=;
        b=efNvoajrq4Do5x6oj4zJJnRZasXEkPLiW1qESZ/oDoW4SVxkNLbhFJKOSMKSP7qZpn
         eXq5SyzI1MwSUv+gjWlvWOOrMEyr6Qei6Z0iuNaTzoU5nPgFaOJrJOWcz9yzQid2uVZU
         Bq0s3nZDjuWIusE7igdwaJTkZ5DdQ80jYTHA8HAIaJ7YPVUuMut5nGriR+1EWMjv6nNE
         UyzyWM7WVhwQNnJeNwnfRL4q7BHHQm3+Yrpo/YNvtMY1ClrmkVXPXyHkIDNsJ/T2FwR7
         MaYirZvEJhd2YEDbN9guQL2yktEEYMkEnBjAdeCieVKKL6zBEdo9byQw4iHk3bCYaLJ4
         KNlw==
X-Gm-Message-State: AOJu0YxmRZAxkiSrA1DbCggHikII9pQ28B3owHu4j8C/p2loiS114BRM
	2s01688b9083VZkLkqBZD30=
X-Google-Smtp-Source: AGHT+IG9EC/74n97cK3GDBfEKYCNdZ8SgpgG3M98yVe3ogcyDdt7gsMvOG7MD4VrvVjB84CZVpZHPQ==
X-Received: by 2002:a17:903:1c7:b0:1d3:dd16:5242 with SMTP id e7-20020a17090301c700b001d3dd165242mr657823plh.125.1702967260965;
        Mon, 18 Dec 2023 22:27:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599513-1613-1-git-send-email-wangmy@fujitsu.com>
References: <1702599513-1613-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pylint: upgrade 3.0.2 ->
 3.0.3
Message-Id: <170296726039.1627685.500838030550672244.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107600


On Fri, 15 Dec 2023 08:18:33 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Fixed false positive for unnecessary-lambda when the call has keyword
>  arguments but not the lambda.
> -Fixed incorrect suggestion for shallow copy in unnecessary-comprehension
> -Fix false positives for undefined-variable and unused-argument for
>  classes and functions using Python 3.12 generic type syntax.
> -Fixed pointless-string-statement false positive for docstrings
>  on Python 3.12 type aliases.
> -Fix false positive for invalid-exception-operation when concatenating tuples
>  of exception types.
> -Fix a bug where pylint was unable to walk recursively through a directory if
>  the directory has an __init__.py file.
> 
> [...]

Applied, thanks!

[1/1] python3-pylint: upgrade 3.0.2 -> 3.0.3
      commit: 6580c4bb38ece6f0775c550e36ee5da89352d500

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


