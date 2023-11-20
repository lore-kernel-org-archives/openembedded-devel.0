Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC8DC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:25 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.43647.1700452284433191193
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+p5M0X3;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6c396ef9a3dso3240829b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452284; x=1701057084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQmqRYVHUDotYcO3RqccL2PY2yTRePMq/Ew1/8iS/RY=;
        b=Z+p5M0X3Og11s8F+Zi+TDotKzUiK4+7vIMCK2wgEEarADe23NamoWz7FJYX5bLWnBS
         kdfwnuCpoGFqJaqypBFs2fRh3x8SZOW/3iC2g4/wTvFqFw+Iw039aHLFeYs71fm+DXLA
         rnWmPThC7oiNQbEXdInLZHxUCUiSOxKraBEt3y62oR+w9LC7iglry6YOsNnedmuGl7AJ
         y289Ge4NUkBJV4beD+Gc4cmGyN0cE8lBMcRsZDVnGtCNgKj8fKuzSe0PNarrakOv15mj
         w9EqjMCuShtVpFdbTtceCbw3DzcaCyCZXxwNrCFnbhCNDfmZpXmaLFexlsdjWPXfw+wV
         UsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452284; x=1701057084;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQmqRYVHUDotYcO3RqccL2PY2yTRePMq/Ew1/8iS/RY=;
        b=p8E9ghbEcF62R0bV6GSz1yHzmIJ9h6tI09l+yf4jxA2opkbafO4jvFy+nDUaYjxEMJ
         wkaR01btwdW4AZHNtWfci2gjKvtZTNmTLTklcsmWr5SA480OXWzTRPuz4gGr/L5GjP4I
         jXt3qjThJUCIaBGYbGPrTaev4OGU92dL7Xxvbg2TQ8JThazdoB7izzaSyyj1GbDXD2XD
         3yuaerB3YK5rWEOPeHD46H3JxkbRKN9duTkH6c/chtjFrKiHUWVYn94QCZA5E1VVKEkN
         BfOszMUSDBE4jSUtjh+YwB9vytZD/MJNsYWuUVXWLqUfcywBd2vWxeJbllg0Jnd/XO1/
         pnTQ==
X-Gm-Message-State: AOJu0YwIPgwJhrHFcZurRQieWFAlnz7+f6NV75zf9MmzW3i7gRH9GBVv
	YETchLJaEowwB2wh6fbHEfR5+/AUmF3Cjw==
X-Google-Smtp-Source: AGHT+IH4xpBNZXcR1V8fhzeYp/MGJ1EH3lGMyiRvWS7laAXdRk8LlFIGPk+ixLNczLA+AbwZ08joFA==
X-Received: by 2002:a05:6a00:4c95:b0:6bd:9281:9453 with SMTP id eb21-20020a056a004c9500b006bd92819453mr4829810pfb.9.1700452283862;
        Sun, 19 Nov 2023 19:51:23 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116165527.1196891-1-alperyasinak1@gmail.com>
References: <20231116165527.1196891-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] cloc: upgrade 1.94 -> 1.98
Message-Id: <170045228282.1416826.12016790543140939027.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106939


On Thu, 16 Nov 2023 19:55:27 +0300, alperak wrote:
> Changelog:
> 
> - New Languages: Cairo, Carbon, Circom, Containerfile, HolyC, kvlang, Nunjucks, OpenSCAD, P4, Pest, Pony, TEAL, WGSL
> - New switch --diff-list-files to run diff given two list files
> - Handle comments embedded in OCaml strings
> - Write empty JSON and XML structures if the inputs yield zero counts
> - Support for long paths on Windows
> - Better support for building and running Docker image on Windows
> - Better output file names when running with --count-and-diff and --out;
> - Resolve internal file handle conflict when running --diff with --sdir or --categorized
> 
> [...]

Applied, thanks!

[1/1] cloc: upgrade 1.94 -> 1.98
      commit: 1292ec8a03dd14bedd95fb3f1100212a81d475fe

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


