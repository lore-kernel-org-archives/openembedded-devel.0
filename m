Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjvt-00005S-O2
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:05:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 490E1314B8D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3smBN6Yr1aLb
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:52 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 32276314B8DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:51 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:03:51 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:03:43 +0000
Message-Id: <1291914227-25068-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/8] gst-plugins-good: remove unpinned versions
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
X-List-Received-Date: Thu, 09 Dec 2010 17:05:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../gstreamer/gst-plugins-good/flvdemux-ecma.diff  |   26 --------------=
------
 recipes/gstreamer/gst-plugins-good_0.10.13.bb      |   14 ----------
 recipes/gstreamer/gst-plugins-good_0.10.14.bb      |   14 ----------
 recipes/gstreamer/gst-plugins-good_0.10.17.bb      |   18 -------------
 recipes/gstreamer/gst-plugins-good_0.10.21.bb      |   16 ------------
 recipes/gstreamer/gst-plugins-good_0.10.23.bb      |   15 -----------
 recipes/gstreamer/gst-plugins-good_0.10.25.bb      |   15 -----------
 7 files changed, 0 insertions(+), 118 deletions(-)
 delete mode 100644 recipes/gstreamer/gst-plugins-good/flvdemux-ecma.diff
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.13.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.14.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.17.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.21.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.23.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.25.bb

diff --git a/recipes/gstreamer/gst-plugins-good/flvdemux-ecma.diff b/reci=
pes/gstreamer/gst-plugins-good/flvdemux-ecma.diff
deleted file mode 100644
index 6def2e0..0000000
--- a/recipes/gstreamer/gst-plugins-good/flvdemux-ecma.diff
+++ /dev/null
@@ -1,26 +0,0 @@
-From dd82612340001e7ff821725ac257a0a36ab1fea7 Mon Sep 17 00:00:00 2001
-From: Jan Urba=C5=84ski <wulczer@wulczer.org>
-Date: Mon, 09 Nov 2009 11:17:34 +0000
-Subject: flvmux: properly finish the ECMA array
-
-The ECMA array with the file index was missing a mandatory end marker.
-Fixes bug #601242.
----
-diff --git a/gst/flv/gstflvmux.c b/gst/flv/gstflvmux.c
-index 89e8279..e1cb143 100644
---- a/gst/flv/gstflvmux.c
-+++ b/gst/flv/gstflvmux.c
-@@ -1060,6 +1060,11 @@ gst_flv_mux_write_index (GstFlvMux * mux)
-   }
-   script_tag =3D gst_buffer_join (script_tag, tmp);
-=20
-+  tmp =3D gst_buffer_new_and_alloc (3);
-+  data =3D GST_BUFFER_DATA (tmp);
-+  GST_WRITE_UINT24_BE (data, 9);        /* finish the ECMA array */
-+  script_tag =3D gst_buffer_join (script_tag, tmp);
-+
-   tmp =3D gst_buffer_new_and_alloc (4);
-   data =3D GST_BUFFER_DATA (tmp);
-   GST_WRITE_UINT32_BE (data, GST_BUFFER_SIZE (script_tag));
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.13.bb b/recipes/gstr=
eamer/gst-plugins-good_0.10.13.bb
deleted file mode 100644
index 17b0a93..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.13.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gst-plugins.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit gconf=20
-
-EXTRA_OECONF +=3D " --enable-experimental  --enable-gst_v4l2 --enable-gc=
onftool  --enable-external --with-check=3Dno"
-DEPENDS +=3D "jpeg libtheora gst-plugins-base esound"
-
-PACKAGES =3D+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements +=3D "${sysconfdir}/gconf"
-
-SRC_URI[archive.md5sum] =3D "27f27151ccefad1157c9eaa322e14ac4"
-SRC_URI[archive.sha256sum] =3D "dfffb80ef01b8fee9af3576311e65b60c378d998=
5099dea532be090ede54ebaa"
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.14.bb b/recipes/gstr=
eamer/gst-plugins-good_0.10.14.bb
deleted file mode 100644
index 22d9a57..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.14.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gst-plugins.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit gconf=20
-
-EXTRA_OECONF +=3D " --enable-experimental  --enable-gst_v4l2 --enable-gc=
onftool  --enable-external --with-check=3Dno"
-DEPENDS +=3D "jpeg libtheora gst-plugins-base esound"
-
-PACKAGES =3D+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements +=3D "${sysconfdir}/gconf"
-
-SRC_URI[archive.md5sum] =3D "a861ccbb90a176d1242608502f45f0ac"
-SRC_URI[archive.sha256sum] =3D "12205d01cb99900ed6f936a09ac31b5849f8a7ff=
3c9a93e5857a76dc3e30788a"
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.17.bb b/recipes/gstr=
eamer/gst-plugins-good_0.10.17.bb
deleted file mode 100644
index 7875039..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.17.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI +=3D "file://flvdemux-ecma.diff \
-"
-
-PR =3D "r3"
-
-inherit gconf=20
-
-DEPENDS +=3D "hal pulseaudio speex libsoup-2.4 flac gst-plugins-base ope=
nssl popt esound libv4l"
-
-PACKAGES =3D+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements +=3D "${sysconfdir}/gconf"
-
-EXTRA_OECONF +=3D " --with-libv4l2 "
-
-SRC_URI[archive.md5sum] =3D "833546cd2b8bbf86b8ed083b00897918"
-SRC_URI[archive.sha256sum] =3D "4f41fbd325270416c9f55d900e470482a7d1e7ef=
bdbb725ed03a085dec307ad6"
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.21.bb b/recipes/gstr=
eamer/gst-plugins-good_0.10.21.bb
deleted file mode 100644
index 0f6ff3f..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.21.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI +=3D "file://flvdemux-ecma.diff \
-"
-
-SRC_URI[archive.md5sum] =3D "9bc5c9b390edbb96bda42fc553eae5ae"
-SRC_URI[archive.sha256sum] =3D "24445a1cf56302ab4ad5f56055d5c3d81c704b8f=
9f6875fe78a25d4f72716d22"
-
-inherit gconf=20
-
-DEPENDS +=3D "hal pulseaudio speex libsoup-2.4 flac gst-plugins-base ope=
nssl popt esound libv4l"
-
-PACKAGES =3D+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements +=3D "${sysconfdir}/gconf"
-
-EXTRA_OECONF +=3D " --with-libv4l2 "
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.23.bb b/recipes/gstr=
eamer/gst-plugins-good_0.10.23.bb
deleted file mode 100644
index ebd978f..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.23.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gst-plugins.inc
-
-PR =3D "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] =3D "9cddbb0e7e90677f0cc05c23feffef5c"
-SRC_URI[archive.sha256sum] =3D "2e7771a611cedb1e8208601cb26744fbf3310959=
8e222afee1be8811ba4babcf"
-
-inherit gconf=20
-
-DEPENDS +=3D "hal pulseaudio speex libsoup-2.4 flac gst-plugins-base ope=
nssl popt esound libv4l"
-
-PACKAGES =3D+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements +=3D "${sysconfdir}/gconf"
-
-EXTRA_OECONF +=3D " --with-libv4l2 "
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.25.bb b/recipes/gstr=
eamer/gst-plugins-good_0.10.25.bb
deleted file mode 100644
index 5bc578d..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.25.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gst-plugins.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] =3D "d734bc866788d1d6fc74c4ff1318926c"
-SRC_URI[archive.sha256sum] =3D "b5d5750c12412c47d85ba9391c842f6f02cad951=
1876695e48b15fb37e4699f6"
-
-inherit gconf
-
-DEPENDS +=3D "hal pulseaudio speex libsoup-2.4 flac gst-plugins-base ope=
nssl popt esound libv4l"
-
-PACKAGES =3D+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements +=3D "${sysconfdir}/gconf"
-
-EXTRA_OECONF +=3D " --with-libv4l2 "
--=20
1.7.2.3



