Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B27C47DA6
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:17 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.31449.1704682029467624912
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D7+P1LeN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d50d0c98c3so6615045ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682029; x=1705286829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXHHht2hSjQffwLF4y+BXQOFoagwZ9C7od1KzNKeTRk=;
        b=D7+P1LeNJTCSvQWqAwQ+yrtPT2IVcaYvoQ6pQ7IVScX/+8RbFJxaUcMqh9HVYJbTHa
         aLSPc+EI8/feIcankP/oymBxB/iL6025iOmJfrebY1gWTVrVtWpu52M07H9yWdLuEtL6
         D9bNKnef2RawO79Rcx9y3bPMapg2om/7dIshmXGdEyN0KJhOPRnsC6whlozreEjS0Sxu
         MmRmz5zDYto01J/Stu1GELxy17MMtWxtl1bsBsTvrJtZnyH5vfN7LU3wT3ihKeMpSskQ
         mGSOgsjBM1n/YUT77JQWc0yJTvBQXW5bsddGtNsW8sO1zm4FlUUaVUJtsDnQ3yRl7x60
         Dh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682029; x=1705286829;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXHHht2hSjQffwLF4y+BXQOFoagwZ9C7od1KzNKeTRk=;
        b=MLYiWWbuZCOAXABsv0dqkfsZifcvfJF2xZ4rMYdth0YwTQQUcaRN9LttHPnVVajW/7
         2mWs0peGhm22T8Z2Xk1NJe3QyAyWVPFcrIBMnpNV4y3a2Z9qlp2YojwLSsLQDIR5/a8G
         JLe7thaBbB93jQ3aWGSv0Jz2B9dniCQFX+WQ4wMB2Gy3b/MXuoe+R6nM3tdyRG35iBfc
         TvCgjgudvqs2R323ysXHAHe4nEfRNVW+DugkjcfavpRKMFZtUsv6Wwt6D7g+BFwApsNJ
         uIOwX1nlJ1BpuU3nD62Qv2UoMFQpowgw7GfzxGI2WHshnMqB6y0BxYV1xnR6Lhftncrq
         ifMw==
X-Gm-Message-State: AOJu0YwwrM6y48t0Zy9uo5Q5dDU1WGR/WIIAKAq0JHkqbAPrgAR3uhjF
	Yn0RaZmjzJtFXSIwr0H0u4kMjFPNH8Y=
X-Google-Smtp-Source: AGHT+IEEd7OpN0AuTsdxJp8XAp3OT/CzqGbZiiHZbgb68dzzaEtDaDLC3HDlg5vJ3g2bRSPNaUMTNQ==
X-Received: by 2002:a17:902:8606:b0:1d4:c811:dd7b with SMTP id f6-20020a170902860600b001d4c811dd7bmr5440661plo.35.1704682028703;
        Sun, 07 Jan 2024 18:47:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Peter Marko <peter.marko@siemens.com>
In-Reply-To: <20240103093943.959731-1-peter.marko@siemens.com>
References: <20240103093943.959731-1-peter.marko@siemens.com>
Subject: Re: [meta-oe][PATCH] protobuf-c: upgrade 1.4.1 -> 1.5.0
Message-Id: <170468202801.912276.10248430913356903104.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108114


On Wed, 03 Jan 2024 10:39:43 +0100, Peter Marko wrote:
> Current hash pointed to version with code already indentical
> to v1.5.0, it was just missing three formal release commits:
>     a15d80a Bump copyright years to 2023
>     6600fd5 Bump version to 1.5.0
>     8c201f6 CHANGELOG.md: 1.5.0
> 
> License-Update: copyright years refreshed
> 
> [...]

Applied, thanks!

[1/1] protobuf-c: upgrade 1.4.1 -> 1.5.0
      commit: 5231104a0a650d5385201da4f1f2d1228cd36ce0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


