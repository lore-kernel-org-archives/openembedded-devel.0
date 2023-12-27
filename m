Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB56C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:48 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.98065.1703665307962424115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Akz0QHjJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6d9ac5bd128so577941b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665307; x=1704270107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQtF5jSZBluFoOSPTU8FV5l9i6/Yb4DDUgPBBxL7ngQ=;
        b=Akz0QHjJcGm4ZaNhmfgq3e4YWdltnNYlYFo9K+otSTQFP3NCCLVimn31wKzF6Qe3Fh
         OvOYqTl+SLRm1frRAsdkL6soxodRVw7VdIGam96F6E5F0GhV+fackUCfZU0cwYUydJby
         aqBX6fEG70XJkq5ZOHsK0vZj0POD/zoLVov5IfIaGcaSxV2t2G76elSQNhfndTTuJfNP
         qU+felIEpTlZgLfoF4qJvI+5EJfE26qKsUDxNZSOuUodVCsCJ61AddLQ9MgH+3+yOk9q
         PxmXCngNzn5flbYHFaDjpIscWuXIXEkR9ceeKLRcBc/tDnczPAdEnBgKwU/BW02rRFaw
         y91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665307; x=1704270107;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQtF5jSZBluFoOSPTU8FV5l9i6/Yb4DDUgPBBxL7ngQ=;
        b=cxKzmXINNhnmMBMbePt5Kbn3+DW0c1kbdGfOAdTdpPxkJXPBRsTMj/NKNvu/VXWI7T
         I4FUWgvDonpOmtH2yK8PhXKA1TCfumY0c4yOar1Gnu2BugnrfZQXkAtNh4emCC8lMja/
         medUZoTXZ2j28+icUthjGoyC5E0ZKGvue0RL49pBfERWjoAm2iqRN333w0RhR5st21Zx
         rrEy9Ms7E45HO89WOZNxyDQB1vWsQfzSEq2ED56SkI2p0Z2bTCu1e0wYJLmy/NpR34ZJ
         NyOCvEb8ry9PtvE12sh3/rvut0fPzY8VYkZRwOklhaO+GuG1DUkm+IrVsQgiEC0Ne/Tk
         058g==
X-Gm-Message-State: AOJu0YyhKpwZGT+zyAZoolOu49JXwkLkL3AmJ+dwYN4Ghi2OyP9+cThc
	j6A9ZQJvvGF47xjJC04Fb2w=
X-Google-Smtp-Source: AGHT+IGEzTpnjRFqNRa7qGU8VYUatBO+AgPrOKP3hozY3x9xoE9ktqqLc2o2GBL9I/RN4aks3GcpfQ==
X-Received: by 2002:a05:6a20:1596:b0:190:31c1:31aa with SMTP id h22-20020a056a20159600b0019031c131aamr3485574pzj.49.1703665307327;
        Wed, 27 Dec 2023 00:21:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221182648.3921326-1-derek@asterius.io>
References: <20231221182648.3921326-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-flask-wtf: fix upstream uri and
 version check
Message-Id: <170366530663.1947762.1087141645148191874.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107854


On Thu, 21 Dec 2023 18:26:48 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-flask-wtf: fix upstream uri and version check
      commit: a434b01e7b8128fa67d2096bf19cb7be3a437cac

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


