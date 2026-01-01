Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6CFEEB57B
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 23:52:18 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9367.1767311532536390723
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jan 2026 15:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZT26Es4M;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b725ead5800so1654469666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 15:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767311530; x=1767916330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=leTP/rmtCsaIw+70lo5TBHtAypP/hf3B8+ftWjEaDXA=;
        b=ZT26Es4Mo6LxFWHorKZjrCwPi/PTuRzmtDWwZ0dfmgkcHp9u0BhOMaJ0xWfOMD+IUU
         qfn1Nj5QM/vQX3ZaO4qbz30Rjyol0mL8ugiSXUCYCK7ESotJaOEIbsxcgslMkMIl4XkV
         ivQQzAMBXhSXkh2y5CjNpsxN9LTFhM/Ew+QOj2KthLlZHBcCz6HMg3pWGqv5v/A/VhGb
         CDlJNc+YlabiwaUxnwssbjvh7H9uqY2x14ig/FZl8w8N5bzd5E97/8NDYop8PpxThADf
         k852i+hOrLiSB1ODOPa2sPkvYQOlQlGr7Mi5LklvYLBgagPxjw1iwPK0bWMBnZteQUBy
         7UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767311530; x=1767916330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leTP/rmtCsaIw+70lo5TBHtAypP/hf3B8+ftWjEaDXA=;
        b=OJAJ78b6fgVEkfLBuseQL2zq76Nk050PtV7n7edUXDhYxQpuhz7TMVztSa3fCmWOhE
         Sh6yzwIS3z+0rSfrHdJQvhktoE4MQNufNeFL02anisSSxyqFbJ4r85sf8mflSpguoztJ
         ZVd58kmQW25+SlQS9Awdm0TcrNRjEZQPa7pa+DfK6v1o14PE0WLaFubx8/KaOnAZOAJl
         QOl80+7WIclWVVigW45dtZr37tizy+AxDnzkLbCm3i2j1eIOUxp2X+OmcvisgvK82DJJ
         lZEq238bsKyiRKXQMEVD6zOktk0uNqUJhxRVjQM5M090oLKy6S5tqx7ilpdMYFAe04+Y
         jmIQ==
X-Gm-Message-State: AOJu0YzIoxKQTpPEfP1i0N55eWWYZ+jinDsibD7Do7gQS7ltIS67iiYj
	ktauV/kq5lNf+Z6kOkfWHgSgmb30oL128yefndh+asenXSAuwhaStd36jt8+ZqdB
X-Gm-Gg: AY/fxX5wn7YvkHieU4WaJcETLQLN4hCdgfXz6SlEjFSyVnSDwHpdpOpNVPdzfpZDxE6
	IGiNo1sB1E4vmDfFqFWZXnj0Pm+6Whk92n9uS95d17ZkAhdBeBDSSym4X3NrpE35/Q6eypO9cLQ
	DnsPdbEoWvV0H8JofLTX3aQI+DH7CgbLJNzadHH13mWrrFdo6PVnAAX1yekMMjnhZOu4qiTGJJA
	Z9HoIVl7djk50c+p9I7lxWe+pt4qEf769Ygg08QfbZjUKlCHI5o/xEvLXiMo8twbQYinMxRcKRC
	FWv3mb0X9PDrPpomAdeLE5fcWdzeY7A/85/bs0PeE4FMpcCJIr9U7L/JhUaglivJ4EeyTCOuwji
	O3i7lSZ3tubH99OO/p/0kCx1unnp4iU7iXP32XxVGv/6USAuRwHq1qujT+bt31mJpJixjFK+kUo
	eNBziNN665lhETAs9hlV1SrufluabZv3DA/fLhE5+mCeFoM0bVno+eW6NlCUGlgNp0
X-Google-Smtp-Source: AGHT+IGOzgGIzWBeRUN3t2X5GqBLyB8bdFkr5mOa2+U4HclgWsbRm2ma9OWviP9SBTGrEfVi2fDckQ==
X-Received: by 2002:a17:907:db03:b0:b73:6c97:af4b with SMTP id a640c23a62f3a-b8037233a00mr3763270866b.45.1767311530408;
        Thu, 01 Jan 2026 15:52:10 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm4200698966b.30.2026.01.01.15.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 15:52:10 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-propcache: relax Cython requirement.
Date: Fri,  2 Jan 2026 00:52:01 +0100
Message-ID: <20260101235202.2746620-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 23:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123087

Since commit c35ce5fa9fe65da7c74d3ba679692c2f15bdca24 in openembedded-core python3-propcache fails to compile due to a version mismatch. This addresses it.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...0001-Relax-strict-Cython-requirement.patch | 24 +++++++++++++++++++
 .../python/python3-propcache_0.4.1.bb         |  6 ++---
 2 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-Relax-strict-Cython-requirement.patch

diff --git a/meta-python/recipes-devtools/python/python3-propcache/0001-Relax-strict-Cython-requirement.patch b/meta-python/recipes-devtools/python/python3-propcache/0001-Relax-strict-Cython-requirement.patch
new file mode 100644
index 0000000000..4b23145633
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-propcache/0001-Relax-strict-Cython-requirement.patch
@@ -0,0 +1,24 @@
+From 093a426a453840366c281515fbaa9509c77512df Mon Sep 17 00:00:00 2001
+From: Tom Geelen <t.f.g.geelen@gmail.com>
+Date: Fri, 2 Jan 2026 00:12:43 +0100
+Subject: [PATCH] Relax strict Cython requirement
+
+Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
+Upstream-Status: Pending
+---
+ packaging/pep517_backend/_backend.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
+index ce79c4e..e3168ef 100644
+--- a/packaging/pep517_backend/_backend.py
++++ b/packaging/pep517_backend/_backend.py
+@@ -376,7 +376,7 @@ def get_requires_for_build_wheel(
+     if is_pure_python_build:
+         c_ext_build_deps = []
+     else:
+-        c_ext_build_deps = ['Cython ~= 3.1.0']
++        c_ext_build_deps = ['Cython >= 3.1.0']
+ 
+     return _setuptools_get_requires_for_build_wheel(
+         config_settings=config_settings,
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
index 53ec5b33b9..23dd38b968 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
@@ -7,9 +7,9 @@ SRC_URI[sha256sum] = "f48107a8c637e80362555f37ecf49abe20370e557cc4ab374f04ec4423
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
-SRC_URI += " \
-    file://0001-build-wheel-in-place.patch \
-"
+SRC_URI += "file://0001-build-wheel-in-place.patch \
+           file://0001-Relax-strict-Cython-requirement.patch \
+           "
 
 DEPENDS += " \
 	python3-expandvars-native \
-- 
2.43.0


