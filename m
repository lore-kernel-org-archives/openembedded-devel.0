Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB66E63C9E
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 10:28:31 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36666.1769336906617798781
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 02:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S6NakQ6n;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8837152db5so493711366b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 02:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769336905; x=1769941705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAApo2lKJnyueuUqttEm+Q43A9bHq+A9t6Tzeb5MzQo=;
        b=S6NakQ6nWywmBTTVx6f/8LQ9MsNo9Rj1j+i+RPycCYOTf7dfmH/vBxnSEpBw9mHBHd
         tX4M2ASYcMUNNZCe8sxqPrwNsjovsx/R0QFTEDeMIBA0YnQEDSuaUyGmROSs51V+tLgR
         66dgZu1sJ8SiAoHmqCh7iHyY40fK+UFk4z+tus7xF1LT1VnZYfDtGIaYWkrTOdquandL
         G3I/d5iUp0CzD64c1y2yQ/DE+9iD3LGEIM/FddZN+jInaniHUOKjj/fS0y4VhZM18mBY
         iOYnTEeyRkF54P7NQGIevvGYMVi+uvlgqDtDf7hIio+lhg0qxeg0ILMIbbGZuvXZ+wEK
         NLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769336905; x=1769941705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAApo2lKJnyueuUqttEm+Q43A9bHq+A9t6Tzeb5MzQo=;
        b=QP1AW7j+6K/Pr5Mh1Mu1HP0Fta31SfmO5q9gqYRyiI2GO2ekNT/z0AoBXSpkum+DrP
         bOuaAkOKqw/ZPkWLv3lqeWX7KHeRUDOj9c6zVvKJMOs+ggEljNuAdSIsMyIh6PmtMcaA
         f/YaXNyFcAzbALUkpRhBUkbNsH4XtyDqIMQPUceyjP+XZafTdkbiPimlUvpGOI8tzml9
         /gp8h8bF151dVKpceIpVopSeCk7aJTWmL6JeZDRvs0cIr2FPqwHKco5AG//DVZxtMX/m
         kLSwQ41MGNY8rDV0eKKUTghIKDZ9AT7kiDAWUt0Y6foNwR9TGRSxjSd/DLq/srLQazMR
         oSxg==
X-Gm-Message-State: AOJu0Yz/3ORsXjf5b/SR6V1h9yU6sAhRwm/dUXkAtPtC5V7jkKrNmZGT
	yLkNlt2zJDIlSeuLgxMht5gzjNNik64hZ7U9rPqmkFtQQ9o8TtdiaRbLmmvK7w==
X-Gm-Gg: AZuq6aJMuD6G/Kq/Zdwod0GY9/KTQR+pLydXbOO2UqMnKLrFEknoFkYshxELLcHKcPC
	Md1cMip3uZj5tZvFaYj4dtPqdNQ2Q/Ev0/ZSEMyW0ea+wa87Rqh+7ScXR9Rvq+/JIx6yQ/s1YpZ
	/VMx5x0G/BX4M2Boy6OZjY1vVjf7RGiER9wl20tikP7yrUwbrjSdQUPzZ8Ate9U8Ud/sHjWxUgk
	xo+4crft79715+IPs8lbzHRLmWKuKO5jtHZ9Mti4csUQDi52/fsETgQf4Yc0hjS/PK1ulz/GiCG
	usc9fd04P2nT+clLsEniR2VyN6wbI43JLVTmY7J/fMAAujer2Z0VC6G1ab3Zj1BV2gMFOzTlbsc
	mVfpNSERD4SS8mXdiMPfdEs2pxgwQIABYYsS+jnA9Lz45jHqly2XWwPA1piLCtBc9xCFO31Mb+A
	8ID2eefiFTNMsF5t9EG8v42z1vDNR55jiVRLH7EI6o1okVULhPxDWxKyFWZXJRvmZd
X-Received: by 2002:a17:907:6ea1:b0:b86:eda4:f770 with SMTP id a640c23a62f3a-b8d3fa4683cmr84752566b.21.1769336904638;
        Sun, 25 Jan 2026 02:28:24 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbbd1sm437659666b.2.2026.01.25.02.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 02:28:24 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] liboauth2: Add recipe at 2.2.0
Date: Sun, 25 Jan 2026 11:27:43 +0100
Message-ID: <20260125102742.1827360-4-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125102742.1827360-2-frederikbraendstrup@gmail.com>
References: <20260125102742.1827360-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 10:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123839

V2 removes the hard requirement for apache2 for liboauth2

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../liboauth2/liboauth2_2.2.0.bb              | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
new file mode 100644
index 0000000000..0890a6b78d
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "OAuth 2.x and OpenID Connect C library"
+HOMEPAGE = "https://github.com/OpenIDC/liboauth2"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI = "git://github.com/OpenIDC/liboauth2;protocol=https;branch=master;tag=v${PV}"
+
+PV = "2.2.0"
+SRCREV = "12571b6d6568c2db7d5f080f60ecb55795c0db19"
+
+DEPENDS = "libpcre2 jansson curl openssl cjose"
+
+inherit pkgconfig autotools-brokensep
+
+PACKAGECONFIG ??= "memcache redis jq apache"
+PACKAGECONFIG[memcache] = "--with-memcache,--without-memcache,libmemcached"
+PACKAGECONFIG[redis] = "--with-redis,--without-redis,hiredis"
+PACKAGECONFIG[jq] = "--with-jq,--without-jq,jq"
+PACKAGECONFIG[apache] = "--with-apache,--without-apache,apache2"
+
-- 


