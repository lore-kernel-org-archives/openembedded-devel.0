Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30397C5B563
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:55 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.43622.1700452247593981579
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kl5eXmw0;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b2e44c7941so2616058b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452247; x=1701057047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEKybp+XFWsotSIqbCmwhDhoRSrFJCD+BkbnzqluvQI=;
        b=kl5eXmw06x3eeAoL4aj93F9YZ4Ttus+FGwDezs0jJPL3YbLtersLaNymmTTEwYtPFY
         ojPBhM+dSfqXOjie9qIQLgaKpQLlkuueYzwm3n8/oLeqgYCof34C4YWaFLzIYv4Fsd3H
         s1AoYcDvWvndevopWFpt4SQxIpzNbirvGDzfQwJMbZzrsBKxh9C45vBDNn4eZ9w547tm
         5ShT5u8coG0P/c7dVlCv3oh2vyWTZTx03ZnYcfmcbRUaqPbb8jds0fPM7/o4OLfJ1UAs
         GF9rVpTU6HeW46eVn+OTz4CbLFM3uuDDJelEFA0hPkSnJxmmZF/4NGAPiLnes3Ml1CrV
         Q3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452247; x=1701057047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEKybp+XFWsotSIqbCmwhDhoRSrFJCD+BkbnzqluvQI=;
        b=B+be1THCRB/KovhbycljW9ECb8vU6wmcIPdWAhwKndEPoPIuAIgYle7ytT/idKBSY6
         2PUoBmeoiocEFB1PPkdGxyDsIKmAABgaMTIcI1kLh2u4aitEu8pEPXRsiIos1sXGD91j
         hbu/0M6N6o17scrBd1uEO7Xj7cbLneKcnkkE/esrYiIhCKh8xIaVJNiXK588DT38pIbT
         ddrNSe2ZqQOznNP0iLpt1YaK8VfW6rodcaZi69OC9H+/h9c+CAkXSExpYblm4UCyIcc1
         rkutooG4fq9fVUfGTGXhNlM2q18WdmtIWNJE9pFlezoGL1bQACIGs8oFKdInp75cSvLj
         aC9w==
X-Gm-Message-State: AOJu0YwkekeZuDtS4vmlw7Jg+ZIggee8kUeYD/UAEM9h5BbArpROOkbb
	zIrVQSyzovZENCFWiEcjUE3ItDmfTRTfJA==
X-Google-Smtp-Source: AGHT+IGiddeKWBphpqULg46nM3HmeZXLihOwXNkWkEnEquqGbLoAT2+5HdSrhe53oTnHG/PgXuVcAA==
X-Received: by 2002:a05:6808:140e:b0:3ae:4cad:91a0 with SMTP id w14-20020a056808140e00b003ae4cad91a0mr1166207oiv.6.1700452246765;
        Sun, 19 Nov 2023 19:50:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700121795-21735-1-git-send-email-wangmy@fujitsu.com>
References: <1700121795-21735-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-linux-procfs: upgrade 0.7.1
 -> 0.7.3
Message-Id: <170045224610.1416826.8850748157259778394.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106904


On Thu, 16 Nov 2023 16:03:15 +0800, wangmy@fujitsu.com wrote:
> License-Update: Change the COPYING file for SPDX licenses
> 
> Changelog:
> ============
> -python-linux-procfs: Remove specfiles and update version
> -procfs/utilist/__init__/setup/bitmasklist_test/setup.py/: Added SPDX licence
> 
> [...]

Applied, thanks!

[1/1] python3-linux-procfs: upgrade 0.7.1 -> 0.7.3
      commit: 0203082de10b7e0b324fb75fe33ce3ca3b1d8796

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


