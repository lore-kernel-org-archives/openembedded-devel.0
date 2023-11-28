Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6F2C10DC2
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.14525.1701215735384834453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7UBUufU;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2856254bd74so4556394a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215734; x=1701820534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXSvf0Wln+qHe4wYxY5wiMDM5zAY9ul6+uKFecWpXXY=;
        b=g7UBUufUlyRlyKdG4Tbzv+63AqEY+GZxZl4kWMpe80Ii9e9QyOuHXZxo82Nh+L8Kyh
         wH5QpB1ur18cXZOAoIHSCcQRRSIQz5GRy+sNxQizbdGrTfXtl83PhVuPiyuvgzu1inl9
         to19AGURRlozy/ZTFS30OWngooe867eZBn+GPJ3z58mvAnm8HJYGRGnC02pP/e8hmyte
         Mllo01sxv1RvRF40c9wMczDUuOe2NPD+N7IgWKPp4eHkEREoHqoWQ5Usd1Xusb7QOnbA
         rdtVZKcTEpZpTE/TWr/xObh/uckSh3dWOMi3zbZy662+CloxtjkVWFPgfqwsPEoDHjOC
         g15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215734; x=1701820534;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXSvf0Wln+qHe4wYxY5wiMDM5zAY9ul6+uKFecWpXXY=;
        b=DVg+8nXQv3ZVmnPDLT09vzuNXencFxwL7y/QDjNAsrW2kv1tTPgSjrbqlT0OjkgdnU
         w7ug1RkKrzptEoIs7h2678yxKsvfNZf83b/wufr4gSsKqpXGMKqDd+LOim45InPcAW4s
         /RJ2IpQh/DjJjM3pYSMgJQRNl25LGxUrQDymOVn1zl3Z5m8lMJfh4XJvhCKrC0+7GpUW
         CXaduEwveYBt3hgtR0jrwbrErKwpFio4sQ3YEWdDpnhqNhg1fmwGtLpsoft0D0e6Qa8j
         8f6DM1Qa8LsG6eSJ8y9N7NugVNsrBNnF44elJTM6kfgRG7LxQWdP+S1M9H+4gfbbAlkW
         Wdgw==
X-Gm-Message-State: AOJu0YzOsqRKwHXaKkI8br7jx0rnfPeVlt0bgWB/LjDlMUEDZF+bKEsl
	sPTM6zZetoshHBVnBHaCAET1KuwKjYRMAg==
X-Google-Smtp-Source: AGHT+IE7dxhTUMCzcjQjBrTR2CfTR3WTjQmLLFM9HyzpIPIBDPdKVQmmZMi759itOe8IimXW60cG/g==
X-Received: by 2002:a17:90b:1803:b0:283:2612:714a with SMTP id lw3-20020a17090b180300b002832612714amr15979150pjb.36.1701215734544;
        Tue, 28 Nov 2023 15:55:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160904-28487-1-git-send-email-wangmy@fujitsu.com>
References: <1701160904-28487-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.4.0
 -> 3.5.0
Message-Id: <170121573334.1187527.1651219904087543884.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107120


On Tue, 28 Nov 2023 16:41:44 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
>  #632: --dist=loadscope now sorts scopes by number of tests to assign largest scopes early
> 
> 

Applied, thanks!

[1/1] python3-pytest-xdist: upgrade 3.4.0 -> 3.5.0
      commit: 992f254d5632775310acfb2af2251b42dc8ec237

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


