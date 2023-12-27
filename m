Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1886C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:17 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.97648.1703665276199396225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SF0F19Lq;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28b400f08a4so3821971a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665275; x=1704270075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hynNrgqc+x11tr6DCGBU0y1Kgk8NOE5Ld2RbX7e6oig=;
        b=SF0F19LqYoKtQiPGGetdXIv9EvcappnVPwkTgwIA0kg/5eAIsXeDn4pKHS+ZEo2TRr
         NCcIvPguB9Gytdtb0jszhQ90tVTnJIl0rSzdZoAMN3A9mAFWqKX5M4Z7C/JlkLpdclUV
         K8Ppuy/VIgL0UExdrHVP5HM3yL1xQe2LNXjExTTnYBUmEAC2HNPMbY928wqNYve9Ex3B
         AKcHZiQMjxAlwrkc4TlhJhkMtQklvl11DvajjkovyDvE6Ztv3AtAuWUHz/t+EoOl2V6e
         Kjo+922eesZEyVq3y3Fi8B4+8iHT8HpS8Mt+7kH85BJp72Cz/ldNohGuC6XIKsrfP7i+
         a7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665275; x=1704270075;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hynNrgqc+x11tr6DCGBU0y1Kgk8NOE5Ld2RbX7e6oig=;
        b=igt5mVh8j2CscLN1CmRVZIPLuG58lNsSCfWZCyMT67dd3FCUC2B9gydxQhD7yG3ON1
         fUKgx3mc4YHPmjD0e8vCYoyT8+OzOUtMZaiM2huroxUbWGTtcLgqPc3Dzkzxk1LgSGzF
         s8j+whaezcVqxsvg/mXDxylLoQBeZJ3kPG0K1kaqdBWrUr3G7XQiAnXupIZzHCTNrPeB
         w3rnSnECkazmbz/Xge8DQyVRQr4tNwqM9aaYqsrgSJwkIG30nTyU3qCpQgGwbB6lBhZm
         hH3QZd2ERreiJo78RtpRJVFeTi3cZa8l7U8Wc/qrdydVHMGcbhZAqkNvtzYWYF5Jpey4
         TSlw==
X-Gm-Message-State: AOJu0YxbH4Ak+2O3YX7+G+egbB54IhaYPx3f/zWXwKb3VwpW7oe4lIUU
	tzgZ6rNhXBH7NTHakAH5bl4=
X-Google-Smtp-Source: AGHT+IGAKfp6JCyhr8fHG/QB5o059oELcl8oHscLlycpKItiduH/qn9UB1yOJXwsRLAAlDxYWpHpng==
X-Received: by 2002:a17:90a:2b47:b0:28b:ca29:4dc8 with SMTP id y7-20020a17090a2b4700b0028bca294dc8mr1673368pjc.95.1703665275542;
        Wed, 27 Dec 2023 00:21:15 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220210825.3605157-1-derek@asterius.io>
References: <20231220210825.3605157-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-astroid: update to version 3.0.2
Message-Id: <170366527464.1947762.8552459115681892809.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107819


On Wed, 20 Dec 2023 21:08:25 +0000, Derek Straka wrote:
> Changelog
> * Avoid duplicate inference results for some uses of typing.X constructs like Tuple[Optional[int], ...].
>   This was causing pylint to occasionally omit messages like deprecated-typing-alias.
> 
> Closes pylint-dev/pylint#9220
> 
> 
> [...]

Applied, thanks!

[1/1] python3-astroid: update to version 3.0.2
      commit: 6a1d0752f8c8b3a74e5a79a777f4a52288c3ae2a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


