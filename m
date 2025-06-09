Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD6AC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:43:44 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.55899.1749462217595749812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mxDI3aE1;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so5338032a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749462216; x=1750067016; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNvrTXlpblgcU7n2bb5FU57y0msx4/J+X6cPAF8BpNU=;
        b=mxDI3aE11QS0ljLPtaggQNcph2En6E8swsxewoj5C1vSF5azLVuWKZcn+YX8FF5/jW
         YXUzyhR+Cfjpfnc1w4P3SofjEI5bb0+aZx4j0GsGAPRx+LJGUOVTAgZhw2utQWYpmFWK
         OGroPx9GpZ8IreS2eb6CocoXXTI9QRal8LV6MGqVXoeDn9GQrGlLlJV9yUMXMNdz+1/2
         PVvL+iQuFKI1VwmHQP7s26Ox3RxOIWn6ZUhvdD8xWqCom84QDqiFNCzikDRBS+bnWC58
         lV/BHD6kjzRTcEdNXuIJJ6VZDIuhXSwuNHUjYBqgNL8QhVUF0y074PkmG7WECrwJxi0D
         IHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749462216; x=1750067016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNvrTXlpblgcU7n2bb5FU57y0msx4/J+X6cPAF8BpNU=;
        b=K48nssSFIt9q+SRJmdHF7pDk3oz9Il5pVkUI2++aFFQU3AYGaHjQdOy7gbJ/s11msF
         9X+yfioi9wj/Z2O2k/8qDyWywfis1bgeBMNdqB1qjnIoSZdypunKk6/2Z4V2tvzdY05k
         G39hQBtkp0JQQVRVIetof7XHnjWJTNBQ/XDokddXD/l5G/3Lop4w29viZzrTfqL64Rt4
         H3Vg2KVJo68uMHnlHn5cY0OGJTkGvF/6gSxfywlNcPzGQXg6RURvCvqsmbYR8zF1d8+k
         x0RBTjqtUhKMWW6QBfQtKIO8WqDiP7U7j6v1KN+yR3mj85OMNGlH6tItXBXupeeptrBU
         dtRg==
X-Gm-Message-State: AOJu0Yxm88OOZKpoILYnPDf9oJRuSRO/TFthbEILE0PmAysvhhbWN/yO
	0OJcutmA/sAucvOukJe2KfVENypcSW6E3sMFDUVLVqfs2b+kg07u8UGT
X-Gm-Gg: ASbGnctxWw1gwGs46NrGIFDo6LlhTdwpr2koHh7YndYviOTVDP6PENXM3fH5R636e7O
	0tgfna+crly4uLjYLbWsb95xXMJoiJYDqS5Ax37scsfPLD8ji1Iua8GE2ALz0MfY4eWKz2duWyg
	aRsUf5UGNmdgMgOCGywm6WBl31AxKehuEixSwwNw8yko1G4R3Iv71OHt864Yr9iL3wXaHerzBh9
	hlGDO/TdecHzu3TeHRTvyXVm7/2Gg/NWqAL4Bxo6jcbvig9QNla9fBxqslg8jCzLgrN0pvkbe4C
	8s+qry3409aXrFhXhasy6tK2gWHgetbQ2nGOHv3TBfxd8AOEbBUd6haynPI=
X-Google-Smtp-Source: AGHT+IGRpzoVVqQ4pzH5D+weyKGjfqRrYhAPcNhT2PskrR3KN+RYxAiuvpf2bwCR6NDm/Hdxr+Z5Gg==
X-Received: by 2002:a17:906:6a13:b0:ad8:9c97:c2eb with SMTP id a640c23a62f3a-ade1a932bb3mr1186854766b.19.1749462215669;
        Mon, 09 Jun 2025 02:43:35 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3a496sm529424466b.144.2025.06.09.02.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 02:43:35 -0700 (PDT)
Message-ID: <e0e8bd2f-e513-4850-be17-2078a5d4c9d8@gmail.com>
Date: Mon, 9 Jun 2025 11:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH] procmail: fix compile failure with gcc-15
To: liuyd.fnst@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250609083102.1925-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250609083102.1925-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 09:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117784

On 6/9/25 10:31, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> +Upstream-Status: Pending
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
While musing about this quarter-century old release, I have found an
Debian bugreport[1] where someone else was doing the same - when
suddenly the original developer showed up, announcing that procmail
isn't quite as dead as it looks. Procmail now lives officially on
github[2] and to my surprise there has been even a new release.

Though it has been silent again for the past 3 years unfortunately,
maybe it would worth it still opening a PR with these new patches (and
to remove the Pending state).

[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1006633
[2]: https://github.com/BuGlessRB/procmail

