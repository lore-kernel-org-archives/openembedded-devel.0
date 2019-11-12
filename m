Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33BFD7F57B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 23:36:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xACNaGke028624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 15:36:16 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.80]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0468.000;
	Tue, 12 Nov 2019 15:36:15 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][zeus][PATCH 1/1] php: fix CVE-2019-11043
Thread-Index: AQHVmZ9TMcYcEEQfgkKUPwuiwdkmdaeIMA3Q
Date: Tue, 12 Nov 2019 23:36:14 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA8F6548@ALA-MBD.corp.ad.wrs.com>
References: <20191112212244.53157-1-joe.slater@windriver.com>
In-Reply-To: <20191112212244.53157-1-joe.slater@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.237]
MIME-Version: 1.0
Subject: Re: [meta-oe][zeus][PATCH 1/1] php: fix CVE-2019-11043
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Nov 2019 23:36:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Oops, the patch is only part of commit ab061f95ca.  I could document this, =
or just leave it.    Joe

-----Original Message-----
From: Joe Slater <joe.slater@windriver.com>=20
Sent: Tuesday, November 12, 2019 1:23 PM
To: openembedded-devel@lists.openembedded.org
Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy <Randy.MacLeo=
d@windriver.com>
Subject: [meta-oe][zeus][PATCH 1/1] php: fix CVE-2019-11043

Backport unmodified patch from git.php.net.  Fixed in php 7.3.11.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-devtools/php/php/CVE-2019-11043.patch  | 38 ++++++++++++++++++=
++++
 meta-oe/recipes-devtools/php/php_7.3.9.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch b/meta-o=
e/recipes-devtools/php/php/CVE-2019-11043.patch
new file mode 100644
index 0000000..7e20063
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
@@ -0,0 +1,38 @@
+From ab061f95ca966731b1c84cf5b7b20155c0a1c06a Mon Sep 17 00:00:00 2001
+From: Jakub Zelenka <bukka@php.net>
+Date: Sat, 12 Oct 2019 15:56:16 +0100
+Subject: [PATCH] Fix bug #78599 (env_path_info underflow can lead to=20
+RCE)
+
+CVE: CVE-2019-11043
+
+Fixed in php version 7.3.11.
+
+Upstream-Status: Backport [https://git.php.net/repository/php-src.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ NEWS                                          |  4 +-
+ sapi/fpm/fpm/fpm_main.c                       |  4 +-
+ .../tests/bug78599-path-info-underflow.phpt   | 61 +++++++++++++++++++
+ sapi/fpm/tests/tester.inc                     | 11 +++-
+ 4 files changed, 75 insertions(+), 5 deletions(-)  create mode 100644=20
+sapi/fpm/tests/bug78599-path-info-underflow.phpt
+
+diff --git a/sapi/fpm/fpm/fpm_main.c b/sapi/fpm/fpm/fpm_main.c index=20
+24a7e5d56a..50f92981f1 100644
+--- a/sapi/fpm/fpm/fpm_main.c
++++ b/sapi/fpm/fpm/fpm_main.c
+@@ -1209,8 +1209,8 @@ static void init_request_info(void)
+ 								path_info =3D script_path_translated + ptlen;
+ 								tflag =3D (slen !=3D 0 && (!orig_path_info || strcmp(orig_path_in=
fo, path_info) !=3D 0));
+ 							} else {
+-								path_info =3D env_path_info ? env_path_info + pilen - slen : NULL=
;
+-								tflag =3D (orig_path_info !=3D path_info);
++								path_info =3D (env_path_info && pilen > slen) ? env_path_info + p=
ilen - slen : NULL;
++								tflag =3D path_info && (orig_path_info !=3D path_info);
+ 							}
+=20
+ 							if (tflag) {
+--
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-de=
vtools/php/php_7.3.9.bb
index a5c7b9b..e886cb1 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
@@ -8,6 +8,7 @@ SRC_URI +=3D "file://0001-acinclude.m4-don-t-unset-cache-va=
riables.patch \
             file://0001-Use-pkg-config-for-libxml2-detection.patch \
             file://debian-php-fixheader.patch \
             file://CVE-2019-6978.patch \
+            file://CVE-2019-11043.patch \
            "
 SRC_URI_append_class-target =3D " \
                                 file://pear-makefile.patch \
--
2.7.4


