Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D00BC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:41:00 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.13679.1684212050786532015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 21:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id C8296B001
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:40:48 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.204]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pymUQ-0cxAYL0; Tue, 16 May 2023 06:40:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] libcamera: update 0.0.4 -> 0.0.5
Date: Tue, 16 May 2023 06:40:38 +0200
Message-Id: <20230516044038.7485-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684212046-62FE39E6-B64C8310/0/0 CLEAN NORMAL
X-TOI-MSGID: 4e71078e-ce2a-4eab-a0bf-97c4fc5d43ff
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102617

 libcamera v0.0.5

Bugfixes:
- meson: Ignore -Wredundant-move with gcc-13 and newer
- cam: file_sink: Workaround gcc-13 dangling-reference false positive
- libcamera: Open files with O_CLOEXEC
- meson: Fix git version parsing
- libcamera: camera_manager: Stop exponential explosive calls to createPi=
pelineHandlers
- py: cam: Fix demosaic overflow issue
- libcamera: base: Make the registration of log categories atomic

Core:
- test: controls: control_info_map: Test default constructor
- controls: guard ControlInfoMap against nullptr idmap_
- device_enumerator_udev: Use std::string_view
- formats: Add 14-bits Bayer RAW formats
- device_enumerator_udev: Remove devnum from dependency map
- meson: libcamera: Report IPA signature method
- meson: Align handling of build metadata
- converter: Check converter validity
- Keep using syslog for isolated IPA modules
- utils: ipc: Update parser.py
- utils: checkstyle.py: Don't run commit title checker on staged commits
- framebuffer: Allow inheritance of FrameBuffer
- Remove transform from V4L2SubdeviceFormat
- libcamera: camera_sensor: Add tryFormat()
- camera_sensor: Fix typo in comment
- camera_sensor: Demote flip support message to Debug
- internal: tracepoints: Use correct include directive
- libcamera: camera: Ensure queued requests are invalid

ipa:
- doc: Clarify IPA acronym in its namespace description
- rkisp1: Add tuning files for PinephonePro sensors
- rkisp1: Add tuning files for Google DRU "Scarlet" sensors
- rkisp1: lsc: Fix integer division error
- libipa: Add OV2685 Camera Sensor Helper
- libipa: Add OV5647 Camera Sensor Helper
- raspberrypi: agc: Add "shadows" constraint mode
- raspberrypi: generalise algorithms
- raspberrypi: Fix default frame durations calculation
- raspberrypi: Ensure shutter speed and gain are clipped in the AGC
- raspberrypi: Use the new sensor limits fields in CameraMode
- raspberrypi: Add sensor mode limits to CameraMode
- raspberrypi: Fix crash under LTO
- raspberrypi: imx296: Minor tuning updates
- raspberrypi: agc: Fix overflow in Y value calculation
- raspberrypi: Better heuristics for calculating Unicam timeout
- raspberrypi: Generalise statistics
- raspberrypi: Change Unicam timeout handling

pipeline:
- simple: Validate transform
- imx8-isi: Remove mbusCode from formatsMap_
- imx8-isi: Automatically select media bus code
- imx8-isi: Split Bayer/YUV config generation
- imx8-isi: Break out RAW/YUV format selection
- raspberrypi: Iterate over all Unicam instances in match()
- raspberrypi: Add a Unicam timeout override config options
- raspberrypi: Always use ColorSpace::Raw for raw streams
- raspberrypi: Drop unused code
- ipu3: Drop unused code

apps:
 - cam: kms_sink: Drop unique_ptr<> from DRM::AtomicRequest
 - cam Return std::optional<> from StreamKeyValueParser::parseRole()
 - android: jpeg: Add JEA implementation

ABI Compliance:

 * abi-compliance-checker reports 98.6% ABI and 100% API compatibility wi=
th
   with v0.0.4

  Total binary compatibility problems: 1, warnings: 1
  Total source compatibility problems: 0, warnings: 0

 - First virtual method ~__dt ( ) has been added to this class.
   1) The layout of type structure has been shifted by 8 bytes by the add=
ed v-table pointer.
   2) Size of class has been increased by 8 bytes.

affected symbols: 6 (1.4%)
  FrameBuffer::releaseFence ( )
  FrameBuffer::setCookie ( uint64_t cookie )
  FrameBuffer::cookie ( )
  FrameBuffer::planes ( )
  FrameBuffer::request ( )
  FrameBuffer::metadata ( )

This ABI breakage was introduced by:
  4843bfa ("libcamera: framebuffer: Allow inheritance of FrameBuffer")

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...le_sink.cpp-Avoid-dangling-reference.patch | 44 -------------------
 ...{libcamera_0.0.4.bb =3D> libcamera_0.0.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-file_sink.cpp-Avoid-dangling-reference.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.0.4.bb =
=3D> libcamera_0.0.5.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
file_sink.cpp-Avoid-dangling-reference.patch b/meta-multimedia/recipes-mu=
ltimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.=
patch
deleted file mode 100644
index 55a5977a7a..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_si=
nk.cpp-Avoid-dangling-reference.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 2eaffc9ac8b47c354404075761fe8f76fad0ced4 Mon Sep 17 00:00:00 2001
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
-
----
- src/apps/cam/file_sink.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/apps/cam/file_sink.cpp b/src/apps/cam/file_sink.cpp
-index b32aad24..9f4c5648 100644
---- a/src/apps/cam/file_sink.cpp
-+++ b/src/apps/cam/file_sink.cpp
-@@ -114,13 +114,13 @@ void FileSink::writeBuffer(const Stream *stream, F=
rameBuffer *buffer,
- 	}
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
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.=
bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
index 12d42991eb..14a20b4317 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM =3D "\
=20
 SRC_URI =3D " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
-        file://0001-file_sink.cpp-Avoid-dangling-reference.patch \
 "
=20
-SRCREV =3D "6cf637eb253a68edebe59505bea55435fafb00cd"
+SRCREV =3D "fb44403f1c5571549ac128c21daee9761eb9249c"
=20
 PE =3D "1"
=20
--=20
2.34.1


