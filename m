Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00701C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:45 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.43596.1700452244518408667
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DxBEZPna;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b5ff072fc4so2614998b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452243; x=1701057043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQfqTaJ5bQmh3h9VcKbuMFj7mU+bu42t9lFK1KFs1cg=;
        b=DxBEZPna4efJr5/LtlIG0m1JdmZDwxQC3avxpStCoVv4zW5glS8GsefA740d5T26R7
         Ahlhs9HNcEzNkffSiDQupGqDxFBgT3SdgLmTSjoXZd796ESaAqVmI/0yY6gRc5D/3H6L
         PQh7GyGO5DYlqNEd7+2E4rVxo5BN0Nt63+le6WkBw/Co3pTPadtDh0rW1VgrP1vubcC+
         QqxYrQ/UBnsD5oHuMW3mJodFAc5//K/veNrMbr2/KhkdocIbGOpkIj5mXx/ucALDciFJ
         SIoYLZOaFWLPsl61Rd4GGBKEKrN4paNrgizH1UAgOZM8fxCudYbKc68u01KjT45lkg+/
         jcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452243; x=1701057043;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQfqTaJ5bQmh3h9VcKbuMFj7mU+bu42t9lFK1KFs1cg=;
        b=QmGRxAqcwJzrO2oa6OeJqceNH2GvDdQKuuYUvL7fbanaY+43YoroBi5cRue4GgZryH
         hqR3+LOXLilxoN5A2DGCCpDztthO/1eutT9gkIQCpWZ65sja6nZ50MSAcHLNNYjAXAPD
         2OBe4Ph+IHS9KkmkzmniNi4cjDX7V9T90EqVV1DzBClWLIPV423oRFjAmury6WfLfI7E
         ZHCnc/XBUKd1Vbwq9xrDmopyfG0TI3LI+JhYKUGUtCgoueuHdWjUzNS1ZrzpyjVtlNys
         VOxMAKWU0vUm5Lt5OpRyYCMpEXH1IF4c4eROtoOeuBf6fJpy9Od28Ezf3G0zOJmVr2MV
         p0gA==
X-Gm-Message-State: AOJu0YxmFsxceU7uh5+MT7rTZkuIEG9HSaPe6/YfmIoa58ZtKa53CwUc
	3KkaFnBWUl7GH09Sm4bqkKw=
X-Google-Smtp-Source: AGHT+IE9oDUWw7LI/uS+M0Pr0K4iCuvFtVLYReqtVy8Vi5YFsCnx8mvIBf36i69g5MF4fGa6SeWUAA==
X-Received: by 2002:a05:6808:1288:b0:3ab:84f0:b49d with SMTP id a8-20020a056808128800b003ab84f0b49dmr1306358oiw.3.1700452243660;
        Sun, 19 Nov 2023 19:50:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700120893-21503-1-git-send-email-wangmy@fujitsu.com>
References: <1700120893-21503-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.19 -> 3.20
Message-Id: <170045224252.1416826.2179487245898282928.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:42 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106901


On Thu, 16 Nov 2023 15:48:13 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Fix indirect syntax accordingly to (but not by pulling)
> -enc2xs: Fix indirect syntax
> -encguess: remove duplicate "the"
> -Fix spelling in comment
> -fix gsm0338 test compatibility with perl < 5.8.8
> 
> [...]

Applied, thanks!

[1/1] libencode-perl: upgrade 3.19 -> 3.20
      commit: 8dea2f5e1df33d0dfa8d540191c7d73c09c85820

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


