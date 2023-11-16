Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364F9C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:51:21 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.19069.1700171480166548726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UcNwNZ2+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28039ee1587so1024804a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171479; x=1700776279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fREovR8hF+L12DdmD2ahs+TgyCxlSmPg5/shkdy7SfE=;
        b=UcNwNZ2+74AkzH7sABbjFVMZCqegtnho/iCBVo3yMaIjQyIQ9q+ge9+WcQsDE4nGQI
         QxC47gj5Egsl49yu1ucyNoSylWnQkqydOsnOkkqhGJHUhqtV6Wf9VhSBkBhFQF5WuDML
         A5524mdAxO49Mg9bzquCedTzUhf0KzkANFmIt+Ei6m9SsPiC/bspJeDYRp7biHPLzAMy
         YdCfGzweXPzlIax7i4ed9SBwUAG/p4o+rcnTGUGPpWVxCbopvCPNAODjOwKZqjPiIH9P
         fiyLoFy2lBV7IFbp7FyTyOWiLj5nKPUSRVC5u+HLA+mLjBwCXzZAN99u+Ej15KV3olyJ
         xK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171479; x=1700776279;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fREovR8hF+L12DdmD2ahs+TgyCxlSmPg5/shkdy7SfE=;
        b=PqkYw0/LwhdcRI7QZfy8PvnNseydc74CO/8MpJAJ/FCqEgez5xOLC3elM2+ZqiJqaM
         dEG0u4Ysik9vYbtP4mXyxnm52oUC/M17TytwRASD5+ZX/HeMV2Uk1GSjaJeUXAqgx79a
         yqNWtPmEFrgjbZBhm4Py5152/I0fdrxWN3oGccNgQozcmbpM8rooZsM7aOlobCANxVXP
         5SAaXUWAx4WxT4NKqkJfUIegGuNYU2bk+Xvs5M9ypBmvAi1LnlSXGyeWaji5mc4l7OhA
         +FbiunRAfXQooh35vRJfjrV/SJkoCNdNyIfEpd1uAEItymdtOeRdWRPjweXhr0ko95Qk
         OX1A==
X-Gm-Message-State: AOJu0YzD0o5S3UJuObL081Zs30L0ZUE2QhZkC3FW1HA7RJxwle1l5Dft
	WqglyWwXh9AYnYAM/toHGvU9mcTy8ctlJg==
X-Google-Smtp-Source: AGHT+IEwnwTghNMRZvWGInD64aipPwdPcuAUbKDLKEFWiXPNtFa8B7mv7Hy3KwUW2gJ7yxcI3nl3Yg==
X-Received: by 2002:a17:90b:1e49:b0:280:2652:d4c with SMTP id pi9-20020a17090b1e4900b0028026520d4cmr17284509pjb.13.1700171479480;
        Thu, 16 Nov 2023 13:51:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090ab89100b00280469602bcsm1997692pjr.2.2023.11.16.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:51:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231115063243.181768-1-alperyasinak1@gmail.com>
References: <20231115063243.181768-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][master][PATCHv3] libopenmpt: Added license
 change reason and dropped md5sum
Message-Id: <170017147893.249256.4378534487554184011.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:51:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106832


On Wed, 15 Nov 2023 09:32:43 +0300, alperak wrote:
> License-Update: Copyright years changed
> 
> 

Applied, thanks!

[1/1] libopenmpt: Added license change reason and dropped md5sum
      commit: 9905fa07c42f9aae06117bb75bed7366426e1389

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


