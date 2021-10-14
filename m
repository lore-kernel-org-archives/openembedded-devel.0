Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92185C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:59:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.8858.1634216349530644136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=u16w0845;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id u21so23391593lff.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I04HozDlJ1vkMadwGdtjeFbcpDvOBniGCq4NYFYDmfk=;
        b=u16w0845Qk8y75vr+vg96N/Zgs/hBVPqDm0DVZnKaoejkhef4Oc7Mu1gizUbDDLgsO
         fmfRJMk0BwomY6O8lG82BXulzyjxPteFcKH43gSpCSwPDBsmLdguGgjWKQMHUEDnvs/G
         76XSYoZfqAfLU5vJiziz+F+fZIbJj8pgbO4hxcOPuLpQ+pi1kP5vIvuvFqzw2lghm/nw
         Rn3vzD+MtpV0UB038BFHkMAQGjfaz53z99GGwyrJADcX4X1w8QhMCf52RCWuWWqJ0lVD
         Z+xTIQVrt1MVgsG1dujUGehBQmabRrqrWbDZ77yu4/0VusuKwePDFQG3cRJq4Snjx8AB
         I8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I04HozDlJ1vkMadwGdtjeFbcpDvOBniGCq4NYFYDmfk=;
        b=0yd2WkkM7grooZZlQ/VvYxqZDCgpGCr0yVHSHz62Fwzq1GJbgcbPeppddNPns5SpaP
         fTuvbzD37pFlLXeiresG3e+r3PJFTGzXYddckSc3fyvxXwiDoVrHdJYKdKdlTvW0kx7a
         Dr61SNnCGIJ4doXRFVlZVbKg4xHFio/5Rwl2bRrKt9Y2bmNNTB//3ZgBa805BsUYKfjD
         ExAUQLFscI5wZMjH/T1meaiPgTU+6mKdbn1uD2GLcC9/+4DNLu0ksGDhp6aEVuVwLdO0
         1VNayo45zMh/4fwNbW6sCLcv8zUB54Nv9ChE46/XULCne01ynSXbffmH+Ubw9Yp7IMG8
         lYxQ==
X-Gm-Message-State: AOAM530KS0lUeFvN8WquYxE6Jw0ClSc7VivjI4/g7zXtDgj3/akueTKW
	j99lt/BFA044hqXXbUo/oUmynGoVNm4LCNaE
X-Google-Smtp-Source: 
 ABdhPJzd3mq0mkw5RxhE5xmayNwCFYobvyMBQdaadFsrFrCJ+JMRA8uQxkzodMDEzoji5/ufYCBa9Q==
X-Received: by 2002:a2e:bd0b:: with SMTP id n11mr5796612ljq.71.1634216347081;
        Thu, 14 Oct 2021 05:59:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 o24sm221841lfb.97.2021.10.14.05.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:59:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH 2/2] packagegroup-meta-python: remove
 python3-anyjson
Date: Thu, 14 Oct 2021 14:59:03 +0200
Message-Id: <20211014125903.1348112-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014125903.1348112-1-open.source@oleksandr-kravchuk.com>
References: <20211014125903.1348112-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 12:59:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93292

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb      | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f0159f823..b660cc9a8 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -25,7 +25,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
-    python3-anyjson \
     python3-appdirs \
     python3-apply-defaults \
     python3-argcomplete \
@@ -478,7 +477,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-jinja2-ptest \
     python3-markupsafe-ptest \
     python3-ansicolors-ptest \
-    python3-anyjson-ptest \
     python3-appdirs-ptest \
     python3-backports-functools-lru-cache-ptest \
     python3-bcrypt-ptest \
-- 
2.25.1


