Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAE8D2B93A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.19541.1730817419961942454
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2rMazmv;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e38fc62b9fso47423727b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817419; x=1731422219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOQHxMuQM4PfreieIXUOwHGJRZHGORuUXoXRWg0FaXA=;
        b=l2rMazmvYKJbxSuo1vP4gRb0pdQT66iVdiWiXdGHuVF+JIseZP0QGxqpiVTZGQltvd
         fVe3vWJAwiSXx4aBhyGhMtbxSVi6JW8EbewcEnUe4+Mv/gw/c0Myl9vy+3YyyujAyW5E
         p76UrFvbOccv6yKrsiiaFsx5xgGH6fbHmQBQa6T728/AFbf+F91AS8aW/NBTK0FdyR8H
         pO1e5gdsORl+vIzGpYzSUsDDyuCXJCeOkdKLWVXlOwBH5nYOG1qaYklgW5rwiB5Qm1Ym
         BTaDas4ACNywMNVzbnon/GKB8AXDh4zqA2e0NeABAy6WrgjF20sEQcsWnwUD/EsZUeSY
         OJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817419; x=1731422219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOQHxMuQM4PfreieIXUOwHGJRZHGORuUXoXRWg0FaXA=;
        b=me3jDzg9qU1FZ6bYY67UISL6Gc7FkDGNUvOq+S3xPyt6v+12fznV+RMC1cuXjWC6Xi
         8TJTGE+Ny80tMu8ypeOheaBYsn0jbBQkr3YVcDXw0fuo1V/M6z8IaLYcpaTD2qulOIv4
         Ul9vpNN1dVG2HCjXFZHq6a2kFa2v9cv/R1YLGerfFD3a88JOfpC2z5dLHYsQ1eSOUuyi
         NUWc6oGYrXvRY3/CF3gpxVmI8h4L9qtSbbe2cXbDeeGaEx/uedpwl5iJeT4pDLvavqp+
         lSkZDDYoYibh2pdzMKQerH/LfW3tjE/Bvuu1ThukMHmPykkzGvo6dXWnEtzhxbKWW9Fz
         Co4A==
X-Gm-Message-State: AOJu0YygJM8HflGtbUOUPt9bJGCAwSRovhd+xjaKSVarZy9D5C9VeULT
	yZ5AanFPIYTZP4O8xlaH+eOJ+ZQpv8yuRHX5bZByjX0JDELiGNO/sgdSuA==
X-Google-Smtp-Source: AGHT+IH+EY1A3C8BwekpX1k2BSMC4Fi3ku4UjqX+j1+qmwZAUxkpHD8kAXK5YrB+wkzjRYcwXzcojg==
X-Received: by 2002:a0d:cdc4:0:b0:6ea:7c35:e2ab with SMTP id 00721157ae682-6ea7c35e56amr77208947b3.15.1730817419032;
        Tue, 05 Nov 2024 06:36:59 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 43/90] python3-ujson: Add python misc modules to ptest rdeps
Date: Tue,  5 Nov 2024 09:35:08 -0500
Message-ID: <20241105143638.2301245-44-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113461

From: Khem Raj <raj.khem@gmail.com>

Its needed for

ModuleNotFoundError: No module named 'tracemalloc'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index 8d2017d39c..4863c5e5a3 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest --automake
+FORCE_COLOR=1 pytest --automake --capture=no
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
index 18ce5cc301..5f4439c4c3 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5
 
 SRC_URI[sha256sum] = "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 # let OE do the strip operation
 export UJSON_BUILD_NO_STRIP = "1"
@@ -24,6 +24,7 @@ RDEPENDS:${PN} += "\
 
 RDEPENDS:${PN}-ptest += " \
     python3-json \
+    python3-misc \
     python3-pytest \
     python3-pytz \
     python3-unittest-automake-output \
-- 
2.43.0


