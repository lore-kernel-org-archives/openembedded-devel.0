Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0869C46CA0
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.14749.1701215725445418441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLvJTLgj;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cfc2bcffc7so23778205ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215724; x=1701820524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKtxrSsJOvXQOeKnIoRLeiJh2cQW15z5cH9dOKuSSuU=;
        b=JLvJTLgjlfEsTyd6TItEC08E/RAKnPVb2pKUFcsmniTqeSwaIHlTY/arSDAlUnPxNr
         WiJeb3vTHufIuOTbgIplcbUA0vbMyDZShfmBNhKzWeoBcHfVZI7RUBgRHDsr14PgtIor
         Tdilm5Cw6DUGD5Q/hv/hw4tWj0LEll9++yLf6LC9HyuzL78gkA+4xhZCmp0uRvS6iat4
         lEhgXT7t3a9ZpImZGSKAB/p/xwd7XEcMJ37+XChO/fsFgE+PHrT2SJ3YAIYZWseTBXaY
         g5CMYByXp4rVuy7YkA8PBBpCuWG3GsH1V2iY85DEgGZ/NjeIul/1kLHXwgjshDyLjU0a
         1qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215724; x=1701820524;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKtxrSsJOvXQOeKnIoRLeiJh2cQW15z5cH9dOKuSSuU=;
        b=IJiq4WJxxw6oyL+rywD7LLm/odrxo4iJQdrdYSN7ZIkJwHZ/lg9FjlDStTnr8NkeGo
         qEdW91TdTxQ+5nHO8JDhrq0I65NrhvzHrYAXBgIwt3uYMgmZuwh/tzCIe2SzaV40+ryE
         gYZiL97uhuE/8B84Wp549G4UPQlSqhmfEft4L9I5d8qeYNSJxxSYcurCk1mQq8raGf9X
         ovfOwwqdVVz223SqHMySVFWH+a7NSqbRKiPbtytThnPvNTdL08hNGlUYbiEh79PXjtI/
         WkYG9PSaC0wQNMX/6ri2uexXkNaBgZMwdkMNN+Kq/bSxeWUjqIDNCReuakvmdu9Jn/a8
         V3vQ==
X-Gm-Message-State: AOJu0Yz8+WggDHR2rBgtZSWZDV/8frG7NULOUmOydkb7afp6HpmuMG/4
	jNXrsoUwBXURuVQ/d23AY/JP056JZaKaTw==
X-Google-Smtp-Source: AGHT+IET5gcGo7bqDOf35iBTnTOOHMtGxIUA5RZGPoCcvPPTRGIrJ4oscRwjNDaMl/TGZo/BmOfSew==
X-Received: by 2002:a17:90a:1a03:b0:26d:2b86:dbe1 with SMTP id 3-20020a17090a1a0300b0026d2b86dbe1mr15018803pjk.25.1701215724554;
        Tue, 28 Nov 2023 15:55:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160217-28148-1-git-send-email-wangmy@fujitsu.com>
References: <1701160217-28148-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-humanize: upgrade 4.8.0 ->
 4.9.0
Message-Id: <170121572343.1187527.14119075709115432695.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107112


On Tue, 28 Nov 2023 16:30:17 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Add support for Python 3.13
> -Add Norwegian localization
> -Add Hebrew localization
> -Add Klingon translation
> -Replace Flake8 with Ruff
> -Fix DeprecationWarning: Plural value must be an integer, got float
> -Remove useless shebangs
> 
> [...]

Applied, thanks!

[1/1] python3-humanize: upgrade 4.8.0 -> 4.9.0
      commit: 4ce28b4bc203a4f96dc459d3ae05ae072af6f347

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


