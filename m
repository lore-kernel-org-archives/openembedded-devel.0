Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1PszY8-0003y6-A0
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:25:44 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 0E43E1D360A9;
	Fri, 25 Feb 2011 16:07:03 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Feb 2011 16:07:05 +0100
Message-Id: <1298646425-27992-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] libvpx: fix fetch errors, remove older releases and add security fix
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
X-List-Received-Date: Fri, 25 Feb 2011 15:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- remove old and unfetchable versions v0.9.0, v0.9.1, v0.9.2
- add v0.9.5 patch for CVE-2010-4203 security fix
- fix fetch errors for v0.9.2 and v0.9.5:

	ERROR: Function 'Fetch failed: Unable to fetch URL git://review.webmproj=
ect.org/libvpx.git;protocol=3Dgit;tag=3Dv0.9.5 from any source.' failed

	this happens because of some errors in the git repo:

	error: missing object referenced by 'refs/tags/v0.9.5'
	error: missing object referenced by 'refs/tags/v0.9.2'
	error: missing object referenced by 'refs/tags/v0.9.1'
	error: missing object referenced by 'refs/tags/v0.9.0'
	error: refs/remotes/origin/aylesbury does not point to a valid object!

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/webm/libvpx.inc                 |    6 +-
 recipes/webm/libvpx/CVE-2010-4203.patch |   69 +++++++++++++++++++++++++=
++++++
 recipes/webm/libvpx_0.9.0.bb            |   17 --------
 recipes/webm/libvpx_0.9.1.bb            |   14 ------
 recipes/webm/libvpx_0.9.2.bb            |   14 ------
 recipes/webm/libvpx_0.9.5.bb            |    8 ++-
 6 files changed, 77 insertions(+), 51 deletions(-)
 create mode 100644 recipes/webm/libvpx/CVE-2010-4203.patch
 delete mode 100644 recipes/webm/libvpx_0.9.0.bb
 delete mode 100644 recipes/webm/libvpx_0.9.1.bb
 delete mode 100644 recipes/webm/libvpx_0.9.2.bb

diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
index 9913d5b..a1e02b1 100644
--- a/recipes/webm/libvpx.inc
+++ b/recipes/webm/libvpx.inc
@@ -1,10 +1,10 @@
 DESCRIPTION =3D "vpx Multi-Format Codec SDK"
 LICENSE =3D "BSD"
=20
-INC_PR =3D "r5"
+INC_PR =3D "r6"
=20
-SRC_URI =3D "git://review.webmproject.org/libvpx.git;protocol=3Dgit;tag=3D=
v${PV}"
-S =3D "${WORKDIR}/git"
+SRC_URI =3D "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2"
+S =3D "${WORKDIR}/libvpx-v${PV}"
=20
 CFLAGS +=3D "-fPIC"
=20
diff --git a/recipes/webm/libvpx/CVE-2010-4203.patch b/recipes/webm/libvp=
x/CVE-2010-4203.patch
new file mode 100644
index 0000000..37f5108
--- /dev/null
+++ b/recipes/webm/libvpx/CVE-2010-4203.patch
@@ -0,0 +1,69 @@
+From: John Koleszar <jkoleszar@google.com>
+Date: Thu, 4 Nov 2010 20:59:26 +0000 (-0400)
+Subject: fix integer promotion bug in partition size check
+X-Git-Url: https://review.webmproject.org/gitweb?p=3Dlibvpx.git;a=3Dcomm=
itdiff_plain;h=3D9fb80f7170ec48e23c3c7b477149eeb37081c699
+
+fix integer promotion bug in partition size check
+
+The check '(user_data_end - partition < partition_size)' must be
+evaluated as a signed comparison, but because partition_size was
+unsigned, the LHS was promoted to unsigned, causing an incorrect
+result on 32-bit. Instead, check the upper and lower bounds of
+the segment separately.
+
+Change-Id: I6266aba7fd7de084268712a3d2a81424ead7aa06
+---
+
+diff --git a/vp8/decoder/decodframe.c b/vp8/decoder/decodframe.c
+index 2d81d61..f5e49a1 100644
+--- a/vp8/decoder/decodframe.c
++++ b/vp8/decoder/decodframe.c
+@@ -462,7 +462,8 @@ static void setup_token_decoder(VP8D_COMP *pbi,
+             partition_size =3D user_data_end - partition;
+         }
+=20
+-        if (user_data_end - partition < partition_size)
++        if (partition + partition_size > user_data_end
++            || partition + partition_size < partition)
+             vpx_internal_error(&pc->error, VPX_CODEC_CORRUPT_FRAME,
+                                "Truncated packet or corrupt partition "
+                                "%d length", i + 1);
+@@ -580,7 +581,8 @@ int vp8_decode_frame(VP8D_COMP *pbi)
+         (data[0] | (data[1] << 8) | (data[2] << 16)) >> 5;
+     data +=3D 3;
+=20
+-    if (data_end - data < first_partition_length_in_bytes)
++    if (data + first_partition_length_in_bytes > data_end
++        || data + first_partition_length_in_bytes < data)
+         vpx_internal_error(&pc->error, VPX_CODEC_CORRUPT_FRAME,
+                            "Truncated packet or corrupt partition 0 len=
gth");
+     vp8_setup_version(pc);
+diff --git a/vp8/vp8_dx_iface.c b/vp8/vp8_dx_iface.c
+index e7e5356..f0adf5b 100644
+--- a/vp8/vp8_dx_iface.c
++++ b/vp8/vp8_dx_iface.c
+@@ -253,8 +253,11 @@ static vpx_codec_err_t vp8_peek_si(const uint8_t   =
      *data,
+                                    unsigned int           data_sz,
+                                    vpx_codec_stream_info_t *si)
+ {
+-
+     vpx_codec_err_t res =3D VPX_CODEC_OK;
++
++    if(data + data_sz <=3D data)
++        res =3D VPX_CODEC_INVALID_PARAM;
++    else
+     {
+         /* Parse uncompresssed part of key frame header.
+          * 3 bytes:- including version, frame type and an offset
+@@ -331,7 +334,10 @@ static vpx_codec_err_t vp8_decode(vpx_codec_alg_pri=
v_t  *ctx,
+=20
+     ctx->img_avail =3D 0;
+=20
+-    /* Determine the stream parameters */
++    /* Determine the stream parameters. Note that we rely on peek_si to
++     * validate that we have a buffer that does not wrap around the top
++     * of the heap.
++     */
+     if (!ctx->si.h)
+         res =3D ctx->base.iface->dec.peek_si(data, data_sz, &ctx->si);
+=20
diff --git a/recipes/webm/libvpx_0.9.0.bb b/recipes/webm/libvpx_0.9.0.bb
deleted file mode 100644
index bce50a6..0000000
--- a/recipes/webm/libvpx_0.9.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require libvpx.inc
-
-LICENSE =3D "VP8"
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI[md5sum] =3D "9eb8e818d2f3263623c258fe66924082"
-SRC_URI[sha256sum] =3D "a0096ac6859cfb61cf06dd9bc0a79a3333a4ec389ba31191=
1d84df8ff2a1b9dc"
-
-do_install() {
-       oe_runmake install
-       install -d ${D}${prefix}
-       cp -R ${S}/vpx-vp8-nopost-nodocs*${PV}/* ${D}${prefix}/
-       install -d ${D}${includedir}/vpx
-       mv ${D}${includedir}/*.h ${D}${includedir}/vpx
-}
-
diff --git a/recipes/webm/libvpx_0.9.1.bb b/recipes/webm/libvpx_0.9.1.bb
deleted file mode 100644
index bcb7358..0000000
--- a/recipes/webm/libvpx_0.9.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require libvpx.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI +=3D "file://libvpx-configure-support-blank-prefix.patch;apply=3D=
yes"
-
-CONFIGUREOPTS +=3D " \
-        --prefix=3D${prefix} \
-        --libdir=3D${libdir} \
-"
-
-SRC_URI[md5sum] =3D "e1442e74d0cca228785083fa520735a2"
-SRC_URI[sha256sum] =3D "c4e8e463e079ffde5b6948366a1d0873f1bf685dccd89ca1=
37585c2b8247ec59"
-
diff --git a/recipes/webm/libvpx_0.9.2.bb b/recipes/webm/libvpx_0.9.2.bb
deleted file mode 100644
index b7ced8f..0000000
--- a/recipes/webm/libvpx_0.9.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require libvpx.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI +=3D "file://libvpx-configure-support-blank-prefix.patch;apply=3D=
yes"
-
-SRC_URI[md5sum] =3D "609370925b274aeaa29e94fc34c74957"
-SRC_URI[sha256sum] =3D "7425853d06443a0ce8e9cfc7cd3b0a43228b22c10dca813d=
a68af9b114510b3b"
-
-CONFIGUREOPTS +=3D " \
-        --prefix=3D${prefix} \
-        --libdir=3D${libdir} \
-"
-
diff --git a/recipes/webm/libvpx_0.9.5.bb b/recipes/webm/libvpx_0.9.5.bb
index b7ced8f..42b4199 100644
--- a/recipes/webm/libvpx_0.9.5.bb
+++ b/recipes/webm/libvpx_0.9.5.bb
@@ -2,10 +2,12 @@ require libvpx.inc
=20
 PR =3D "${INC_PR}.0"
=20
-SRC_URI +=3D "file://libvpx-configure-support-blank-prefix.patch;apply=3D=
yes"
+SRC_URI +=3D "file://libvpx-configure-support-blank-prefix.patch \
+            file://CVE-2010-4203.patch \
+            "
=20
-SRC_URI[md5sum] =3D "609370925b274aeaa29e94fc34c74957"
-SRC_URI[sha256sum] =3D "7425853d06443a0ce8e9cfc7cd3b0a43228b22c10dca813d=
a68af9b114510b3b"
+SRC_URI[md5sum] =3D "4bf2f2c76700202c1fe9201fcb0680e3"
+SRC_URI[sha256sum] =3D "2e93968afcded113a7e218de047feecf6659a089058803a9=
e40fb687de5f9bfa"
=20
 CONFIGUREOPTS +=3D " \
         --prefix=3D${prefix} \
--=20
1.7.0.4



