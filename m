Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4826EE0209
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65111.1767104945806547395
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+9Z/4ac;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so63858125e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104944; x=1767709744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibCzb2drc7ZUsKE/KHPh/XULG5qVRwRGmbvBYfRpDb0=;
        b=k+9Z/4acKVbrILZtDypB1SBiatzS/TSnGEe8kqA/KgalF+inx52FThxwqBsDXwyN8Q
         1057lRIgVjTjgJyC06BZqQPdhfvC64Gj2FoqZ9+lMrK4KjH4LnKzTWLmntlk3SxtOFG8
         1j8/EaXBmN4EdxVDN62K2D6cM3a02EAXo2Kc20cSJo3IgCLDQaAADAVuSl4kShwLzyBI
         Aj7REAIxr+EQEXXY+PvxWl0mgCXXFLArHQSlB8ZIKq/bzlpeaDUv9Ysz7w+Zhl+IZGND
         vXu4iH4nBk1wWhj3QkR0rEWLcX1ld8wtYmFyKXjDjDQdSRuXkKnavgm/hhLFGWwzdD4e
         Xkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104944; x=1767709744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ibCzb2drc7ZUsKE/KHPh/XULG5qVRwRGmbvBYfRpDb0=;
        b=uVVyineywTXCSeOGB8vAuoWQbIu7rt13KfOGPOY8RNyw9DhIUjBzIpzLVLfW2iZhN3
         AnwcWoMKmtXy+ZvGgHkAj9wlK6tTDHn6W4fTnYOBPVzhLG0NI642lDZuW4nN8C26yaze
         OtDFEbg2dSJ+/L5SjDiJP8jqPpuuJo8rprWS4Rgx8d8Ux/C54004oNqSLkgOy2CGmZ6L
         yAXCbrRR4XR/Miz1+BiDxH27rN75Aj9xEvbxzBeHqfltmzPZR3DT9w5EBgwyHYcXgJYk
         xY6EYH08ieBA6pCKpeMS3uOnEN/UQdduL7ygFDWYld1YvDqVbngo3zDjKcu9I1HJvJzl
         vEZw==
X-Gm-Message-State: AOJu0YzlYbjg0yxHxvtfurkTcK+SDfsnzFOEq8eswiXe19hWfLEZdKu/
	fUd13X52x+3Z9pGLFytphKlK6iCqxc+AkQouzKBEAgNa2SqPS2Sm7a4WzEp5xA==
X-Gm-Gg: AY/fxX5uRdC3HpBIA4vNMYU0EwGIJIfuPiiKuD19E2EdbVlBj9ANMgVciYWmPzs/a+V
	+0fdi/t0Q0vdrGzyqmucZbJ2YAD+r64aVBEmE/cqDKWeyzR+R4vysHLeWbToqrEH91rxW1B1qtV
	OzFgD7hJ86NYYZgOJSKLEbZjZ9onxlqRmPgJPte1puM3oP83ct/ZJXZyiOj//cr+KQdi4DUUa5H
	F7febDd84ln26w5zMT0K0QYsG4h8oBnp4v31Vi+nsyHYbOiU1YQ7TvyvyTEoCgxJZE07m9PMhbn
	kXl3apogTpcvH2hmUo6uuUCYEmGe2cQPLtQdJ486/t2XZH+bbakbGjAV77oerFeyrkJWTNOSKyi
	i1BGD2y2BaQ9/8MnaK+KNJB1+xzhyq4TeknDie6qV1S6VeJpFSv43E0C6pSpvURWxgMia7UmfZt
	zCNNOcKwsT
X-Google-Smtp-Source: AGHT+IHtBcuxzJhw9v0YrtED5mxyAuTHN2t8EfgeH3nOCQZqXa0ahCZvT5UXjPKSbKyfSQ3YA8x3jg==
X-Received: by 2002:a05:600c:3106:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47d1957b115mr377821995e9.19.1767104944041;
        Tue, 30 Dec 2025 06:29:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/10] python3-ldap: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:28:54 +0100
Message-ID: <20251230142902.730667-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123018

The relevant CVEs are tracked with python-ldap:python-ldap CPE, not
python:python-ldap.

See CVE db query:
sqlite> select * from products where PRODUCT like '%python-ldap%';
CVE-2021-46823|python-ldap|python-ldap|||3.4.0|<
CVE-2025-61911|python-ldap|python-ldap|||3.4.5|<
CVE-2025-61912|python-ldap|python-ldap|||3.4.5|<

Set the CVE_PRODUCT accordingly

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-networking/python/python3-ldap_3.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
index aecffa9d7e..8d52ff0154 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
@@ -28,3 +28,5 @@ RDEPENDS:${PN} = " \
     python3-threading \
     python3-unittest \
 "
+
+CVE_PRODUCT = "python-ldap"

