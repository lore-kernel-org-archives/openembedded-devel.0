Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAB2C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 02:08:24 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.2433.1645841303500718701
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 18:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=egMvCCX+;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id bx5so6294861pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 18:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rSh5tWP7XS6+L3rpeKrJ6x+e0RQ5kBbKMg8zQCm8YqM=;
        b=egMvCCX+W6nVW3nHBpBjbF2vDsQegsUu1ak/afUIJ/zlO5SG9C9z/kgomlY1ZnmAqg
         jrrUZao5GhCsjzpBFP1h36O+xqQQleOlMPYITTsTkuDc1Lwwv98NGtiraVUZpD0AaPdx
         CTxC6TPVkEWEnd7x9Pbwzf/zRjNe91UcJi3aTgccwvYl7CPhyQg3C0CIIfiLtVm/ZJlF
         dU0BuPJ/mILSjyFWpWVc6HBao7B556p85Xghsq+Bw3zRE3/q2KRJ57xgchKKI+MGgS/s
         YUBDt9bXIxB/8fKVHdn0ZilqpcqXSGbOQNQWTH87pE/ukcBXM0PsHDOdFL7KMAq0rqaW
         4WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rSh5tWP7XS6+L3rpeKrJ6x+e0RQ5kBbKMg8zQCm8YqM=;
        b=bnNxn35bO3U/FqXWK63z7ggSkILPa2R6NzSogb4jzdgkEsm0LmoB73qFUqAb5iidCD
         sFAlwU7ufp+D7IImgvHHpmXzbda0XtPUmpdCUfchdLCMz3lADcMKwqOUlgrMrkKp00av
         aXxw/GQadBdno2bf+qVTzotI9Ik7a0vJqdCSNH1JwtrRLixjVgrQgdJkPHguvzgsR/0w
         y89FwKKMDlzgpKJbPToZ9Qb0vemMev+nGd390kYg2noFW30tt/BuAyPoyQSo+mNCfGWt
         udwdqcnUIv9rq99ICDGJedtHNbs1iDVHGjX5xHuHt1inB/bzVbNgHHEVFkb3p6b1yhFh
         HBZA==
X-Gm-Message-State: AOAM530snaN6i8Soj1fO27lcxllLlEZIIy2mhVFAAahBKOcd6qkwe4ut
	XeDZcpYF5R4135PSUkgRR9S3ZlcBxy8=
X-Google-Smtp-Source: 
 ABdhPJxEYro/bkxshRnJmxJ0ALMiC4pvQ6brFHvZpVMO7TQs9zGn96hQSAHAbbhpAzmCfulHRdlAVw==
X-Received: by 2002:a17:90a:7e95:b0:1bc:5d56:8d4c with SMTP id
 j21-20020a17090a7e9500b001bc5d568d4cmr5870411pjl.93.1645841302359;
        Fri, 25 Feb 2022 18:08:22 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004f38e426e3csm4783374pfw.201.2022.02.25.18.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 18:08:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-ptyprocess: inherit flit_core
Date: Fri, 25 Feb 2022 18:08:17 -0800
Message-Id: <20220226020817.1318621-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 02:08:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95530

Upstream provides a pyproject.toml which declares a flit_core.buildapi
build backend for PEP-517 packaging.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index ff1155eeb1..e19ec7522e 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -8,7 +8,7 @@ SRCNAME = "ptyprocess"
 
 SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
 
-inherit pypi setuptools3
+inherit pypi flit_core
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
 
-- 
2.30.2


