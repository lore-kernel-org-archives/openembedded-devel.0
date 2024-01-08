Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FC8C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:16 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.31445.1704682027081955010
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ggSuyR6q;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3ef33e68dso8558925ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682026; x=1705286826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnZUv4SQFjotfNnZOwNKMil9r5MLE57nadLGev/3VO8=;
        b=ggSuyR6qF0CmjXrrWlqGLotknAof+XZLcGuV9WG/X58FhSZENmDd8S33ZrzmIvDk32
         u5BwSqiPB1rR0e2sowc4uYOv/8WGhP3XU2TWRwQ+ErM02ARjWLE5oAqNaKIC5eRq8fTK
         aVe5pFNHX+rE64eHPamFJ2olBN83hajRnlLgNquhBy2ow5gexmKBrdcxu3TK9rxi69CA
         54kKmc8UbFvNBHxMNhZi2qfp0aljmuAdlea9bF7KtjVV4XRa6z4HauBP7knrgclzAtEk
         oH1pG/8WbvBhRkFq65kM0NVpwRMy0A/I1828wob4RqwnjBd3Y/hZiOhpQw908NxCZolk
         yp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682026; x=1705286826;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnZUv4SQFjotfNnZOwNKMil9r5MLE57nadLGev/3VO8=;
        b=Ogiptx0FIv0Ugcxu0mJa4kfVNrLsEGid2qKh/9Z4kXU3QNOvLboBrOoITJoZUWNtPZ
         N5n+UW1wjxHrrf0jVmZLwAJNOGjo7ILMNcK7IrcYamKoEjAIqcfulRLsbcv/VSx2H+w+
         ovSyikJX41G4ia6Y1Ji36Q8GDSi5fv8uoPBC3zcL4guZElPywfynh6/+3zIvtm8kwrn5
         LQNo9gQtyg1Jp8ljQS9cG6/f7A8YSVe7xzQykYgRiqvH+WBgHAOZDDFOICc5RmOHlkmy
         ajiT3YczxPB+yZjlwkCXF2VX8A23WTefY47wyErNy9RjyV306vSbZU1dy5s6fLQO08lO
         XJaQ==
X-Gm-Message-State: AOJu0YyqpNtlxv0CmSM4LsTn/cFOu3cHHfcz7fKiSIMSFdJ76HanqhrX
	WZs/tDiDKm+NTD43biIoObgHU8AQPcA=
X-Google-Smtp-Source: AGHT+IF8TutJfyfPQEuEJpNPDB8q0TDg4PgyielgtLMGyfoo2GZrg0YxnVH2NYVNDtho7NxFGJ5/AQ==
X-Received: by 2002:a17:902:db03:b0:1d4:cf60:4eb6 with SMTP id m3-20020a170902db0300b001d4cf604eb6mr3855551plx.38.1704682026533;
        Sun, 07 Jan 2024 18:47:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 "Ilya A. Kriveshko" <iillyyaa@gmail.com>
In-Reply-To: <20240102222459.847246-1-iillyyaa@gmail.com>
References: <20240102222459.847246-1-iillyyaa@gmail.com>
Subject: Re: [meta-oe][PATCH] srecord: fix install prefix
Message-Id: <170468202543.912276.5568028151174595156.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:05 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108112


On Tue, 02 Jan 2024 17:24:59 -0500, Ilya A. Kriveshko wrote:
> srecord's CMakeLists.txt was unconditionally setting CMAKE_INSTALL_PREFIX
> for non-WIN32 builds, which caused it to ignore OE-supplied prefix
> that contained the sysroot portion of the path.  Fixed by setting
> the prefix only if it wasn't explicitly provided.
> 
> 

Applied, thanks!

[1/1] srecord: fix install prefix
      commit: 7b66ea10817f90fe4b869de7b3b04d3aa4b2714f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


