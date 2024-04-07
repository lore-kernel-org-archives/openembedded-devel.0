Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01E7CD128A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:15 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.82102.1712504594141924749
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gRpeR++p;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5aa26990d5aso544001eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504593; x=1713109393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI8D9ue+TSPj7QtXDf9S0J2N67LASM2HvADIHFIU1ks=;
        b=gRpeR++pwPNAwH9RAnyctr7nMYuHaqwFzmTPNFO7gv48licjIvWQTfYNjf+Z+M9vnJ
         VtFmDViWZ/xK7LxpAX60tbIttcjbqQ9AQYzmxoVhjwQmMgmbbSJKlB8mChD6wUDuyGzL
         lADCILf8OmV+7jIAMe8T5uZ9HQaepW4ugLMjrIgCJpF11WA4vwoNTW0m7KFnB8uibLfK
         DAT6hDLm97uLpkhsxcFCDyYnscIlRXhyOt2RyhTpAWID1zcliC9Qcugoe0vE/FN5mtT2
         9Mq+KsPd6Dhga9e5VE7pwXYFii4QaRfxVQUTmJrTAPSPbaPHjtwhd9MNrnPEY/DKT7Nd
         vhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504593; x=1713109393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI8D9ue+TSPj7QtXDf9S0J2N67LASM2HvADIHFIU1ks=;
        b=vJRxG32ZJvzt0CxU01WANJfWY4XdaihAELYgji5R6+ODCnxrYroHuMQBP1Z5KflQby
         Am3Tc0CGS14/AgeDMxQ7xpjMIZFdHDI+y1LHSNR6hEuQ01kMfJilVWQRJtAMyxvuzQRJ
         jOhefrthjDbOeGCGU2EmpTw6rGAAsEaJhyapE56DzyhZmWfGmAnDV18z5MQxVOhlUs7p
         WqdyGNSnvO6lK+kD2zCVYLEeEetIm/e9HFshZNsIRURhoRVIMdgPy8FaljQA0XechZwP
         fudY1ksPQnNq7WcEVX53fzd48vB0pzTYCF8YGNHwshwHArI0mFF5w4fr/yFQOxCIvO6t
         ShGg==
X-Gm-Message-State: AOJu0Yz0Q+KbnRP25rZbh8NVl69D3gW8PNc4qtkXqO8Bf+cGYueV5y4V
	FwB7J3PNdaVX8WvRCyEHGARGP04M4lu3m5EAKjeip4Re5o3ZCZy8uf+khfXS
X-Google-Smtp-Source: AGHT+IH54WvSLxr6nwsM5aCS7suO6eFzqDPots3812QHfJgusJaSWKTgWrxM8Sgew6jFTit2+2L6uA==
X-Received: by 2002:a05:6358:6817:b0:17b:f672:4abe with SMTP id b23-20020a056358681700b0017bf6724abemr6581183rwh.16.1712504593168;
        Sun, 07 Apr 2024 08:43:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Peter Marko <peter.marko@siemens.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] syslog-ng: fix build without ipv6 in distro features
Date: Sun,  7 Apr 2024 08:42:59 -0700
Message-ID: <171250415787.900727.10891751971903563478.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404211857.105186-1-peter.marko@siemens.com>
References: <20240404211857.105186-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109850


On Thu, 04 Apr 2024 23:18:57 +0200, Peter Marko wrote:
> Sumbitted to https://github.com/syslog-ng/syslog-ng/pull/4880
> 
> 

Applied, thanks!

[1/1] syslog-ng: fix build without ipv6 in distro features
      commit: 66d4d29d2ae43c83398fe1d661faa8b1e22f4159

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

