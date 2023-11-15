Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD891C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:37 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.8066.1700032774270546231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kv+JKGv9;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1f0f94943d9so3176405fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032773; x=1700637573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdCpKe/4QCN3/41u8nU1oUmarvYt0DJ1JeeEeDvhRDk=;
        b=kv+JKGv9/VC/WoE01CjERS1xqJ8/4a4qpWlssOzr7sMrzQ1G5lIP9bMSStSsq68fhK
         +jwPq7WlZ3bE9sji0aARbTCX189GpVCPcf3ZDXgzLrwjjAcQEd3VuYaFDHxzLbBnZ+AS
         rwjVnUHnrahWp5HVqXhBW3aunn7wfRv4bDCq8QTKKhVjMb1ML1Pu1BXjiWf0y8UBRweD
         YmuLmUL+hSBmIfXaD9a4hH2joLhU10MlpVoJDf7ys0bpTxuwcnICf6ZMXtDqbczA6uKV
         jt3EupObAMtgK+VmSgYnT8ZXOdIT6b0cEUkTgp7mF60UqwvoJyALlJk3MkkAkjNfVfmz
         YbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032773; x=1700637573;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdCpKe/4QCN3/41u8nU1oUmarvYt0DJ1JeeEeDvhRDk=;
        b=kzQ7MUBdtAQ89Qs2ijEaNVk2rKpdHDK55GdBzczLSQjLrAUZx7/EhIGPSl+xqEFg6+
         CJ9HKJtDxZVLgpEpfMf/waWqScBWoQEvScf984VJXDh+kByOdJoUZmTZ7TiL1hWf09/V
         HvawPWvXnBnTHaXW7WzEPwxfWEgfsHIoy5fG1wucIv2Uc8llhaCeXuyrxeJyD4ymiX9y
         NOWMUpfC29LYqXcY0kjgZQWbQhwVenYCik/UyObWvdWe4hTczhMJacb2wwEl9fy3Dz4V
         pVjQ2nLb6bMGmr7jvczoAxjH98IcTnjNuVSWF2iedtBHn+ppyLCFYcUmlWWITz8a82gw
         XLaw==
X-Gm-Message-State: AOJu0Yy2QDa+YQLTIbgvAtUYRXNyLbf85GSf6wuqA7yhk5mFYUDr2DMO
	cXJ33L9wJSI3k/AyTYbfp5D7ElU+Hfw5cA==
X-Google-Smtp-Source: AGHT+IFNzjiiS52pIZf5IHMaesgc0BWStH1MFw+PltjVYXFoj8UJetGLvC6FNSmKQAVrT4a9dKUyGA==
X-Received: by 2002:a05:6870:4c10:b0:1e9:de37:a75d with SMTP id pk16-20020a0568704c1000b001e9de37a75dmr12756230oab.17.1700032773107;
        Tue, 14 Nov 2023 23:19:33 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Samuli Piippo <samuli.piippo@gmail.com>
In-Reply-To: <20231113084245.96832-1-samuli.piippo@qt.io>
References: <920b4ed2-386e-49e9-9d8f-15dfa98cfa59@gmail.com>
 <20231113084245.96832-1-samuli.piippo@qt.io>
Subject: Re: [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
Message-Id: <170003277227.3928366.1448541073845709724.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106735


On Mon, 13 Nov 2023 08:42:45 +0000, Samuli Piippo wrote:
> If protoc is enabled for the build, recipes using protobuf will
> fail when protoc is not available in the recipe sysroot:
> 
> |   The imported target "protobuf::protoc" references the file
> |
> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
> |
> |   but this file does not exist.  Possible reasons include:
> |
> |   * The file was deleted, renamed, or moved to another location.
> |
> |   * An install or uninstall procedure did not complete successfully.
> |
> |   * The installation package was faulty and contained
> |
> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
> |
> |   but not all the files it references.
> 
> [...]

Applied, thanks!

[1/1] protobuf: stage protoc binary to sysroot
      commit: b1deec0de476d8f0a0c6427919f57ee5f681ea0e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


