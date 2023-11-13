Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4944AC072A2
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3139.1699900422273432305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MWg60A77;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso4049715b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900421; x=1700505221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5mIglP3O/vjOvfseXruUgZTAa+XoEJjJUm9Daat8GM=;
        b=MWg60A77OxyRVRubMzYi3Vc06Z5SOmFCH+5LsT5qut50f/kGMYV1YnGQZ4MA5+Utqq
         sH5k9PO58zRSaleCHhc0p3MKx81ExXVnM+nPrew40CBuVf30AZLq4YDkY6gRcrO4c283
         CXPXGHQ93xd1afVF9R8woIxZO1xwPt14oBIsBmLpqsdXtdAb/A4itAlt/pSM2mPGiZO4
         A4VMPsI79QqqQ6NOifaj6Yg0leAebfq10wtXWk9KcrGm1cL34DfydfU1Rm38HgRympTZ
         4n5+3e9SZdxDdWj7PgFQbl36sAOG/DsCTfBUT25EkTLHE97g9wUV4VsOf2fTaEnGKXnD
         di9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900421; x=1700505221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5mIglP3O/vjOvfseXruUgZTAa+XoEJjJUm9Daat8GM=;
        b=mv+kF3eTEDTqc4zdHo0u8VDJxCY+rECsD0PCAjEPOeuPiRak8ISqi/+o2/WoXwuOsy
         0Owh93jUuWSEKNpDlyP8d8oBIeoFGK5y9lGt1MB0AKF9T5GZOpkalB6kcPWU+GQe/i6S
         hAODUfilVJ4wV8Wo3p8nnCKm0fvO7V6BPayda0yW7mjeiwwpoWgc5qvc4DVflNNI3QAV
         ZDpiydLidVHL7DMZDWctRaIfbCjZL24yAS2o9prcXkvSgdTV4a50pkqyFxRUE2DbVhus
         v4fpKOl1OpAFekgEbnXkeT8yHnbdREQZV1eRN8AlCIor5e582YNNpYtKwOzcBanPkWs/
         J4dw==
X-Gm-Message-State: AOJu0YxBaBArLhrCCjwRkQjU/dg0hHIAUIpX8Rv4GscAarI2mNXeuy0A
	Z6jfDgS0sZxTIvKwbWUCteFARAJQcgaMtQ==
X-Google-Smtp-Source: AGHT+IFV3XDf13LngSCxGgd2XX1NEul+lWLUfuvcvQ9aJlf2vLpMkceJBxzMk1J+81jJXH1E39G+sA==
X-Received: by 2002:a62:fb0e:0:b0:68b:bf33:2957 with SMTP id x14-20020a62fb0e000000b0068bbf332957mr4660764pfm.22.1699900421236;
        Mon, 13 Nov 2023 10:33:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231111193458.3422863-1-alperyasinak1@gmail.com>
References: <20231111193458.3422863-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] catch2: upgrade 2.13.7 -> 2.13.10
Message-Id: <169990042066.4418.4772222719713372473.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106646


On Sat, 11 Nov 2023 22:34:58 +0300, alperak wrote:
> v2.13.10:
>     Fixes:
> 
>         -Fixed issue with catch_discover_tests when there is multiple of 256 tests (#2401, #2503)
>         -Catch2-provided main and wmain are explicitly marked as __cdecl when compiled with MSVC (#2486, #2487)
>         -Improved break-into-debugger behaviour for ARM Macs. It should now be possible to step execution after the break (#2422)
>         -Replaced deprecated std::aligned_storage (#2419, #2420)
> 
> [...]

Applied, thanks!

[1/1] catch2: upgrade 2.13.7 -> 2.13.10
      commit: 1bdab916b1fd70ce9196aedac319df5dd8b6dd15

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


