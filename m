Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207FCC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 00:05:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.5367.1644969933489040375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 16:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=yJQxkEun;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644969931; i=@fujitsu.com;
	bh=83lS19qpdvLtphL5P4UEMwZJP2wdiKUXzoDqCqD44y4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=yJQxkEunDK8W0YG6pTvndoMXGbCM3OqQzOcJPCfTUKYUfE02YYWuvgUVe1Ufg6CAX
	 Wl0UYL1n8bWoNX/rWR6TuEhnD1YD8qlI2WRgkfbZPUomdyVCaOBvUG2uzeat0sU7Ii
	 rTsBds0AxSQYpjAmMUP8yOHMSqTOJjtvNS+9Ue//5v54YuLaUbALhEIx3TPFrCHWFY
	 yqTCPzUu/AUj4V3Qv4Yh0Y/7h7xFeF2fCxjI0nAjs+VzVqR0B3BIENHrCT/+tR5MSB
	 GsE6Rr11wTlowVUyqA5E67uQV7Y58a9MJgb8J6afG6Ok3RbY9KY/T5nrxoJDLioUOd
	 bgkGhuYtpluPA==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 57/2C-14616-BCF3C026;
 Wed, 16 Feb 2022 00:05:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqHvanif
  JYPJWPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP7yqesBa0SFfOmZTcw7hDtYuTiEBJ4wijx
  9W03SxcjJ5BzgUni3NV8CPsEo8Sc38ogNpuAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICjhJvj3aBzWERUJVY1XIVqIaDgxcofm2XDUhYQkBBYsrD92CtnAJOEudP/GCHWOUosXLrAi
  YQm1dAUOLkzCcsEONVJbqPPGWCsOUlmrfOZoaYoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjEK
  zkIyahWTULCSjFjAyr2K0SirKTM8oyU3MzNE1NDDQNTQ01TW21DU10kus0k3USy3VLU8tLtEF
  csuL9VKLi/WKK3OTc1L08lJLNjECwz2lWN1kB2P3yp96hxglOZiURHnbbnAnCfEl5adUZiQWZ
  8QXleakFh9ilOHgUJLg5bfhSRISLEpNT61Iy8wBxh5MWoKDR0mE950lUJq3uCAxtzgzHSJ1il
  FRSpzXzw4oIQCSyCjNg2uDxfslRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8abZAU3gy80r
  gpr8CWswEtFixkQtkcUkiQkqqgYn1zocp0ivnJ8/Lje1rmp/yKfVjFoPvidobt5Mb49ldrrWZ
  WLyRjf7Tv3bX55s7vu8NuJf5U19CdL/nZNe2KOXNhSmWzaYXj7utdwi4EfH29IOgn0xVl/RfG
  7OuWSDEWLmo7t759GN7OByLSh6ZH5l9mu/JFdlj5Yv5gv2S+Z3XhOT+9racKtt/JPLzybbGhs
  tNpVI5d37OEjK2d3jy4GT5p+v1phd2fBI/YsLe5+up8krRtO77j9BNP549CWTzOL5L7E3VY7X
  SOF2jnIgTcbfeskge/l/9ntvQy8vYOO1WoaTSmSij1rVn3sVJP96mMrHmwsbJu8NZWGIOPTg3
  9fOD55I5fDer5x8zueLL8kWJpTgj0VCLuag4EQDzHIzdcgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1644969931!14499!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26365 invoked from network); 16 Feb 2022 00:05:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Feb 2022 00:05:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C9D1D1001AD
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 00:05:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C496F10018E
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 00:05:30 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 00:05:09 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mm-common: upgrade 1.0.3 -> 1.0.4
Date: Wed, 16 Feb 2022 08:04:51 +0800
Message-ID: <1644969891-7677-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644969891-7677-1-git-send-email-wangmy@fujitsu.com>
References: <1644969891-7677-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 00:05:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95325

refresh 0001-meson.build-do-not-ask-for-python-installation-versi.patch

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Add util/doc_postprocess.py and util/doc_install.py.
  Generating documentation in modules that use mm-common
  does not require Perl in Meson builds.

Meson build and skeletonmm:
* Specify 'check' option in run_command().
  The default value will change in future Meson releases.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-do-not-ask-for-python-installation-versi.patch | 14 +++++++++-----
 .../{mm-common_1.0.3.bb =3D> mm-common_1.0.4.bb}     |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.3.bb =3D> mm-common_1.0.4.bb} (76%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch b/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
index 6031eaa782..7d1dbc6ee4 100644
--- a/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
+++ b/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
@@ -14,19 +14,23 @@ just ask for python3 executable.
 Upstream-Status:  Inappropriate [OE specific]
 
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+
+rebase for 1.0.4
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
 ---
  meson.build | 7 +------
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 3255328..7a6094c 100644
+index 8a18c36..34fd546 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -6,12 +6,7 @@ project('mm-common',
-   license: 'GPLv2+'
+@@ -7,12 +7,7 @@ project('mm-common',
+                               # and meson.add_install_script(python3, ...)
  )
  
--python3 =3D import('python').find_installation('python3')
+-python3 =3D import('python').find_installation()
 -python_version =3D python3.language_version()
 -python_version_req =3D '>=3D 3.5'
 -if not python_version.version_compare(python_version_req)
@@ -37,5 +41,5 @@ index 3255328..7a6094c 100644
  # Use these instead of meson.source_root() and meson.build_root().
  # source_root() and build_root() are not useful, if this is a subproject.
 -- 
-2.21.0
+2.25.1
 
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.3.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
similarity index 76%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.3.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
index ae2bf2d02d..cee56fd55a 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.3.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
@@ -6,7 +6,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
 
 inherit gnomebase
 
-SRC_URI[archive.sha256sum] =3D "e81596625899aacf1d0bf27ccc2fcc7f373405ec48735ca1c7273c0fbcdc1ef5"
+SRC_URI[archive.sha256sum] =3D "e954c09b4309a7ef93e13b69260acdc5738c907477eb381b78bb1e414ee6dbd8"
 SRC_URI +=3D "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
 
 BBCLASSEXTEND =3D "native"
-- 
2.25.1


