Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC09C54E60
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:39 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.27101.1710706708999603588
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hmfQkXTx;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2732155a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706708; x=1711311508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQKjLHf26Q+AN86ZSqCoULgifTMkSq82X2KT4E8C964=;
        b=hmfQkXTxbuQNuTPctZnI7QTLyM4xgQym9hMCUeFN5+9LeudUDWZ8xMajVqmXNBRWmG
         hPHDr+x9W4gMlVwgqSHAIUavo85kzI5mNyTJkJp1c6YZKmpCMBRekguw2Yoxi0eTnS+B
         lu3dSDiuF5QKKd6PhQixM1tdU+PCEX8M6fQBbiCj2YChwLwU5EhrbQVNKrRUMzhgU/5A
         JTKm1xFaYNZW8Xledq+78YhAy8+/fVEDQU5kPUYEAOxFtgu3g5t5YMlnoDobGBPNHTOK
         1cBEYZ8MSiv1sGYF+/IYW1JVjRPFtg4uP8pU+uker5XM9N/QBFMsG4Sh/LIcmVFHsyKZ
         qrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706708; x=1711311508;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQKjLHf26Q+AN86ZSqCoULgifTMkSq82X2KT4E8C964=;
        b=YuaXj9tB3AZlkQoUwQI7okkrzKsWF0Iu+8s5A6LrOsjq0f1H+UfVRregSSoIPgtv8R
         p8sAGj1ZqarwSO0qk3iQpK3+QozQZNb/h4/LP5GPAzVeVzsetAtDikGRqtqlbUKz6qAj
         QlSHSzU+B0F9FeUJU57QezDuq4dpIYu0ostTUIbkqpotRsUkgLzve3LfUZOfabKBl2mw
         ga5c6gE3RI5ESPQ/P4MwisLHCcs3FmgpAPSscuiNyZGEIsddHoLEBR3lLqUbxZIlaOkH
         pZuis8aRBnSP14eHAh+qdV02W46hfXuAJpsvb+qBtRhltdpNiTKEOXVwCP/vYCubOkm0
         hlXg==
X-Gm-Message-State: AOJu0YyscxHvvi1oQ839++eteCLApm+Mjoz8Bjq90S28H1TxRos81/oq
	VnDTrkmYBXu1xTVX25knL7QAEs1ttkGYaisBtsNVi2C9bZJZcI7d5S/MXXIA
X-Google-Smtp-Source: AGHT+IHT3LvcLBsFWeg+Tvx9PxjP8ezNBpTji2NRuLxqxjkwUmHo4o2V7jTLkpSbaQuSNBhqnesuQQ==
X-Received: by 2002:a05:6a20:3942:b0:1a3:4e19:183c with SMTP id r2-20020a056a20394200b001a34e19183cmr5714518pzg.52.1710706708249;
        Sun, 17 Mar 2024 13:18:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Martin Jansa <martin.jansa@gmail.com>
Cc: changqing.li@windriver.com, alperyasinak1@gmail.com, chen_heyun@163.com, 
 omatiush@cisco.com, niko.mauno@vaisala.com
In-Reply-To: <20240315051529.3751-1-martin.jansa@gmail.com>
References: <20240315051529.3751-1-martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] unionfs-fuse, dropwatch, postgresql, yasm,
 multipath-tools, python3-pybind11: add missing Upstream-Status
Message-Id: <171070670747.939783.9438596680501544366.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109386


On Fri, 15 Mar 2024 06:15:29 +0100, Martin Jansa wrote:
> * add Pending to .patch files where it was accidentally droped
>   with upgrades or modifications in:
> 
>   f88e5b146e postgresql: upgrade 15.5 -> 16.2
>   c904e169db multipath-tools: upgrade 0.9.3 -> 0.9.8
>   105be9b3d9 unionfs-fuse: upgrade 2.2 --> 3.4
> 
> [...]

Applied, thanks!

[1/1] unionfs-fuse, dropwatch, postgresql, yasm, multipath-tools, python3-pybind11: add missing Upstream-Status
      commit: e49860ee219f52525307a4e4e4a318d2df76cfa6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


