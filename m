Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E6EC47DA9
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.31434.1704682018265469182
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=goLfc1Wa;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7bade847536so86588639f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682017; x=1705286817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uqlXBJ8shG25v9QrZCzhX4q4QuWQtkPQYrxyIaeejE=;
        b=goLfc1Wa62ZuMaHCWkksdhdYSSU+FZRAno8Kx3x4g5o9SNZlY3WbpPy3smODiiJve9
         L1Op730vYIQlxdEc9RWsSVIMOheHHZ1JP+/OXJoOFp+vMYFMWEKyBo5tC/LD8k1zLFPl
         ftBupALrjJc6yGr70GHiJmQxcFxNeoL+2PA7HRKQXPNZUUuRmbJuiEmhmIQYMSTKI3If
         pgKkEiRJ3vRjt8biJFyb89qMVEofKIv4WV3oFHZLqfcXMgsLVYxaSGzxr/CytKDVzIuU
         yG1sjyS//S0J7A84D34Sla70EaMxE/uwFirPgTmgiybSjHsPbbdWT+7AU33UANIspPMt
         ZIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682017; x=1705286817;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uqlXBJ8shG25v9QrZCzhX4q4QuWQtkPQYrxyIaeejE=;
        b=htx/1+sWrOCLf963kh3xJscJEXzesWVYE2ey/3vW88d2+lvVyx6J1lKpTLygANrZK0
         v471rEdOp8QzrVZC5Nvzs/RLm92oR+0npPdR1OGDPVn7pOElHQlF3VZdbjo5bZDpD3A4
         CzYXAmUQ7JqcK/pvilRNYCYUlRB2McteZK6AGGkxfDw13V2HwLkffDiSgi559z8UryhP
         WChNkWFYqtmEanpFUpe9EIwLLmPhKrJHHUkItU2d07bNkDCqNnfdHeLz485h3p3J5MWz
         j6hX5EGBCSiNaxqkOKsfc6mp3dtG+lAtJqbK9EaIuz3qDJllx1qesuuLMklqPL7hUQgf
         WP3w==
X-Gm-Message-State: AOJu0YxpFYNNzeyk9d2XtAHaBYm5bfi0Au3FYvOexEOlFRmFUtpcYzzD
	iwG6Xz4P+e/Y41+SfTHKT2M=
X-Google-Smtp-Source: AGHT+IG6g08Vq39dGuDQNVGu6AKKJV+tyXRZDW1gcGUJ9t3eU5QfUWJlQOxxxjPF/F7rBq3tAcpYXg==
X-Received: by 2002:a05:6e02:1849:b0:35f:e863:a6ee with SMTP id b9-20020a056e02184900b0035fe863a6eemr6327420ilv.62.1704682017492;
        Sun, 07 Jan 2024 18:46:57 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179340-8177-1-git-send-email-wangmy@fujitsu.com>
References: <1704179340-8177-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python][PATCH] python3-gspread: upgrade 5.12.3 ->
 5.12.4
Message-Id: <170468201684.912276.16144079492850979853.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108101


On Tue, 02 Jan 2024 15:09:00 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Bump actions/setup-python from 4 to 5
> -Fixed default value of merge_type parameter in merge_cells function docstring.
> 
> 

Applied, thanks!

[1/1] python3-gspread: upgrade 5.12.3 -> 5.12.4
      commit: 31fad7ab5eae467645622153f456bbae468b2d4a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


