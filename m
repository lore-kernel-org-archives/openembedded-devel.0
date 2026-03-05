Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF304F3D334
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:02:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49126.1772730124967402284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 09:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZE3CAse;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b9b190easo3149255f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 09:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772730123; x=1773334923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ll4kaYdcLim/eDRPTqko7eb/XBJg35rRNwwgJx4ggs=;
        b=nZE3CAseBmkIai5JqZlCANZmn4lFvYyt8AsItzf7Kn469Y7Md/B3Mv3hTpaF/bebuh
         0WqW3/pk/21DBv3PHDeLtCCrXUSiJlon3Hfer6blRXT0Xg1EodQ+YoiV7db9h56t9gvR
         KxaSTNzNSHDSHKfDnYwAuWhYicpYiVnFNvbjsJtrre7x6w3sug4WxYDSOq0yH65zb5HD
         nXCN5aH7l0YcFU49bkdrv1VULFyAW+6GTz3lOAhgcrtZWxN79fvipBZy6/7XuFXHqXms
         WoOgzo9FhFL6YjtBJUHSynrbaAZFUEofT917cq7hyqMf2IBDxi8ZIA18Ij2gchtycdLJ
         lE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730123; x=1773334923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ll4kaYdcLim/eDRPTqko7eb/XBJg35rRNwwgJx4ggs=;
        b=newRvWK5xZ41vx8F+l/Zt8hiLQTYJNO4fMCgLg2SM1E0oyePw3zX23oojAHq2L/hII
         xnvU684WBbMWsAmqRPk2CrFsVDDVXOA4KekDj6x2mEKCtXcNo64qnM3g/xoUG/6kW78X
         YGLfBCBLGBwlI/tSpOtwDk91B8rSM+IVytD6cvxN1N/UrEqIIDytwxHhclAwnBq/sTi+
         kQ1/A3Qv3OyWgxlJ4I7xTf0C3AsNn5MKoTvr7f1U/HNndeQE7st3H8w4hRJlefDQZucl
         2FKIyoq2QcZi1x3rmrnOLNTVEoi+GdMyadmG/MJowm1LaEB87P7Dp/VFucSBfZ2Cp5IF
         iTeg==
X-Gm-Message-State: AOJu0Yzi7QZnBiUK8U6B8ra+Y5Laq6z0nZwCJIJ08TlT5PIbpH9bIXSF
	PzVunkCyyVeMlrCI/jBNShpXd+KGaLE/tRfKkQ4AEcgc80BwHCIXnVP3rOsIwg==
X-Gm-Gg: ATEYQzxg1sNKN89m1vV5VNCsp96kw2LYtjZtFIc2+IsQ/fCXVNcfI9GWy4NmVHGez+a
	ZlVFCProPsOMOwu5HS8N037SXpcAW50AjzqyjWXGCaAszeEYtGvzOaKXXon2NfjfAA6eQ0W3yWL
	GHskIyMI8XNKzO8ABkArKAS2yVg2+vsXJcL3QhzVQ5wySsN7SL/WrsI7hpO9ETgezxNgWSSuXgm
	GRZlBqkv8LIZX2CKa8bnPnjuVXrBiPVhFHbgsGjQiWbiI2kjvIUgFNIL8jk/qG3YZXX2Rlm/MWR
	K0BWW+koISS6kJQ5QNFzOJ9EPaEDGoAa/w6IKjlJynAsfVJAfGRNg+y1SyLAa/RgLFA5CdkghQp
	bQv8Usr5J2ycyLrfVMZuv5qVPVW/oTysxGnhajcvOc9MGxr6tLb/qZ+wDbLq+2JAAAR3VQArMMJ
	hRT6/3dpsY5lHYJ9R3PfVK
X-Received: by 2002:a05:6000:1a8a:b0:439:bfaa:ed9d with SMTP id ffacd0b85a97d-439d7269ae4mr932971f8f.58.1772730123240;
        Thu, 05 Mar 2026 09:02:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b1116698sm38468637f8f.16.2026.03.05.09.02.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:02:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-django: upgrade 6.0.2 -> 6.0.3
Date: Thu,  5 Mar 2026 18:01:55 +0100
Message-ID: <20260305170157.3357499-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305170157.3357499-1-skandigraun@gmail.com>
References: <20260305170157.3357499-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 17:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124888

Ptests passed successfully.

Changelog: https://docs.djangoproject.com/en/6.0/releases/6.0.3/
- Fix CVE-2026-25673 and CVE-2026-25674
- Fixed NameError when inspecting functions making use of deferred
  annotations in Python 3.14
- Fixed AttributeError when subclassing builtin lookups and neglecting
  to override as_sql() to accept any sequence
- Fixed TypeError when deprecation warnings are emitted in environments
  importing Django by namespace
- Fixed a visual regression where fieldset legends were misaligned in
  the admin.
- Prevented the django.tasks.signals.task_finished signal from writing
  extraneous log messages when no exceptions are encountered

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-django_6.0.2.bb => python3-django_6.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.2.bb => python3-django_6.0.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.2.bb b/meta-python/recipes-devtools/python/python3-django_6.0.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.2.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.3.bb
index 001abf48e8..b3aec8870a 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.3.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3046a53b0e40d4b676c3b774c73411d7184ae2745fe8ce5e45c0f33d3ddb71a7"
+SRC_URI[sha256sum] = "90be765ee756af8a6cbd6693e56452404b5ad15294f4d5e40c0a55a0f4870fe1"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

