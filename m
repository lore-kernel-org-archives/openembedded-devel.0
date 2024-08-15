Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76371C52D7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 06:31:07 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.117289.1723703460480323965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 23:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YPMRacUQ;
 spf=pass (domain: konsulko.com, ip: 209.85.208.177, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso7542251fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723703458; x=1724308258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2T/aRM4vGdDznv6knLxrF9FmgV2QMCT2NDSvqBJ1hc=;
        b=YPMRacUQUy4dXgZC6Sk+THH4USZgXNbMJLQqKyrShnyyV/EOZZvLTQQGSr2MHJLI2S
         tZJDD7+duaAFoTAsHIAYWIbMtlm5BBhX4YFVQkq0rTfJV4v9XpxsoyNtDHRvvchICWc9
         nn4xyQ4COL/piiDCDwGRbO5K9CPWyDGzAl0ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723703458; x=1724308258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2T/aRM4vGdDznv6knLxrF9FmgV2QMCT2NDSvqBJ1hc=;
        b=o8YpG7p7P3jPA2tIc/Qak5ccfeA/KiwKH8eUzGvkyWqd25H4iRTY7+p4amXeAXo/dX
         /ztYTBEIGPVmMvXpiDaeBURx7AOSfvuNIrqHkEx8kvrgrDdAxM28lf1y1iEIaOJKUYp9
         Ywad76P9P/nrZxzJsIFhSoj/BB9x0124RaZ5U4IayjSu3JFs3xUhhLD2HhuXsLDpiwit
         QWMnzaUk0sT1i6zcKmIqSVMTXtWxC1xG+FiQ0nZVn1VKZ8Wtl61eSBmuYwENnTOo/h4s
         nHxKjQkXiMqQcQWJvOItH4OUbrf7JzTcxwmjzpogGCqewVyXHJcs/7IQMjfJqVk+QQEl
         OL9g==
X-Gm-Message-State: AOJu0Yw+p3PUg7iAckvtHu9rYzyb2I3VfDLmFwy1BFirfqMzhyqr6X2L
	Az7DsNmjk+Xw+tHwLQyIUHhGlpJnGnI4udSQ6qFJ4R8D9dklGyVT3RR3FnZBREvgTRh1kbp4frG
	0
X-Google-Smtp-Source: AGHT+IFptiM0g1EAqfhqvDgAKwjkilklK/jamcCjdtbbSrhdny2Eblw2BsAAcPL4L7W8rLpXs+PQ7A==
X-Received: by 2002:a2e:8706:0:b0:2ef:2b44:9977 with SMTP id 38308e7fff4ca-2f3aa1bdb36mr29204651fa.18.1723703457818;
        Wed, 14 Aug 2024 23:30:57 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm707174f8f.54.2024.08.14.23.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 23:30:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-dirty-equals: Upgrade 0.7.1 -> 0.8.0
Date: Thu, 15 Aug 2024 09:30:53 +0300
Message-Id: <20240815063055.2088675-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 06:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111818

Upgrade to release 0.8.0:

- set requires-python to 3.8
- use zoneinfo instead of pytz where possible
- No need to call datetime.replace for utc_now
- Patch pprint to make pytest diffs nicer for big objects
- uprev test, lint and docs dependencies
- Support Python 3.13
- Uprev version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rty-equals_0.7.1.bb => python3-dirty-equals_0.8.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dirty-equals_0.7.1.bb => python3-dirty-equals_0.8.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
index ea9303b17..584d787a7 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://github.com/samuelcolvin/dirty-equals"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI[sha256sum] = "a580513f3285e93656a770a04e428f8bfc513848877bf278282dbfbb907fdbb4"
+SRC_URI[sha256sum] = "798db3b9481b9a5024c0e520946507676ed2f0c65317d3e95bdce1a01657cf60"
 
 S = "${WORKDIR}/dirty_equals-${PV}"
 
@@ -18,4 +18,9 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "dirty_equals"
 
-RDEPENDS:${PN} += "python3-pytz"
+RDEPENDS:${PN} += " \
+    python3-pytz \
+    python3-core \
+    python3-json \
+    python3-netclient \
+"
-- 
2.39.2


