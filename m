Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AD0CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:38:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.1464.1712759927064352221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 07:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=1qG7LadW;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.53, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a450bedffdfso950506566b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712759925; x=1713364725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+T54Ff9nAnTXFeNI0Q9c145Z7t0UXirNiKBMWAU+b94=;
        b=1qG7LadWFXv1Bv3t9ZUUwedmcUgt9eM0D99OD+uRI/iOB2DJzPfLNAtizy6b8eaB26
         v3dqT9B5UlF1OUq8nhW4VJG6oJkEnC0MEotNcva2EnXlvIbk3hfxhaVyW/H/q1gBW+d4
         arD+fv1ufHSRrZKgxzTyUfP3CMZlLaLlC0863+gTrUI0moa1YQ96Dlg+BxurX682WMHs
         wgTLozgdSonspdeJ8+vW9gfLwsXnxHXPka2B/Q6adj9VXyNFz3lsrYdSPEclLk48M1NW
         R40fF52xMU1A0vI8DEUPPbi9tpNhVcjVp2e1U8J6EMDf4wHjQnt/O+v7rCfJ7zm6tt0S
         S6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712759925; x=1713364725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+T54Ff9nAnTXFeNI0Q9c145Z7t0UXirNiKBMWAU+b94=;
        b=KlfxcBare7lqnQsYVIPN/FAS0WvrfrRgSrKMpeJmeb0ig4dL3rGH5hbs1jIrcrD2tI
         KV1SyOZqsPFC4OS4MEzQ1SljX+MpXxIj5pH6TmntANotOKdOaSjOv0yOUQlpCqEL7601
         mY9KzfZ86Ej9MbN+ZKps4X3M5AVt4a21ZPSbfYRvuSjbvcRUMq30lN2FPsceqcvXf2lO
         n/DSgVRu17WSxPz1Kje9JQgr8r6mZjs/BtTkr68PHvKsrBE7x5eBX6ZV2ZCKGhsBE0Gf
         3u1nZU9ZmkDJGeiFOmOXmCEWjsk3S7pGFWrKeyPI4yMDL06AwoErePKdiIjgdrazBViv
         ylRQ==
X-Gm-Message-State: AOJu0YyxIH/N76e7MDSCv8uLXaWuHrWQRoZTE+RnYu77WFYAjMtBrbbJ
	ks3JAr7aLzec+XesDH+3QRzK+JUleBLH7L9t6wregE6jR7W/yoKtFfEJsnp8dTpEa67JiujSlzW
	K
X-Google-Smtp-Source: AGHT+IEo31v0gayzT3BAIbMjFksfPmCyYDEaAPbgSr4AmMfezAmKq103YggusbG+/P24mLoWf2KQPQ==
X-Received: by 2002:a17:906:f0a:b0:a51:82e1:ef52 with SMTP id z10-20020a1709060f0a00b00a5182e1ef52mr1665072eji.11.1712759925344;
        Wed, 10 Apr 2024 07:38:45 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id en19-20020a17090728d300b00a51a74409dcsm6873416ejc.221.2024.04.10.07.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:38:45 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] memcached: Update CVE-2022-26635 status
Date: Wed, 10 Apr 2024 16:38:42 +0200
Message-ID: <20240410143843.77108-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 14:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109899

This issue is for php-memcached and this is not relevant for meta-openembedded.

Ninette Adhikari (1):
  memcached: Update CVE-2022-26635 status

 meta-networking/recipes-support/memcached/memcached_1.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


