Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CBDC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 15:28:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.8810.1641914917678282758
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 07:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=q/6Uxb9H;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0310380562;
	Tue, 11 Jan 2022 16:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641914915;
	bh=kTAaZfQW41NFGskH/OkRjfrRlh6BQWbP6UkYdb+vDLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/6Uxb9HT65dO/SoJkMgGXnWxYP51Fz9rxVi9PwMgdJ07xrsOXlHCkwTJOylAKTtW
	 NEsIKlpEFlIUKls2+95veY54wNPPBN/TS8jHmqgyxmS4gHbthw+4Hrw0UlzpKLI8Ek
	 xRsYDVtsJiBHQQ0oX+lKKep8ieo08jx14mDZRs2cEE6M68Pja8oobt8PKG/cJdCVfu
	 jbo6x4W9CW3aro//NFvhB2Fii4ZvjpC+xTZe61I3kY0NkRIohLXamGZ5Xm5eU5yPSR
	 WUiWm+e2QsRylrVDtjvsBZU5eTVfqdHtXziCxeoLF/jNkNO25QRyDhFkeuL1XJFB4F
	 Je9E035tj+68Q==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH 2/4] sdbus-c++-libsystemd: Fix reallocarray
 check in meson
Date: Tue, 11 Jan 2022 16:28:12 +0100
Message-Id: <20220111152814.1270957-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111152814.1270957-1-marex@denx.de>
References: <20220111152814.1270957-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 15:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94748

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4a171790a66c6adb5bf0994c9b2c85a1ea0b8ce8)
Signed-off-by: Marek Vasut <marex@denx.de>
---
 .../0001-meson-Fix-reallocarray-check.patch   | 25 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-2=
43/0001-meson-Fix-reallocarray-check.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001=
-meson-Fix-reallocarray-check.patch b/meta-oe/recipes-core/sdbus-c++/sdbu=
s-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
new file mode 100644
index 000000000..d3d339d56
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-=
Fix-reallocarray-check.patch
@@ -0,0 +1,25 @@
+From 1ebf1a1df17afd8b89f84b1928a89069035bf20b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Dec 2020 16:15:57 -0800
+Subject: [PATCH] meson: Fix reallocarray check
+
+reallocarray() is defined in stdlib.h, so that would be right header to
+check for its presense.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/1795=
1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -501,7 +501,7 @@ foreach ident : [
+                                  #include <sys/stat.h>
+                                  #include <unistd.h>'''],
+         ['explicit_bzero' ,   '''#include <string.h>'''],
+-        ['reallocarray',      '''#include <malloc.h>'''],
++        ['reallocarray',      '''#include <stdlib.h>'''],
+         ['set_mempolicy',     '''#include <stdlib.h>
+                                  #include <unistd.h>'''],
+         ['get_mempolicy',     '''#include <stdlib.h>
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b=
/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index f0e928d0d..c52024130 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -41,6 +41,7 @@ SRC_URI_MUSL =3D "\
                file://0002-src-login-brightness.c-include-sys-wait.h.pat=
ch \
                file://0003-src-basic-copy.c-include-signal.h.patch \
                file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-defi=
nition.patch \
+               file://0001-meson-Fix-reallocarray-check.patch \
                "
=20
 PACKAGECONFIG ??=3D "gshadow idn"
--=20
2.34.1


