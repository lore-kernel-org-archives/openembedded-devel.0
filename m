Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC28C47079
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.198924.1703983128347929116
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMtshmmu;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bbd1fab03cso2127275b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983127; x=1704587927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPcjpBfCihxWkTYaiUIeyST0SRjPStQcfmgO2smqoxc=;
        b=CMtshmmuA2UbhyFzdNeSFT9vx/bt9c+tJlRPZ1VcGqZeYFTQczrLk8AmHLI8UTQDYs
         eFizlCqop8YYZKRWhb0Wv14LN8mHw2HALj95cGkDzwVxZUXXNgPwfl5DwXr4wsSe4swW
         sfLfkcf5kIGTHUR9atI2MpmMLYn7tQR6QYDHhl4VTcxsEwbl9zqV45lUdtP40xWKltdd
         CStRbzFVos3rBrrVZdSon4yu+GL13RDUjOXIKRZnhnKIAzATxQ2jUyb2TW+cLn7LYuNX
         jM2mlFxJgyQIU34PyfnO4oQPn5VMEGUxnNWA35/4a66QDFob34+WmdqLbE8n2f6XHMid
         /T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983127; x=1704587927;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPcjpBfCihxWkTYaiUIeyST0SRjPStQcfmgO2smqoxc=;
        b=EVU1iOOdWt+fjKmLHWKOsVR4OTc5l0VwTJ2c70prF9ZnI+gpH0ouC8jkYPWnHN7jv2
         ZewTcNyinpnCxjYGNLwYvhRFKoZocpRslovCpq4aS3BMIW7G5WYF6szrugDSUn+Y0xtg
         MVlo5IVCfu23WhGy161S6zPaVjS8of0mPT20KlsB86IPVuLyHNe7dGaEKBpsqma45Sj8
         X3ooLuLSbSeCSIJRsJwOUFZYS31OvJV7BI6++Wjhl54OAk2NbSbUtYCQQoSffy3xT734
         4JtVVRLBozdMzFWNulIZg/QOdvKZqCFTOC1NwZb7fiq/foadAzHp7OXlhcS2UejTEh9S
         jnsA==
X-Gm-Message-State: AOJu0YyPuYLmcYwKR90GfAN2bUGMG42fk6NARgeCRma0Uxyj39D9jDpA
	Zdbgkg/GPRXLdYkyN2ps0VM=
X-Google-Smtp-Source: AGHT+IHY8kerCSI5tJffMlPwZKObG2xfUlw6+jchuVGIbOu6TqYOipaugmr02hL4DCWnPYv1ibTqxg==
X-Received: by 2002:a05:6808:118b:b0:3bb:fc6d:1905 with SMTP id j11-20020a056808118b00b003bbfc6d1905mr475936oil.106.1703983127569;
        Sat, 30 Dec 2023 16:38:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Martin Jansa <martin.jansa@gmail.com>
Cc: alperyasinak1@gmail.com
In-Reply-To: <20231229104005.1133493-1-martin.jansa@gmail.com>
References: <20231229104005.1133493-1-martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] driverctl: fix installed-vs-shipped
Message-Id: <170398312672.873206.1018824017522733062.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107944


On Fri, 29 Dec 2023 11:40:05 +0100, Martin Jansa wrote:
> * introduced in upgrade to 0.115 version:
>   https://git.openembedded.org/meta-openembedded/commit/?id=1f2c2ebcbcf5944225462f530e0d56b20f1b4630
> 
> * fixes:
> ERROR: driverctl-0.115-r0 do_package: QA Issue: driverctl: Files/directories were installed but not shipped in any package:
>   /usr/lib/systemd
>   /usr/lib/systemd/system
>   /usr/lib/systemd/system/driverctl@.service
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> driverctl: 3 installed and not shipped files. [installed-vs-shipped]
> 
> [...]

Applied, thanks!

[1/1] driverctl: fix installed-vs-shipped
      commit: 079cd908fcaad88440f293a13e4917e4e64c42b5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


