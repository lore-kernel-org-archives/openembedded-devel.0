Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F32C4707C
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.31453.1704682033455003741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQMITAkR;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28beb1d946fso1250160a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682033; x=1705286833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRkEFGxHi4xHw+gtB0bK7RmyOv/UBcCI3WDOTBGHeuU=;
        b=UQMITAkRCkjzSUA8YbsTX+VQjxIpgPEzAQqNoxuo1aWfBg91E97ePMzgtyDzzxsJhH
         Ebg9pOyMS9dJrBPMYkdb36Gm+DL76k2mngxeKw3jhc9QmFe1GRMoywYG59+zJM/s6ePr
         nxviu6+qM4zw/uLRvVGy4i7DkQpvBd084F+LtaM9s51tljAKu2F4tXIk+OUi3B10McAY
         kJOg+0+DJtIP5AHVpxmHjib8lt0WYLmZDGlIhnSRDbwv3bewQgWkA9vc/tIV+gXM7I8x
         TELvsRU8bA2TmAoi1ZPBTei/rhvANlxXfNAqsiu6i7pXuK1GJQUcE3V7J+joc4Jk54n/
         vJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682033; x=1705286833;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRkEFGxHi4xHw+gtB0bK7RmyOv/UBcCI3WDOTBGHeuU=;
        b=Pof5IqOAXJuyquZGkRln2ZOZja9RKvtOEInf5Z8I3gKX5l1qzXyU/6XDB0f7PgBeLX
         7rfj16ffug0SzpQ6nTS2/8x34V7r7kjI+AddNAAMPwNpkWiC1fZ4fDDotBwMajxNNOks
         kcDggEUYqpfBprHpPX9Hb3xOFLyPjZW2F2x9XXsnHHT+kvdPMoypfJJNjm8Jp3D0EaFN
         tJi2pKGxVxERpL1CFD7vNE8D5JYnlgulze5zIFsitSgTTagWi6PLVtIrbsPJA/YBOMRG
         /4dT6My1x+fzApT9vh+vYDu46wyDNX9ncpSsroEJNkJQsUpLxqrFpHNXeEt9LCAdIYKc
         z7Yw==
X-Gm-Message-State: AOJu0YxOTLzoWQdy7mJjs/GUqB0eWU0gcp3j+t575HJtX6zyshsg1eC/
	idaR30qrWKTd7ZsrFmLqX/JAFSWMOcg=
X-Google-Smtp-Source: AGHT+IHuQZVjIO38kkhlw8oUrCKYg9H4rF0G70KyNibbABvJX2R0wdyD65SEyEG3K81FUQArZovm3w==
X-Received: by 2002:a17:90a:de85:b0:28b:e9e9:e0f with SMTP id n5-20020a17090ade8500b0028be9e90e0fmr1197295pjv.17.1704682032916;
        Sun, 07 Jan 2024 18:47:12 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>
In-Reply-To: <20240103172810.1833032-1-festevam@gmail.com>
References: <20240103172810.1833032-1-festevam@gmail.com>
Subject: Re: [PATCH] picocom: Update to 2023-04
Message-Id: <170468203226.912276.16552536393117671678.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108117


On Wed, 03 Jan 2024 14:28:10 -0300, Fabio Estevam wrote:
> Update to the 2023-04 version.
> 
> Use the the new upstream repository and drop the fix that
> has been upstreamed.
> 
> 

Applied, thanks!

[1/1] picocom: Update to 2023-04
      commit: 8838fb392808881366d4bcdccc3296c7413413f9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


