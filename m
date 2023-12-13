Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9996C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:29 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.31066.1702451248159320309
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EWYnfs/T;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35d57e88c1dso27529845ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451247; x=1703056047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkVgfthvNpobKCRQ5MMmRJJYQcVrsMHpDdEAwG5f8ZQ=;
        b=EWYnfs/TZ1sNPXm1z6WOaO0449rVg/UuaOdIXs5wyA2Kuz7Qj2qOnC6NE8FM15zb/z
         WEMtFuHLD0OegyxDoWEJ3i+mHrbMSOgs0X0Yl4fMmhdfy/7J5nhsKwb3B7o94EcXBdhA
         fI5mIME29j7eKyCsOnrZmsUJQizARizmDcUkQLv/WEnqZ5Tc5HQTcMbCddhOuNPgSo/U
         EuYMLWJbXuuMW5dMDkEvds/93NskWIDk0/cb4BJAcDpdcDJs1IC1RuvsaP5Le1iDWIKD
         Uw+WbB2YOTcXMvro95VbTZnV/JAG4sFn0Y9S0AW4EFGtBqgJV9jN2hijC0a9Vzck/c55
         tlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451247; x=1703056047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkVgfthvNpobKCRQ5MMmRJJYQcVrsMHpDdEAwG5f8ZQ=;
        b=HqWCNcMuqxkBnnAjHtL91DCgCb5x42riGcsJv7ONk3vp3REcobZxAUfi/6rTw5+3PA
         152SagrhwHBSB7Oz1161Cy2FbFnd7ix7h7nrfKzolXiwJR+9P6dlqjBkmc8pC+pzfWPe
         kdriHS24rZ1lE9YY0P+fcpLINQ+vxjLPLD1QF0KdtLoyAfOElyz4iyXgxHT8cbIB9jFS
         ENrrClBoGPKrZ6xUh5DUVJrWsgEoo+nE2NGO3jBvEBkhJzfSpn43sJ5F0DVlQffjSl1T
         /2H2c16Z3byqO/jhDzC+JxVggicL+6oMp5SE64eurI/ed+GzPsRrPpfTcd/5JQuZ8S1k
         uL7w==
X-Gm-Message-State: AOJu0Yw8lhZR89EF4RlFEDnH2Auf6iEx/K3hqLZ4JfRP2vB/JND3RH41
	V7L+bPFuWKzGXMioq4HIawQR7dBBVwU=
X-Google-Smtp-Source: AGHT+IF+ed/j88qpCBz3KuJIw5TUm1Ow2Wdp/nWzE1wkJR7eAV+HzSV1W06eA+cL1b8EvztB1k45IA==
X-Received: by 2002:a05:6e02:1948:b0:35d:59a2:bcc with SMTP id x8-20020a056e02194800b0035d59a20bccmr7364247ilu.98.1702451247180;
        Tue, 12 Dec 2023 23:07:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206204107.458096-1-alperyasinak1@gmail.com>
References: <20231206204107.458096-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xbitmaps: upgrade 1.1.2 -> 1.1.3
Message-Id: <170245124625.133993.11711359318068786247.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107365


On Wed, 06 Dec 2023 23:41:07 +0300, alperak wrote:
> Changelog:
> 
> * Switch to XORG_DEFAULT_NOCODE_OPTIONS
> * gitlab CI: stop requiring Signed-off-by in commits
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> * Update configure.ac bug URL for gitlab migration
> * Update README for gitlab migration
> 
> [...]

Applied, thanks!

[1/1] xbitmaps: upgrade 1.1.2 -> 1.1.3
      commit: 5430b16813c87dc5d69a2ae21bc6d5f2b73cd8d5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


