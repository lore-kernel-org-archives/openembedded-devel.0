Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091F4C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3158.1699900442039761390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPQGrgG+;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso4050092b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900441; x=1700505241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN7FQdgC6SzUSTzRdun8HcFdrhE5+Wgz8ahjDZ7XcYk=;
        b=MPQGrgG+jSHGjPpD1h8cUbxOI5C7APUMUfLh9C3brUzpLx/fFATd1t55KcOVURGOSH
         OhFz90cjBELOIhnRxTD55hbjkdX/c8OnO+Q6V74DUyLyWy36JrbI7Q3XAHtatZzKoNQP
         cz4vTayMBOAb8gQdJqTCdjNxQ1Htd0upL9y4gpq+0gp/0QOOlN0mlvR0f947mg9YJV5B
         xnimNHmJ5u3IKeVYbTH6D6hPxLrWytjNH9FTHLYbtOenwRGS0/SXEqUlxh2yvcd46aet
         FvWZ1U0nYYtu84G5FikOeztxwSIoazZ3c6OxU8RVc97shQibQRf8vAcyANRIdIFSbuOd
         qqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900441; x=1700505241;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN7FQdgC6SzUSTzRdun8HcFdrhE5+Wgz8ahjDZ7XcYk=;
        b=KUAMvhCDYCOFoQHiAynuLH2sfz0Oqy+3iM6DgdOtxxjDnvFDcB+4uF6wZLGts1fiFh
         hz4A5gLT7WEgJD2gGueKwT+62F58rX9O+wFlIRJnSySzbn7YaZcabW85nN766CgeGvVr
         UNVECK7PzViNQ/E0VtIiCh00vsx41YrUO0Fu7ZdIP0da+jjVdpdR1Zlw6IZV6UbbubwR
         vOxynWQG7VyFSKOfbhdT2kIt2XmEnF6R1+0oW42+fCMFofyREuEo/qMvEdoyjdbqLqxC
         7RB5EpoUDuBaeexhe4cXZkpUwRdMl5uNt01FAnXWEuIOSDLXfRGutQdYsB3IH945+V8K
         8ZLA==
X-Gm-Message-State: AOJu0YxLrEs+2dw8EPe5IawDD6kgt/sRAMUTtG5Bzadw4QUom67aJ9j3
	BD4HJTHLRbZxkWhpnjdx4uIaLLg/cYTQhQ==
X-Google-Smtp-Source: AGHT+IHUTdoZYg9sJLHgtFzuaTVK7zLEY7rnW2Tm1MHOfg4q1loSKd+fOVaUVL641OU+tSfKe57JYQ==
X-Received: by 2002:a05:6a20:8408:b0:14d:e075:fc5d with SMTP id c8-20020a056a20840800b0014de075fc5dmr5916371pzd.40.1699900441227;
        Mon, 13 Nov 2023 10:34:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:34:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112161657.553436-1-alperyasinak1@gmail.com>
References: <20231112161657.553436-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] opencore-amr: upgrade 0.1.3 -> 0.1.6
Message-Id: <169990044058.4418.737529801780206589.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:34:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106665


On Sun, 12 Nov 2023 19:16:57 +0300, alperak wrote:
> Changelog:
> 
> 0.1.6
>  - Fixed an infinite loop when decoding some AMR-NB samples
>  - Fixed noise spikes when decoding non-voice frames for both AMR-NB and AMR-WB
> 
> 0.1.5
>  - Fix an autotools issue with cross compiling from the 0.1.4 release
> 
> [...]

Applied, thanks!

[1/1] opencore-amr: upgrade 0.1.3 -> 0.1.6
      commit: 55274f650e304074783d171a406454748b2d456e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


