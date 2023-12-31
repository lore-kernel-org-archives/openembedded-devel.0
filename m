Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4FEC46CD2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.198919.1703983119397220164
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0KPjHlW;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-204fdd685fdso1846801fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983118; x=1704587918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KDk/fkLtCNXZbAmr1MVGHGarDfdoAdP05KwxJmUHus=;
        b=Z0KPjHlW13HTCc80CCYyuQUw0yFwVUc8NShjeBGxaz6TyFBHx/Vl34SAUtKmOt9xAr
         vvh4IPEb2Hl94QCoq6A8Ac1IYQ7p9UDf6o1cSaqR1pL/C+H4WCn5Sr0Mtf5B417SmXqR
         6lZ4HTWuF6D4029/6/0tzs6zoRpb3ngOvcanAhwSP3Ggpv5ANu1xoiGjc43B+t0fRj6s
         yYFEZLgyu4J0B6tsAbDdq9oi3soGvF3I3tgfToM9G2bXSJDp0bZZWv3foVmfmZh4j/tA
         uy94Le/jrXQqKy1RLCetNmhqOqxjmoTejK2jdwYrkSUM8KlEqN/FQDPom8nUYc3i7Opx
         wOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983118; x=1704587918;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KDk/fkLtCNXZbAmr1MVGHGarDfdoAdP05KwxJmUHus=;
        b=KNQB7B8ITEW/XC0fzDhbli4nQ90BP2TRo2jgiUisGutYiYRSNjU8eiLxUKvG1tpWFt
         whmsbb5kEUEHS4lMf17p6X/JwNFAje0J+arq/AI7JICtcqI7HYup5pvLnjTY6p6wmqEa
         K5hdV3RwdnVzjeLw3lkbLrG9WYGjgZ8ZgoLc87ny3IXT6U2D7lwN2S3c1eypcz4SUXRZ
         mt3W/qAi2l6Nis1KArtaC2oF2JkiCnnnQAmFGDAEZptSBZaijki6ZY7xoiHouS6QoAHE
         MlgxoLcDLmn380GwR3qi11+IOYgZXZG9jEjjTNNh1qD+s7cPcdJinrbqQVbxJOj/T9g4
         q+3A==
X-Gm-Message-State: AOJu0YwCrWPzOukaj658PHM1Dikw7zZ2rqbjIU8XpArh7OZR/hgFNwa2
	SV0e0msAyKeT1/pg6VHHU6PGQ6gBR1A=
X-Google-Smtp-Source: AGHT+IEHkOsAK7D1s6DHkGi7gc/hNN8GG+bAYqQvVIdvPaOju8W+JyU3uMF/FnLodVx3tkZ+LSXOhA==
X-Received: by 2002:a05:6870:b150:b0:203:a833:237e with SMTP id a16-20020a056870b15000b00203a833237emr18492509oal.9.1703983118302;
        Sat, 30 Dec 2023 16:38:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703576241-13485-1-git-send-email-wangmy@fujitsu.com>
References: <1703576241-13485-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-regex: upgrade 2023.10.3 ->
 2023.12.25
Message-Id: <170398311761.873206.14853704864855811173.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107934


On Tue, 26 Dec 2023 15:37:21 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =============
> -Cannot get release notification action in main.yml to work. Commenting it out for now.
> -Fixed invalid main.yml.
> -The escape function no longer escapes \x00. It's not necessary.
> -Inline flags can now be turned off and apply to what follows.
> -Added \R to match line endings.
> 
> [...]

Applied, thanks!

[1/1] python3-regex: upgrade 2023.10.3 -> 2023.12.25
      commit: 57d796d6304923548e5f16d16cbae9b7ed537b67

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


