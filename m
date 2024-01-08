Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B554EC47DAC
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.31433.1704682018985449067
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MiQJm9qU;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3ef33e68dso8558425ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682018; x=1705286818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMx3uIPZT321odQKfbHGqi0tGTYViEUVYuTj36GQhag=;
        b=MiQJm9qUGCiAr7IU+ib0zH+h3ztx7xLupfTBERnhuoukTWW+dQ3wdhrAR6BRndFVvK
         eBcQqDWgPFr+J4/0vYXGQPWRNX/ivXlfQNQtOBtPJuBnxSWYgOxCXPFS3qsgStYlXP9f
         Y6DzfVMOq+mhm6czns9/0/EWW3ZSVTqRDlBiXKHbl84tVDcvPBh+mFRmZ6FaoNzISMrx
         +1o5dtBu40xXBvM6upPRKB5yEcsWsPC6o1mcu5TezSZEga9VreNO4FUbVKRaImQlXctc
         K5duD134RefpobVJtKQYD3x+3DRtIKdcPVzLNn6BZFX58FbAI2vkYUBDWsG85XKRK0rW
         sjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682018; x=1705286818;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMx3uIPZT321odQKfbHGqi0tGTYViEUVYuTj36GQhag=;
        b=C8fMKv/ZX6EMI4yY0XLE+oFOMfa7wJm8vFAsd97Y1186cfEkf7NBBDEVx75sf76+X0
         fKyKounzvrpSIGS+SZ3H3PfVhXw4vatREvcpu1LRRTSYpTwksT0mTOmkZb8BJven6XUU
         /lNFfeB9m4crCYVvWGhmzzV0degU8r+m/cI+5XLgZwqFcMEvHcZ3B9s25O53lZipZ3Aq
         uf8OMh/jd0/jqdgj6MbmVkmyHUZvkDQSu2ZRdM1Lb0Ltj+I3G6L1fZO3AVBsNewwAZ3p
         UtIP78REpFwKNeYkipMuQ+uD/9uefZJIeGOAOQZudhvz5AtbTDwMHAPpWU0PI3Mr2ssp
         ZnxQ==
X-Gm-Message-State: AOJu0Yweyvs3M2tByVT3R1QrZH1x4G+tQtn2yi00WLtWthpcUF6B9caQ
	LOnk62xXlnoIFguSiiTMYAw=
X-Google-Smtp-Source: AGHT+IH0ztEzIsam3ftBcru5mHal9P8HGrwAegv1mdjuxl4RtLLINWnHTW//yJwArSjzs0aTZCZU/g==
X-Received: by 2002:a17:903:2448:b0:1d4:c44a:7644 with SMTP id l8-20020a170903244800b001d4c44a7644mr8312527pls.4.1704682018385;
        Sun, 07 Jan 2024 18:46:58 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179377-8213-1-git-send-email-wangmy@fujitsu.com>
References: <1704179377-8213-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pydot: upgrade 1.4.2 ->
 2.0.0
Message-Id: <170468201758.912276.17166248441200173333.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108102


On Tue, 02 Jan 2024 15:09:37 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =============
> - Broken parsing caused by `pyparsing` updates fixed.
>   With this, the pydot project rises from the dead.
> - (Internal) CI
>   Modernized and clarified the development process.
> - Reorganized package/module structure.
> - Reorganized exception hierarchy
> - API (minor): Renamed the first parameter of the parser functions
> - Test suite option '--no-check'.
> - Drop support for Python 2 and Python < 3.7.
> 
> [...]

Applied, thanks!

[1/1] python3-pydot: upgrade 1.4.2 -> 2.0.0
      commit: fbff72263d739ced747a03bc5de5ee82bb4355b9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


