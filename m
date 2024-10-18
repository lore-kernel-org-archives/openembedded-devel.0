Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B3ED3E1B7
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.30080.1729278807102262431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nfOSxJlV;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2f4c1f79bso21089937b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278806; x=1729883606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVoJ2oK0TygKkHhWJSi4iZT10cs8Ke4Mzggj2NNPpVo=;
        b=nfOSxJlV7XfZHqe9YGSYogBfVbJZ9ebOf3kDVdSe1Rm9vu29UPMFGt0DCSN212i63L
         og5UckBYPuoop/MJq+81r/WEAGTZW+k74leYd80jpH7Zc+fuLaae4hmuAi/BcIP+bMbe
         px+GYNDoNC8DbXvdPS/xh64cu77SY0wPZgec7iL7lGFUIbH1GvJRc2Nv2pNPKp/+PmFV
         3451YuO0iOG3lQicl4yLnp+8mlrsq3Z7mN/UrLhmZ18lbERs88dXDJgRDWcJZXurYVTm
         nBUqvFkE17Le/IdmRqjyo+IwzUds1OR03Fz+jE833lt0jLeFOhc/Nwb4e6QEADu+gl1s
         Lk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278806; x=1729883606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVoJ2oK0TygKkHhWJSi4iZT10cs8Ke4Mzggj2NNPpVo=;
        b=MQkKZ5YW/Cbu0kri6FtYAfQJbmnsuUUE9t5jTlN2r+/CC9icdV/Kla/TLGuSfr7WrY
         O6k/qAJJl77Mj1Z+H/lSGYCeviP+fNhGsylBiApnMUZQkYe0YNLWv2dy9t7RD2U9J4OD
         Vxn0TOkS40tBvBoCt0k6kvakh8tRx9oq9fZSIh2Zn3fhHC6QIaQK14TEasWB9HLV91Tn
         de/4+Y0drYDk0/fYL4/8LAE4ZdcoNPQR6j30CYWPWFp9ZRbe67tKociULcn810Ae1DPq
         Xbvpagtbd1brOr9Muhj5Cn0gQv/wAzghXtqqXHZteIweoP4fVwvQYSoPRbt+hN9LL8MS
         MLGA==
X-Gm-Message-State: AOJu0YwNyIE89bkyNJ8ZEYOg3Ct2Ttk+ct+gNOJe8z/SqUsOi/m1DBzh
	WrfggY3AD3+qtasrTsEHTACHl4Sy9hnsZoD3RR3uHREOKOy0OsitZ89pfQ==
X-Google-Smtp-Source: AGHT+IE3Ms1UKOCOj41pxLtVBrATKetLhtVDqparfOvtcH9084G0/fzpI2T1dp9L/XhHkX3auaxUqw==
X-Received: by 2002:a05:690c:6186:b0:6e2:f61e:c53 with SMTP id 00721157ae682-6e5bfc1511fmr40014357b3.29.1729278805660;
        Fri, 18 Oct 2024 12:13:25 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:25 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 23/68] python3-flask-pymongo: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:10 -0400
Message-ID: <20241018191101.25184-24-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113010

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-flask-pymongo_2.3.0.bb       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
index 1cd4a4b69..1e751b9e5 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
@@ -5,7 +5,6 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
 
-SRC_URI[md5sum] = "94df71e6800b1d7915cc91a74b70f959"
 SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
 
 PYPI_PACKAGE = "Flask-PyMongo"
-- 
2.43.0


