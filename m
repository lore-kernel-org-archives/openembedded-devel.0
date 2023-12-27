Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C14C47258
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.98045.1703665281747044615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SI5cxFcS;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28c179bf45cso2791128a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665281; x=1704270081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of74Sf9OFMChgvPVYk9aGGYh5FwD51ZqRA+Al2rWIYQ=;
        b=SI5cxFcSQEkT+g/qhHdlx33feeQ7KupjH5krz4WXuGZbcHUEfLKZLQwmbYKdUf5NxZ
         PrgIRU+SvJw58XwVa9IHV3bqTvwose8hq7cdb1SxIIXIF0xgF3k7OMzZLiWKmTSL3OwC
         yAecGmidajJBmL4sapOhuVT7YZU5Rv6tbXtW+YoA9JNThEDr+sn6cWT44mTFUsoVGcXf
         PClbF47+e/xvRbh72QQ3x6VLCFtXQ1U/9Q0LYmuwJQV0Bmp9F70kZRje2OgqjRn3vbck
         iCKziaLo5kaCVKGDOQgWx07hLUCTSlD5wOQ7TZF+9LixYFgp+wUnlFqvICmPVsZLGVyQ
         4VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665281; x=1704270081;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of74Sf9OFMChgvPVYk9aGGYh5FwD51ZqRA+Al2rWIYQ=;
        b=geXnHuV1cFMIM0urLgU895hrWNCoWjQDkRBd/+HER9vrYXLCGaQdsEfKt+ZztJzLjl
         EDgv6s7ioQFg57KomVRjMIU8z5LggjMv8W9J8/HP0fawFksYVejV9gI6B1SG6C29buKY
         Tl3JdjAlYCEGAEXur+bmyOO9DiDeAT12CZJZl8l21DuFinHRMTptlBF6qxWF/qxC5Zkw
         M/Yq3ohW5Wuxvv9JRVg3Gmg2/JVZCK6vU7GVGW4RVNicnMiDttfL+qzRhdU8fXcb2YUo
         dHH5Uow8Mq1bmI1TWEsqaQjcs17vuXbJQi9jVTHhS01Y3ug3QxEx+pyubbchGQJsaXcm
         F6nA==
X-Gm-Message-State: AOJu0Yxkd2aFXrOEsZ76bVL4ut7xDYj6ZrtzhcL+zStow4iKRQK8b/+Z
	O7aBPnMUMerMvLOOD86idfI=
X-Google-Smtp-Source: AGHT+IEjkGiurLtL9b/9NPxZf7TbWfpUnY6SZJU/8ddUM8HE8RIgPAewGNyAJ78Akl5GH1X/63CnEA==
X-Received: by 2002:a17:90a:c7c8:b0:28c:c99:38 with SMTP id gf8-20020a17090ac7c800b0028c0c990038mr3627116pjb.4.1703665281156;
        Wed, 27 Dec 2023 00:21:21 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220221908.3789842-1-derek@asterius.io>
References: <20231220221908.3789842-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-pdm: update to version 2.11.1
Message-Id: <170366528034.1947762.13095356693440526021.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:20 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107825


On Wed, 20 Dec 2023 22:19:08 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-pdm: update to version 2.11.1
      commit: 50e241df341cdc9059bd2bf6b4f830a139d39d21

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


