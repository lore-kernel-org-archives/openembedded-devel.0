Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59C2C47074
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:55 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.31420.1704682005822689226
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkQn1G92;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7bbec1d1c9dso105897639f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682005; x=1705286805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPNilAI/OsBqGhSr28goRG6yFLa2PVUeeaVSV8keHUQ=;
        b=NkQn1G929JOTHwvkdN0oybd56fxw3JG/nNsRZr6rlYZ2trTbFYwMS/4rlU+j5vfplY
         BNlwQ5eCN3Ivs2+kGjl7lngaOhrlfJncPD7lgg2h8tCJ1qP1nbHKyX/VG3GymF+4Uwww
         QYW/K4sI01o3xlCWte6SbB042GkKv6kZEtC9Ubk0c0+/RZMSQPyVUe6fQLvt+3h58BWV
         LJfjLWybL8LkiId6Lg3xgNBj6X9bwuRJvMst78c1Qw8O2vSpnk8PPBjdtMPUOD9iEhyg
         gbPvuXO+CHFNi65FM5zIX1sJEk9Fff4QxXVMg1qeHtDdHTQbIvhfE8rNwJ5y0holjnP3
         mtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682005; x=1705286805;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPNilAI/OsBqGhSr28goRG6yFLa2PVUeeaVSV8keHUQ=;
        b=j/LMg0qbMoCHkEUn9QURaW7hohpXdINPO+xxjm10Xh1z9fzup0AY2hAVq+kg2Xfh6M
         4cORw57he4Y7DLaJc80xGTy1xYS1V0OXPOrSLGqMeyjM/23kv8kS9CBUrzBRjO5rJK/r
         cv6bAPcVn5ZY2LVj+1YbM8cthWScwVUs0M9L9z6TnAsE99M6ppnvekXICLpjpvYWTSYB
         Z/E5fQEQHUrdR/0CB7KB6kbWkI5Hsp1UPYnWZVilofpi3gPd5oOKxHNplAsqd78FrUkt
         Q/YJwjXHnoyPHim6fTZ9JoA5950/SmVwxqlPecda5Tb72hiJWZwDhEqyGKtW/q4GkZTe
         i1FA==
X-Gm-Message-State: AOJu0YwH7Rg70ODlb68kyClAPNvjNqxhvIjdPOp4+u8MkGxI2PLS5b2L
	VA4OqYthewNer+BtonY9H8Q=
X-Google-Smtp-Source: AGHT+IFU4ij0F+IIArB0xmV8J2g4+kTHbWLjIG36CikjKo0j1UFWZArGFaWR89j4bnTcbilA294aLQ==
X-Received: by 2002:a05:6e02:148f:b0:35f:c846:186b with SMTP id n15-20020a056e02148f00b0035fc846186bmr5773294ilk.34.1704682005029;
        Sun, 07 Jan 2024 18:46:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20240101154519.540245-1-alperyasinak1@gmail.com>
References: <20240101154519.540245-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] libnvme: upgrade 1.6 -> 1.7.1
Message-Id: <170468200402.912276.3815577479355914647.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108086


On Mon, 01 Jan 2024 18:45:19 +0300, alperak wrote:
> * Patch dropped because it is already available in the new version.
> 
> Changelog:
> 
> ====== 1.7.1 ======
> 
> * The v1.7 contains a bug in the sysfs scan topology code which could double free some memory. As this is a very common code path to execute, it's worth to get this fix out fast.
> 
> [...]

Applied, thanks!

[1/1] libnvme: upgrade 1.6 -> 1.7.1
      commit: 7a6ca59ab1f57974066a377677bb3c41908ceaa1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


