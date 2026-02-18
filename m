Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C962E9A04B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 19:52:01 +0000 (UTC)
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88.1771444315760865103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 11:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JiLxCSj7;
 spf=pass (domain: gmail.com, ip: 209.85.161.65, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-66ee7b9af94so100482eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 11:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771444315; x=1772049115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq+phGnHfn1YPeLZ2frjgstn5ob+OMSRpsji7FkWMOw=;
        b=JiLxCSj7MzfjZz1Z2oWF5gAgbPzFi1N4jsM0lRANmqojpUTJVVC11QbRLynHkcI7OK
         yGwq7Nc+pw+/z7v0VDkZavKyCNodyUFfWkN5E9AGdVwDRLKd4GmSWbtb3ngeshEQAkEx
         Uw4fAfhTgXN+GXsFiVaTm66QbS+HLrsA4Nr0hqr29uPbdKLbpaC997R8yl75/yObPp9o
         KCmuM13WY9VHCJCmoOWdQzV0b0ek27U0wKWi3AYg6lFhs5nv6vWXLjzFs6rlf3Se9Eou
         87HInqm7hRNAkmjt2Ahb79w2al2CvTrdpNwEhEyrwkp5UNOXWx+Oxzu2we0LBfMdXCQ3
         Rk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771444315; x=1772049115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq+phGnHfn1YPeLZ2frjgstn5ob+OMSRpsji7FkWMOw=;
        b=RtlWHgqBTrVxYAqrxnLEOL4DCbVHu2EvyI67RVFaeukRlOo0o1TOabq9dFNLbGwyCT
         GyU0Flm4VxNBBwlcdSAPBae5WEs1cV7T+Gm5rkt+tlo9tzlUgwgYzk/aynuX4827+crU
         I08uV9pMVrYEJEH3ff9ejWK+zB3osaaSy6zH3/829nDKH609yZWbNE0oERFuIfcg2sKh
         EGTa3cLl+fYFANGrGCJQ0Valvy/ey3WkhUjq+BJXA4Ss2zWf+G6paMPCqBT64O30BjFC
         a4Lw4CULV2ThnnoMboUIDMzfloKmNxl6YKmw1NolFDKmggOtsofGAXRnE7rZBAkLlEbX
         fzBA==
X-Gm-Message-State: AOJu0YzTlA6+KjtFRaNib5l5o1ZtkIh52i1ZHLdZljU64V36FOFjzsez
	teDVuMfXmxV1i41JClwUkQo0jUD/k5gIeye/V2nqa4AqNHO6WsDmAImqk0YPGUTg
X-Gm-Gg: AZuq6aLTngUY9lYbjFML96yjUmhQ/6CZWBjvQUJE64h81aBdUrpcDX4kddILxQ0Ocaw
	CEWNqnVPqc7hS+yhKK310q4yvrE7HytCUihnO2coNyIEOgv4Cola3MHARvbJnhINhOJKcNqFxMc
	xi9IHUpaJCavuGI0F+k7CGO960LgDomOUJOVkHAJMKX4tak0MoSkPOlgNPM5zwpuA2NCaulRnWN
	bNLh5dN9sZY5wGt30F6K8vASiu1G/k6EMcr4Z6dhr3BR0kELtcGKBA6pUUuE1PBG2/KUiIRsXiL
	o98V8MwtiBFYcLk7Op5V00erAKXQmhS+vutGhDApZqj4ZiEIxewvy1h4d+viUeJlWDCMzx8dcAl
	N+r30zHtu1pR0zF7gTbqo1FwQdJtR4/ITeXGCYKsobr45RbAjlo4gjIwjQgLZ/ao16bes655W2W
	SQ7uBTfFBiS7WSnC3cBylCoLGR2B9E1QOsMpwiuDVxc5MJTvN3+7q2ZeW9peEep2EmGU0X90tNE
	ICx8ijB1lZMa+h9mpammtk=
X-Received: by 2002:a05:6820:4910:b0:676:f174:9d07 with SMTP id 006d021491bc7-677670a4009mr6929967eaf.19.1771444314692;
        Wed, 18 Feb 2026 11:51:54 -0800 (PST)
Received: from ACT-L-SWD024.yourbase.domain.local (c-73-168-239-54.hsd1.il.comcast.net. [73.168.239.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-678c9eec065sm9188565eaf.10.2026.02.18.11.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:51:54 -0800 (PST)
From: Eric Meyers <eric.meyers15310@gmail.com>
X-Google-Original-From: Eric Meyers <eric.meyers@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
Subject: [PATCH 0/1] redis: Add redis 8.0.0 recipe
Date: Wed, 18 Feb 2026 13:51:50 -0600
Message-Id: <20260218195151.30540-1-eric.meyers@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 19:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124494

This branch adds 8.0.0 support for redis WITHOUT any additional
modules configured in the build. Module support will require
cargo and is deferred for another day.

This effectively copies the 7.2.12 recipe, refreshes the patches/LICENSE
file, and provides a baseline package to install.

See redis v8.0.0 README for more details.

Eric Meyers (1):
  redis: Add redis 8.0.0 recipe

 ...-hiredis-use-default-CC-if-it-is-set.patch |   45 +
 ...ile-to-use-environment-build-setting.patch |   81 +
 ...003-hack-to-force-use-of-libc-malloc.patch |   39 +
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |   34 +
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |   33 +
 .../redis/redis-8.0.0/init-redis-server       |   71 +
 .../redis/redis-8.0.0/redis.conf              | 1314 +++++++++++++++++
 .../redis/redis-8.0.0/redis.service           |   17 +
 meta-oe/recipes-extended/redis/redis_8.0.0.bb |   88 ++
 9 files changed, 1722 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/0001-hiredis-use-default-CC-if-it-is-set.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/0003-hack-to-force-use-of-libc-malloc.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/0004-src-Do-not-reset-FINAL_LIBS.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/init-redis-server
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/redis.conf
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.0/redis.service
 create mode 100644 meta-oe/recipes-extended/redis/redis_8.0.0.bb


