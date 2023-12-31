Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2DFC47073
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:59 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.198927.1703983132001343151
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEm/Fryw;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7ba834684abso398578239f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983131; x=1704587931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoZA59qBdLgDwGVgmzSr5ds8gTiZuxD5vFzI9iMOyJg=;
        b=HEm/Fryw28whV33vgvYzAbanEuGj96/W+cug+7xlm8+jblWb2vkc0vIT6TFNNNn04t
         AqI2P/XfR0hsmmkhfP1BLfnEiWeaRbJmZdfiFslUlNwVzU3PLs7FNYt4xFsXXh1E3Gr4
         5106HzCsjodyUd7tHTYwMIXj96TNgSXJc7+2CPV0ip8dmVQa9hdMeEkc3iDgUeSSwcWG
         nEm/mTQIpcZlTq7AAtS118x/W3wLLVk2YYFCiyigh77Dgk4ziX767Cf66sBO15s4J3JZ
         46ae6ipc+cy5blw5xY7kQgO6QnfMvSuaUZRORfe8XDO9h3GUyf8WFEDjK5FsoOphJeRf
         MmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983131; x=1704587931;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoZA59qBdLgDwGVgmzSr5ds8gTiZuxD5vFzI9iMOyJg=;
        b=uWspNKY/RkqRrm16IipTRIcqv6o2Y9wRx9GuHXb5kGBZfEAv/QhPK3Uobzke8ryQEB
         DnJWVusdYuPqEnfO5co1CsqdzxdQpprZ/BAPA6S6N20Xgzerf1tyxPXaib/2ynfXKxq2
         t39wb5WDEEYz73GTbteX1A1o7IqtZMkOWG1zVUBbhM/nUzwBXhwOZrSR8h6TsCCGaAoA
         gYeKbWNoPFA4n7+xjwL/IXgMR1XadkWYfDubPNI7oN1i87UWHYGVsD3Iqytg38bQ17Hg
         GeYGtqDKsp1dONF1tGsMieJjP9RnNnI2Iy0H38P4ql+2l9dpuG6/h6/f2ROU6AUJHTeq
         6Z5w==
X-Gm-Message-State: AOJu0Yxk2pZNmIzBrvCsptyViS19T9h48ChO4TXfigpmDCmPC4TsDUAV
	w5iaiMVn4K5rljP2+1W0Ufs=
X-Google-Smtp-Source: AGHT+IEwZsc6lPf130SKXoVaCmw5RPf8usif4dZ2yFio7PBaOZ9ACEQ1cMG1m3XcT+/pFTeqAFRqjw==
X-Received: by 2002:a6b:c9c8:0:b0:7b4:28f8:d9 with SMTP id z191-20020a6bc9c8000000b007b428f800d9mr21183616iof.34.1703983131242;
        Sat, 30 Dec 2023 16:38:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, bruce.ashfield@gmail.com
In-Reply-To: <20231230031557.1915729-1-bruce.ashfield@gmail.com>
References: <20231230031557.1915729-1-bruce.ashfield@gmail.com>
Subject: Re: [meta-filesystems][PATCH] zfs: update to 2.2.2
Message-Id: <170398313050.873206.17697697984312270209.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107948


On Fri, 29 Dec 2023 22:15:57 -0500, bruce.ashfield@gmail.com wrote:
> In addition to the zfs upstream commits:
> 
>   - This fixes the build against libc-headers/kernel 6.6+
>   - adds bash-completion packaging, as 2.2.2 has support
> 
> Bumping zfs to version zfs-2.2.2, which comprises the following commits:
> 
> [...]

Applied, thanks!

[1/1] zfs: update to 2.2.2
      commit: 639d7378ce5a049e3e035e77162cc9b1013d4980

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


