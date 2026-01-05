Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFB6C2A092
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61074.1767607371368538564
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aw//Ambd;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so35962455e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607370; x=1768212170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVxq/NKI3H8PSMmsqzVsSz0BiKPDX9X9s3CM9iM5I0M=;
        b=Aw//AmbdiuGOX3bWRsfAc59o8fTfBoHSr0Ohv8DXVvPppPlN0hjcsdcCRiHoYAJTV0
         Qic0w1T7TZPGZwNv0oxCk5+cLADh5bXkLxyrkW9Y3aJqAz/IgEJT0cxl7Wf/kNPYFrJs
         b0dIw3KQ8cM/WJB9qYzzcBk5h+SkZN+UsMyHGbEHNgdmbYyNUzdGLFWTsUN4yw2L6iZl
         LpSXx9hoheZxfoi2Tx9bKmPnAbmjR13NFzqLzU/p5t+tMxaB2vS4m+LjBtTxx5JqkSYB
         uPx4XsoB9zBlk/OBXERnR9pH4RIlpckoeCOen/mPxK+GKplRlz+tFgLZ1OjkVd8SAuJ5
         /CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607370; x=1768212170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uVxq/NKI3H8PSMmsqzVsSz0BiKPDX9X9s3CM9iM5I0M=;
        b=Q9j3CKnMT/yBYs5PuCIzYH7s7a95G4fFV3aYTq2yUs0teLZiKUx5MRb5gD0espaqQd
         /IprmeuTB7mr/HQxeEOrRonJE3Kvz7wBRjwGJlFEj37PCs7b/+JFzYQIiTutsJaIAH4z
         uSPK7/OvxCqF9/LZ8mT7XjhZhzw7DLwlwu1Mzal49twsGKO4e65B2izriLO4VQWH1lJD
         pdYV8kaZUxOskXB4ZsHQsahcxGwta8AXumq1iqa4VxdSTx67pt7WOXSdd/wJBKJd8eNN
         Peu2LJRj0yj/dtCXBzQuQwQbA/TAQqBZHS1iStbAur+ngyouTWtVf8GDAPWUoqEvCz2D
         H8LA==
X-Gm-Message-State: AOJu0YxQ/ilIObhvuIV/VCU9KIarqEWpji0njeZAXY/dCuxW1uG0F7sE
	pwLlRp83+N1YfeLspauQzwA2EN+EoDwAPavamedrUXfZ8/lCrvif/aOsCCkTPA==
X-Gm-Gg: AY/fxX6msuBWoaYjkiItBGavp8gMxqCny1Pvz+G4bdeXI4mxFwz+o+kwjSH6+D4Cckv
	mI6s2YnFU1JJhv2e+JELQmB2VoH4ciw8fUWklFVmTCBpTY1ZvJ+kQ8jtQLVtYbKrgxYR+Y2KZIf
	iXwjjC/8V3i2BzNObYhhbL73v0VyjbbqDEC3MvdQSiAjPJUPmC8K4IhsP5g1SKMIoEC7bMdO1j1
	ST1Ion15ku4GzyZNbFaurj92w3vApR/2M7LQifcBjlAecya3DmxcEtgssNWWJ1BByfKegyAeiK/
	ODaOZFWn6sa59ZAjdW6A4E9AjXj9J5+hmiaCZKpeqiD7zZayAyAOQDq/NgppF6wBqgKT0gREG33
	D6NPSazoMvcE6lROSX5oAjaznQ2kqMnZl5w06jgKvPPbp6NuZTwRj7146fNDLV3/bz9iUOiiXtu
	oQ10+nYT6o
X-Google-Smtp-Source: AGHT+IFh/JSRlsHqiUPZ6f/1Ys5IaibGd6/9xTz8pMWndcJDm+rJvkBDGdWDKeV7NLjTWHEpp7HX7w==
X-Received: by 2002:a05:600c:6299:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-47d1959ae49mr681527625e9.35.1767607369660;
        Mon, 05 Jan 2026 02:02:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 16/17] python3-django: upgrade 4.2.26 -> 4.2.27
Date: Mon,  5 Jan 2026 11:02:36 +0100
Message-ID: <20260105100237.3081345-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123147

Contains fix for CVE-2025-13372 and CVE-2025-64460

Changelog: https://github.com/django/django/blob/4.2.27/docs/releases/4.2.27.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fae6fe9b4156fae7696a7978700c823f414da8f7)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_4.2.26.bb => python3-django_4.2.27.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.26.bb => python3-django_4.2.27.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.26.bb b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.2.26.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.27.bb
index ea790e4b7f..86425ca724 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9398e487bcb55e3f142cb56d19fbd9a83e15bb03a97edc31f408361ee76d9d7a"
+SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

