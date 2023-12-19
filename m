Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7327EC4706C
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.6849.1702967281019903926
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pfxi1f6f;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28b71490fbbso989995a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967280; x=1703572080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZDIEuF3jtwQ8dqxGGmp+7/tC+GhA99CCLBV6kF7FkY=;
        b=Pfxi1f6f8y4/gI7L+GjRxOiwS6k15QAOa6DWeKbO2OwMsXCZMMzVVo/v3QDtM2viI4
         Od9gQ3NL7Y6iJOixvSXhga+71qLCt5p/57M+U27Aw67Yn5bVm/Wydfts/+uC8wQh+WiP
         0yERgiHwRBAqsM1ho14AZxZE3xfl89Iik5voPRm25I5jV/A016iibmlsOxLgMfqZMj8i
         5E8d4HdBs6p2x1sagDsjbzn555oMq7y37zdpNNgQIcyoKHzq/Gr36d3hgV57CCQIe6XF
         0MS8oeWJN9I4/6cpnScPlHeFBW8FtP8VQRbeoC3K610LcfapcOMA31IbcOh5b+MrrHV1
         sygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967280; x=1703572080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZDIEuF3jtwQ8dqxGGmp+7/tC+GhA99CCLBV6kF7FkY=;
        b=Xe5B+EB/kLLfW9tvB4cFBlzfmgSiy4GVTKW2FxlAdUmRUUsF39KqK0HlO/lD4hE4MF
         +RszaRnjFsUartUVh72eDRWKK25khuZzGmgRGFea655tESD8wybeSIhSI5kiLAYtZBSH
         +K/hyFIumEB6V/7nrzugcOGoWFCORXeYBdnKlzgECCGRnE7GNdGkO8WWTUlSxuGo6ixq
         9kBQ2smQH31l0/A94ouRmynMieczWtmOSnmvEjJoFOSkAV0w9LAwH18ZuZMo+6/umgdi
         L8rNsTlSj2O7QbIlcjo91N4JaN8NSanWHo945oh1kHAnlnOxi5g+/ld4SWgn+dHFJLjb
         kHHQ==
X-Gm-Message-State: AOJu0YxOnpOFlw7MiwJWiKJy29L7UDh1os1Atwk6RCWA2lUd3YwvlSkU
	kOuTRVRHKxKRS9sF24fbnKAUhVRsZEA=
X-Google-Smtp-Source: AGHT+IF49BnpNozEb1/B00VnMGGKkXWEXnmWqWi1LGnTmMqDqpT81RrCHJDcjE4SzKT24QtNaHju2w==
X-Received: by 2002:a17:90a:780f:b0:28b:4aeb:bd74 with SMTP id w15-20020a17090a780f00b0028b4aebbd74mr1423285pjk.33.1702967280501;
        Mon, 18 Dec 2023 22:28:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:28:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702856984-27455-1-git-send-email-wangmy@fujitsu.com>
References: <1702856984-27455-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH V2] paho-mqtt-cpp: upgrade 1.3.1 ->
 1.3.2
Message-Id: <170296727980.1627685.324792711053349265.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107624


On Mon, 18 Dec 2023 07:49:44 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Fixed generator expression for older CMake
> -Bad LWT message in async_publish.cpp sample.
> 
> 

Applied, thanks!

[1/1] paho-mqtt-cpp: upgrade 1.3.1 -> 1.3.2
      commit: 3f844d4136cf5033dfb9b20012dc218d3610e658

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


