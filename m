Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDE4C46CA0
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14742.1701215709813838389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RHl59Hq9;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cfc35090b0so26472605ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215709; x=1701820509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fkXRxXDNvJWBq+X1C8DNSMe/FjNqNwgecSv6b+cpvw=;
        b=RHl59Hq9ZiMqJlDBlGHViTIQMR3J6ZBN9BrvZW6K3ZSxWEgUcCYccZLkXTKLwXMRHI
         fZluOlo7MDEdXS/nldmP1GlOUxrE1KVarN4gR2BcVwl7mxDtAdvapqvBSNRPz/NAP9mK
         fzSEyb/hvkTJE9sNw65UcpejB9wOYp5RUTEKW7JIA+Nf2FVH+/1mhIuymH2jONlDy638
         +mzcAipufWDzQuBmrcO39Es/eEJWhSM8RMI/9r4sAsGDbDIteLWZ7anTRhv1DpKP/RJ+
         Mxt2ZrX+JnR1L4URzr2U2GQw8zAj9Df7Pp7cdaZkrgJY/bzLQ0GGhCDayXHa3Mga9pvt
         wvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215709; x=1701820509;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fkXRxXDNvJWBq+X1C8DNSMe/FjNqNwgecSv6b+cpvw=;
        b=lJJwpnjtaCGqJtzRgjdIi2F+diHbeWY7Q9mRVcHKmcZTjjnrNbNtp865yGAF3eRTjT
         57JfsDV/WwrhnBE8tiuXN5WU0OzG25duiuVBJ01l1Rq1RhxuTr1vyq+gkupCsEzp2A60
         asQmp0g/8D6EzEuDMN2kaGTV8diuAI2kRfmU2FPDh3U3z3GjRNcMMgScHbN7e9PQYWCr
         uyxCtXs1/QDcrp0cKGQXqZP5lYlCrDxUCNGGxdQI0bHBs07BdIRmAaKEvDAxJLCSYIN2
         4YvSVuHNsivUWec6NWCmeuMA4j+ndmNqEpLR9VdIC/dU2J4rNG0/KG9BOOihCKKZ61PY
         c1Yw==
X-Gm-Message-State: AOJu0YzhfnjLlVTm3a6wrsY7/0jTmNFBK2+dCYrT+BHTj4bhAhz7MKB9
	mlAI4Hay5VqYabA5rc2PBPYh5lCSi0IkMw==
X-Google-Smtp-Source: AGHT+IGIfderlsqprv93IcnOJlPrD1okYI7zc4OuKmnBa0TN01dhY1KTcFaesK6LXP+Kl4iQwVYz9g==
X-Received: by 2002:a17:903:2302:b0:1cf:c649:61a3 with SMTP id d2-20020a170903230200b001cfc64961a3mr10754207plh.52.1701215708776;
        Tue, 28 Nov 2023 15:55:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159188-27653-1-git-send-email-wangmy@fujitsu.com>
References: <1701159188-27653-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231119.0 ->
 6.0.20231126.0
Message-Id: <170121570712.1187527.4854931678488747921.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:07 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107100


On Tue, 28 Nov 2023 16:13:08 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ctags: upgrade 6.0.20231119.0 -> 6.0.20231126.0
      commit: dc67e26b2f92255d10225f7df26a2eb11a1bf8b1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


