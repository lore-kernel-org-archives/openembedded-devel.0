Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF7AC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 22:04:46 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7098.1746050677193861536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 15:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jy3WtkDG;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso202427f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 15:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746050675; x=1746655475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5nieE3XT/PPuC6m3wBx4gny5k3s425TK2mguifHZCnE=;
        b=jy3WtkDGXZyxcSfHTQkXG2nYpN1AQPgp+6bmWq8IOl96XUdNVNCPTiO5UDZnEVBttb
         T6kPA9sUeJkQ7XuWLCCfDFx8gVPKz/FOnOspKyTagO9+pwV5f+sLQimcujanKrkuVEAv
         XZkERM4z9L4m9TqNR6XmuNkQWbVvQpaGrH9Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050675; x=1746655475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nieE3XT/PPuC6m3wBx4gny5k3s425TK2mguifHZCnE=;
        b=d+FtqaEq0BR3jU2d0OS2TsHyJaeu/HfYzoXqDDpCLAdLpFRA6G5dHRQ9M3+UlXbOjp
         2wDGCLSXkXBL1JCRxuMZq9UFxDvn64ObXE9sSr0oqd9LrnUfll72WC6HSqOdULxJbH/U
         D6pF3TslHXOpCiSSZxICf/sgt24GenDI1SAGWPOvzFEhOZT6iM7brbuZK1YFFozP8Pxx
         Do3Utl6OTd0FUmjoJzNUzm9e/XECyruZkXtbibH7XYLdasWG51AMpAlW5MOBcvQ4NVC0
         HipFyxaeDDpVjSsLL5Dc6ut9CYG/wv1GNoqQezWEcLEcAC4qwA930OvV80Ib+zztcD+o
         dVIA==
X-Gm-Message-State: AOJu0Yw684VshgF6mxGwYVBVDvMO3opthCO1ztohxsGZwN7NCqoag60c
	X8nb0ZMWLisF8WsTh+nW8sQKY6j2GuakJqTefkjlyHFO5ytOZe0359DdfBn3keOSHvwTqnhqbml
	/
X-Gm-Gg: ASbGnctPpFuLlyjuXmjLUn51g/bXtezLcKQuHjJ1uirtf/0ZnM7U4B0pDQzRnFZxyiT
	yZtf+WbKsuYzPODPOjox4JImdEqGFydHunzQRBM6iAPbh3bbm4n1Sftrg1+M7Yd7ALX1j7wU2HF
	ZHZNx9dISBQMSrBKCADdq/s0CADZXvrLjqYzHCanMgZOqK/4AnoytzD0Yw3GUzxDYG2FufXyVYk
	Z+ZNajawjdlpjXJ8LkY/deA1N8AJLdfgwMg+/iZPkEh5HG1o97rTsFsTaCf7De4j6lAkzfQ0OMK
	5ZudW0S6UFAm7Qo+FVbnhj0M9spVMdURLQPgt1+QTOMB1on9JcmJTCDGCz4XC8+EveZlcc2/xGi
	+Is4DFJ4H2NRWwE29A0+YuJ5vw3siMQ/r7mcWya8wakaE6byH
X-Google-Smtp-Source: AGHT+IGTsmIhQ7ngu8KyNvQEvTLmsCLDK+g54Z38JiBW2/VUUZ/394Rc6i/ihexo+rp9mRYsDzpTdA==
X-Received: by 2002:a05:600c:8210:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-441b6ff0e33mr2300965e9.4.1746050674758;
        Wed, 30 Apr 2025 15:04:34 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b61c4db2sm6172175e9.36.2025.04.30.15.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:04:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 1/4] reproducibility: mark ipmiutil as known non-reproducible
Date: Thu,  1 May 2025 00:03:58 +0200
Message-Id: <20250430220401.4149372-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 22:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117262

From: Yoann Congal <yoann.congal@smile.fr>

ipmiutil packages are not reproducilble.

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----ipmiutil-dbg_-.-.--r-_amd--.deb

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index ba08749412..b926b45b0a 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -46,6 +46,9 @@ KNOWN_NON_REPRO_META_OE = " \
     hplip-src \
     iotop \
     iotop-dbg \
+    ipmiutil \
+    ipmiutil-dbg \
+    ipmiutil-dev \
     jpnevulator-doc \
     jsonrpc-dev \
     kpatch-build \

