Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E5FC5DF69
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 13:57:37 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13376.1786715804457217141
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 06:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ep/xs5FC;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so10578366d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786715803; x=1787320603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1L+L4h+lagITJ/WcRLQd7+L5w4gyoicVF4lx+h9WBuo=;
        b=ep/xs5FCyH5qsfXbOq74M1f9wQa9pXvpXiOlHwVTP5PtgoSjcjn0CvG5o6uHQWTK4c
         mZf/q95xFHw/HoTGLMQLunpxv4FDDYcl0I2CtJrFdubVtvt8yK90M/4KfWuyEwHc522A
         VJZGT2esv4BwHHJmR+z4RB8tOC7VBkiwV63M5OLn2EivcNdgVO/NYF6OgEj1+JAja2LS
         8xt7Tw68sRm71ZoPjWKZzeQZZJ6STnf67Vn87/aFot+XLJN7N2BPGN4lWEcd4UWAqwVX
         K0a4MuwnSngxQOEWdr9edxPIjr+wEULC/Y4nGk9CaqVwBUKfL7x6wDLeRbUQg5yzE9/A
         nwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786715803; x=1787320603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1L+L4h+lagITJ/WcRLQd7+L5w4gyoicVF4lx+h9WBuo=;
        b=gpCRh/89cQxGkNPjhCOmZ1WzTDO012r9bQltzv+6o7Tt6AbmUWnZ9xCb2Mx/5ajT7L
         xAyLbDJ+ouED/VaaKZsqyGe9DWgs2/K8dDMQFtlnyzi60hwWDXg986ECspZhPbqxgIwH
         xilJDpu6bv+Rrlmyi6BIbnWwfHkyH8pH6x3Eu8nHzmstn7o4/G+bdCLe+/17xWXDet+L
         zOt4p/eCVffYB9rBTrMDirXnNEsI9xSHchCwBCSA6EfsshF63zafTCvj58fWEpX+TVIj
         9lVT9A3PLIRrdBArTF1wqQKlii+1vgPSNppFBbCauYEEIlUnqMhHWPlJS4uhCVC7e4LO
         su8Q==
X-Gm-Message-State: AOJu0YxCY3Ey6nIr77Og7QQH7L8aHkPCCk3lu1AE3RojvZNLUnXYSchQ
	obORUPCpxCjX6rbQkgmaamkuWQieILNADoctzAOQbU6hzMtwkGWWTOOL+9FwEpoNx/Y25kxgmRs
	ENdwzAxY=
X-Gm-Gg: AR+sD138HoINFTLX59JqDdqAvw6wfSUAV2JgTkkHBMETY65x2SkNCXtJf1eNeBlSdAR
	GCc/M3B5Nn7/Tk7gdbACXfiA4tYgbNPQ5UAglkrzPFqWMYRb7lQ0USZUgCDN4SD4Nat7Peib0mr
	5nEy6/hPtD/BeI1v4jprrT4BBcfY0HpOvPhMmiY9/vMDreNxGuS/qR3GIWu7VSmcTiDfV7FzxbP
	yWlsK89YnpC/Dhsqge73TZLF41/0HKR5d8uXZJjjHhKJBSNrJGK8E4GClyD/wyTcW52Mwm2yuDZ
	C4RbUhPFcbj+HaTyDdLMvknHLmEZa35RjVipfhf6DBGAGFSBIs+86KQUboGv4uqxA8Vr1Xiwpof
	ZnEjBmlG2X+3GKz+mUwD0Yf65MBgGUwPm9svh/vXHLElLdD+g6+iG8Wz/18PiPQpSweI4fm/uiB
	OLSTpG1IHRfTh5GV+kOIN10xc3/dx8yaTYH3VJSPvCgrHh6iegkxESqAQkismhICr9
X-Received: by 2002:a05:620a:254a:b0:92e:f380:dabf with SMTP id af79cd13be357-936d22c5b78mr622405485a.30.1786715803300;
        Fri, 14 Aug 2026 06:56:43 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce1ea6cfsm278756385a.27.2026.08.14.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:56:42 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: pidge@baylibre.com
Subject: [meta-python][PATCH 2/4] packagegroup-meta-python: add python3-glances
Date: Fri, 14 Aug 2026 09:56:35 -0400
Message-ID: <20260814135637.537350-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814135637.537350-1-tgamblin@baylibre.com>
References: <20260814135637.537350-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 13:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129046

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b129e62d16..f58f8a0f29 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -151,6 +151,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-geojson \
     python3-geomet \
     python3-gevent \
+    python3-glances \
     python3-gmpy2 \
     python3-gmqtt \
     python3-gnupg \
-- 
2.55.0


