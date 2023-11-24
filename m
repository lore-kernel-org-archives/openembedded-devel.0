Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B3AC636D0
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.120990.1700784067981455184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cE2cxkf/;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cb749044a2so1341581b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784067; x=1701388867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhFoJV6Pp24/eOpTGJcyM9eg1uO44YzHdCk0v7RGRQk=;
        b=cE2cxkf/MyzVdxKpoe8GYWbe8+p7UrXnp8qT4rw6MPoFCyjdI/kwYHrU3aW9QTGaWc
         e72t/lszvhufMHF2JgryjuaD0cowy/OS17/UTx0CUFbGG39Nf8Vq5Tc8qEje6nKywema
         MLYUqoDguiZ551ciW/7CjqCOuuPgwMK1xTpZb7Hw7J9wH1sTpps7gfr17NplNAh85JXT
         US4EbyGD2bs+K0dxBu+pvBZRkYKHrptesCkoyI9QBIWjs0/BwEo1f6yWAnxgPw+g4w+/
         jQim1bcg6PvfMPAqUtI1hkUouVVUxL2qlf4bbr63su0UnVLPKy5m5intD739LS64usII
         k+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784067; x=1701388867;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhFoJV6Pp24/eOpTGJcyM9eg1uO44YzHdCk0v7RGRQk=;
        b=MDl3wbZtjqnNL0zRqn0FYLSnM744F6GRyI0NuC8mwnu/oyxQmjDec/Gz72cwYww/aY
         18YNDv0afJOkzC9+D67i8Fj7kvqh4uuFenhe2+ym8dQSlgoKdSXy1uxXy/CVMYVxuIXF
         iByFuMq2MGM8WZM6dICUilwwugOIcxqkVqrW5GbqQUOkBRcchIQDp7x9zDgzDj+SO6gq
         g5tfoK369SNZBxzFrFJ2imGCHNgGTPJkkr3a2Ba8jAjkUrny3Gnrcn+VxnyfyhSzsxJh
         Y+jk6dcATM9EApp/Y+lg5m/K7z0vNO3u5rf89AtGqY1LAjVNwz+qfpnvtmW3BxoLrfsf
         Lh9g==
X-Gm-Message-State: AOJu0Yz57TxI9YIBFo/ghVzncUUc/h+1hUSUhFDmAKy+eXtP3iLDyZIA
	byy61tsPrBjTEE7L4PgnCvPBOKJNFsnDcw==
X-Google-Smtp-Source: AGHT+IHzl8OthCVyDUUiccMqPEZiVo3ZZS+WzNdlWMkgdtsOF1sqndeyfBlv4bjm7UIV2fBXyChbMQ==
X-Received: by 2002:a05:6a21:7896:b0:18b:4e8c:471d with SMTP id bf22-20020a056a21789600b0018b4e8c471dmr1573861pzc.59.1700784067149;
        Thu, 23 Nov 2023 16:01:07 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634619-8139-1-git-send-email-wangmy@fujitsu.com>
References: <1700634619-8139-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pastedeploy: upgrade 3.0.1
 -> 3.1.0
Message-Id: <170078406650.3118595.16414522897240984597.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:06 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107037


On Wed, 22 Nov 2023 14:30:19 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Fix python_requires package metadata to support Python 3.7+.
> 
> 

Applied, thanks!

[1/1] python3-pastedeploy: upgrade 3.0.1 -> 3.1.0
      commit: 34d731c20638299055566bfb29d56031a2db6c0e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


