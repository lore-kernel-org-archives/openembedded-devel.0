Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CFEEF06E1
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 18:33:41 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31089.1770575617133548719
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 10:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CjR/F5Js;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b886fc047d5so666576466b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 10:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770575615; x=1771180415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sO8k0nsIXAySrALOgcqHqchm0ceWBH45rp4W6QM4Soc=;
        b=CjR/F5JsE1/0/tWeqj7kmBAg+HOImn8y5dUF8sgAGbjO19VFsPWtO7liFAjOSA9/5s
         eDr/r7H9LH8IjV1HJdqbGQT0bH+Kf31XYT1z9QNnwhEE5zlcjzjvONmxN1w4F5U3mqGf
         SzMpeQx7ElBIRz2eWEnLgX9nOQV7FdSFByyDiDvPN6UlIahHAGc99ROUKgSLzP+E23m7
         rVhCaiH4fiJizGc27V/aTI7AShlXbNRU1ejQGa6y15YmT9B44oIjDsXIcVRL9AxkTHLY
         xNUzuI7Uuke44yoVq0idULxMRL5iq5O79eAWfb6EJcGRQyPd/fBoBYlW736l5n5hGI7t
         uCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770575615; x=1771180415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO8k0nsIXAySrALOgcqHqchm0ceWBH45rp4W6QM4Soc=;
        b=Yq2smVJ7ctHr5gEl9nX1b+c7fG0/RnaEp+IjKQro6nzlB2FG2B94drrz4sYbSJ+Yyl
         P9tyCry1rBR1cGgL/NnGp2UrAvm6PH4KA/0FYadfeDHKdRllVy7b108qG02Eycow+YBf
         fF6mMzGOkX61/u5WsLLJhHPMY/YBQdoMp3gJ3bAGOch/acFKaCGGsO4lV6cYykhP7IJh
         jIVq9oIZ1S8okpBi1bBVq3rTwMpXxXpOp1sN6KnUpFGJp2VdPCdUvcJVsT6qOsAZ5JBs
         JnWg4LkVl8xTXerf2ZOLr76KuTrdITG46b3gDfJZBO0zH0Peanp1F00OxnUr6pMYFy1a
         tkag==
X-Gm-Message-State: AOJu0Yz375rj2z566vhe7EQN1Max9vq6HUpZRWmUoB7qA9DEjm4pEDRC
	Ib0AtxRXhHZHDdB1ovb0zt7SaEzWWK/TRg8KVgD3odgt3OEa4XmfF6pIwJK11A==
X-Gm-Gg: AZuq6aJ4J9Dl+EZoES8yAp8YUbXEYyHHOQtXostY6yiXgGJ1h/HZrKTCe4DPEwE38pB
	oGOPaVTTWtq1kowYdHkwcBuzMGKS4V6w20yQUpU9soUd3sqBEXpHY1siL29DGT9xwXRBErWbgsE
	Y4uMmBfK7NC9ViZKvNH6byRMWA8UzZSXH84QV3gmflxYXCeDaffPYZ9jrYfXypSXlKGXkroh+D8
	TsoQ4Pb6JVaEM4yV97BrM8TJ8ZsWaMGnYA2uEAUQN5m9IH7hfTSa6ozDzrYtfNdWKgwhrMkvJbx
	3TUfsn+/nSiWwWjLvK0XB4OwSXviNV0cw2N4cWKfb6uTbjMOE794N74yMV4i7YTLLu4Lo09SPWP
	VCZlP+XOqPH329X6ZN83u1bPOab19iBsQkm9dFKZv7iD5swCb1+kPzYvCMBIRqg3dO3JRuGZ28W
	pESx4oEu1H4vuKGtLcERfmYTcSLM9tx5/rd3EgnMflSnsTUmpgN9+/E0RPh7aUG9ka
X-Received: by 2002:a17:907:c10:b0:b76:f090:777b with SMTP id a640c23a62f3a-b8edf1ef07bmr431553766b.22.1770575614749;
        Sun, 08 Feb 2026 10:33:34 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3004sm307891066b.15.2026.02.08.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 10:33:34 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-pychromecast: allow building with newer version of python3-wheel
Date: Sun,  8 Feb 2026 19:33:28 +0100
Message-ID: <20260208183328.3609757-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 18:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124284

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../0002-allow-newer-wheel.patch              | 22 +++++++++++++++++++
 .../python/python3-pychromecast_14.0.9.bb     |  6 ++---
 2 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch
new file mode 100644
index 0000000000..456feb6010
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer-wheel.patch
@@ -0,0 +1,22 @@
+From e11eb34d1196a9dc35fef213aeffdfd8e6e29f44 Mon Sep 17 00:00:00 2001
+From: Tom Geelen <t.f.g.geelen@gmail.com>
+Date: Sun, 8 Feb 2026 19:14:09 +0100
+Subject: [PATCH] allow newer wheel
+
+Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
+Upstream-Status: Pending
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 4c98630..75a15da 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.2"]
++requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.4"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
index 35106f870a..6f88684f8b 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI += "\
-			file://0001-bump-required-version-to-0.46.1-for-python3-wheel.patch \
-"
+SRC_URI += "file://0001-bump-required-version-to-0.46.1-for-python3-wheel.patch \
+           file://0002-allow-newer-wheel.patch \
+           "
 
 SRC_URI[sha256sum] = "fe78841b0b04aa107d08aed216e91ab9cfb54b11d089d382be4e987e3631d4a6"
 
-- 
2.43.0


