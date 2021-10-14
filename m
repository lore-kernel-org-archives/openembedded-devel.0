Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1684EC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:41:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.2121.1634251272079998816
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=WqwL8v9/;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E7A418365D;
	Fri, 15 Oct 2021 00:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634251258;
	bh=DS190/vBvKWORDGngQnsRhBF2DlQa4Z928eTJil3nPE=;
	h=From:To:Cc:Subject:Date:From;
	b=WqwL8v9/RntZzAO0ALiFrdHsTmQHhatWc9vfgRiyLjZ+Bvws91C7+uBSAxhbeESH7
	 yGuE+Lx/IEJI6oV5skvJhh1jqni6B03S+ZNk+nFxWLDNDRnkrybf+o8MD51J7KIdnA
	 qNEDOSTAaensWvjuy3iVJgpJjd2m/C/boCxWD1FzPsR1/gCEb3ywK+ZCuzKVurzbsW
	 WrpwJDlad6QA3vBG54V3DejtbYncEbqd9j92mqsfQseP4A+bgNXyc/TEC/XyabvVwE
	 xx4c5hu0OWw6rwaWQpyW/tHWoRIwNOBZexF7rem/CwcUuEQc0DDkPcdMo/MoGyjBim
	 qjagWMhLtWgVQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] apitrace: Upgrade to latest version
Date: Fri, 15 Oct 2021 00:40:50 +0200
Message-Id: <20211014224050.84905-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 22:41:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93311

Update apitrace to latest version available in apitrace git
and drop patch which is now upstream as apitrace commit
d28a980802ad48568c87da02d630c8babfe163bb

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 ...-2.34-build-failure-by-disabling-dls.patch | 28 -------------------
 .../apitrace/apitrace_10.0.bb                 |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0001-Worka=
round-glibc-2.34-build-failure-by-disabling-dls.patch

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0001-Workaround-g=
libc-2.34-build-failure-by-disabling-dls.patch b/meta-oe/recipes-devtools=
/apitrace/apitrace/0001-Workaround-glibc-2.34-build-failure-by-disabling-=
dls.patch
deleted file mode 100644
index 92edc4404..000000000
--- a/meta-oe/recipes-devtools/apitrace/apitrace/0001-Workaround-glibc-2.=
34-build-failure-by-disabling-dls.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1926700b367745e976dae9d9dc2236da21f4435b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 1 Sep 2021 10:07:48 -0700
-Subject: [PATCH] Workaround glibc 2.34 build failure by disabling dlsym
- wrapper
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- wrappers/dlsym.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
-index 5ab8465b..d353bbf7 100644
---- a/wrappers/dlsym.cpp
-+++ b/wrappers/dlsym.cpp
-@@ -34,7 +34,7 @@
- #include "os.hpp"
-=20
-=20
--#if defined(__GLIBC__) && !defined(__UCLIBC__)
-+#if defined(__GLIBC__) && !defined(__UCLIBC__) && !(__GLIBC__ =3D=3D 2 =
&& __GLIBC_MINOR__ >=3D 34)
-=20
-=20
- #include <dlfcn.h>
---=20
-2.33.0
-
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb b/meta-oe=
/recipes-devtools/apitrace/apitrace_10.0.bb
index ca828b0b4..57ec1f8e0 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
@@ -5,10 +5,9 @@ LICENSE =3D "MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daeb969185a143c3c25130bc2c3ef9=
a50 \
                     file://thirdparty/snappy/COPYING;md5=3Df62f3080324a9=
7b3159a7a7e61812d0c"
=20
-SRCREV =3D "9d42f667e2a36a6624d92b9bd697de097cc4e619"
+SRCREV =3D "d28a980802ad48568c87da02d630c8babfe163bb"
 PV .=3D "+10.0.1+git${SRCPV}"
 SRC_URI =3D "gitsm://github.com/${BPN}/${BPN}.git \
-           file://0001-Workaround-glibc-2.34-build-failure-by-disabling-=
dls.patch \
           "
=20
 S =3D "${WORKDIR}/git"
--=20
2.33.0


