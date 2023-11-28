Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AFCC10DC1
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14751.1701215727112860331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0bXzm/D;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cfb83211b9so30073875ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215726; x=1701820526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bFt8KiWRfK6mfIexyhuN1E9OaIb8xzzEl2cKlXTIDw=;
        b=K0bXzm/DpT/fUQbG4qguGHKFCjW4e0t1CemZvzWDtcf3GdRE+CF35EDJLdsv1FH8eo
         j1wDmIeiPHm8721hfJfO5fqb6RgED4TJtoot4uojMU+dmq7kR4gPpp5X5/awXQJVLaRp
         CVcsURADhge2xtoX3P8H/bzq8TpQOeIThvmoBVmfgc9syc5U7ShscjIKoY7bdeR9gnXl
         yYN79VXoASnKNkXrGZBTimqO15ky+B7gToKo7O9aX9a7+pfurXASGk/EXonb9iWY5FPh
         EgcS8pb7KBcrbeBGdvQFgNfonZXW4Qfs4TaB8WNT8V1gtGQmNE/pW8y5i4R5VYeGFRue
         PwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215726; x=1701820526;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bFt8KiWRfK6mfIexyhuN1E9OaIb8xzzEl2cKlXTIDw=;
        b=C/n/WgSxi6LW420iAjHRc5tsZkZImvr9y0hIZBPUerJQBtUMVNRPHFvoCPW4AflgrC
         E/nMOLvQ4erGFihYL0AHLCFGCbjnZU7vY/lOFEo3cuUrwIk7Xr9qz/HjukeKVbIkrUon
         yFMOu9WD+vq5Xk88qoa8QcP67Ly0f63v1s/3n5zHp6ECilqFHo1z0+54P3ghh7wlrwqk
         /Ol6rzhPvnIf6CwTaLrbU0E5ohEI/ZMzvaoGHE/aFb5XpTmrxt8umRZP0GIlGK3IkWyv
         kSKolhkkTdFp9A2Eq+71JQKOBisSFxmk2JkMn3OCAKLOZAR6peBflgjdJRE7fvU8aXrU
         z0bQ==
X-Gm-Message-State: AOJu0Yw1MAbHB60sGrPU89ESe2SIW2MDvXDVTFPj9SpPK/DGFrkMd2VY
	T7LHCogFOcJb11CpcNkzpZGt0Utaa0gYxw==
X-Google-Smtp-Source: AGHT+IFX+noa8I8sMFC+3+Tvu1Ohu2LEzvHmB4j5hJ/DskIXU8XjniBxh8Ky/ybwUkDtHRJBfwfcvA==
X-Received: by 2002:a17:902:ab94:b0:1cf:ba11:1adf with SMTP id f20-20020a170902ab9400b001cfba111adfmr11468026plr.67.1701215726259;
        Tue, 28 Nov 2023 15:55:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160312-28184-1-git-send-email-wangmy@fujitsu.com>
References: <1701160312-28184-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.17.2 ->
 8.18.0
Message-Id: <170121572470.1187527.14267143597097315357.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107113


On Tue, 28 Nov 2023 16:31:52 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] python3-ipython: upgrade 8.17.2 -> 8.18.0
      commit: ef82d420dda778eaa8a659dfb760524f849abefa

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


