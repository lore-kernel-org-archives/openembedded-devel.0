Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2289C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 16:36:02 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.396.1750610160720697189
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 09:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0LK9qlA;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso6609457a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750610159; x=1751214959; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+JnWOt1lMwe7RwZlRj27ltQz8006dTDrqL2ANxE1u0=;
        b=F0LK9qlA+SqkWwVpSPFnsUGaFSJkZeVR1ClMz0xDUN3QQlwYZXZGPsLso/H87afaTE
         XX7kcriD9sYNfMAOJtB3Kcpw634Ipo9ZWEAhArz4UKitdUZlvCtF7wFbVdTWb+KfJaFJ
         a444bjtAuI3EsVI+Xgid/8cqYb0PvskreRJhk+I0ji4JFV3Gm00OKMR0KsoBR1E63ceB
         KlXScMCrHkCmGCeXaORqMWvv/llfT7rwpqvvU7cu8I0EIV29SwQ5lnhLPX78k8UzfLR+
         7OVgkVPJ3V93FG86+lnuxkE/7w1eJxYTR2+pnHo/Y9mbMuZpBKauMEuw4WewD+iyxseS
         r/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750610159; x=1751214959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+JnWOt1lMwe7RwZlRj27ltQz8006dTDrqL2ANxE1u0=;
        b=Oq5rqisrgTxVKF78KlR2Bl+LLaV3rjyjNrf+b/N2Y1gybLMl1he95oOj60Z7nyJB4X
         kDqhAOqADYq1X1pw0579H9lcF43c7pPeGh9Bq0GuKzKPfhbNQxrF3y1GfZhA1K99tawm
         wNacHWI2wxVlOPMqREBD4c6F1HSgE+MpuPecF9GWMCKa4oA1R3COwPDPOrR4hRDRE/98
         Gfbf6en8OXHl76h/RmVkOloNDFlBo8SRiGJDEl7/ZoujVB1qULuNg0i5qGcJCWm6klRn
         tQTK1WyFJd2PLyitelgw0Dls+yda5ZgNoUK6+2cTeycm68d/GQF4pEeNFNXHI9ykydKj
         Chyg==
X-Gm-Message-State: AOJu0Yyyq8tqW8HG1DjVkDJLUkm5vm/945ZFnktbveIbRUUzJ9TjQy+X
	JszUnw3jSGtqpqqjfK/Anz/Qe2Kw5xy1Z5QoV2ahtq7NIaGSrVKtAyQZlkCqwQ==
X-Gm-Gg: ASbGncvUcticu5UYIe1all/Pcvf5XYLdDWUcnYO2LvDw9cxItl9jLSoMsnhoBicgWeb
	mOcdu0MQ74Ja7dfio1D2ViTO1Z8loHim7d6nnSWA9vM2h7R8qdFs11+hdmHC4NCVpCfTKNUzfP0
	9mH8cFI2Da8fuljOsv8wH8vWxqnAgNdg4NVVrW8U2AXV86tQikOWFSXF5rE3S7BNDZbUUoByrkz
	k/qhq8t3b1z5yG6dHbZhaZn9MhcM59TFKKQgH05KGglP1DOGHkhratOX0cM3i4dGLXLfxp0WuYo
	oZLonZ8OF/DTVdIHety5E2iYKLD4zr4H741Hv166KMB93V7+qD9CrgMFNp+yg3KcYGzWVfto6t7
	mSj3n
X-Google-Smtp-Source: AGHT+IHkhstWy+tURkGDnKtFK+bxmN9YqwaMyp4q5dfcqrXdwhNPy6okNQjoLaCMlKzZphqB+QaLCw==
X-Received: by 2002:a05:6402:524d:b0:608:b3c3:3aea with SMTP id 4fb4d7f45d1cf-60a1cd1dd23mr9122770a12.16.1750610158745;
        Sun, 22 Jun 2025 09:35:58 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18d018c1sm4876551a12.78.2025.06.22.09.35.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 09:35:58 -0700 (PDT)
Message-ID: <5fd3d391-7612-4d7b-80a0-7b2f04f837e8@gmail.com>
Date: Sun, 22 Jun 2025 18:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: ignore QEMU_OPTIONS for native
 signature generation
To: openembedded-devel@lists.openembedded.org
References: <184B26232F1A96E9.12316@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <184B26232F1A96E9.12316@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 16:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118022

Please ignore this patch. It looks like it solves the problem only in
some specific cases, not in general.

