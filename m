Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57B3C433EF
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:27:09 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.143.1651422420529159244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VRFmxQ0z;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id iq10so10984134pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TPqbSEV8m6E5CV73dUC1Ygm+yH30tD+cpod9MnvCcjM=;
        b=VRFmxQ0zTTPKKUTYmF9hDNYudaWKL66K9dLA3NGlS5H892gA+j2dWpH8Whq2vESjwl
         kUbYeW68SdpgISByXY6BBcewGmFmxky/DMhZft8jJ7PZ/HuYaYGKPax8+6dyx67dEZEP
         QKdFzAblGx0QFq2ZDRz+B37zIGfwdXL36OD0sRbYOOKpM8MeuwNQ/DofH6uzuAUBRzZw
         j3DPEDqM0IguvKNCHV5pieujVVPSbqLoVoGWKveYeCBmyy1V1tB/cUQnl+N0cBhsJPiR
         w8uV8N+wdRU+2UOaniFm9kh/Vul1d1B+pm+j6SefSBwANLO9d1RLPBVdZQvYcc8SyJsh
         eGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TPqbSEV8m6E5CV73dUC1Ygm+yH30tD+cpod9MnvCcjM=;
        b=J4KMthQHUWJ3SUX+BAUYHpiEvCoIxPpsfoSY0JdKBaR/UzOkLB/cBbbrImxJzuQ8mS
         csm/EAdjwVXLgEyNxlsZqGB8RPKJKXnkvt9uRd2gL8d1O7CdhNBnnIvm+G7kqUKSM1B3
         GTCzXADSGHWTfDwAup81pgB8HzbKFDO8lyjHw5ctNWxPIEpyDi6b3y3xFTl+e3ngTg9G
         6jTD5oNaB+AUgPMSd74cirQ4cb3LPADX3arkbnz2LvfIf8FRlbK0uBaFkdFj1XseptQ9
         fHVt+SOJdONeTfBJWCL0wBiQhAXrdaRNyIlGuowlYTYeAl9SE2xppw71dAknaCSqAi9a
         rSHQ==
X-Gm-Message-State: AOAM533ibml75ZnqinaOyD8MOd1dwt76bsxgyecrezvb5VYSpa5REp9x
	0XsVFaWeHbySxgLgewb1eOpn76S42mctGA==
X-Google-Smtp-Source: 
 ABdhPJxEfnydsEXKuCXTiTWJvNzv2V7rRbCh5QjJQdrGDKqvvIDeFQnMNawKQEb45PB65g3lga5bCA==
X-Received: by 2002:a17:903:213:b0:156:7efe:4783 with SMTP id
 r19-20020a170903021300b001567efe4783mr8171078plh.126.1651422419725;
        Sun, 01 May 2022 09:26:59 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 08/10] firewalld: move to dynamic meta-python layer
Date: Sun,  1 May 2022 09:26:41 -0700
Message-Id: <20220501162643.513646-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96920

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/firewalld/files/firewalld.init           | 0
 .../recipes-connectivity/firewalld/firewalld_0.9.4.bb             | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/files/firewalld.init (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/firewalld_0.9.4.bb (100%)

diff --git a/meta-networking/recipes-connectivity/firewalld/files/firewalld.init b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/firewalld.init
similarity index 100%
rename from meta-networking/recipes-connectivity/firewalld/files/firewalld.init
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/firewalld.init
diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_0.9.4.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_0.9.4.bb
-- 
2.25.1


