Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF8EC10DCE
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:50 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.31078.1702451264815035710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LRcC452c;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c21e185df5so5574746a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451264; x=1703056064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqcPPSmkdcUFziKaEXbVX9CeiasxIVcy4znKiDbD6Lk=;
        b=LRcC452c34KvHuCKJMRIf91fQo3frp/FDZ1wZsxpQMBIUO85+6VWLVhp+V4cjktRbh
         pQX7d4+oPxk2HOsorczIrkqIjD0R1ZavQzTs1mbExofy4ET2VWWdvLg1y0E3rjJk/LCY
         FYLW2K/FOVRgOs/UDYpUxfLOycLdgrEfN13y4Io4EYR9A1wACQ3rN5l3zER5QcxADfaq
         5VYUNIJQzlsHZHQZiI+5IYYvcUwV5LH3DtOCzdiNngo8mGWu0eqXXIx82QDbBYNtqmim
         oXSTHT/c5tCeQhgsJsW2VY3Ker1/4U4Bo9o8G6zKscMCkielOxlbXpIhI64rviyxEsW+
         8eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451264; x=1703056064;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqcPPSmkdcUFziKaEXbVX9CeiasxIVcy4znKiDbD6Lk=;
        b=wH7jID+Ox7inJMeuy+I8DOrK3NsnezUVqequSntak0uCKajeUV50zkdTnBKGsiHitQ
         XPmAewXtjnqMeov9aKwpQUs2/TZgjRmATH6u82/WFgFmVYAoxyqk6SU6fIQ62lo7cAq3
         kTN+0El4ngYM1kqYAXXvGL6qg3ZQ6NXvh8zooQOoVjZG/Py6AFlQ8+W1dsBsp/VWn4zg
         ndyL183V0P+m4UbnVf7CFAA3qEd8Y6cKrW2KXqNCz+QOHV/CQMFUSLZNnR0LlDJMcorf
         qzTpGNh/jHXumzT63FhEKAGOMwi4hixIn21Jnf6Gd6WaLAYp1pDJ6FA928dyq5aj+Vmh
         CNvA==
X-Gm-Message-State: AOJu0YzbKyR3gxlljikQsQ9LXQ3ptYDTAPQSDtk+24vlMxKOOEgFG/Gt
	0Q2JYsZ8uxtitS1L0yLfX+xKeVdicRY=
X-Google-Smtp-Source: AGHT+IFbho2u14sW0D/VsGk7NSjkuELPtzSAwzdkZVqJgdNQosojH9lXvYuUq5iI0XZtVfXOZvovPg==
X-Received: by 2002:a05:6a20:f397:b0:18f:97c:978d with SMTP id qr23-20020a056a20f39700b0018f097c978dmr8578681pzb.117.1702451263706;
        Tue, 12 Dec 2023 23:07:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231212140240.2600626-1-dmitry.baryshkov@linaro.org>
References: <20231212140240.2600626-1-dmitry.baryshkov@linaro.org>
Subject: Re: [meta-oe][PATCH] android-tools: remove two Debianisms
Message-Id: <170245126312.133993.7761896159786296977.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107382


On Tue, 12 Dec 2023 16:02:40 +0200, Dmitry Baryshkov wrote:
> If the build happens on a Debian system, android-tools build will hang
> forever, filling the log files (and the disk) with the following
> messages:
> 
> make: dpkg-architecture: No such file or directory
> make: dpkg-architecture: No such file or directory
> make: dpkg-architecture: No such file or directory
> make: dpkg-architecture: No such file or directory
> /usr/share/dpkg/architecture.mk:9: pipe: Too many open files
> /usr/share/dpkg/architecture.mk:9: pipe: Too many open files
> /usr/share/dpkg/architecture.mk:9: pipe: Too many open files
> /usr/share/dpkg/architecture.mk:9: pipe: Too many open files
> /usr/share/dpkg/architecture.mk:9: pipe: Too many open files
> 
> [...]

Applied, thanks!

[1/1] android-tools: remove two Debianisms
      commit: 90976455c1f2494b8b2f54db11dc4bc5881accae

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


