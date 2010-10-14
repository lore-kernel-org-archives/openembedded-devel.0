Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P6ILm-0003Z2-8w
	for Openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 09:35:43 +0200
Received: by pzk28 with SMTP id 28so841397pzk.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 00:35:07 -0700 (PDT)
Received: by 10.142.144.7 with SMTP id r7mr8478547wfd.192.1287041706041;
	Thu, 14 Oct 2010 00:35:06 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id y42sm6859981wfd.10.2010.10.14.00.35.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 00:35:05 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Thu, 14 Oct 2010 15:35:05 +0800
Message-Id: <0EDC1EA2-3238-4748-B2C4-C074DA741C10@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] c-ares: Fix configure.ac
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Oct 2010 07:35:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Get configure to work with our version of autoconf by fixing
the syntax of configure.ac
---
 recipes/c-ares/0001-fix-configure.ac.patch |   12 ++++++++++++
 recipes/c-ares/c-ares_1.5.3.bb             |    4 +++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/c-ares/0001-fix-configure.ac.patch

diff --git a/recipes/c-ares/0001-fix-configure.ac.patch =
b/recipes/c-ares/0001-fix-configure.ac.patch
new file mode 100644
index 0000000..c8c3e66
--- /dev/null
+++ b/recipes/c-ares/0001-fix-configure.ac.patch
@@ -0,0 +1,12 @@
+diff -ur c-ares-1.5.3-stock/configure.ac c-ares-1.5.3/configure.ac
+--- c-ares-1.5.3-stock/configure.ac	2010-10-14 07:18:36.437023208 =
+0000
++++ c-ares-1.5.3/configure.ac	2010-10-14 07:18:39.527024687 +0000
+@@ -811,7 +811,7 @@
+   ],[
+     AC_MSG_RESULT([yes])
+     eval "ac_cv_func_$func=3Dyes"
+-    AC_DEFINE_UNQUOTED([AS_TR_CPP([HAVE_$func])], [1],
++    AC_DEFINE_UNQUOTED(AS_TR_CPP([HAVE_$func]), [1],
+       [Define to 1 if you have the $func function.])
+   ],[
+     AC_MSG_RESULT([but still no])
diff --git a/recipes/c-ares/c-ares_1.5.3.bb =
b/recipes/c-ares/c-ares_1.5.3.bb
index 0def152..2a7d0ff 100644
--- a/recipes/c-ares/c-ares_1.5.3.bb
+++ b/recipes/c-ares/c-ares_1.5.3.bb
@@ -1,7 +1,9 @@
 DESCRIPTION =3D "c-ares is a C library that resolves names =
asynchronously."
 HOMEPAGE =3D "http://daniel.haxx.se/projects/c-ares/"
 SECTION =3D "libs"
-SRC_URI =3D "http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz"
+SRC_URI =3D "http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz =
\
+           file://0001-fix-configure.ac.patch \
+"
 LICENSE =3D "MIT"
 S =3D "${WORKDIR}/c-ares-${PV}"
 PR =3D "r1"
--=20
1.7.0.4



