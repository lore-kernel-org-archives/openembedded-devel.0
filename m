Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB14C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.43640.1700452274590332667
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpJr1x3X;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so3694173276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452273; x=1701057073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPuxI2KGSEg8kCLAFe4njBFnAQ9bSmUoF10xWrxv2oE=;
        b=RpJr1x3XAjOejzYmA+CYIuXbJxXXwWC7fBkJhk9wHUz5SBdcltXjYZm5oL4INjSH1W
         dbINPjFI1zwV/o3bEvELfp0wJJthadfJ6cuixLdTzoNHoPDkJbm5H80O/Dbb6R/z4nes
         bHSz1iYy9Z2Vif8bTor98lQgO+xLBL/HcUIhSKH/eE/u0wk4ZvOTe882ygNMxKZzh982
         XhAXoEtHNE4sEzw5IRyVoNpmH3SjSEh8u6lG0hE2X3HczzYYdBfns7L7DEfohbbUrWOf
         +KVEUDBW8SIvM14OvJVMEqNg/PqOUJ87te7kepGzTT1b+DIDI8LiMnNA/2If+U2NaLca
         fTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452273; x=1701057073;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPuxI2KGSEg8kCLAFe4njBFnAQ9bSmUoF10xWrxv2oE=;
        b=pwsvC8N3EdK4WImTXgRUTrLibP6bJqfrapOaPQ2h00V00u9ubgzxmnbwEm+kersNNX
         fatLixCLcFs0qesEJYPfCju/ohSzr8gPguy5R47/CSqFlMdELcOZdWLj+Xjfm7hnYjAo
         gkBVpzjaqItFiGYwdHU5y366GaCnvmoa70zkFsASWJGJ3Y4F5r70qbDmZvdu+BB6+1Cj
         m0lUzmlkep7WgT/vkU/4GSYwds+kuNhAwJwuM2xlBamBcPSVpup+cRI7hN3D2A+R9IaE
         hsoqKUkqDKbQwTrF/7K+fGoVG11ek2B2AcHkzmo7Ge7X06CqS+z/As8l3RlQJYm+ZLCd
         zaag==
X-Gm-Message-State: AOJu0YykFD0eFGSp5jYaGbto7unOzXsZNycnwL6MAldnaIUIXO4bhDCK
	oZCcyQcC41TCD0AJDovQ9TbvdJiZmvw7Bw==
X-Google-Smtp-Source: AGHT+IEbUQ/f2n67MiWxRKClcq5NSXXZVpj6UfCtqb45WukOPvpl2s+YAxR4gcoYUYf8cp5jOKN0dQ==
X-Received: by 2002:a25:ce8d:0:b0:da0:cea9:2b3c with SMTP id x135-20020a25ce8d000000b00da0cea92b3cmr6530297ybe.59.1700452273601;
        Sun, 19 Nov 2023 19:51:13 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700124531-22887-1-git-send-email-wangmy@fujitsu.com>
References: <1700124531-22887-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] webkitgtk3: upgrade 2.42.1 -> 2.42.2
Message-Id: <170045227265.1416826.16593080980779245851.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106929


On Thu, 16 Nov 2023 16:48:51 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> - Bump Safari version in user agent header.
> - Fix CSP regression that broke Unity WebGL applications.
> - Fix the build with GBM disabled.
> - Fix several crashes and rendering issues.
> 
> [...]

Applied, thanks!

[1/1] webkitgtk3: upgrade 2.42.1 -> 2.42.2
      commit: 700e3a36fbc70ef7ecd5fa2bc820f0922df5a528

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


