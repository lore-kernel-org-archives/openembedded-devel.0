Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F2AC4725D
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.198982.1703983112170049334
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dh1SA/CW;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35fd0154368so38751515ab.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983111; x=1704587911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM9Kr47lZMa+qfA2YvJfGKUxK/6/DwtHgiMPxvvOojM=;
        b=Dh1SA/CWw8BwGlxU+27j8M6oByzz8a7TPR7CLFk1jLsFjtljQR/ad/sDOjGkD4Wp0/
         T4ykpUYgvRFVn7BAu+tYaCc44JrEXEhFuVJtJUdSGTgfqJnqYZtuM1wntE8XXeogIHqD
         E2DWYC+vF2VyaolY0L9lnxD3xBy2rTGMoIh18JyLIpZQCGrzUZv4vt59QyzrzE4WwwTX
         9XQ7S2FSL1GrFRtlAqp78JnkHla6zOGpLrXcLDRIKY16vSS/fA4DSCKSXU+qYyna6suq
         VdSTIApYFRTHuBLlj85biWyr2iRuEjsyuGwMMXUkT9S8TjoPeJza0vU5DAM9gTnbLe6V
         XHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983111; x=1704587911;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sM9Kr47lZMa+qfA2YvJfGKUxK/6/DwtHgiMPxvvOojM=;
        b=NUlsXoKTi/NE1LFmjkXKPkqfRvi10CKTphL9kQyzGP8fS9THRlhaa6cLFNfkdIwKpy
         6Z2EBviKvfDJuV8fdKnsdKNxjYxbbTnihRuKM2dN7bEwTw99KBFZvuOIqCbzwa08eQ9O
         9N7DpJQUS2hjjD3pexBIcAc/uJtjTElvwpQRX+UMJw0lEfHx+NfN2XbTF0s3iC6nzIad
         iiRuMvnP1mZ0jwVh2a5SIm9qw/NEtzgi7bZLMOnxXrxRtESYCJ+KFYP2gVOWElrBtYnB
         jhtHqmYxp9wmIGOx9RkdNaVS+skKHEJzWE29pBjzq7o0yCFDVupJupZTPTG28nfBuxou
         92LA==
X-Gm-Message-State: AOJu0Yyo/pfN+CV93aEVjky5C3QSgM9DBYHWez+6JCvyuzXiIXpuGldR
	JhHDLeADD8CK/eaKDGJ1zfTcNs2JoKU=
X-Google-Smtp-Source: AGHT+IHhXDpAYSbpPVoRxDJOeSU++fi9thAG/m3qszjjWwR8npDweXg00878hPKPL39hy+69XLCOOQ==
X-Received: by 2002:a92:c567:0:b0:35f:eab7:6d19 with SMTP id b7-20020a92c567000000b0035feab76d19mr19801372ilj.57.1703983111258;
        Sat, 30 Dec 2023 16:38:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574365-12941-1-git-send-email-wangmy@fujitsu.com>
References: <1703574365-12941-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] opencl-headers: upgrade 2023.04.17 ->
 2023.12.14
Message-Id: <170398311037.873206.14063152589393672313.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107926


On Tue, 26 Dec 2023 15:06:05 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] opencl-headers: upgrade 2023.04.17 -> 2023.12.14
      commit: fb8f7ffddfcb3edc815a75b70a3c26c39f40e31f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


