Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C3AC44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 13:32:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8788.1783517576387278961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=grIzN1y8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c59f740cso4926235e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783517575; x=1784122375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OKqSZqGYQqZQHXFIDNfGtzqZgcl6Ve+qleXQ8TcJws=;
        b=grIzN1y8lJwdb7DA4zWINCwRE8r9y3tPnGIk+mo2aWqywyw2gpd0nFJ5aFgU9OARV4
         ifjXZ7H/FVdTnzFIaJdLmcsuR0YzTaNAUwyQ2zWIhqnBz6gQe/6AhDiTuqZ4VtXFLRx2
         h/ZqtauqCmiHDpagvqXRTeVePVtfhRq4+iXzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517575; x=1784122375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OKqSZqGYQqZQHXFIDNfGtzqZgcl6Ve+qleXQ8TcJws=;
        b=lJKPcYLDWgLficbN/6TE2sKq0OoKMHCBVlSBIJLffc5SVRj/W69j66VZg9DQLKwxji
         PI5cpJgHRJbWSWNAzyUsVstwcxhLJWaUB38Un1oByhX0sMO3ZPcgkp2hwO6qVt4CVKih
         K1fPY+li4ABK1HOuCvHuUMz8tI2y114W6eDBU4+PCDQwZWE7oAC2KgDc7uptAL8lK530
         7lD0wjel143p1farmJu+YsmByTm7W4CG812En79Hv+58PRQIgJ8f8rkX689b9lXH7gNh
         KKY6j+NG0S6MJxpZjXYAe+s0LCrhmSX2XQpu6KNvkht9Un8NOaA9gw6emeKamFC/qIrw
         WM9A==
X-Gm-Message-State: AOJu0YxI0UrIRMzFuc1CFIxHp66+yh94QXbpIk6Cap3jy+6FPzPBYlIc
	uFVBnpYKjoNrKGXwfh3glIxO+f3zKFM8UOYjFqPhSELk8Du7+Eqta5RJA6hz0i9N280keGr1Nsj
	x43Qr
X-Gm-Gg: AfdE7cm4vCQunK59OEe8rP8ZBpfcivu6WUcovRQCoMdHMig1ht3v96MIhOL2sNiWm/x
	8GEAPbk8AbvZw66w9SvhSL7eu79kgb8UC075R5iBVMN6aGIlX549Hx5rk8T1qB4MYaa9J76AVrs
	nEEy/V7oSJI6hORiuYX5k2IdmK2ce/zVM7Kdq5DYJmluDj+hFATlRX6+2EZeSAno6vHUHZ7cQfJ
	6FsguSDkMqe7KCjI9vfw/rkmQH9NcE+D0nip1R7DvPjYvFhN241fRYQ0qDao5m2hhwED8uZ9k3L
	REIZpvnDd40u+DglYUT+1pBUsZgww04/j5VaghtfRKmgH76N8pe3gXQG+Ok0wkzhhyTT+yt3cs+
	JTAhc5cqrAHPZWZNudlAV8NnX/OCXsdoLW38Xvugwk6QkrzA4AU0F/UjBsHKwjli2avEGDJnYAK
	ZhclpmuCHPW9FIp87NGkRUEiHxeNqMP//grmI1ubez8GmbvJG9xR6RGIeaaM+swiyYU3Zpg63No
	KPK5815uH88gB9DclOIDIdjyMvgANyTsyLrxgOyww==
X-Received: by 2002:a05:600c:a47:b0:493:e53a:4b24 with SMTP id 5b1f17b1804b1-493e6892f99mr24883125e9.6.1783517574726;
        Wed, 08 Jul 2026 06:32:54 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f294a6sm262333915e9.1.2026.07.08.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:32:54 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-jsbeautifier: Upgrade 2.0.1 -> 2.0.3
Date: Wed,  8 Jul 2026 16:32:48 +0300
Message-ID: <20260708133248.1765250-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708133248.1765250-1-leon.anavi@konsulko.com>
References: <20260708133248.1765250-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 13:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128112

Upgrade to release 2.0.3:

- Fix minor crash for certain oddly formed *.js files
- Fix: make dark mode label dynamic
- Recognize <script type="importmap"> and beautify its JSON body
- Add wrap_attributes option to website UI
- docs: clarify version numbering policy for releases

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-jsbeautifier_2.0.1.bb => python3-jsbeautifier_2.0.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsbeautifier_2.0.1.bb => python3-jsbeautifier_2.0.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
index a8c3edf3ae..96cb6e84fa 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "45603b2097410feee8d3a6ef8ad5a8e0a0e89f347331888a97e46f332ce8d953"
-
-PYPI_PACKAGE = "jsbeautifier"
+SRC_URI[sha256sum] = "9579d4e9dbaa00383f3efdff4c98c8140bb85ba319398e8b97cdaba27abd6ba3"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.47.3


