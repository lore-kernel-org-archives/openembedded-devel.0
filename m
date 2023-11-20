Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A04C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:54 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.43627.1700452254578906614
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hDYEH+OB;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6cb749044a2so1095622b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452254; x=1701057054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/pN1elmxY/sbbJpgTi0gqOgvMqB8q7kA+5YGv3kFo8=;
        b=hDYEH+OBLf8v2zqGRk+kXL897PuB7dt1LQ1e2Y+wKBIL3VO9Xp08KkMAjvQ32dEyjC
         J+TZA4TFpd/+1x0DKdNUymXDsRPB7NH68oCKnDxivhA6fRz08Rh/h+8z8NEKkiNYKqyo
         Wxqa819IqDaMM+HZKGIFi06+Z5gzfYhz9miSIJZXTogjC7WVjVY5olUbW0VhE8LHECBh
         2znu4ROS/cFCxHZcTOBh2zU31aI28jHWKARCfsytbBwt+gguG2l4kuYaLXqdhTylhW9x
         dXt6l9wRbMJxBJaWL0eLYUVWG3Aq+uYUiTp1kQzUMDdlgMiZdmIo8pybsFRtps78pPFP
         WzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452254; x=1701057054;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/pN1elmxY/sbbJpgTi0gqOgvMqB8q7kA+5YGv3kFo8=;
        b=m81EfsvXr+vmibsPBHy3vQVmcKNLLeau3LalB8wOM05OsnTw9G07U09+CzkLsGx8/r
         L7oJ0fy9t87bmpT/roZRbl3rQJJLy/sQNreus6NW3ymg/yUD5z9O5kuDY2yTY0a935Bb
         t4M/XvpPdwGSbhhyB1SJURTfKR0K/NXNmsi+FzmFzo+lM0YwZnRKRpYv1qusNO3/kkTB
         89uZte7KV4hY2OTnNUyi3bD6MSJkvwYUvaoCKEn+vnuAJV4Qe9v9nbH1fuOWMiE0dCWj
         AcjfHABRB/CZWV0XIWKf59Q46O9WCZZrUJSUH+ckgFbl3DdKkYLW1TNr4ckuD8WCkA3G
         uteQ==
X-Gm-Message-State: AOJu0YzuEepX9MIbhE3KqE9hYzi/DUNXYDl8ix0CuRDUF+Cp61WfrVvr
	evRvr8r/34yRIjOXMWZTAFg=
X-Google-Smtp-Source: AGHT+IFWhjaZpeYPprCTomV8KInpBBsdjQ/roauh8N7iwTS9swnoUxdnoANWbsdf32VwU9CoNIMP/g==
X-Received: by 2002:a05:6a00:b43:b0:6cb:8b26:9793 with SMTP id p3-20020a056a000b4300b006cb8b269793mr3939243pfo.24.1700452253866;
        Sun, 19 Nov 2023 19:50:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122510-22059-1-git-send-email-wangmy@fujitsu.com>
References: <1700122510-22059-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-geomet: upgrade 1.0.0 ->
 1.1.0
Message-Id: <170045225304.1416826.16785348761183884895.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106911


On Thu, 16 Nov 2023 16:15:10 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =============
> -Move project metadata to pyproject.toml, modify build scripts
> -pyproject.toml: include the full README.md as the readme contents
> -Remove dependency on six
> -Fix geojson to esrijson conversion with custom SRID
> -Add explicit support for Python3.11
> -docs: Simplify release process, make patch versioning more clear
> -Add explicit support for Python3.12
> 
> [...]

Applied, thanks!

[1/1] python3-geomet: upgrade 1.0.0 -> 1.1.0
      commit: 7f6172eb45d765bd9ba6b6e2105ae57bfc15e495

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


