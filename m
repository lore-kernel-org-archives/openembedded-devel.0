Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528C9C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 17:09:26 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.884.1783962564705753814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 10:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=NlomTJq3;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 40DE81CBF3
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 19:09:05 +0200 (CEST)
Received: from fedora.fritz.box ([84.163.43.133]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wjK9N-3L3YEz0; Mon, 13 Jul 2026 19:09:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libcamera: update 0.7.1 -> 0.7.2
Date: Mon, 13 Jul 2026 19:08:53 +0200
Message-ID: <20260713170853.298499-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1783962541-D8FF6965-B6E52EBB/0/0 CLEAN NORMAL
X-TOI-MSGID: d9226f14-ef9f-4426-a04f-6b6c006d5d1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1783962545; i=f_l_k@t-online.de;
	bh=Ruc3kGKTDQnMmEf/pv0ij6jKuO9lOu233BehuTVUPpI=;
	h=From:To:Subject:Date;
	b=NlomTJq3zBoaFrKhCgjlf0Og9/42KwYici/KOpKCr5KOWvl4SInSfIoWiQAoxckrt
	 +3sk5IiEF/EoNiuhJCpGqFUFenQ4wQ8S2Ozb1BWAWzQ99/weSDEVPIpakJqbDIG8df
	 XVrKvFhXT/jplBT/d8zfpgzCOc1kvL6r63DF9EQB/hqS4DSCC7czWCTxLLb2leMloS
	 aCqr1Bvry6WtQ1ohGmUsbc+A54WM+JEgTb27nJzf/w+6vot3OqAeThI2hJsDeodi4B
	 DpGbSFWfO1c8L/6Vhp0cJPTctVbfzmjJlfUZaclAI8/HMwvReXY33YGMGv4BenREa7
	 t1PtNA46VF1tQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 17:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128160

Integration Overview:

ABI:

The abi-compliance checker reports 100% *binary* compatibility in this re=
lease,
so the SONAME is maintained at 0.7.

Validating ABI compatibility between v0.7.1 and v0.7.2
Preparing, please wait ...
Comparing ABIs ...
Comparing APIs ...
Creating compatibility report ...
Binary compatibility: 100%
Source compatibility: 97.9%
Total binary compatibility problems: 0, warnings: 2
Total source compatibility problems: 13, warnings: 2

These source compatibility problems are bisected to 597a5bb97bf9 ("libcam=
era:
bound_method: Use std::apply") and this looks to be a false positive and =
as far
as I can tell do not actually prevent any external application compiling
against libcamera.

The following commits in this release relate to either a bug fix or an
improvement to an existing commit.

bugs:
 - libcamera: egl: Don't depend on libdrm
   - Fixes: 7350d6cc5dd1 ("Revert "libcamera: software_isp: gbm: Add a GB=
M helper class for GPU surface access"")
 - libcamera: base: regex: Fix preprocessor check
   - Link: https://github.com/llvm/llvm-project/commit/568c23bbd3303518c5=
056d7f03444dae4fdc8a9c
 - test: controls: control_info_map: Fix libc++ warning
   - Link: https://github.com/llvm/llvm-project/commit/9a03a30706cca40b93=
146f379fb5faa75d417af5
 - ipa: rpi: agc: Clamp digital gain to avoid saturation issues
   - Fixes: 17f9912cff85 ("ipa: rpi: agc: Calculate digital gain in proce=
ss()")
 - py: Use smart holder for `Camera` if available
   - Link: https://github.com/pybind/pybind11/issues/6064
 - pipeline: rpi: Print old color space before updating
   - Fixes: 71bbf10a2f79 ("libcamera: rpi: Add some helpers to PipelineHa=
ndlerBase")
 - libcamera: framebuffer: Reword documentation about cookie
   - Closes: https://gitlab.freedesktop.org/camera/libcamera/-/work_items=
/331
 - ipa: libipa: Handle missing YAML nodes in Interpolator
   - Closes: https://gitlab.freedesktop.org/camera/libcamera/-/work_items=
/323
 - software_isp: debayer_egl: Consider border for scaling
   - Fixes: f520b29fe9e6 ("libcamera: software_isp: debayer_egl: Add an e=
GL Debayer class")
 - py: examples: simple-continuous-capture: Fix comment
   - Fixes: d6cfb080604a ("py: examples: Add simple-continuous-capture.py=
")

And the following updates have been made in this release, grouped by cate=
gory:

core:
 - include: linux: Move mali-c55-config.h header to correct location
 - utils: update-kernel-headers: Create destination directory
 - utils: update-kernel-headers: Add drm/drm.h and drm/drm_mode.h
 - utils: update-kernel-headers: Add linux/media/arm/mali-c55-config.h
 - include: linux: Update to Linux v7.0
 - libcamera: egl: Don't depend on libdrm
 - libcamera: base: Restore defopt
 - treewide: Use utils::defopt
 - libcamera: base: signal: Disallow rvalue references
 - libcamera: base: bound_method: Strip qualifiers in argument pack
 - libcamera: base: bound_method: Forward when invoking
 - subprojects: libpisp: Update to v1.5.0
 - libcamera: base: regex: Fix preprocessor check
 - libcamera: bound_method: Use std::apply
 - libcamera: framebuffer: Reword documentation about cookie
 - libcamera: base: log: Remove log level check for "Fatal" messages
 - libcamera: base: log: Move abort logic into separate type
 - libcamera: matrix: Rename data validation function
 - libcamera: vector: Rename data validation function
 - libcamera: Drop 'yaml' prefix from ValueNode variables
 - libcamera: global_configuration: Drop "YAML" from function documentati=
on
 - libcamera: Replace last mentions of YAML
 - libcamera: vector: Replace class with typename
 - libcamera: vector: Swap order of arguments to apply()
 - libcamera: vector: Support multiple scalar arguments to apply()
 - libcamera: vector: Add clamp() member function
 - libcamera: vector: Replace custom lambdas with standard functions
 - libcamera: v4l2_device: setControls(): Do not return index
 - libcamera: v4l2_device: 0 is not a generic error index
 - libcamera: request: Inline `Private::hasPendingBuffers()`
 - libcamera: request: hasPendingBuffers(): Simplify
 - libcamera: camera: Add missing `span.h` include
 - meson: Build virtual pipeline by default
 - utils: Merge shader header generation scripts
 - utils: Rename and move shader header generation script
 - libcamera: egl: Replace pointer and length with span for shader source=
s
 - libcamera: egl: Add new helper attachTextureToFBO
 - libcamera: egl: Add createOutputTexture2D
 - libcamera: egl: Add activateBindTexture
 - libcamera: egl: Add updateTexture2D
 - libcamera: converter: converter_dw100: Refactor dewarp param handling
 - libcamera: converter: converter_dw100: Allow to transform between diff=
erent camera matrices
 - include: linux: Update to Linux 7.1

softisp:
 - libcamera: software_isp: #include cleanup
 - libcamera: software_isp: Normalize statistics sums to 8-bit
 - libcamera: software_isp: Drop redundant sumShift_ guard in finishFrame
 - libcamera: software_isp: Use Vector operator>>=3D in finishFrame
 - debayer_egl: Include stats computation into benchmark
 - debayer_egl: Sync output buffers after processing stats
 - egl: Add GL format parameter to eGLImage constructor
 - egl: Remove some parameters from createTexture2D()
 - egl: eGLImage: Add flag to remember dmabuf import fails
 - libcamera: swstats_cpu: Take MappedFrameBuffer in processFrame()
 - debayer_egl: Implement dmabuf import for input buffers
 - libcamera: software_isp: debayer_egl: Demote unsupported format log to=
 Info
 - libcamera: software_isp: Support 12-bit CSI2 packed raw bayer formats
 - software_isp: debayer_egl: Request input buffer alignment of 256 bytes
 - egl: Log the GL-driver
 - software_isp: debayer_egl: Consider border for scaling
 - libcamera: software_isp: Probe EGL availability before creating Debaye=
rEGL
 - libcamera: software_isp: Fix black level application in GPU ISP
 - libcamera: software_isp: Fix black level handling in CPU ISP
 - softisp: Split AWB from Combined Matrix
 - shaders: bayer: Use native matrix multiplication
 - libcamera: software_isp: Replace open-coded buffer cancellation
 - libcamera: shaders: Move header generation to shaders directory
 - libcamera: shaders: Replace C array with std::array
 - libcamera: software_isp: debayer_egl: Pass eglImage as parameter to se=
tShaderVariables
 - libcamera: software_isp: debayer_egl: Implement input/output frame cac=
hing mechanism

ipa:
 - ipa: simple: agc: Replace bang-bang controller with proportional
 - ipa: libipa: camera_sensor_helper: Add OV2740 black level
 - ipa: libipa: v4l2_params: Fix code example in doc
 - ipa: libipa: v4l2_params: Mention ISP in file one-line description
 - ipa: libipa: v4l2_params: Enforce uint16_t for id_type underlying type
 - ipa: libipa: v4l2_params: Move non-template code to new base class
 - libcamera: libipa: Add right-shift operators to Vector
 - ipa: rpi: agc: Clamp digital gain to avoid saturation issues
 - ipa: libipa: Handle missing YAML nodes in Interpolator
 - ipa: rkisp1: ccm: Drop unused parseYaml() function declaration
 - ipa: rkisp1: cproc: Fix brightness and contrast value handling
 - libcamera: libipa: camera_sensor: Add Sony IMX678 properties
 - ipa: rpi: Add cam_helper for Sony IMX678
 - ipa: rkisp1: awb: Utilise clamp function
 - ipa: rpi: Improve control over which sensor modes require "debinning"
 - ipa: libipa: camera_sensor_helper: Add OV01A10
 - ipa: camera_sensor_helper: Add black levels for OV5693
 - ipa: libipa: camera_sensor_helper: add ov08x40

apps:
 - android: Disable build on platforms without mbrtoc16()
 - apps: common: options: Use character literal instead of string
 - py: Use smart holder for `Camera` if available
 - apps: lc-compliance: Reduce test repetition
 - py: examples: simple-continuous-capture: Fix comment
 - py: cam: Remove unnecessary check
 - gstreamer: allocator: get_pool_size(): Fix return value
 - gstreamer: Use `FrameBuffer` cookie to associate with `GstBuffer`

pipeline:
 - pipeline: rpi: Simplify delayed controls
 - pipeline: rpi: Make control lists in requests properly atomic
 - pipeline: rpi: Fix crash when configuring timeout
 - pipeline: rpi: Print old color space before updating
 - libcamera: pipeline: imx8-isi: Use `completeBuffer()` return value
 - libcamera: pipeline: ipu3: Remove `setRequest()` calls
 - libcamera: pipeline: mali-c55: Add missing `<queue>` include
 - libcamera: pipeline: rkisp1: Simplify dewarper configuration
 - pipeline: virtual: Move libjpeg requirement to libyuv subproject
 - pipeline: rpi: pisp: Ensure we don't run our SW correction with packed
 - pipeline: rpi: pisp: Fix colours for NV21 and NV61 pixel formats
 - pipeline: rpi: pisp: Remove duplicated format entry
 - controls: rpi: Add ControlListSequence control

test:
 - test: controls: control_info_map: Fix libc++ warning

documentation:
 - Documentation: Reorganize the index of the "For Developers" section
 - Documentation: Move platform support to user documentation
 - Documentation: architecture: Detail policy on dependencies
 - Documentation: coding-style: Document rule about indirect includes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libcamera/{libcamera_0.7.1.bb =3D> libcamera_0.7.2.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.7.1.bb =
=3D> libcamera_0.7.2.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.=
bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
index 2b351a39be..4b5e735a37 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
@@ -13,11 +13,11 @@ SRC_URI =3D " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster;tag=3Dv${PV} \
 "
=20
-SRCREV =3D "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
+SRCREV =3D "191e202178f02430b5942397c70d215cdd2056fa"
=20
 PE =3D "1"
=20
-DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
+DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml lib=
yuv"
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtba=
se-native', '', d)}"
=20
 PACKAGES =3D+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
@@ -38,7 +38,6 @@ PACKAGECONFIG[raspberrypi] =3D ",,libpisp"
 PACKAGECONFIG[sdl] =3D "-Dcam-output-sdl2=3Denabled,-Dcam-output-sdl2=3D=
disabled,virtual/libsdl2"
 PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind"
 PACKAGECONFIG[vimc] =3D ",,"
-PACKAGECONFIG[virtual] =3D ",,libyuv libjpeg-turbo"
=20
 ARM_PIPELINES =3D "imx8-isi,mali-c55,simple,uvcvideo"
 # Raspberry Pi requires the meta-raspberrypi layer
--=20
2.55.0


