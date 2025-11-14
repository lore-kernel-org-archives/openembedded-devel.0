Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E0DCEACD6
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 20:26:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7588.1763151993519406191
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 12:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8m/npHd;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632d9326so17215075e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151992; x=1763756792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiZQSiXzsOdIHXS5HWvymWTFQAL2o+S8r68UgXCiOnE=;
        b=Q8m/npHdlMHgKaBvQm7aUEr2NSNe4Qyx2+7HI+5n7+MGjHaai1AnJa7QH+dYO67Uaz
         z440iCNR1GqBiSgN1JFFLW9lYxaq9a1exrDWzJPiYif7WZzEQ8KOz8bwIBMi96uy4d6A
         gpU79SotoYxDMJmxVUiZS0tUAN0MH0DNyYSRN6QWgnVPcqP6Kfw9qGEPM/bKfpiliduW
         Mv0h5ibtEr+FHxgO/1HlIdaks3+B0WU86HLtqeNFloF7WztwHlZHu39x0EbTRhsp5NY3
         5V/uq9asSkuEdBbiQ5kxpkhTWP4Uz/jz7gd6fbHqV1bCdgWJVNYkyXK+PxvHoPOBCv1Z
         tJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151992; x=1763756792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiZQSiXzsOdIHXS5HWvymWTFQAL2o+S8r68UgXCiOnE=;
        b=CE8Z/QmYRC/8Yuv5qVYvKNPZghgCN8blvY7kNK/BpltNxZ8McFTKsl9nbbCF4CiPkW
         4pnEdsyHrk6Z6qSYc0XWuk29oe4zi1jotk9AQuGLR1jL72rIbwvqpEy2pVR+nRgdr8A6
         ZU0tYhjPq/YWiSmqCnh+HpoyIHxoc4C/hPfoJTXHwtG2w4kjxBWCyaNXVyW6/aHsIqtr
         Z89XjhsoDLXRWHO/7oNgeQgyiKBUdQQNSukn/Q8pA4jPQA1uMd3acjRdyZXpApJlerow
         Cc2YzEuwygFqsSLe3+HrH0fm0rMZSYkYSHyxQn0rLe2C5YJr1sKNTI715cqRxgYNhxlP
         67dw==
X-Gm-Message-State: AOJu0YyHErhI6uzQa3Qz22FJU8crNlSNuJEdH0s3TjCWrgQpDbJ8RbX+
	cVR4OIxWPdxvw/CNHbiZSpaBo3tM/pKeDqMWv62Yvtr6sr+Ym9TsBLqF6E2ok9VF
X-Gm-Gg: ASbGncvO9RdpuA9XOPvXn2O22fqnNl3CKGye/v53p4wyAd5nYTNmrlWZFTqB6Bc/55d
	gWJl8Jm/rduLb6XW+iSalTtaNcvshVM8wU+YiK5JQvrbRSrl/C1Ccb7c+kS9Yp75isy8O/10Qv3
	YId/vB0yWFD7j4LRTTiNsi8b19u0ETQutCaJBOi1ULBHlMR4042wKGBBKpzOCAU67KAmV6cNJIn
	Kvfg7bsbcGJogYWkW4cV8rEENVBDC80it1mE/z/2/lHXYnCaGG9OcLtpET8oPttP/0S/5aQX97J
	oSZ24QQ4zhxz3+rY5e6hTqUbQzZNiGDutK55t9tFIDfnYuQZyHnvzweTacYomVaI5z3v/m8YNpJ
	05kdr81uPD/orXDO5xgP2EF0spW1O0yHhMsecR+/FepilhURdrmB/8VGwVYywAOUMU39BypUkxa
	O9G4wwMl/u
X-Google-Smtp-Source: AGHT+IH41UT6L7KSWXZDSGelhxk153u3OKzG/25UAbUrsjENM5qtTrG5A6oTuBNMnKkXfvA13oaQXA==
X-Received: by 2002:a05:600c:4594:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-4778fe9aec9mr45876835e9.22.1763151991818;
        Fri, 14 Nov 2025 12:26:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779527a656sm23617845e9.10.2025.11.14.12.26.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:26:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/6] libwmf: patch CVE-2015-4695
Date: Fri, 14 Nov 2025 21:26:25 +0100
Message-ID: <20251114202627.656631-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114202627.656631-1-skandigraun@gmail.com>
References: <20251114202627.656631-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 20:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121719

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-4695

Pick the commit that explicitly mentions the vulnerability ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/CVE-2015-4695.patch         | 70 +++++++++++++++++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
new file mode 100644
index 0000000000..fe6163af3e
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
@@ -0,0 +1,70 @@
+From 7a7f58c0ebb84b9a3c44c875a667ce8ba191b325 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Wed, 8 Aug 2018 13:59:37 +0100
+Subject: [PATCH] CVE-2015-4695
+
+CVE: CVE-2015-4695
+Upstream-Status: Backport [https://github.com/caolanm/libwmf/commit/b5ae5d1f3bbddf051a5c9dd01897bd835817f013]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/player/meta.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/player/meta.h b/src/player/meta.h
+index 252e68b..3e13688 100644
+--- a/src/player/meta.h
++++ b/src/player/meta.h
+@@ -1565,7 +1565,7 @@ static int meta_rgn_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -2142,7 +2142,7 @@ static int meta_dib_brush (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlist
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3067,7 +3067,7 @@ static int meta_pen_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3181,7 +3181,7 @@ static int meta_brush_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrl
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3288,7 +3288,7 @@ static int meta_font_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrli
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3396,7 +3396,7 @@ static int meta_palette_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* att
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 56fd0b9eba..e135b1764b 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://libwmf-0.2.8.4-useafterfree.patch \
            file://0001-configure-use-pkg-config-for-freetype.patch \
            file://CVE-2015-0848-CVE-2015-4588.patch \
+           file://CVE-2015-4695.patch \
            "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"

