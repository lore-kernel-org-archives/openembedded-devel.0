Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5D5C41535
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3164.1699900447487131446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0vVtJpx;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6c431ca7826so4000720b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900446; x=1700505246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VQqrqgcisvcm0eYGc107zxW/1OnUXWgQoW2tWmvltw=;
        b=g0vVtJpx4drXeYthDwVT9WJ0Q+vC9ptAGwyiacUqjglQyNns5abRixtGL+ysW5ywAH
         IcxPEr9jkwioXnQgAI1g1cWILdN70uFFnWViK30s6ePowdkRS+Rsi57kikSvBiQMtxlT
         LDhPg1v8GaLBwgHAqN8splqIMtfzePy5QG/bkSblytHfTyTerfrDzuHMgqu9Ae3741Kf
         FEAX0bFx5UJzPTF3yxGX8QjngER8IbU2/QC6WI/Lilmo3rDpPsOaDiUrqwhnThRjlSF5
         yQuWwTnAtvAQF/8mQkBd2p9YetwGMytW9W4zRBZjCH5Nc/D+Xpm/xwlZ2evs1GmWLGfd
         vZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900446; x=1700505246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VQqrqgcisvcm0eYGc107zxW/1OnUXWgQoW2tWmvltw=;
        b=TnL+msUcDhIcA41veSUJHzQIuKwxdRpSCZGwPXQhkSsMhyTPTKIZRBud9S+dVPBK1Z
         Reo2Oi1zSZrmByWZdLCdnn5jFtRm2/gF4GpFb37vYWVcxLSzrMtVChNjEKzpeKH+fICY
         Iz7qT0qmF1sGLq0kpLwfXRkMZbkxlL+2NWUCpypcAoybwAq9f4hD8TD0OI3/pmsjZGZI
         oJCm7jtAQMEtsCZ1/9FrxnYjLeU+VzKAvc4kmUE8gkM4m6F/lhFMJ+Wdu06IrGGcqWL1
         5PKH2wy9XSQxKOL5uj2gVXcT9bjXvy/yb97YMszV+laHFAR7KaPFi2Pjob4W9FWpCR4O
         L2Ow==
X-Gm-Message-State: AOJu0YzpBEZoZE71IqTq93tYfICwPrVN2b+J+wK62IV+FQW7ycLr2FiG
	3RrIHzn4UOCp6C/Ia9G+FLe2f3PxS5yt/Q==
X-Google-Smtp-Source: AGHT+IEBTG/+JE0eHTtOMHGWRzCCRtK4SkQmw/7DsmZovEqNs1OOTNhgPHURqTEyGzZCQ95QP/X0dQ==
X-Received: by 2002:aa7:8217:0:b0:6c4:cfe4:cfd with SMTP id k23-20020aa78217000000b006c4cfe40cfdmr4736474pfi.31.1699900446479;
        Mon, 13 Nov 2023 10:34:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:34:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231113011336.2843244-1-f_l_k@t-online.de>
References: <20231113011336.2843244-1-f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH 1/2] ghex: backport patch to fix build for
 clang
Message-Id: <169990044569.4418.2115417965366651061.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:34:05 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106671


On Mon, 13 Nov 2023 02:13:35 +0100, Markus Volk wrote:
> 


Applied, thanks!

[1/2] ghex: backport patch to fix build for clang
      commit: dba4071b696df1d399f9320fb40eb8b6eeae266c
[2/2] qpdf: cleanup
      commit: f1109887083d97365e3e0c292a76cb0195af269d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


