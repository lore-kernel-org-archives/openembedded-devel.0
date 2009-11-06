Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N6MVh-0007a8-H4
	for openembedded-devel@openembedded.org; Fri, 06 Nov 2009 11:57:44 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 480941D36076; Fri,  6 Nov 2009 11:48:07 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Fri,  6 Nov 2009 11:48:06 +0100
Message-Id: <1257504486-7975-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1257504486-7975-1-git-send-email-ynezz@true.cz>
References: <n>
 <1257504486-7975-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH][geodegx] geodegx: Fix glibc configure error
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
X-List-Received-Date: Fri, 06 Nov 2009 10:57:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix glibc configure error:

| configure: running configure fragment for add-on nptl
| checking sysdep dirs... configure: error: The geode subspecies of i486 =
is not supported.
| FATAL: oe_runconf failed

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>

diff --git a/conf/machine/geodegx.conf b/conf/machine/geodegx.conf
index 6350f2d..a9cf577 100644
--- a/conf/machine/geodegx.conf
+++ b/conf/machine/geodegx.conf
@@ -2,7 +2,7 @@
 # Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
=20
-TARGET_ARCH =3D  "i486"
+TARGET_ARCH =3D  "i586"
=20
 require conf/machine/include/tune-geode.inc
=20
@@ -16,4 +16,4 @@ udevdir =3D "/dev"
 KERNEL_IMAGETYPE =3D "bzImage"
=20
 GLIBC_ADDONS =3D "nptl"
-GLIBC_EXTRA_OECONF =3D "--with-tls --with-cpu=3Dgeode"
+GLIBC_EXTRA_OECONF =3D "--with-tls --with-cpu=3Di586"
diff --git a/conf/machine/geodelx.conf b/conf/machine/geodelx.conf
index f8874fd..7316f2d 100644
--- a/conf/machine/geodelx.conf
+++ b/conf/machine/geodelx.conf
@@ -2,7 +2,7 @@
 # Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
=20
-TARGET_ARCH =3D  "i486"
+TARGET_ARCH =3D  "i586"
=20
 require conf/machine/include/tune-geode.inc
=20
@@ -11,5 +11,5 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-geodelx"
 KERNEL_IMAGETYPE =3D "bzImage"
=20
 GLIBC_ADDONS =3D "nptl"
-GLIBC_EXTRA_OECONF =3D "--with-tls --with-cpu=3Dgeode"
+GLIBC_EXTRA_OECONF =3D "--with-tls --with-cpu=3Di586"
 SELECTED_OPTIMIZATION_pn-glibc :=3D "${@'${SELECTED_OPTIMIZATION}'.repla=
ce('-fomit-frame-pointer', '')}"
--=20
1.5.6.5



