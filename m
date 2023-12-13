Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB04C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:08:00 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.30711.1702451271008496097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PWpNWzik;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ce32821a53so3654035b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451270; x=1703056070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYagWycw/rDIco9uHkiqhGfO1zFPBDwWEWNlQdzL8ig=;
        b=PWpNWzikZLiOHLhLO5L9tGB+SzAcIJTck4q6aRQtfRKXMqCWvMQEaeu8UCpyVvBI/c
         hgi3xShKbw2mzhF4Kxnw6eemmJH6Cf1+WNHdthtunn3+upNOB7ntgD1NZ2kGHzuChTy6
         5AiIXEEb4WjpQboZfOravIsnCHOHr1gx0v4I62gruXU3Rqkr/D2aV9qG1dvLghv0RBgI
         nub0n4GBvOaexhnc3bumh5gkC7LbalLepvtgZVnBwcvqCSJiFXmr8SNNghlS2+oj8vv9
         REd6NXbUxz1P+f4AVk0iQx5VWbP84eJWS006wr91a2L4GcZntjxNdCG77HCAcOK3t9ZY
         UGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451270; x=1703056070;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYagWycw/rDIco9uHkiqhGfO1zFPBDwWEWNlQdzL8ig=;
        b=PbJiEW2ZKqZYDZRvUbeZo8aMGS/WOkKiqW6nMK5OcSkQTYhxU6ngeDSpAtrPmCfIk8
         PqpoyOijRtfzhL5Gq3+cjFkw3pPMLIpBeO9L5B365KFWvhNPd9JFEcu57IuIPFVzx+4j
         B71CAW0A3hugKrtsqbkIgbEl7QH3s158DNnixpm2jE+og+hJblcz6ubEG3F0LSmdME3g
         BKCiscuwPol20cjAOyd/TV2maiDEpRFYZBz2YbqA0UjQlQ4dvzfvRF26QmzE9DOoPxmG
         dBwiiGGffHoONmISOhOXOuQaMlmg6HPMqvPQlZqohEHjsZiloFIYbkjJmtJvLWXRDMQF
         Dbrw==
X-Gm-Message-State: AOJu0Yyaiuyfou2jwwnmRydt+B01RDvHU0Pdg9KQbBxpDoT22dAZobSo
	4x8hpH3/349jDbSkqHfThQppWHk9on4=
X-Google-Smtp-Source: AGHT+IFI0/aIP0vgd4KFC6dxQxJFZAzIVPM1oowzYMDwnUP8a4IXncL94/Hj2PBLH1hLXHqa6gWPyw==
X-Received: by 2002:a05:6a00:2d13:b0:6ce:270f:2eba with SMTP id fa19-20020a056a002d1300b006ce270f2ebamr4452169pfb.34.1702451261497;
        Tue, 12 Dec 2023 23:07:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, ross.burton@arm.com
Cc: nd@arm.com
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
Subject: Re: [PATCH 01/10] Remove unused SRC_DISTRIBUTE_LICENSES
Message-Id: <170245126082.133993.16549150814658857323.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107385


On Fri, 08 Dec 2023 22:32:15 +0000, ross.burton@arm.com wrote:
> This variable was removed in oe-core 8c9ef5, and didn't do what any of
> these recipes seem to be using it for.
> 
> 

Applied, thanks!

[01/10] Remove unused SRC_DISTRIBUTE_LICENSES
        commit: 9ae31f6f6a67d14da075bceb4a1a9781b140ffe8
[02/10] gspell: inherit gtk-doc
        commit: 58194b0b1264bb2f5c80b63edc3348c4fb1a0508
[03/10] gspell: update DEPENDS, switch iso-codes for icu
        commit: c3eaf805d2cce97ba2d25b6b4fae6b6ccbdfa114
[04/10] librest: remove spurious build dependencies
        commit: 069885e74dace8eea3b71557b26c99e959ce7830
[05/10] librest: inherit gtk-doc
        commit: a9cee7a46934d2f305fa458969e96ff7dab8841b
[06/10] keybinder: use autotools-brokensep instead of setting B
        commit: 21dbf20b54029eb8babfeb8d7f52f1b78cc560aa
[07/10] keybinder: disable gtk-doc documentation
        commit: d015d52ad81115986ac89f45d086820d9027857a
[08/10] gtksourceview3: remove obsolete DEPENDS
        commit: f8f5c728a387c9b26a62f30d12c7d71e199d277e
[09/10] libgsf: remove obsolete DEPENDS
        commit: 103f49b5fc987e7bb8765700d16bd387a33b62ca
[10/10] evolution-data-server: remove obsolete intltool DEPENDS
        commit: 50769bc2f25f20dff422cffb5e0c486578d8eacf

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


