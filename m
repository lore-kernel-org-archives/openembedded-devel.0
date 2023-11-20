Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78D1C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:54 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.43600.1700452252722816295
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FU/If3Y7;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b2f507c03cso2338341b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452252; x=1701057052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R/zEyepj0X/mBeURmQkhEe4aTlZeqWn/miqWvggczI=;
        b=FU/If3Y7IB2aVnSs1UCrZOz3jEiPhfiERLD6xqJyw8gEsXswKyaq2tRTELAP7Gd0Db
         Ic1aSgFx9t/GtawW6lG16D09uz5V0pSZNK+5G55q8UFfF9oqnJJqnvyN11XKyzgbczhI
         y7sZEfBZblz6uecQbvdlzIW4O95PYfRi5AoM/EC1txwzxzzbr0KeJzfzBtoLsOvCj/H1
         Il+FwPhcXjrmbN+t/vOfjO2r/vHqaOPQrIRB5BWHfouah7cLuPcpSRH7Qi/cnNl6d75q
         oxGekGDvJDmv3Nw45e6aFsa6h3dCpS8xJ/prxg5XMPHwjY1C+udrsrEP1CtKiPSxA8sp
         X3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452252; x=1701057052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2R/zEyepj0X/mBeURmQkhEe4aTlZeqWn/miqWvggczI=;
        b=KD999AtkSqSumD8N2jFoGVVumAFGBlTESVG5Wt7zue3AO1JZM0ZmXcKlO0C1H/rk2K
         w/vDJGmMCSxvYxgQ0Y42bmAvu2icqen4yUX5HqaOIHOOe4OmtQaM4s9T07kVGdImx3O7
         iuiqDEYGgkgEoD8Rb2Ryu0xy5GLUNHGLRm06uvjzXvILRYIZM6JkdVhYKFz0tGzroDDI
         KpzNJd8JSgBi7zCm+glIl4RkybCrVrwAb2CqxhqQXd8StVZrJzgbbut4mkGVdSZ/kZI2
         SpyzYVafdb0ub6eg+C7etf6l0wo0eGHctedVBggoDoUCmPbgGoa+Ln83Szk9OtnPnq8x
         nEpg==
X-Gm-Message-State: AOJu0Yy2Oi+8Tgy1J9Y/n5z9jDJmIh+jh1n6ZYfvKkl33mau5n4Ty6rL
	P1vYV28jGz2q7e6fCerZXk1mcGDRaZAOmQ==
X-Google-Smtp-Source: AGHT+IEcwlyBaNmSvNe+v9udYPcQm1ymWnYQMWP6j/MEwsDHzfMh3oknOcI7fbvsLPA8obLLvXsbCg==
X-Received: by 2002:a05:6808:1704:b0:3a0:41d4:b144 with SMTP id bc4-20020a056808170400b003a041d4b144mr8517714oib.1.1700452252040;
        Sun, 19 Nov 2023 19:50:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122400-21965-1-git-send-email-wangmy@fujitsu.com>
References: <1700122400-21965-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.5.1
 -> 3.5.2
Message-Id: <170045225124.1416826.1514216015567643735.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106909


On Thu, 16 Nov 2023 16:13:20 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Update network chain ids
> 
> 

Applied, thanks!

[1/1] python3-eth-typing: upgrade 3.5.1 -> 3.5.2
      commit: 3818667dc0be22c33fddd5683922d4140255121a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


