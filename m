Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A24FC4706E
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.6760.1702967247428041094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XqCvP/h2;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3cfb1568eso10306675ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967247; x=1703572047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yyVlr3YjLVunvCqPuMMeYPGZ9JvtTFtvjaotU6NN30=;
        b=XqCvP/h2Cl6MNk8PcqboQaDGilFuR7ML63u6p25JPza2CyDmwmaCMsww0PqLjB+feF
         HA22bM+t1QFgUaKllmC3xxVEKSmT39srr94kHaCMg4yCvuKLZh42NI6bEWXsp7FiVmpg
         xiFaVnYbzAd+S4TkbMHNoKuhpHWRHQKU8zZSu+kq6RU7SqNjgou+h8Ha4ItSjy8pjiLF
         YCBDSrUNpmdZEciWbfkDeF99eLlZr+YMiEEOZ6wKDuC3QapaD1NcLUaF9HkDJlkwUp60
         h2zmwOawlADLM+WtxnXJBnJNb5XAU2So4f694ZuHitlQ5e7cFORT6qCtvE3kMgnm3Wfu
         AoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967247; x=1703572047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yyVlr3YjLVunvCqPuMMeYPGZ9JvtTFtvjaotU6NN30=;
        b=wEDcZO/ViMCF+NvYOKFAYeeXoq1B2J3pq3pyjlJS4i9AnU2heJxlz2zzFEXBFTEboD
         HNZpUQy6tikoTfjh4TBCEYT7DGa7cudNlJvLJhRECWwj2XfSVVVvhKPOnJ2231rkMWve
         KDDHKpoAbEdG7j212/J6cVnAvLeBuvj7qi38U3lZY5yyIClgRr60jeSaz0GaEMjH3Vsu
         7hLtXjnBL6Owf4etZ/u3iTIFLV8oYFNK2oh3l+wHqn2V7ncUmUiHkUH5gQ9oNMX204VJ
         LRJnbssvA2he37U0ZEWJKisHVCCngGJTojgxp3QtAxBIam4SQ/lk2VDBovOlQyx7bCSJ
         V4dg==
X-Gm-Message-State: AOJu0Yy+V9i4k5e6pOModQBWoxsMJA1+JDj0GCBB9MAfQRT373gKnD/Q
	jCuT8QoTjvX8eyfhBUVjqS9MmbSnkSk=
X-Google-Smtp-Source: AGHT+IEjC6PbJMfuC2vvgh0uVJb0XeGK9mD0SlIHt5xuMi6pDYG1RqA5I/4ubcguTai8CWH8/wUDIg==
X-Received: by 2002:a17:902:da90:b0:1d3:c942:144c with SMTP id j16-20020a170902da9000b001d3c942144cmr2458816plx.80.1702967246790;
        Mon, 18 Dec 2023 22:27:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544113-27952-1-git-send-email-wangmy@fujitsu.com>
References: <1702544113-27952-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.23.4
 -> 2.25.2
Message-Id: <170296724616.1627685.14553297262081060694.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107585


On Thu, 14 Dec 2023 16:55:13 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Fix user cred universe domain issue
> -Fix vm universe_domain bug
> -Add custom tls signer for ECP Provider.
> -Add custom tls signer for ECP Provider.
> -Add with_universe_domain
> -Fixes issue where Python37DeprecationWarning cannot be filtered
> -Remove broken link in Python37DeprecationWarning
> -Add support for Python 3.12
> -Add universe domain support for VM cred
> -Modify the token refresh window
> -Add missing before request to async oauth2 credentials.
> -Auto create self signed jwt cred
> -Migrate datetime.utcnow for python 3.12
> -Update user cred doc
> 
> [...]

Applied, thanks!

[1/1] python3-google-auth: upgrade 2.23.4 -> 2.25.2
      commit: 4cac6ad7b95823c0c5180636f599dcbb7dbe3db7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


