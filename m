Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B6AC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 06:16:59 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.16702.1679725009715238820
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 23:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id D304F7844
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 07:16:45 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfxCn-29vuu90; Sat, 25 Mar 2023 07:16:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] libcamera: update 0.0.1 -> 0.0.4
Date: Sat, 25 Mar 2023 07:16:39 +0100
Message-Id: <20230325061639.8856-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679725005-F0F94C73-AE91F5C9/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f8cbc70-f646-4caa-9d17-aa593c9c276b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 06:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101712

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...le_sink.cpp-Avoid-dangling-reference.patch | 46 -------------------
 ...{libcamera_0.0.1.bb =3D> libcamera_0.0.4.bb} |  7 +--
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-file_sink.cpp-Avoid-dangling-reference.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.0.1.bb =
=3D> libcamera_0.0.4.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
file_sink.cpp-Avoid-dangling-reference.patch b/meta-multimedia/recipes-mu=
ltimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.=
patch
deleted file mode 100644
index 5aa6ee8d3..000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_si=
nk.cpp-Avoid-dangling-reference.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0e97896e6a09957f27125957d00b5150ec90b2e9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jan 2023 01:18:25 -0800
-Subject: [PATCH] file_sink.cpp: Avoid dangling-reference
-
-Fixes following errors with gcc-13
-
-../git/src/cam/file_sink.cpp:92:45: error: possibly dangling reference t=
o a temporary [-Werror=3Ddangling-reference]
-   92 |                 const FrameMetadata::Plane &meta =3D buffer->met=
adata().planes()[i];
-      |                                             ^~~~
-../git/src/cam/file_sink.cpp:92:81: note: the temporary was destroyed at=
 the end of the full expression '(& buffer->libcamera::FrameBuffer::metad=
ata())->libcamera::FrameMetadata::planes().libcamera::Span<const libcamer=
a::FrameMetadata::Plane>::operator[](i)'
-   92 |                 const FrameMetadata::Plane &meta =3D buffer->met=
adata().planes()[i];
-      |                                                                 =
                ^
-cc1plus: all warnings being treated as errors
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2023-January/036575.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cam/file_sink.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/cam/file_sink.cpp b/src/cam/file_sink.cpp
-index 45213d4a..897c4b37 100644
---- a/src/cam/file_sink.cpp
-+++ b/src/cam/file_sink.cpp
-@@ -89,13 +89,13 @@ void FileSink::writeBuffer(const Stream *stream, Fra=
meBuffer *buffer)
- 	Image *image =3D mappedBuffers_[buffer].get();
-=20
- 	for (unsigned int i =3D 0; i < buffer->planes().size(); ++i) {
--		const FrameMetadata::Plane &meta =3D buffer->metadata().planes()[i];
-+		unsigned int bytesused =3D buffer->metadata().planes()[i].bytesused;
-=20
- 		Span<uint8_t> data =3D image->data(i);
--		unsigned int length =3D std::min<unsigned int>(meta.bytesused, data.s=
ize());
-+		unsigned int length =3D std::min<unsigned int>(bytesused, data.size()=
);
-=20
--		if (meta.bytesused > data.size())
--			std::cerr << "payload size " << meta.bytesused
-+		if (bytesused > data.size())
-+			std::cerr << "payload size " << bytesused
- 				  << " larger than plane size " << data.size()
- 				  << std::endl;
-=20
---=20
-2.39.1
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.=
bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
index 46f058f2e..cbcc33aa4 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
@@ -8,12 +8,9 @@ LIC_FILES_CHKSUM =3D "\
     file://LICENSES/LGPL-2.1-or-later.txt;md5=3D2a4f4fd2128ea2f65047ee63=
fbca9f68 \
 "
=20
-SRC_URI =3D " \
-        git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
-        file://0001-file_sink.cpp-Avoid-dangling-reference.patch \
-"
+SRC_URI =3D "git://git.libcamera.org/libcamera/libcamera.git;protocol=3D=
https;branch=3Dmaster"
=20
-SRCREV =3D "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
+SRCREV =3D "6cf637eb253a68edebe59505bea55435fafb00cd"
=20
 PE =3D "1"
=20
--=20
2.34.1


