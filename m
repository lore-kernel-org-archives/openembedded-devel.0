Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BCCC982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:38 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4306.1790160151624420651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pKlvmWe6;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so433751b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160151; x=1790764951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBOlZYakJTeItuWBXbxFRqepudTuhK8bj/ZDlf59yEY=;
        b=pKlvmWe64VE6NlV4wSkRKs2+iWM6gSYdEUa6WQGhNbOfvJ2bOj1XWgSCI+8v0RM58Z
         jJpBTtC2JmO7FLvT/CehvqJLTTiWaa6UCcqUd8IM4No703aPkI0eYrK680jjxrKGLSRm
         ENCME81bK+6yEzWKxI8/J0T85zlZB7JkznbBm2Y/KLZiFI7SeYekSOkrnDZ5ns8F9oF1
         i1zTbYw6J+DEY/dN30KXw+iP/ZQ1/WweEZv1vmlpoDopYybLx11XKx626mi/oo/KhIko
         J33JgVhtz8vZOuUGw0QoLseMfXIdP0PhCjeN/QQhTfyYJKhCRkWpWaCMfgCFTeaYKjyq
         3xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160151; x=1790764951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBOlZYakJTeItuWBXbxFRqepudTuhK8bj/ZDlf59yEY=;
        b=WY9zYShzlva5IBsRhy+wNvXh8+gbGAAYUSTE3cPa8NEKJSpYOcQc2G8j/qYnyDuOsR
         2JQv5TihCP4ipFSZM+gf5BQoHxTBx6uheOcVq2zliHlxtGEC/mjTawLTViK5LjL1rb4Y
         Bw7xiWq0UGQDefZ+k4fmZce8cVN4eReKmxWfCInIWYeA8ulO8GEBbbQF+GKi7CGvqhKS
         ByET6+6tuMeWZcd8FULr7nQQzgD2UvebAwv28S2YHO2EhYIyDzTn+J3YR/fvRr5b7qXr
         PwtUf01B5+mNZDdFVUMdZLGUZX9MT1pJysAMEkVlVaYen3uaO5MxKlEaeAYuZHlHqjTW
         ZGYg==
X-Gm-Message-State: AFuF++kbjVwyIXzA6f8bKOye8l1ntrjYyC9h2PJUsmspcn/hJq1h3WEo
	efqsG/xFdxjPyAzpTQ55Xk4seRjd3nxKMC6eruZI/nDyygNdhKYqIDD/enCb9g==
X-Gm-Gg: AYBFou1dKEdxAnzK8rxvc+WsbjxZysI3aLgyk3blMFdi4KYu8e6Mg4UIIkReOp5KW3s
	x0ZcwQTQJc1H4AP3uzfkkvDYkc+IQ4+kjVbGHK9O/xqa0JsRinUUsHT3vytPcfVHW9+NWs8wR7a
	1iUrYOsnOeI4jXYoyIguEBSvttQypwgYcHW1mKh3nCF2y55xM94OWjM0L09l80C6THH6sIER3f1
	0w5dUykYAjChUjgn1zjpZGOztc21jt0CIQp4eop+j+ZywPCO2w5MUeyz8P22SQSHsUYgc4kKZVC
	4KzQP8I7aEfeaaEsaOVaKHv8+8ja721zHC06VNPU+Qg5ogXQxiaWC+1pm4sq5L2JzwTDi8HZ2pM
	FN1OMNNxbd5omKEPGR3GJWEE+97RhScGMNJueR+J6K8Is2e0ZmCEho7kQAowu2tnnWU4L3fm+7x
	PShM/OoKEc2Ieo5EgAPo4WuNa39VIarmWTVKerHMivdnw9Skt8qR0qCTWIqCMSHgUMGiUnO1/mR
	6Yv7Wj8u19hpfnEDZRWIXg=
X-Received: by 2002:a05:6a00:438c:b0:874:705d:f651 with SMTP id d2e1a72fcca58-87d1b3b1e39mr1925036b3a.31.1790160151001;
        Wed, 23 Sep 2026 03:42:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 41/42] python3-ujson: add CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:55 +1200
Message-ID: <20260923104056.457360-41-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130228

From: Devansh Patel <devanshp@cisco.com>

The current inherited "python:ujson" mapping does not match the UltraJSON identities used by NVD and CVE List V5, so source-aligned CVEs are missed.

Use "ultrajson:ultrajson" for the CNA affected-data identity and "ultrajson_project:ultrajson" for the NVD dictionary CPE and configuration identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7a393253ec09d90c67043201bb0f29e7613930a6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
index 89311254a8..abcda88c8b 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
@@ -8,6 +8,8 @@ SRC_URI += "file://CVE-2026-54911.patch"
 
 SRC_URI[sha256sum] = "5b7e96406c301a1366534479a7352ec40ec68bb327c0c119091635acd5925e35"
 
+CVE_PRODUCT = "ultrajson:ultrajson ultrajson_project:ultrajson"
+
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
 # let OE do the strip operation

