Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CF4C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 15:28:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.8805.1641914917688039020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 07:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=vmBpk7N+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A96FA801EA;
	Tue, 11 Jan 2022 16:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641914914;
	bh=xds+4PMZoHKlN+3QYBY1uqlAyK7IAPnvs90bBY75/Gw=;
	h=From:To:Cc:Subject:Date:From;
	b=vmBpk7N+Jt/WhZKZR3k9VNTdKJgmZXv4EKTB11cdMqAVyOERvUl3Kv//QWK8YFDi5
	 /poH1YFWGJaFcApMrZfkasVNZjBxEGbhizxaGHpKpzpLm0wNye6hqg1tD9SlXWbNkp
	 9jRSni5RrY9rZmBBrnViv98ISeaAbqo9xJGWKdfSI0aAXuLhGvUmvwPXT8rPaL2jsP
	 6shPP03VqCnRK9LQnd3D4kW5Mv5y11QSSieZrOj2g5f1PrBwUqyDt1TAoKedf7MNjV
	 H7uwebJcrkQ0vJzSLhJ0v3XeXOFbfPl4vl3ISu/DuR+P6QUGanHqSkQ58nX0eQ95lE
	 bT88BhFQ+OeVw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Stanislav Angelovic <angelovic.s@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH 1/4] Bump sdbus-c++ version to v0.8.3
Date: Tue, 11 Jan 2022 16:28:11 +0100
Message-Id: <20220111152814.1270957-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 15:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94746

From: Stanislav Angelovic <angelovic.s@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b6213e4dd595d7dd2dbd67c1cad09e958ffd9c2f)
Signed-off-by: Marek Vasut <marex@denx.de>
---
 ...1-Try-to-first-find-googletest-in-the-system-before-do.patch | 0
 .../sdbus-c++/{sdbus-c++-0.8.1 =3D> sdbus-c++-0.8.3}/run-ptest    | 0
 .../{sdbus-c++-tools_0.8.1.bb =3D> sdbus-c++-tools_0.8.3.bb}      | 2 +-
 .../sdbus-c++/{sdbus-c++_0.8.1.bb =3D> sdbus-c++_0.8.3.bb}        | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-0.8.1 =3D> sdbus-c++-0.=
8.3}/0001-Try-to-first-find-googletest-in-the-system-before-do.patch (100=
%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-0.8.1 =3D> sdbus-c++-0.=
8.3}/run-ptest (100%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_0.8.1.bb =3D> sdb=
us-c++-tools_0.8.3.bb} (88%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_0.8.1.bb =3D> sdbus-c++=
_0.8.3.bb} (96%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-f=
irst-find-googletest-in-the-system-before-do.patch b/meta-oe/recipes-core=
/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-first-find-googletest-in-the-syste=
m-before-do.patch
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-fi=
rst-find-googletest-in-the-system-before-do.patch
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-firs=
t-find-googletest-in-the-system-before-do.patch
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/run-ptest b/m=
eta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/run-ptest
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/run-ptest
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/run-ptest
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb b/me=
ta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
similarity index 88%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
index 9eaec0f2a..3b87c2265 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
@@ -8,7 +8,7 @@ inherit cmake
=20
 DEPENDS +=3D "expat"
=20
-SRCREV =3D "3a4f343fb924650e7639660efa5f143961162044"
+SRCREV =3D "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
 SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhtt=
ps;branch=3Dmaster;subpath=3Dtools"
=20
 S =3D "${WORKDIR}/tools"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb b/meta-oe/=
recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
similarity index 96%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
index a94fb8def..3f805001f 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] =3D "-DBUILD_TESTS=3DON -DTES=
TS_INSTALL_PATH=3D${libdir}/${B
=20
 DEPENDS +=3D "expat"
=20
-SRCREV =3D "3a4f343fb924650e7639660efa5f143961162044"
+SRCREV =3D "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
=20
 SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhtt=
ps;branch=3Dmaster \
     file://0001-Try-to-first-find-googletest-in-the-system-before-do.pat=
ch \
--=20
2.34.1


