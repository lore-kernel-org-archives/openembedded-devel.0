Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4939C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:29 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.31061.1702451239605201822
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k58nAIJh;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6d9e756cf32so4258315a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451238; x=1703056038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EujV0r2jCWFhaDExCaTpL+smGo3MXKOFdtLqMqkTaWo=;
        b=k58nAIJhYYajbS6tHoxBKFuiPjjL/+D1CeupdEuG8//ctWESis5/sSim5ER5+hA5JE
         FNx5vvJAhPoxjMrsotzEbFxAPYhimwqCESilxWcDa5ctZ7Q0PFp0bjLBrUCQms7E2EY5
         wAAXtxrhAGrLWbPhUhyvArliEhZslwNHo4FniFwPnDSJoeIeb2R+cojUZJNErP1Ie56q
         rkqFtfeKKcTok4LTKr7MJrq2GQGky/NkNtAPdHJNPYPfhEisNtZyEpqgaZXfHmQ8xyZY
         iaMYD0EoxrD7BH3rMeMsKVPmXY8sDioCFGdO73LXD/FTACP3EPkFCOmcyEBkS2BdcDoD
         O54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451238; x=1703056038;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EujV0r2jCWFhaDExCaTpL+smGo3MXKOFdtLqMqkTaWo=;
        b=MrFLrJhWbUBUt/2bl+3OX1P3P/NrTVON2DYpYLlaa+iKErujMVvP2PUa/zYzX/7Brf
         fcE/cAINc5UQcxCfWkqMF/ewtdpqIVHFA+PEGSZCBNX4qjhyUyHf/Ds0OAuaFVXoIBbR
         4oD8/HOYBbAwoljPpSOkZnpCb2wWn8f9Vh/45yVypEHQAeAiFGf4cke/RLga9/7k3LHY
         X6FkReZiMnXBW84p4I4PZ6mOsOi9LEelgzKeH54QiTbnxGJsVsVv4i7GQxrOr7CkcAFY
         aU5HtTroL9PtWtcRJuKFERLbVCmsf0varKfhyuQ9rXWqpXnNM58KiRCkYB+sJrY7nBnv
         WMBA==
X-Gm-Message-State: AOJu0YzAk7vUitLgX4/sMHoCeJbf3sHaQJGIEcN4RGWadh1cT3TYNvIX
	cNqdqWeHck57O+E6ogsYnWGvM++e0EI=
X-Google-Smtp-Source: AGHT+IHg5QjduKHZv/dFpUf+iqDQjPfakDb5HvHa/D5tZFYc96BaL4tgvmP76bXNYhdvMjpJCebF4A==
X-Received: by 2002:a05:6830:1d51:b0:6d9:f0b7:9e7c with SMTP id p17-20020a0568301d5100b006d9f0b79e7cmr6890423oth.33.1702451238570;
        Tue, 12 Dec 2023 23:07:18 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206131314.303185-1-alperyasinak1@gmail.com>
References: <20231206131314.303185-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv2] xstdcmap: upgrade 1.0.4 -> 1.0.5
Message-Id: <170245123788.133993.10085934423521635221.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:17 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107355


On Wed, 06 Dec 2023 16:13:14 +0300, alperak wrote:
> Changelog:
> 
> * Remove unneeded variable initializations
> * Remove unnecessary cast of XFree() argument
> * Use C99 loop variable declarations
> * gitlab CI: stop requiring Signed-off -by in commits
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> 
> [...]

Applied, thanks!

[1/1] xstdcmap: upgrade 1.0.4 -> 1.0.5
      commit: 40daa8ca7c6c7db184b2fd1d2af7c132ad0e6d54

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


