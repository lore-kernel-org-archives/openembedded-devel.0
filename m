Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F91C4706D
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6814.1702967228949314621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ie6n4H39;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d04c097e34so28676455ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967228; x=1703572028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSSh+zObGsbgk/f5UIEWlwwPEThTRz9voBIO2R627sI=;
        b=ie6n4H39Ucl3ksWGNXAJCEe69vj4AJOFlkQJFp8V8Mk/Vf6rO1KoRMec5PWYd6cK/V
         Q2KzRvUpljd+b4kpbPf7l/ZfMc3RvCS0hsn041Sw6M3gcWB4DHlSmeVMSZodZxWax9xH
         TdtVOYkA6+kkIMahhZA6cIZ2r+pGNNkqYtk+wOF5nPahgczcT8Pw2qToo1BgnB7SuI5h
         0HFtMCJ7xJDgUj4/aXU9hHCimRNXSrodIR0YL+D9zegOPcPVs4pbDZC8pmWXTFYbtAIJ
         t+XSbjqUEGkFtM2F3YqtRPitWK5YQdKLSbKgmxQ3RJ2HAQvIaoKwuEoRR71oyQQHqgqe
         LMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967228; x=1703572028;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSSh+zObGsbgk/f5UIEWlwwPEThTRz9voBIO2R627sI=;
        b=uo1+XfV0OgoIP2/xzUmGG3am+nIqu68+O9Oo9Zwir2eeDFqkmp+6mBXBXgHdd6Myvk
         P0YXGr8s5W53xRd+XfHLhS4s25y8qR7ubtuYW1MHG2KykouL65hH5tMmt5ZNU38bkaMJ
         KD56tRbOA6qB+o4AMBqdQvRz8IejleWo6ABm2AsE1AhPxirrFz4zNtg+s960EeE8qQyp
         Fr0O/Q92D4ZchswEOBrz6lXupk+TUCY2TUBo0tRLe6vFN6vKhJG5fYX4Q+uLTDfa3vgS
         53tpVPCbxfaBHOrE4+TorodQ+UxYPEgbhngwUg/N7G12DexoxXW815Fui08Q4iKtQuMa
         TQiA==
X-Gm-Message-State: AOJu0YxZupOVNmGo8hfIKRuOpiE/1CemfauK+NpUJkkPScYrNWWt/tZ4
	5rjbdqsFgL5jl1QO1fVQvaXw/M7tKIo=
X-Google-Smtp-Source: AGHT+IGcQkfxDESysa6NnPoXETeSdwDffUCN1DKgbZNQrsZD7LNllMnuX/f0azgxQhamAf1GPceCRA==
X-Received: by 2002:a17:902:ea94:b0:1d0:6ffd:610b with SMTP id x20-20020a170902ea9400b001d06ffd610bmr772782plb.45.1702967228375;
        Mon, 18 Dec 2023 22:27:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, william.lyu@windriver.com
In-Reply-To: <20231213230613.253946-1-William.Lyu@windriver.com>
References: <20231213230613.253946-1-William.Lyu@windriver.com>
Subject: Re: [meta-networking][PATCH] networkmanager: Improved SUMMARY and
 added DESCRIPTION
Message-Id: <170296722752.1627685.16148962442383065310.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:07 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107563


On Wed, 13 Dec 2023 18:06:13 -0500, william.lyu@windriver.com wrote:
> The SUMMARY and DESCRIPTION are taken from Arch Linux wiki page:
> https://wiki.archlinux.org/title/NetworkManager
> 
> 

Applied, thanks!

[1/1] networkmanager: Improved SUMMARY and added DESCRIPTION
      commit: b0bc64e930851dacbe9ec8f46abf0aa0bb6864ca

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


