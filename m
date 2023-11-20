Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99BEC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:54 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.43597.1700452245369031131
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kApfn47+;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6cb66fbc63dso699748b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452245; x=1701057045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+ohrOMFydNRLNbmQ9h5MPkQixsWl2jCLDAGmqTkx5w=;
        b=kApfn47+DktxTo8QFcbiZu2oB3W6Kjvd/qnqDqRByMV8+CgpBCKkmwYQCVwpzB5XXc
         Hutt4ZlCb1foVDVbyLxlGEsvErNjDCYzNRpu3Gdu66aIwdLQ5HMxewymjzLu+K+e4n17
         6cUwq+zScQsjYCxoVUeoyDFb7u6w1ZHMQVeS2anG9DpSV6cQPLMA+12H5MQF43OI1DhV
         abJHsmtwPmufQGHgSWiTC5+6lwiVESnsR1cIKzpFRPPRHfnzXXU2yN70nGTiA2x922Rn
         NVm15lGiEjjGLDAMASk0hBP7GzcX1LQmsizl365uNhkQBWNwHVwukU1bCwWTsYhxrugp
         w7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452245; x=1701057045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+ohrOMFydNRLNbmQ9h5MPkQixsWl2jCLDAGmqTkx5w=;
        b=h6xhZzgwVBOHc22Dsq3sBxotTwwDGtpg2t1zJjnEXZR25LuRaeKT45naIBRQ+tiblF
         gVwBS6+H9V4QTOtXanCRVXr7732PpsKNQDYAF1kcdiMBYzCUxiUKuQVrhEGdyXiLPgWZ
         pFZFwe1AXVJw8il2Ri/knmMCin2LJYaFoFSjV9RsZz8MheXc4Lj98IFhADZWQb/l5nPK
         doKxpReOJJzPT6XLhREdMbI0kzRtRBiBikuNyTjvnQg05EnUgy/rBjZjQBdku1brOuyS
         cinfFlT4ZBZsVlFkL9t2n/mTmfztVlOokyiimk3+yUJ20y9RV+lSqGLdNWOKRLO8r9Tr
         /7iw==
X-Gm-Message-State: AOJu0Yy+6cPFqV7b78qYUakYDhALxnk3k1OGIcj50T3V+An0YpGLxgrG
	nZzPe32xpJu+nuMW9l1Zod/eNjkrdLZSlA==
X-Google-Smtp-Source: AGHT+IHoaV8mG5zHesUS7X8oJW+OeCjsl2FsAwKjXfXCEqX+pqnqyIBf+zr4aslgifcVTIdU2zcI9A==
X-Received: by 2002:a05:6a00:80d7:b0:6c4:d58a:9630 with SMTP id ei23-20020a056a0080d700b006c4d58a9630mr14147282pfb.4.1700452244694;
        Sun, 19 Nov 2023 19:50:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700121104-21597-1-git-send-email-wangmy@fujitsu.com>
References: <1700121104-21597-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-filesystems] [PATCH] bindfs: upgrade 1.17.5 ->
 1.17.6
Message-Id: <170045224374.1416826.8723574423477319606.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106902


On Thu, 16 Nov 2023 15:51:44 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> * Fixed undefined behaviour on platforms where 'uid_t' or 'gid_t'
>   is signed
> 
> 

Applied, thanks!

[1/1] bindfs: upgrade 1.17.5 -> 1.17.6
      commit: 1202e52cf3f925e293542e03a3952d1e2c86e02c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


