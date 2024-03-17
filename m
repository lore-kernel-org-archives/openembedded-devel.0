Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D825C54E72
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.27247.1710706711381127263
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNk1VCBV;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ddbad11823so34806895ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706711; x=1711311511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cy9fe6euFTabHLC+Hy/Aq3qAZ5PZEe0iH6UMK5DFcp0=;
        b=FNk1VCBVqThp/eMVrPCK3vdolbdHqfIGeKYQwwm3quAKsQO5uute6e08RmufYpi7Qb
         g9RYu89nzEEozxgkdV38dWTKLaWmJvuZqIbzJx5EySCQ9Ed1Z/WBtecLswNm67rO30rx
         4mPKfB4A1/dnEOHWL1fu9BkMRbvwN/MblaRuhITEA894biqbj+w2AdtlH+Uoe1jWaTC1
         NpXYaF4at+6IesSwswLOOX8x2SliKsX2woYDQSeuHqxJeo4/QK4qw1KsrFEuEpMlz/C7
         1Frsy8eORxkdLyV6qJZtbURKbNFAPs1d9EZVIc5J1l2PPy5VSabsf3aInRvLaL9/Y5M9
         /hIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706711; x=1711311511;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cy9fe6euFTabHLC+Hy/Aq3qAZ5PZEe0iH6UMK5DFcp0=;
        b=arO6G87lw9KsUCr7nUHse0g6cPeju2j+hfv3O3VVMJzhytgvAmuj3qgH2dgrUWR3pg
         bZIZ3hHRZZaA4r5HFKmyGho2EF5Hjul6Lixknbp/60SOiyAfZxY65ztApi18ULTmNMWS
         +trZU7IML2eK28w6FaNSIKVx6q4QvD3gSAuVjxURHKdeLYVpO0iCcVd86YmOL2sCkanm
         OpPVza3kOfLUgkJzeSClRZL6N4i/wuGqbXdtcig9CUuGjlMtCHPkUQGDk5KrN4j+yhsx
         GjO8W4ZYqeRx0+cQ6EEeAbIVcez3ybB6EhrmHyv1wRA06JscNx/j5XPitAjafjFU4oGC
         TUKQ==
X-Gm-Message-State: AOJu0YwnO7BC4arN3BChgvTFVaPLIX4ihb/1fHKAAw12a15pw1E05ifS
	iDF81uUI3NxmAaY8HVM/r3p2CgYrNOiPXxavMMFJ0pLFMH0ARY5lulcbqkv1
X-Google-Smtp-Source: AGHT+IEDRC7QnsvyQRu8xLf+wc7d0kkm0lVdfDlm7nj0qX4Jf3tiLd/OMI1WeDLrIBhsOF0nilwEWw==
X-Received: by 2002:a17:902:d586:b0:1dd:a3d7:dca3 with SMTP id k6-20020a170902d58600b001dda3d7dca3mr14577669plh.11.1710706710610;
        Sun, 17 Mar 2024 13:18:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, ross.burton@arm.com
In-Reply-To: <20240315114159.1063479-1-ross.burton@arm.com>
References: <20240315114159.1063479-1-ross.burton@arm.com>
Subject: Re: [PATCH][meta-python] python3-pydantic-core: just set
 PYPI_PACKAGE
Message-Id: <171070670954.939783.16818008703006544121.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109388


On Fri, 15 Mar 2024 11:41:59 +0000, ross.burton@arm.com wrote:
> There's no need to set PYPI_ARCHIVE_NAME and S explicitly if PYPI_PACKAGE
> is set correctly.
> 
> 

Applied, thanks!

[1/1] python3-pydantic-core: just set PYPI_PACKAGE
      commit: d52c3b94068f660b729361bb969129d50eaf81a6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


