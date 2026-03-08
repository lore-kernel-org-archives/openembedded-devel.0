Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D933AFC9EC8
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:04:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38988.1772978671034567127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NGsCI4vO;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so1836875e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772978669; x=1773583469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pH+pjOa6+mujrYGLjHyORUUGZ9ZO3bU08Hze87JmsPA=;
        b=NGsCI4vO5tTYHQjUZNwHYnUtb7cZbAO5HrQkKjCW73S18nL5zcCDyCEPUeyOHUxpDm
         a63xPN/HCrEVSl089Qd9DYVJaE/FClO9Rj8RgPe1dLbVICTpVfMk2aA2gf6ssSGKn0UY
         qqUKcwrC7MkEx9+U1NqMrDKTzZYjp2+a02FhbhOOFWvwYLiYImCxob01LJU7Vjhsngml
         KlCS6AMcYOxolhgR+Ay9tATt2KIKA/YDMdFOrggdHAZFEwPhFe660qn6IRuJTn/MSAyw
         yzfaZyICbWNs+vSqwu5MSgwNoYgE6XHfXTzFgnICk/xcNmyVl/ari40POoZ7eJf0VCOO
         XQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772978669; x=1773583469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH+pjOa6+mujrYGLjHyORUUGZ9ZO3bU08Hze87JmsPA=;
        b=nVHhGbnz+I/+LBDexhSh3ys5w5cGY2FxTD2Qjn84NcuAxWT6ZEu/aX+k0rdBDP9OfJ
         u0MFiCQQZypg3KwdkLpuyk4hmiv5JXa2+nuAAZM31rlCzf/sSdx/QOMD+zMcKeTyuibY
         PM/86+C4E3yo9dTIT6k7GMt1hWUslr910CgE8xryDb6jbq7sGo7DaP6DFT3ijWas0N9R
         PhduqXOBqmU3NxdPZe00aSbzMQACi020x8OKphXMWWmVrSgs7j5dKZsjtF2p+mU4X+bz
         QNJWL3DvrxUVv7IzdswoUAA0v0qV9eVNxotW4L8mtc6+nQvQ/LDtwLXkouDp8efcVkGL
         DvKQ==
X-Gm-Message-State: AOJu0YxK1gDoR2ampdzlIuPNJyvNQ71ICt2USPp+6e5/ygzmzSBtdJZj
	GMSvEtJPnxNM4qtu5k3/tTcnV65B6SMFLmjiVAccZKdxrPoX0H81PEWboIa7aw==
X-Gm-Gg: ATEYQzxcC3Xe51cprXCYlKEaDrAVcwbG55kj8LzQPj/MZeQbTaiafkR20hnqKzq2QGq
	pqZgVYMOxKb5pHWc1V4ZkvT1CIrU411FQNXdvD0W3EYWgKzNurOcxC54rEDFl8oPtEZ69wKH7r/
	Eenu8LXOOhCheYZuo31Ezp1uim6e6gHcUZGC6xMoyUMFuyBdmWt5UY8ObeHT9/kAGdqA7SSkEPo
	0IUaqwRvm+4mNSEbzOInswV8njOjfzjaj6AdN1zqHbRfNeyqBJHePpIJLAqmDLKOp5Dvv9BxMQ9
	bs8CnEoxvcwk1/Z4I7aaygOpJcDzfaVDvK8g7+H9NzAtn/4ZcZsbbl2zxOeOSXAlbNee7iDimWJ
	M9VY5hckK98BEOIh18ZsDOV9T63gcYL+cDOizaftnmHeZn4qwpfU/FPyAv5a54MohgfPpEg08la
	3gZ/X7K+zIHxaj0PFcyaC/
X-Received: by 2002:a05:600c:a108:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48535d3d016mr24768475e9.10.1772978669065;
        Sun, 08 Mar 2026 07:04:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ece8bsm90012665e9.4.2026.03.08.07.04.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 07:04:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH] gimp: ignore irrelevant CVEs
Date: Sun,  8 Mar 2026 15:04:27 +0100
Message-ID: <20260308140427.3258512-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124939

These CVEs are not affecting the recipe, because they were introduced
later, in v3.0.

The commits the introduced the vulnerabilities:
CVE-2025-14423: https://gitlab.gnome.org/GNOME/gimp/-/commit/222bef78c71ed8562a610f6863d56c0b3e2bef68
CVE-2025-14424: https://gitlab.gnome.org/GNOME/gimp/-/commit/a0fc5a025ae3579609730ebabc3c84146385da76
CVE-2025-2047: https://gitlab.gnome.org/GNOME/gimp/-/commit/00232e17875d4676a2c797a429db23b1a9815db8

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index ad9d34ef6d..4d2771e551 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -75,3 +75,6 @@ RDEPENDS:${PN} += "mypaint-brushes-1.0"
 
 # It has been fixed in version 2.2.16
 CVE_CHECK_IGNORE += "CVE-2007-3741"
+
+# These vulnerabilities were introduced in v3.0
+CVE_CHECK_IGNORE += "CVE-2025-14423 CVE-2025-14224 CVE-2025-2047"

