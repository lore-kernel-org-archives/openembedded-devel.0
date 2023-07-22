Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928B9EB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 07:18:16 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.1230.1690010287642412102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jul 2023 00:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id 55DFEABF1
	for <openembedded-devel@lists.openembedded.org>; Sat, 22 Jul 2023 09:18:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.200]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qN6sO-0WXGmf0; Sat, 22 Jul 2023 09:18:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libcamera: update 0.0.5 -> 0.1.0
Date: Sat, 22 Jul 2023 09:17:59 +0200
Message-Id: <20230722071759.27004-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1690010284-9A68B904-4620FAF3/0/0 CLEAN NORMAL
X-TOI-MSGID: 564feb86-c653-4d22-84ec-7fbcf5190a17
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jul 2023 07:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103985

libcamera v0.1.0

ABI Compliance:

abi-compliance-checker reports 99% binary compatibility and 81.4% source
compatibilty between version 0.0.5 and 0.1.

 - Binary compatibility: 99%
 - Source compatibility: 81.4%
 - Total binary compatibility problems: 4, warnings: 2
 - Total source compatibility problems: 165, warnings: 7

Now that we have funtional ABI validation, the soname has been updated fr=
om
libcamera.so.0.0.5 to libcamera.so.0.1.

Future releases will now maintain the same soname until an ABI breakage i=
s
detected to reduce the repackaging and rebuilding of other components tha=
t may
use libcamera. The abi-compatibility report can now be generated with the=
 new
utility './utils/abi-compat.sh'.

Key differences here are due to preventing the installation of internal a=
nd
private headers in the packaging process, and most of this API compatibil=
ity
should not be visible to applications with the exception of:

- Camera::generateConfiguration ( StreamRoles const& roles )

  The StreamRoles type definition has been removed. This is now handled a=
s a
  Span<StreamRole> to prevent unnecessary allocations and copies.

- CameraManager::addCamera ( std::shared_ptr<struct Camera> camera, std::=
vector<unsigned long>const& devnums )
- CameraManager::get ( dev_t devnum )
- CameraManager::removeCamera ( std::shared_ptr<struct Camera> camera )

  These functions of the CameraManager were for use exclusively by the V4=
L2
  adaptation layer, and not intended for use by applications. This has no=
w been
  reworked to use the new SystemDevices and the redundant functions remov=
ed.

The ABI/API breakages have been introduced by:

  5ca0c9276f28 ("libcamera: CameraManager: Remove ::get(dev_t)")
  26a4b83d1b94 ("libcamera: Remove `StreamRoles` alias")
  63966ae587d7 ("libcamera: base: Do not install private headers")

Core:
 - libcamera: v4l2_videodevice: Use O_CLOEXEC when exporting DMA buffers
 - libcamera: ipa_manager: Allow IPA loading in nested subdirs
 - meson: Fix usage of overwritten pipeline variable
 - subprojects: Drop leftovers of pybind11
 - camera_sensor: ipa: core: Add CFA pattern to IPACameraSensorInfo
 - libcamera: controls: Define a default lens position behaviour
 - libcamera: internal: request: convert to pragma once
 - libcamera: camera_manager: Move private implementation to internal
 - libcamera: camera_manager: Move {add,remove}Camera to internal
 - libcamera: properties: Provide a Devices camera property
 - libcamera: pipeline: Register device numbers with camera
 - libcamera: camera_sensor: Adjust properties::Rotation
 - libcamera: meson: Allow PH to change libcamera_deps
 - libcamera: base: Move thread_annotations to private
 - libcamera: base: Do not install private headers
 - utils: ABI Compatibility checker
 - meson: Use x.y soname versioning
 - libcamera: camera: Take span of StreamRole instead of vector
 - libcamera: Remove `StreamRoles` alias
 - utils: ipu3-capture.sh: Fix the script to work with recent media-ctl v=
ersions
 - Documentation: Add predefined macros from config.h to Doxyfile
 - utils: checkstyle: Add __repr__ method to CommitFile class
 - utils: checkstyle: Support running checkers selectively
 - utils: checkstyle: Don't include commit ID in commit title
 - utils: checkstyle: Add trailers checker
 - tests: gstreamer: Test cameras' enumeration from GstDeviceProvider
 - meson: Fix space around colon issues
 - libcamera: Add option to configure udev support
 - libcamera: CameraManager: Remove ::get(dev_t)
 - tests: gstreamer: Fix compiler error with gcc 8.4.0

ipa:
 - meson: ipa: Add mapping for pipeline handler to mojom interface file
 - libcamera: ipa: Remove character restriction on the IPA name
 - ipa: meson: Allow nested IPA directory structures
 - ipa: raspberrypi: Introduce IpaBase class
 - ipa: raspberrypi: agc: Move weights out of AGC
 - ipa: rkisp1: agc: drop hard-coded analogue gain range
 - libipa: camera_sensor_helper: Add IMX327 helper
 - pipeline: rpi: ipa_base: Parse config files after platformRegister()
 - libcamera: camera_sensor: Add Sony IMX327 sensor properties
 - ipa: rpi: imx296: Small refinements to the IMX296 mono sensor tuning
 - ipa: rpi: Handle controls for mono variant sensors
 - libcamera: controls: Drop reference to IPA in controls documentation
 - libipa: camera_sensor_helper: Restore alphabetical order
 - ipa: ipu3: agc: Drop hard-codec analogue gain max
 - ipa: rkisp1: agc: Restore minimum analogue gain limit
 - pipeline: ipa: rpi: Return lens controls from ipa->configure()
 - ipa: rpi: Set lens position to hyperfocal on startup
 - ipa: rpi: tunings: Add missing short and long exposure profiles
 - ipa: rpi: agc: Use std::string instead of char arrays
 - ipa: rpi: agc: Gracefully handle missing agc modes
 - ipa: rpi: agc: Do not switch to a default if a mode is unavailable
 - ipa: rpi: imx708: Fix mode switch drop frame count
 - ipa: rpi: imx296_mono: Disable all colour shading

pipeline:
 - libcamera: pipeline: simple: Add support for ST's DCMIPP
 - pipeline: meson: Allow nested pipeline handler directory structures
 - pipeline: ipa: raspberrypi: Refactor and move the Raspberry Pi code
 - pipeline: raspberrypi: rpi_stream: Set invalid buffer to id =3D=3D 0
 - pipeline: ipa: raspberrypi: Restructure the IPA mojom interface
 - pipeline: raspberrypi: Make RPi::Stream::name() return const std::stri=
ng &
 - pipeline: raspberrypi: Introduce PipelineHandlerBase class
 - pipeline: raspberrypi: Add stream flags to RPi::Stream
 - libcamera: rkisp1: Generate config using main path
 - libcamera: rkisp1: Crop on ISP before downscaling
 - libcamera: rkisp1: Assign sizes to roles
 - libcamera: rkisp1: Fix enumeration of RAW formats
 - pipeline: rpi: Do not return an error from pipeline config file handli=
ng
 - libcamera: pipeline: simple: Support TI CSI-RX
 - pipeline: rpi: Account for Bayer packing when validating format

apps:
 - apps: qcam: Remove redundant check
 - v4l2: Move the v4l2 compat layer to libexec/libcamera
 - android: mm: generic: use GRALLOC_HARDWARE_MODULE_ID
 - android: mm: Stub libhardware for build tests
 - py: Fix CameraManager.version property
 - py: Move ColorSpace and Transform classes to separate files
 - py: Use exceptions instead of returning error codes
 - py: unittests.py: Add weakref helpers and use del
 - py: Move to mainline pybind11 version
 - py: Fix code formatting
 - py: unittests.py: Fix type checker warnings
 - gstreamer: Add enable_auto_focus option to the GStreamer plugin
 - gstreamer: Drop libcamera_private dependency
 - apps: Add ipa-verify application
 - v4l2: v4l2_camera_proxy: Prevent ioctl sign-extensions
 - v4l2: Use SystemDevices properties to identify cameras

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libcamera/{libcamera_0.0.5.bb =3D> libcamera_0.1.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.0.5.bb =
=3D> libcamera_0.1.0.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.=
bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
index 6ad376f295..e770200e28 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
@@ -12,7 +12,7 @@ SRC_URI =3D " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
 "
=20
-SRCREV =3D "fb44403f1c5571549ac128c21daee9761eb9249c"
+SRCREV =3D "9e3a83c03bab65b745eea2482be78077b409a2b5"
=20
 PE =3D "1"
=20
@@ -47,7 +47,7 @@ do_configure:prepend() {
=20
 do_install:append() {
     chrpath -d ${D}${libdir}/libcamera.so
-    chrpath -d ${D}${libdir}/v4l2-compat.so
+    chrpath -d ${D}${libexecdir}/libcamera/v4l2-compat.so
 }
=20
 addtask do_recalculate_ipa_signatures_package after do_package before do=
_packagedata
@@ -63,7 +63,7 @@ do_recalculate_ipa_signatures_package() {
     ${S}/src/ipa/ipa-sign-install.sh ${B}/src/ipa-priv-key.pem "${module=
s}"
 }
=20
-FILES:${PN} +=3D " ${libdir}/v4l2-compat.so"
+FILES:${PN} +=3D " ${libexecdir}/libcamera/v4l2-compat.so"
 FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
=20
 # libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
--=20
2.39.3


