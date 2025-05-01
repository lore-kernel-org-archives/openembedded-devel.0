Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1731C3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 20:47:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.4803.1746132448795253155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 13:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wZaicmfe;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441ab63a415so12571965e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746132446; x=1746737246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNdxw9dfHuWvALjS+lWkXa0PQmJy3gQ8dKluEiINzr4=;
        b=wZaicmfevj+QM46hVzcFtoLdt7YpMuJOR1INjQCK/jNE+Ei5jjL7FkQp1Y+JFMyKfg
         Dil84Fx2XJ+oJOWyx1PUDXnooMp03RP0vOdbBHi2bOMd394hquTna+vVTFJ2arzjI4f4
         JI0El22KJ8X2p8zFo3Pdr7CgYXbMUFBr+GqDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746132446; x=1746737246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNdxw9dfHuWvALjS+lWkXa0PQmJy3gQ8dKluEiINzr4=;
        b=wufp2DRQOgBPd6QFhNyCdLB6e952fBJVQTtSl6ADJplxHnTCa8VrdCWlDiC8ZMPglf
         TR9hZHlRgY3FT/nyLvPgtqC8+8E5ZRNCF6848Fb4mtVSBFQY25tAD1SGjunGJbvmwD0Y
         rJ+aV9Yift2l5bFQCOeQCAzMdb218ZFNJGrUg3JsTlFuuQyKRJsMVOypgn6pL1zmhYuH
         2gWyDIsBsw4Dxx9CvK42BneVIy8017vavYQahqXz/xoE252aOlgTUIZR4o7ZMnMV/wNH
         rWpxuhMhFLV8lIGAvwhhm6d8xQZAW5l4Jhad00rZbWURTm5wXYWX9zK4Eok4mwXj9j1n
         Eg1g==
X-Gm-Message-State: AOJu0YxhyqGMkmJo51WAvzg4siemH5rK8U8zrird2sXHYEvSqj4kw/3H
	zm4zUXsdWY2xXN1/qu16S57u3ttM0pj1RrRyMquso+BNkJXLC7iRJa/7UFnjKKYkMCNgBX4uJFd
	o
X-Gm-Gg: ASbGncv3wOlBRfEqzOLmRPLbCbu/0ClecsKQLY3pDzyQnzCfSjn+s64G8sSnZGg8C6h
	CIIQnNsRTxRGAcZQnnG4/EaSikx1Edt+Rs2UKzAUOQYFAIr2ZHxjxJBH5LYJPbXH0hH/erujlD9
	uLqnvn4cg4H7Zs0A8vLJNUROPXimpDOH0z5yu0dI3+DcBa5zSvdAI5+GPRmlm0zA9+1UD0nTqUJ
	6jeQXNdzfAvTPp2kcUWH3+PmaMYgwjnUjUmw9gz2fg6osxixkBSlRSfChOwansdpHhbkWagY5VP
	oOszQImB9USw2JdNsgonZlOfBIP2H3UFDcNj2rOat7oQ+FnlDJ1XN7aO8ucq27YYhSZUW2AA5WF
	tu8YpbqaKPgFVPVNtQLgvGmksDXhUIRnX/9bnPnyKVR9KbxvYWKi5LHm8vrQ=
X-Google-Smtp-Source: AGHT+IH65NKW4iTO2r6v/tvWkyCl11OVG89g3xvW+XlUM6S6Q2lzWqXuRL0o89fEN7wL6HdECaWcLg==
X-Received: by 2002:a05:600c:46c5:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441bbf3dc17mr1675845e9.31.1746132446331;
        Thu, 01 May 2025 13:47:26 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4f5sm22990385e9.18.2025.05.01.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:47:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2 1/4] reproducibility: mark ipmiutil as known non-reproducible
Date: Thu,  1 May 2025 22:47:05 +0200
Message-Id: <20250501204708.10398-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 20:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117270

From: Yoann Congal <yoann.congal@smile.fr>

ipmiutil packages are not reproducible.

Quick analysis: Depending whether build host OS is Debian or not, some
files are present or not in packages. (e.g /usr/lib/libipmiutil.so.1 and
others)

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----ipmiutil-dbg_-.-.--r-_amd--.deb

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

---
v1->v2: added quick analysis.
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

