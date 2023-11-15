Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA08C47075
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:47 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.8070.1700032781722461433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmmRUpPL;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7c011e113so75785587b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032781; x=1700637581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVnCVmUWHJtJqJjNCQPkzy2WePScGeiYn3RWP6suwIM=;
        b=AmmRUpPLMl7HPrkIaX/bVDYcg+nl0h2EFxjQiXHvbYVaQcu+GKkCmWMM02YXuLwOcT
         dlYVVKTP2TIjOAzlMe1cbb1B5eqT3lG1Rqz73McY4gjNxtLTbNQSOWUK59lutfvzzvg8
         muzy+Fn3choVP35XRcq/R6vRao4OGh1WsrHGxsJtYEUgwCLy5sSPNCMeOVwrureQO9n0
         uTpxbLzekCfpRMVAJ1U6ZB6ITOsf4jWKZAsUJZ6nuzJUBY7Y7AXCA/zOeitp5scqOFpQ
         heMW7OK+e3G9AQrPnN0uFJV42oEEFrAj4k57jISHCvXMaS1EPUggezhQ+Xuk2zztqDlA
         MGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032781; x=1700637581;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVnCVmUWHJtJqJjNCQPkzy2WePScGeiYn3RWP6suwIM=;
        b=GGcVqlClzon8Fly/IJsOdKx9pqMvzJWrT8SmawwlnefitOMyFLfRTRybtUJgPFad9v
         Mi0hiXipujXIEICNmdhLG110cuhPxADr3sk99DHgwOFZSiUj70oLsusL3AhC9h0RMIhL
         oeLNsTtD8uhXmQz7iujCRQ2zB2ZxOqkKpBABqjeA0DKcXMIw7RFRL22dK4cmP+j1VZCm
         Ub+0rdhOkZyu4Yj7DvtPC9k0qeSNzH8rGFF5cEHxha8cVzfZKxHCsgqXsIujCqG9GJeq
         7NLyQmvD7gZNC09vSpZ3kibch6O//4yk/VI6txhrGh8bfQU4/YZuHLkDhfEeZ/dzchGV
         EsPQ==
X-Gm-Message-State: AOJu0Ywi0Ge5QCDFPeMMKhSJecpvE/ZqRV8BpuGhJS9rKR8PIBh2dZjl
	RL14eyVjS7D/BUeoZLfe5ok=
X-Google-Smtp-Source: AGHT+IFFkXJL8bB6x1ASxAtNyA4GZhBgxdgV1uowpyh2urf75D2Iju8rErMaOpDUIJMf0UDq1j7cTw==
X-Received: by 2002:a0d:ca13:0:b0:5a7:d73d:42cd with SMTP id m19-20020a0dca13000000b005a7d73d42cdmr13401022ywd.20.1700032780828;
        Tue, 14 Nov 2023 23:19:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231114121543.2717-1-f_l_k@t-online.de>
References: <20231114121543.2717-1-f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] gnome-control-center: Add rdepends
Message-Id: <170003277949.3928366.12402865301891488725.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106741


On Tue, 14 Nov 2023 13:15:43 +0100, Markus Volk wrote:
> Add cups-pk-helper and system-config-printer to rdepends
> Both are needed to get printer config working out of the box
> 
> 

Applied, thanks!

[1/1] gnome-control-center: Add rdepends
      commit: 804cadfd2ad98cc59e9e21e10c3c08e89958cc41

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


