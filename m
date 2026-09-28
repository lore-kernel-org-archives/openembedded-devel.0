Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CFAC9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 09:22:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54639.1790587331684069374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 02:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y1zTOD5y;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-488885c3844so1089786f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790587330; x=1791192130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJQn6D+hBM6Jk6YsWilX1TvCqbM2ESBnZW294FFMJpw=;
        b=Y1zTOD5yEI0M/PvcWT6PJEuYA09z1CAsZPkJJj8bfCRSZ42XXNSihVw9yOYuYAuKmi
         bbG++RcULJMqg1KDqN7t4cg1vgo1OxTxUOkMTomLz3USjMp1kC2kLMiiAZSluBHJcq8J
         3QX1tOFY2aXCcvEveo4/5N15kLHesxob3P7PmE0DUhdejo5Kt47NxxVo3G3/j8zeqDqd
         2ZL2QQmkoi7Fk0klipUe8G0BmZ2YPtK2kB1SEud1jsWl4fIYc56/AzKfQyWigcOgzFxp
         THYX887YvW8M/ygihDcWRd2BNsVQp7+Ux1cD0HdLDLASdviCDQY8SjZHPW1qVAYmB8/z
         Sosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587330; x=1791192130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJQn6D+hBM6Jk6YsWilX1TvCqbM2ESBnZW294FFMJpw=;
        b=dSlEy/MV94PdCBr3OnJMbBzTRL93Z/7ZlRMC0ettaqqUjxfxjKL1EunMIWqsx2YuIU
         aQC1TxHDkSAAS9aCKqnEDLK5mwh5KjsmBPj2B7oMGTCV661h7zS3DMCLy3GJNUCc8zRZ
         H1zCf2np0CNykNDmrGjPANV/WgnzpVGT+KvDodYuUPYXlsA2Gfc4JautcCtu9viyF2gq
         RvwcYYCLofTycN52SpPkHLrRFDokQbXsaR72YcYavdmWy8LXhaje77YVqtb13u/vrFbX
         9kvSn+xFyljZSnBSiM/qEMV+X/psKhymOU4IkJX2gk93wOlL80Dxwc5CGbleQ8M8ECfs
         GW2w==
X-Gm-Message-State: AFq9FYKlRXnbYg/AsN7rCesPCSjTQ6dEadzykBZqsUHR1hRwa/58PeTV
	n5ZcgiO7QMUBM69kwrR9bENEbMsmeFZgIJpjiI+SInA/U0mRmvh+csEf+GVYcg==
X-Gm-Gg: AYBFou0OUFB5iEAAvMtR7yzNwsWZF9eGHTKNZPmN6xlypMPqb8NRjIehVDje+8FJEiR
	tyae5qDKIjkzFLtC4mhaIUYgUWZWhLhdRooGMaW84ru6eEsyVYGQDL0fvebm9jH4OFPD+xmHb/4
	ZIg4Lhn2mq7EuReDBHfS4/PrNXUl1MR4Gl1QtgYkyrgLpUNYDAB0hmrKjN7EUrWH5hLOHhm8BE8
	m6z+aI2jShINkpYT6MXZ0Uk+GDreur58AYvYJ+eqOKy6fEplTkPTHKzS+0X+bHgyixgdLLjStmi
	o6q6QKPEMobAaIt7j+oqU1f5SJidQ0s56kG8fYrhk91X1TFy6eiGWh9eOhSkBUmmFhB/POq0WMa
	cHW9N5leMmqxqIdbSVFQ05qOsPIoe1SgYoeoanenrrDoz0J8dJGfUwLC+SPOw5Ueege6OFEM710
	pYRlZyVWknTljNC4H7OI7nYIyKWJxFo6YuIxlq3u2JFbr3gP2MdJ4nzkAVLnp3OutpGGRfVxHdt
	PxW2HLJCUk6mQVbOlR9420QOB0V2bn1F9y9Rkc9qolNFut09qz/qXD9ChmPvuShbif7
X-Received: by 2002:a05:6000:4103:b0:487:c3e:d6cc with SMTP id ffacd0b85a97d-4887171e51bmr22561192f8f.31.1790587329814;
        Mon, 28 Sep 2026 02:22:09 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm24893344f8f.35.2026.09.28.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:22:09 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-asyncvarlink: add recipe
Date: Mon, 28 Sep 2026 10:21:40 +0100
Message-ID: <20260928092140.2252231-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 09:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130427

asyncio Varlink binding with file-descriptor passing; interfaces are
derived from annotated Python classes.

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb  |  1 +
 .../python/python3-asyncvarlink_0.3.2.bb       | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d9a91512763e..9d07fc44e27a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -39,6 +39,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-asttokens \
     python3-async-timeout \
     python3-asyncio-glib \
+    python3-asyncvarlink \
     python3-attr \
     python3-autobahn \
     python3-automat \
diff --git a/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb b/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb
new file mode 100644
index 000000000000..abbe50cab342
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "asyncio-compatible, type-driven Varlink implementation"
+DESCRIPTION = "An asyncio Varlink binding supporting file-descriptor passing, \
+with interfaces derived from annotated Python classes."
+HOMEPAGE = "https://github.com/helmutg/asyncvarlink"
+SECTION = "devel/python"
+
+LICENSE = "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
+
+inherit python_flit_core
+
+RDEPENDS:${PN} = "\
+    python3-asyncio \
+    python3-core \
+    python3-io \
+    python3-json \
+    python3-logging \
+"

