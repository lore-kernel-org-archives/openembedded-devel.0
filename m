Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BB9C54E6A
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.27102.1710706710170692072
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNtsjZf6;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e6cadfffdbso3279693b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706709; x=1711311509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxPimnzgNc7b3giEKPJl6stDj9hjV3fNcGL7Le3oU/Y=;
        b=SNtsjZf69msIj/lxPyRJGV0CNYNAeT85BLDvd/ek9rHEDQTzzUxyGHzXqamg/8osex
         aNoC+Z5LFIi4x8ZjbrHbMZoy0inZrdXXn4IMLI7liXGMTLEKMtidVqu5PVA27XxQVKjC
         REdYAZsI0yZIQbLc47sA95sAR6d3efBUyLdzDA9nY2FJZIzNPohLkccs1NpaDdEn2Aki
         1AgyYQmKcQTr51p40WcqDpzwQXhthPIc22nwkztHxwqgeehU+BUoiVADg9JV9E2xVdV2
         9RoAQp2hiOWhwU+1EgdXWTtu5/Pwwpjoc7Ndg6PltE6Tm8fU/IYHauh551MyM9NtK1Ch
         dTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706709; x=1711311509;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxPimnzgNc7b3giEKPJl6stDj9hjV3fNcGL7Le3oU/Y=;
        b=ovZgrlnToFFMflimuJ8zAlc+qmUnxR88GjWp56wfIeVNWhWrrc/gVw1hc6kNhJtFrZ
         9kenTe26tQVaeFdIakEDjKEiH4ccN1lXMyiXO3NqY8xsWSq6l26EdiTc5/f6d5EeVdxV
         OzH2AYL4qep/nhdXEuD6N7z/ZDZjTJuo4UAvi4Ma6SbeHDK/gNRHJqeYVM8Mmya/YmKE
         AcXcnRNe59WhZTGbUYEMYrZ39oGOu/0G+yJI4vsj5Rr8FFBPanwWAByk3G4+VMZ4OooV
         /reCD+xaJ+tcA46y6mQ+2/ATkmZTj5lI/xxj6fZEBd23RuIY0P2OZIa62TWvPp/in5uG
         9KUg==
X-Gm-Message-State: AOJu0Yz77Mb4Ye09BYTLfN7aiImSAwoduRKE8de2sKRWCJDTvpKm4DgZ
	c/vSUbs0mY+gwSy7qCzWqjIdSh49ah9JK6Ko7GqcOPrNfcVwKj+Ou2vJ4ncZ
X-Google-Smtp-Source: AGHT+IEU4iRI0FLYlCKfZShGH0Y7VsFwnbF3br3agtFn3iGyBr6ctpUZLSGlnaklF1vgUG29B7QwxQ==
X-Received: by 2002:a05:6a20:1450:b0:1a3:2fc0:5468 with SMTP id a16-20020a056a20145000b001a32fc05468mr8343029pzi.17.1710706709395;
        Sun, 17 Mar 2024 13:18:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20240315053721.5782-1-martin.jansa@gmail.com>
References: <20240315053721.5782-1-martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] recipes: Drop remaining PR values from
 recipes
Message-Id: <171070670838.939783.15550677693931997646.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109387


On Fri, 15 Mar 2024 06:37:21 +0100, Martin Jansa wrote:
> * as oe-core did in:
>   https://git.openembedded.org/openembedded-core/commit/?id=d4c346e8ab
> 
> * when people are have to maintain own PRs for recipes in oe-core, they
>   might add them for meta-oe recipes at the same time when upgrading
>   to next LTS
> 
> [...]

Applied, thanks!

[1/1] recipes: Drop remaining PR values from recipes
      commit: e722be5facd8bdfb43ee08665dc2e2d38d6d5853

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


