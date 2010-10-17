Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P7MMq-0006Sw-3A
	for Openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 08:05:13 +0200
Received: by pxi18 with SMTP id 18so328732pxi.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 23:04:38 -0700 (PDT)
Received: by 10.142.153.1 with SMTP id a1mr2224308wfe.369.1287295477723;
	Sat, 16 Oct 2010 23:04:37 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id p8sm19792152wff.4.2010.10.16.23.04.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 16 Oct 2010 23:04:36 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Sun, 17 Oct 2010 14:04:32 +0800
Message-Id: <50C3C89D-F86C-423F-814A-88602DD959E1@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libsamplerate: Fix checksums to match downloaded file
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
X-List-Received-Date: Sun, 17 Oct 2010 06:05:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

libsamplerate-0.1.7.tar.gz has changed upstream.  The Angstrom mirror =
has an old version of the file.  Pulling it from the source, I see that =
the following two changes have been made without bumping the version:

diff -ur old-libsamplerate-0.1.7/ChangeLog libsamplerate-0.1.7/ChangeLog
--- old-libsamplerate-0.1.7/ChangeLog   2009-02-14 11:37:27.000000000 =
+0000
+++ libsamplerate-0.1.7/ChangeLog       2009-02-15 00:17:35.000000000 =
+0000
@@ -11,7 +11,7 @@
     This bug has zero security implications beyond the ability to cause =
a
     program hitting this bug to exit immediately with a segfault.
     See : http://www.mega-nerd.com/erikd/Blog/2009/Feb/14/index.html
-    Thanks to David Cournapeau for the bug report.
+    Thanks to David Cournapeau and Lev Givon for the bug report.
=20
     * doc/win32.html Makefile.am configure.ac
     Reinstate Win32/MSVC compile instructions.
diff -ur old-libsamplerate-0.1.7/Win32/config.h =
libsamplerate-0.1.7/Win32/config.h
--- old-libsamplerate-0.1.7/Win32/config.h      2009-02-14 =
11:42:49.000000000 +0000
+++ libsamplerate-0.1.7/Win32/config.h  2009-02-14 11:46:40.000000000 =
+0000
@@ -190,8 +190,7 @@
 #define STDC_HEADERS 1
=20
 /* Version number of package */
-<<<<<<< diff from left file
-#define VERSION "0.1.4"
+#define VERSION "0.1.7"
=20
=20
=20
@@ -203,6 +202,3 @@
 */
=20
 #define inline __inline
-=3D=3D=3D=3D=3D=3D=3D=3D
-#define VERSION "0.1.7"
->>>>>>> diff from right file


The following patch corrects the checksums for the new version.

---
 recipes/libsamplerate/libsamplerate0_0.1.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libsamplerate/libsamplerate0_0.1.7.bb =
b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
index 737e934..8b457ba 100644
--- a/recipes/libsamplerate/libsamplerate0_0.1.7.bb
+++ b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
@@ -12,5 +12,5 @@ S =3D "${WORKDIR}/libsamplerate-${PV}"
 inherit autotools pkgconfig
=20
=20
-SRC_URI[md5sum] =3D "ad093e60ec44f0a60de8e29983ddbc0f"
-SRC_URI[sha256sum] =3D =
"e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b19ae71d2890dbc9c"
+SRC_URI[md5sum] =3D "6731a81cb0c622c483b28c0d7f90867d"
+SRC_URI[sha256sum] =3D =
"78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
--=20
1.7.0.4



