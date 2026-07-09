Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CA8C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:33:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3128.1783578776277440194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GzJLn4hU;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc73e322dbso14191595ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 23:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578776; x=1784183576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn8yZBKCmd7Ds95S3akq/CNK20KNhaBD0Lu9oEwSvok=;
        b=GzJLn4hUsGpm46Nf31sfVBda2mrlxfUqfbSs9jqn+BEIvFXpEqQBNjcojiVwSKZzlo
         pNBvufKKexneAPQ/S22tlBzbl2QevKwHtwPlI6vv4ey6srcKS6oeb7CC4xLCgb6MLFvC
         rg7241Uo6sVM4JHWatjlWDMi9w1jDKz4RP2Yo7emeLoEqJXqto9IB6m7G7ylzAVLspCq
         e7Nzv9a+BmZE0NiABWutv/SXkoUNkYo0ZULfX18n+w3aJgdotWMbK21PEVtDAu/XA5yb
         kjBvVNlLHn2WfP6kPzkkRQ+uXX2MEq5YgzondmU/1AzJsy5/JjJ2Cq2e3CuavSskF66j
         EsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578776; x=1784183576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mn8yZBKCmd7Ds95S3akq/CNK20KNhaBD0Lu9oEwSvok=;
        b=SCgVRRLCHBrOMlzTd0hCig6YgjQPceMwLaGI/f17ZMtfNQpOjEkBHezo05K1szTvIH
         2B2bmcyNYcdbHqywBLZkJW7tIJPH65ya4RYg89i9wZLU+0TNlfDVfTnX5QDMLe1I5HTl
         +XI4Aa8XYdnjJz3AF0y9izE1dtSSzQw7G0CZM5eedTmkY/VZofLgpOLAaZU6CGfedipc
         UDSreGJzLxyqbFkIjP+PXPQdLdq+cRgAd3U1NoDpCGTlhj93adUUbFjzFRb/t1qnabOn
         /pBHbsCJXHzDiBBr6bgcWAjK9cUDeznqMV3pOZodAAzS0Jczrj1n1aQS07Wd5dnW4CpY
         2ExQ==
X-Gm-Message-State: AOJu0YwvI0IKBE5eK6nb5+YG4SjZbIsktlagx2Jtalf/HBdYo5gBMxw/
	JLVYYFF1K86v4FhCxMeWXa83KZmDSfMhwqbsV7MeCx8aGmpaQ0ccCcZ2WsADfgeo6Go=
X-Gm-Gg: AfdE7cnoZtqMuI/fvkeVsZgWqBK2PVw8dDmgADyYx0wsB/n2NyS+Qm3DvJ5UZFRRd+F
	1kDYzdExJUPtc9e8WMEuneplJi7jaIf9oz/3QORh5pOGQLOD0AFFkGbjyaRrCVBEQKmBO2wvNwB
	vYaq3PduKkVxU74B1Bw51dfTpEnEg12P+qOCNQaCCpAQ5s44pNFH1y2GhMqeneY5FbtFY4ebXzK
	maaN+aqozva95cZqgFH/GYlAhgBRdiIClfGFAHUmTeqUOAKn7CGE+Me7S7bPXckYBGG8QwNW7bA
	KBhUzAxzwza3Par5PxpO1h7xmLA6N7gpmakT9YY38mS7OcWShLQsjWijwyBC31ZUkgz1R1mcNq6
	8OkF4Kf7Cq5YjpFKxFXcKJNZlkqU8HBrR2MlhbHFimCVrp4omOpm8xai7am9i548iVp9agMhymV
	gpGfFK4BmLZ/wknZV6dmf5YOqVF+K/zs5n4c+5SAEo8hpsnkleCLpsdL81NXwVVR1lCgUaxnbnj
	MTXA+XI9Ybg54tzdzVqiY70gGJYHxqDGhE71RzOxB4pSFjma9p7o+dXwVRMjbQA7ZERoNDJ47Ge
	fXEItSwBk9VRN/alLkD1GvmK3d6PKg==
X-Received: by 2002:a17:903:2443:b0:2ca:6c8:abde with SMTP id d9443c01a7336-2ccea3d91bfmr53631685ad.18.1783578775565;
        Wed, 08 Jul 2026 23:32:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd5bsm38413735ad.72.2026.07.08.23.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:32:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/4] python3-charset-normalizer: Relax setuptools upper bound in build requirements
Date: Wed,  8 Jul 2026 23:32:49 -0700
Message-ID: <20260709063251.3218170-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709063251.3218170-1-khem.raj@oss.qualcomm.com>
References: <20260709063251.3218170-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128114

The upstream pyproject.toml caps setuptools at <82.1, but OE builds with
--no-isolation against the native setuptools (now 83.0.0), so the build
fails with "Missing dependencies: setuptools<82.1,>=68". Drop the
spurious upper bound.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ct.toml-relax-setuptools-upper-bound.patch | 24 +++++++++++++++++++
 .../python3-charset-normalizer_3.4.7.bb       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
new file mode 100644
index 0000000000..8d9ee26d8f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
@@ -0,0 +1,24 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 Jul 2026 00:00:00 +0000
+Subject: [PATCH] pyproject.toml: relax setuptools upper bound
+
+OE provides setuptools via DEPENDS and builds with --no-isolation, so the
+upstream upper cap on setuptools is spurious and breaks the build whenever
+oe-core ships a newer setuptools (currently 83.0.0).
+
+Upstream-Status: Inappropriate [oe-core specific setuptools version]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 1111111..2222222 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,3 +1,3 @@
+ [build-system]
+-requires = ["setuptools>=68,<82.1"]
++requires = ["setuptools>=68"]
+ build-backend = "backend"
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
index b9dffb21e4..52c194626b 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"

+SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
 SRC_URI[sha256sum] = "ae89db9e5f98a11a4bf50407d4363e7b09b31e55bc117b4f7d80aab97ba009e5"

 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"

