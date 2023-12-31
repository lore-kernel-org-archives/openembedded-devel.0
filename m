Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F76C4707C
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.198914.1703983114596439782
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PJYr99yF;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5cdfed46372so4602574a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983114; x=1704587914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOt3j6V3c7VunMT4SQR9YFX635211hB5vPkauqm8vjg=;
        b=PJYr99yF4yyCZHGokA1KjdAVH9S6a+xW56dsa//16jVu4054pL2k9lfmJSmQhGrTPl
         I2LFdFWyV4Lm8TEFVZTPiiMJSS3Rf6cYj5EskPWSIcCi5I83y74+9O4XrChy44LtBYF/
         Ed9GbChUeYhuQknrUBJPHZWg6VFl1rmYhGvhq+GygherQ+Gga86BMxB9Mr2ohep/dT2M
         6MkaxkScKMqbudCFIDLrvyphucSd8dZbrvH3/jja10QTGJK6ZnKQQ0XM52RA7+8bhSbr
         ixJtoWAQ6KQp3qceojTtLxB8GkfH5Awqg/VUAflxhdF0AGuuxibMYfkHqAMuKAUzK4qm
         Wiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983114; x=1704587914;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOt3j6V3c7VunMT4SQR9YFX635211hB5vPkauqm8vjg=;
        b=UExvunj1drNHK7htqfSQXysCq4sLgfXL/dv70c3XVdMyezay0XCCXCV0qfJJL8+81J
         smkvruNZ61IC54NZN/XMT9eCu95o0hGokFYU1t31BkqQlx5T/XGRJF1r3NN/J+ViYD4W
         +g1aMltHOY09HhMmiuzRMHOLDGWvGeqQgk2tV2bcNxpaKOhziiz//QEK+5Zt3h97Cyx5
         +d1pvRpbDNKpmX170T//1LMon9BgjNNqP1aZbRh4S99p/NdJXdvRLou7jYHbTZ0caP/T
         HUVKigMP3sGkCtwIgmhZiOjy7KLnsD0miNx8TteNonPHB4Vrn0QP8lY1sS9shRF1JeyX
         Gehg==
X-Gm-Message-State: AOJu0YwdnmxP6OvIz7EoqUwtrPjNtt/jse8SBNLWvZuNbN/crLmSI1dz
	nZ5+L2gBTkXs1JBXqPQZE4dDwyVuZB8=
X-Google-Smtp-Source: AGHT+IHU+/SbzDTYiZltOoTk2bi1PpBrseXw74wCee2iFh57vR8d9mHhWBoG+q+icidtZW9QXpehHA==
X-Received: by 2002:a05:6a20:258b:b0:196:8769:3991 with SMTP id k11-20020a056a20258b00b0019687693991mr4022566pzd.90.1703983113760;
        Sat, 30 Dec 2023 16:38:33 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574559-13070-1-git-send-email-wangmy@fujitsu.com>
References: <1703574559-13070-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 4.0.4
 -> 4.0.5
Message-Id: <170398311291.873206.4441914680892199191.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107929


On Tue, 26 Dec 2023 15:09:19 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] python3-asyncinotify: upgrade 4.0.4 -> 4.0.5
      commit: 47829c75bb56c9d4f424ffa46fa567428035556e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


