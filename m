Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257A7C47070
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:26 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.6750.1702967240620352955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f0uz/5EG;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cd8e2988ddso1088098a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967240; x=1703572040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/J10Fz9/TKDECOGxylRY2mJ5qB4Y0pSP8+hafNGB4A=;
        b=f0uz/5EGD3Yj92iOpH7BPaC5zo5lKC1TSEJG9H1ZK1tr/HbiI0fvicF1H5F0/t8npS
         wks5/Zc1rA6z/lgjF1QeNzKoDlwBMxXAPzErOq1/w8IkK51WaEL0vgI2uoQtOUMN8rR/
         wFwNx05HJJ9RYibF+ln9oESkuN5QmSCnk5iLoGvrTzy28g8jAzIyf+84hM5r+eEWADhV
         WwVT3gWGl7Vzk+b7EczJ5TYWNP1junDbjWCF/AvyaANnFOPWKchMSLsyTc9zr2Xm2OaL
         1/vM7Mzr5UnhYr6na5f8Z6UcLvJWtcQtxXDUazISpmFgNoH4MfobpuUxXpLWrwIA7dwj
         BJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967240; x=1703572040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/J10Fz9/TKDECOGxylRY2mJ5qB4Y0pSP8+hafNGB4A=;
        b=Bo/3Ne8idIXhZMh7hVfbKAc3td5OISLoOsOlGLpHV27p6t233SKaMHSWccOY3ArEJl
         sLp/DU9C+ehfsI2HphZUWoze6SvREImFntkcq+12+h3UfeTy9+jQgkyH3BCZLQnugmSi
         msZE198hzbP6/apGq1VkxsueS6CCOX1BXd56bFwgbF22dhtV4fRkI3ow7D2A8+2IsArE
         cSfRHjhwE0bDF81xOv63ZF91xW03kJFQxVh8P80Gpf70ZuZprirkrD7DxumZT73AxKqD
         X3uIFpcH0IMaS6jWledAdZ/ofly/SFHsNVWgJmMrLD47Ip5hMmb9xHPheJfvZpQktsRk
         8ZfA==
X-Gm-Message-State: AOJu0YxeOq6YLln3iTjqlMl+84jP4CH8FSJlWAImrJ2ccueXPudz9iJO
	/EtRXIL44lwt4DoH/Azcm9A8uuNmNWU=
X-Google-Smtp-Source: AGHT+IHw9y6KcONZHlTUIW4ozYN2c1t+KlPkyeCmYa5UWqOOlZUE4wruDJ9Nw6EdyjgGVSLBl7KdFA==
X-Received: by 2002:a05:6300:8086:b0:194:101e:bca4 with SMTP id ap6-20020a056300808600b00194101ebca4mr1407823pzc.108.1702967239880;
        Mon, 18 Dec 2023 22:27:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702543210-27345-1-git-send-email-wangmy@fujitsu.com>
References: <1702543210-27345-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-ansi2html: upgrade 1.8.0 ->
 1.9.1
Message-Id: <170296723915.1627685.1327071381958288940.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107577


On Thu, 14 Dec 2023 16:40:10 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Enable testing with py312
> -Fix project description
> -Fix RTD builds
> -tests/test_ansi2html.py: use sys.executable instead of hardcoded python3
> -Replace optparse with argparse
> -Replace sphinx with mkdocs
> 
> [...]

Applied, thanks!

[1/1] python3-ansi2html: upgrade 1.8.0 -> 1.9.1
      commit: 52126fbc3398f164eb85e642eebd5b80079a0357

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


