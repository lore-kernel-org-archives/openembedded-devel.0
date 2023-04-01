Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CB2C6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 15:50:59 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.24383.1680364255821946214
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Apr 2023 08:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout09.t-online.de (Postfix) with SMTP id EB5B420E78
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Apr 2023 17:50:53 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.236.62]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pidVF-4QO3hi0; Sat, 1 Apr 2023 17:50:53 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_L_K@t-online.de>
Subject: [meta-multimedia][PATCH 2/2] libcamera: re-introduce fix for gcc-13
Date: Sat,  1 Apr 2023 17:46:08 +0200
Message-Id: <20230401154608.6796-2-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401154608.6796-1-f_L_K@t-online.de>
References: <20230401154608.6796-1-f_L_K@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1680364253-79066C36-D5BBE784/0/0 CLEAN NORMAL
X-TOI-MSGID: 99f87af7-ec86-474d-9b7d-20c01bdbfa42
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 15:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101870

Signed-off-by: Markus Volk <f_L_K@t-online.de>
---
 ...le_sink.cpp-Avoid-dangling-reference.patch | 44 +++++++++++++++++++
 .../libcamera/libcamera_0.0.4.bb              |  5 ++-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-file_sink.cpp-Avoid-dangling-reference.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
file_sink.cpp-Avoid-dangling-reference.patch b/meta-multimedia/recipes-mu=
ltimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.=
patch
new file mode 100644
index 000000000..55a5977a7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_si=
nk.cpp-Avoid-dangling-reference.patch
@@ -0,0 +1,44 @@
+From 2eaffc9ac8b47c354404075761fe8f76fad0ced4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jan 2023 01:18:25 -0800
+Subject: [PATCH] file_sink.cpp: Avoid dangling-reference
+
+Fixes following errors with gcc-13
+
+../git/src/cam/file_sink.cpp:92:45: error: possibly dangling reference t=
o a temporary [-Werror=3Ddangling-reference]
+   92 |                 const FrameMetadata::Plane &meta =3D buffer->met=
adata().planes()[i];
+      |                                             ^~~~
+../git/src/cam/file_sink.cpp:92:81: note: the temporary was destroyed at=
 the end of the full expression '(& buffer->libcamera::FrameBuffer::metad=
ata())->libcamera::FrameMetadata::planes().libcamera::Span<const libcamer=
a::FrameMetadata::Plane>::operator[](i)'
+   92 |                 const FrameMetadata::Plane &meta =3D buffer->met=
adata().planes()[i];
+      |                                                                 =
                ^
+cc1plus: all warnings being treated as errors
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2023-January/036575.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/apps/cam/file_sink.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/apps/cam/file_sink.cpp b/src/apps/cam/file_sink.cpp
+index b32aad24..9f4c5648 100644
+--- a/src/apps/cam/file_sink.cpp
++++ b/src/apps/cam/file_sink.cpp
+@@ -114,13 +114,13 @@ void FileSink::writeBuffer(const Stream *stream, F=
rameBuffer *buffer,
+ 	}
+=20
+ 	for (unsigned int i =3D 0; i < buffer->planes().size(); ++i) {
+-		const FrameMetadata::Plane &meta =3D buffer->metadata().planes()[i];
++		unsigned int bytesused =3D buffer->metadata().planes()[i].bytesused;
+=20
+ 		Span<uint8_t> data =3D image->data(i);
+-		unsigned int length =3D std::min<unsigned int>(meta.bytesused, data.s=
ize());
++		unsigned int length =3D std::min<unsigned int>(bytesused, data.size()=
);
+=20
+-		if (meta.bytesused > data.size())
+-			std::cerr << "payload size " << meta.bytesused
++		if (bytesused > data.size())
++			std::cerr << "payload size " << bytesused
+ 				  << " larger than plane size " << data.size()
+ 				  << std::endl;
+=20
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
index cbcc33aa4..12d42991e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM =3D "\
     file://LICENSES/LGPL-2.1-or-later.txt;md5=3D2a4f4fd2128ea2f65047ee63=
fbca9f68 \
 "
=20
-SRC_URI =3D "git://git.libcamera.org/libcamera/libcamera.git;protocol=3D=
https;branch=3Dmaster"
+SRC_URI =3D " \
+        git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
+        file://0001-file_sink.cpp-Avoid-dangling-reference.patch \
+"
=20
 SRCREV =3D "6cf637eb253a68edebe59505bea55435fafb00cd"
=20
--=20
2.34.1


