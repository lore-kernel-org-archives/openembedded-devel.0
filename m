Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49472C47079
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.198985.1703983115447413871
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbKG9NT1;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28c9d424cceso1690231a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983114; x=1704587914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQg45+YWSHLj9nPfyfYZ15R86arUVzbDKqWBROQG46I=;
        b=dbKG9NT1YysDAY1tf7lUt1W2N/o+C4Lccjks4RGDMLDZO7YPaXt3pyLdVUkHhQ8Izk
         FzPbLZMJUhEVBPyqrYpfEdwQ3J7RLo8VP4HKa6VD2Yfu+KBuHMTwgHEyN65b2g7cwNA5
         h7tIvVspcDEgskF24f897H92DZH44lQ/QWSCjp6WJW/x4xezGEYUv+kNNh01ckyGMLh7
         DUKYu8AnMTIcUQ2V+0VrI6XpD7Z1IELTZG4AkkDFH+SGooMczZU8k8o1P9y0gaEzijOz
         1atVZWR5U+APvgsBZv2hv8AV/BNztpJImts5BHPaISo52+/vaHhk0psyZKhmkmB6Wzkg
         QYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983114; x=1704587914;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQg45+YWSHLj9nPfyfYZ15R86arUVzbDKqWBROQG46I=;
        b=f6nE9MsJl33vFf6TqwzDGeuAcSXauGYvgvYokeW0PgYm7mqB7121lmBnbiYWvjLhws
         k/SJ4UYdp/FNwg8w3AvW9IzSTXV+gDtZWWIeskCslX3DaF3G44jWlPQvRYEirsobRcYj
         5zShMKmq//yHOb/F1IbIvL/xvGtf69avvZdTumoW+Pz18sklYNKcXv1P5/6NZrVkmbV4
         Lv0kcHrBNyghCJYx/NpXc5Df0GSNd/j4xVHhhYamy+0Rgywcd8Zb7y1CTCyFbPd1p7lh
         fN2LQvyK9y9fhHf51HdsOU1A/J4z8IxFyFYFxjilJ8+AlIz59RclVJrump8p6LH3BD1k
         abqA==
X-Gm-Message-State: AOJu0YzIm+kHGwZX895lhXgL/t0UQ9yJYwzBlAm6XhYzh2cVuMHZBL3O
	9P+hNEJBhcjZZ5TIYI+l7np+IJHIOSg=
X-Google-Smtp-Source: AGHT+IGwHSReEEIpCCT7kUdQtiMGFCcnroAy51Szk/0U2i4z9UhPdwK2vTDlyZJtnv9cKyzZ0SKqvw==
X-Received: by 2002:a17:90a:7d0e:b0:28a:c6a6:6d69 with SMTP id g14-20020a17090a7d0e00b0028ac6a66d69mr17551183pjl.4.1703983114598;
        Sat, 30 Dec 2023 16:38:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703575301-13160-1-git-send-email-wangmy@fujitsu.com>
References: <1703575301-13160-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.9.0 ->
 2.9.1
Message-Id: <170398311387.873206.1215766417572090924.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107930


On Tue, 26 Dec 2023 15:21:41 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -* avoid buffer being unnecessarily initialized with 0s in several
>    functions of the 'bitarray.util' module
> -* fix '.count()' type hint in pyi-file
> -* improve testing
> 
> [...]

Applied, thanks!

[1/1] python3-bitarray: upgrade 2.9.0 -> 2.9.1
      commit: d9d42f84d73e9b4b37d8771fef5b876088c15e88

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


