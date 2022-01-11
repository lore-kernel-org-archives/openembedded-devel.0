Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F010C43217
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 15:28:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.8798.1641914917687763829
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 07:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=rMAm+Jvi;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 44F9280FDA;
	Tue, 11 Jan 2022 16:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641914915;
	bh=ETNLc8npz9OlrO83jqnlwrqnneoI4G+uqz3WOB0kvsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rMAm+JviSvD85ldq2fBdqv8GxUGZ/Qz2zV+1EIE82ysPr2Bc34cf1jYvoZ+20xHCn
	 ifoQA242EPel+4d5n/mP7J91RsWNlqB7nvs/PbayEaF8gUX0qj2IxbketyGDn6kL/+
	 fQ62OGvNpqFJnMnlHH8FdaLEeoNI8ODSI7i+1GLR6RSzC3WwkR+EE2Fnh6Fk8JwzRN
	 ShQT69kaUq5fEV3dCoW1+03a+foInJdYg4Vm/GPIoHHINyAZQ8/5aTE+3hgQLZIU2n
	 R/j5CPNHRUoeo30oF90gauM5+4i9An7YZjk/EbfwjH8MwrwQhNnwnAKa7NsisHtGJX
	 MDtezVjDQAD8g==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH 3/4] sdbus-c++-libsystemd: Avoid hard
 dependency on rsync
Date: Tue, 11 Jan 2022 16:28:13 +0100
Message-Id: <20220111152814.1270957-3-marex@denx.de>
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
 https://lists.openembedded.org/g/openembedded-devel/message/94749

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dcb8ab6169bd93440137bbd4703171987ecd3a15)
Signed-off-by: Marek Vasut <marex@denx.de>
---
 ...d25119a495009ea62f79e5daec34cc464628.patch | 53 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  7 +--
 2 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-2=
43/7c5fd25119a495009ea62f79e5daec34cc464628.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5f=
d25119a495009ea62f79e5daec34cc464628.patch b/meta-oe/recipes-core/sdbus-c=
++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patc=
h
new file mode 100644
index 000000000..ae449791f
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a=
495009ea62f79e5daec34cc464628.patch
@@ -0,0 +1,53 @@
+From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Mon, 12 Apr 2021 14:03:32 +0200
+Subject: [PATCH] meson: do not fail if rsync is not installed with meson
+ 0.57.2
+
+https://github.com/mesonbuild/meson/issues/8641
+
+Our CI started to fail. Even if the change is reverted in meson,
+we need a quick workaround here.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ man/meson.build | 25 ++++++++++++++-----------
+ 1 file changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/man/meson.build b/man/meson.build
+index 3cae8446cda..f9c4b83dc81 100644
+--- a/man/meson.build
++++ b/man/meson.build
+@@ -184,17 +184,20 @@ html =3D custom_target(
+         depends : html_pages,
+         command : ['echo'])
+=20
+-run_target(
+-        'doc-sync',
+-        depends : man_pages + html_pages,
+-        command : ['rsync', '-rlv',
+-                   '--delete-excluded',
+-                   '--include=3Dman',
+-                   '--include=3D*.html',
+-                   '--exclude=3D*',
+-                   '--omit-dir-times',
+-                   meson.current_build_dir(),
+-                   get_option('www-target')])
++rsync =3D find_program('rsync', required : false)
++if rsync.found()
++        run_target(
++                'doc-sync',
++                depends : man_pages + html_pages,
++                command : [rsync, '-rlv',
++                           '--delete-excluded',
++                           '--include=3Dman',
++                           '--include=3D*.html',
++                           '--exclude=3D*',
++                           '--omit-dir-times',
++                           meson.current_build_dir(),
++                           get_option('www-target')])
++endif
+=20
+ ############################################################
+=20
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b=
/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index c52024130..59d6f352c 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -12,9 +12,10 @@ DEPENDS +=3D "gperf-native gettext-native util-linux l=
ibcap"
=20
 SRCREV =3D "efb536d0cbe2e58f80e501d19999928c75e08f6a"
 SRCBRANCH =3D "v243-stable"
-SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH}"
-
-SRC_URI +=3D "file://static-libsystemd-pkgconfig.patch"
+SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH} \
+           file://static-libsystemd-pkgconfig.patch \
+           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+           "
=20
 # patches needed by musl
 SRC_URI_append_libc-musl =3D " ${SRC_URI_MUSL}"
--=20
2.34.1


