Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 52FC1705A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 19:32:37 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 4A1D524C90
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 21:32:37 +0200 (CEST)
Message-ID: <53DA99D5.8070405@pseudoterminal.org>
Date: Thu, 31 Jul 2014 21:32:37 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1406824667-9555-1-git-send-email-ilya.smelykh@gmail.com>
In-Reply-To: <1406824667-9555-1-git-send-email-ilya.smelykh@gmail.com>
Subject: Re: [meta-qt5][PATCH] QtGstreamer recipe with patches for IMX6 support.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jul 2014 19:32:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The patches are imx6 specific, so they should not be part of meta-qt5. 
Instead, add them to meta-fsl-arm , write a .bbappend for them.

Also, I am confused. The summary at the beginning lists: 
"0002-Set-playbin-s-flags-as-native-video-audio-in-case-of.patch" , but 
in the recipe I see 
"0002-qtgstreamer-Temporarry-set-native-video-playbin-s-fl.patch" ?



On 07/31/2014 06:37 PM, Ilya Smelykh wrote:
> ---
>   recipes-qt/qt5/qtgstreamer.inc                     |  12 +
>   ...-i.MX6-zero-copy-rendering-implementation.patch | 249 +++++++++++++++++++++
>   ...-s-flags-as-native-video-audio-in-case-of.patch |  60 +++++
>   recipes-qt/qt5/qtgstreamer_git.bb                  |  44 ++++
>   4 files changed, 365 insertions(+)
>   create mode 100644 recipes-qt/qt5/qtgstreamer.inc
>   create mode 100644 recipes-qt/qt5/qtgstreamer/0001-Added-i.MX6-zero-copy-rendering-implementation.patch
>   create mode 100644 recipes-qt/qt5/qtgstreamer/0002-Set-playbin-s-flags-as-native-video-audio-in-case-of.patch
>   create mode 100644 recipes-qt/qt5/qtgstreamer_git.bb
>
> diff --git a/recipes-qt/qt5/qtgstreamer.inc b/recipes-qt/qt5/qtgstreamer.inc
> new file mode 100644
> index 0000000..6a8bd57
> --- /dev/null
> +++ b/recipes-qt/qt5/qtgstreamer.inc
> @@ -0,0 +1,12 @@
> +require qt5.inc
> +
> +LICENSE = "GPLv2 & LGPLv2 & LGPLv2.1"
> +SECTION = "multimedia"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> +                    file://COPYING-LGPL-2;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
> +                    file://COPYING-LGPL-2.1;md5=fbc093901857fcd118f065f900982c24"
> +
> +DEPENDS += "qtbase qtdeclarative boost"
> +
> +PACKAGECONFIG ??= "examples"
> +PACKAGECONFIG[examples] = "-DQTGSTREAMER_EXAMPLES=ON, -DQTGSTREAMER_EXAMPLES=OFF"
> diff --git a/recipes-qt/qt5/qtgstreamer/0001-Added-i.MX6-zero-copy-rendering-implementation.patch b/recipes-qt/qt5/qtgstreamer/0001-Added-i.MX6-zero-copy-rendering-implementation.patch
> new file mode 100644
> index 0000000..dd5658a
> --- /dev/null
> +++ b/recipes-qt/qt5/qtgstreamer/0001-Added-i.MX6-zero-copy-rendering-implementation.patch
> @@ -0,0 +1,249 @@
> +From c36ea48f3f4f0ad1b07a18c3717bd049ac24e32c Mon Sep 17 00:00:00 2001
> +From: Benjamin Federau <benjamin.federau@basyskom.com>
> +Date: Mon, 12 May 2014 17:31:12 +0200
> +Subject: [PATCH] Added i.MX6 zero-copy rendering implementation
> +
> +---
> + CMakeLists.txt                                     |   11 +++
> + elements/gstqtvideosink/CMakeLists.txt             |    4 +
> + elements/gstqtvideosink/painters/videomaterial.cpp |   84 ++++++++++++++++++++
> + elements/gstqtvideosink/painters/videomaterial.h   |    8 ++
> + 4 files changed, 107 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 9304fc3..86dbd46 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -19,6 +19,8 @@ option(USE_QT_PLUGIN_DIR "Install qt plugins at the system location" ON)
> + include(GNUInstallDirs)
> + include(MacroLogFeature)
> +
> ++set(HW_PLATFORM "none" CACHE STRING "Specific hardware platform used for the build")
> ++
> + set(Qt4_MIN_VERSION 4.7)
> + set(Qt5_MIN_VERSION 5.0.0)
> + find_package(Qt4or5 COMPONENTS Core Gui Widgets OPTIONAL_COMPONENTS OpenGL Quick1 Quick2 Qml Test)
> +@@ -173,6 +175,15 @@ else()
> +     endif()
> + endif()
> +
> ++# Enable hardware specific functionality
> ++if (${HW_PLATFORM} STREQUAL "imx6")
> ++    message(STATUS "Enabled hardware platform: Freescale i.MX6")
> ++    set(USE_HW_PLATFORM TRUE)
> ++    set(QTGSTREAMER_HW_PLATFORM "-DHW_PLATFORM_IMX6")
> ++else()
> ++    set(USE_HW_PLATFORM FALSE)
> ++endif()
> ++
> +
> + if (QTGSTREAMER_CODEGEN AND FLEX_FOUND AND BISON_FOUND)
> +     add_subdirectory(codegen)
> +diff --git a/elements/gstqtvideosink/CMakeLists.txt b/elements/gstqtvideosink/CMakeLists.txt
> +index ddb3da9..307c434 100644
> +--- a/elements/gstqtvideosink/CMakeLists.txt
> ++++ b/elements/gstqtvideosink/CMakeLists.txt
> +@@ -57,6 +57,10 @@ add_definitions(
> +     -DQWIDGETVIDEOSINK_NAME="${QWIDGETVIDEOSINK_NAME}"
> + )
> +
> ++if (USE_HW_PLATFORM)
> ++    add_definitions(${QTGSTREAMER_HW_PLATFORM})
> ++endif()
> ++
> + if (GstQtVideoSink_LINK_OPENGL)
> +     if (OPENGLES2_FOUND)
> +         set(GstQtVideoSink_GL_LIBS ${OPENGLES2_LIBRARY})
> +diff --git a/elements/gstqtvideosink/painters/videomaterial.cpp b/elements/gstqtvideosink/painters/videomaterial.cpp
> +index 7711415..b9a83f7 100644
> +--- a/elements/gstqtvideosink/painters/videomaterial.cpp
> ++++ b/elements/gstqtvideosink/painters/videomaterial.cpp
> +@@ -95,6 +95,18 @@ inline const char * const qtvideosink_glsl_yuvPlanarFragmentShader()
> +     "}\n";
> + }
> +
> ++inline const char * const qtvideosink_glsl_vivanteFragmentShader()
> ++{
> ++    return
> ++    "uniform sampler2D texture;\n"
> ++    "uniform lowp float opacity;\n"
> ++    "varying highp vec2 qt_TexCoord;\n"
> ++    "void main(void)\n"
> ++    "{\n"
> ++    "    gl_FragColor = texture2D( texture, qt_TexCoord ) * opacity;\n"
> ++    "}\n";
> ++}
> ++
> + class VideoMaterialShader : public QSGMaterialShader
> + {
> + public:
> +@@ -104,6 +116,10 @@ public:
> +         Q_UNUSED(oldMaterial);
> +
> +         VideoMaterial *material = static_cast<VideoMaterial *>(newMaterial);
> ++
> ++#ifdef HW_PLATFORM_IMX6
> ++        program()->setUniformValue(m_id_texture, 0);
> ++#else
> +         if (m_id_rgbTexture > 0) {
> +             program()->setUniformValue(m_id_rgbTexture, 0);
> +         } else {
> +@@ -111,6 +127,7 @@ public:
> +             program()->setUniformValue(m_id_uTexture, 1);
> +             program()->setUniformValue(m_id_vTexture, 2);
> +         }
> ++#endif
> +
> +         if (state.isOpacityDirty()) {
> +             material->setFlag(QSGMaterial::Blending,
> +@@ -144,6 +161,9 @@ protected:
> +         m_id_vTexture = program()->uniformLocation("vTexture");
> +         m_id_colorMatrix = program()->uniformLocation("colorMatrix");
> +         m_id_opacity = program()->uniformLocation("opacity");
> ++#ifdef HW_PLATFORM_IMX6
> ++        m_id_texture = program()->uniformLocation("texture");
> ++#endif
> +     }
> +
> +     virtual const char *vertexShader() const {
> +@@ -157,6 +177,9 @@ protected:
> +     int m_id_vTexture;
> +     int m_id_colorMatrix;
> +     int m_id_opacity;
> ++#ifdef HW_PLATFORM_IMX6
> ++    int m_id_texture;
> ++#endif
> + };
> +
> + template <const char * const (*FragmentShader)()>
> +@@ -220,10 +243,19 @@ VideoMaterial *VideoMaterial::create(const BufferFormat & format)
> +     // YUV 420 planar
> +     case GST_VIDEO_FORMAT_I420:
> +     case GST_VIDEO_FORMAT_YV12:
> ++#ifdef HW_PLATFORM_IMX6
> ++        // Note: The following was just implemented for YUV video format. The above formats are not tested
> ++        // with the Vivante mapping method. They will still use the glTexImage2D method!
> ++        material = new VideoMaterialImpl<qtvideosink_glsl_vivanteFragmentShader>;
> ++        material->initVivanteTextureInfo(
> ++                    (format.videoFormat() == GST_VIDEO_FORMAT_YV12) ? GL_VIV_YV12 : GL_VIV_I420,
> ++                    format.frameSize());
> ++#else
> +         material = new VideoMaterialImpl<qtvideosink_glsl_yuvPlanarFragmentShader>;
> +         material->initYuv420PTextureInfo(
> +             (format.videoFormat() == GST_VIDEO_FORMAT_YV12) /* uvSwapped */,
> +             format.frameSize());
> ++#endif
> +         break;
> +
> +     default:
> +@@ -315,6 +347,18 @@ void VideoMaterial::initYuv420PTextureInfo(bool uvSwapped, const QSize &size)
> +       qSwap (m_textureOffsets[1], m_textureOffsets[2]);
> + }
> +
> ++#ifdef HW_PLATFORM_IMX6
> ++void VideoMaterial::initVivanteTextureInfo(
> ++        GLuint format, const QSize &size)
> ++{
> ++    m_textureFormat = format;
> ++    m_textureCount = 1;
> ++    m_textureWidths[0] = size.width();
> ++    m_textureHeights[0] = size.height();
> ++    m_textureOffsets[0] = 0;
> ++}
> ++#endif
> ++
> + void VideoMaterial::init(GstVideoColorMatrix colorMatrixType)
> + {
> +     glGenTextures(m_textureCount, m_textureIds);
> +@@ -426,12 +470,46 @@ void VideoMaterial::bind()
> +         glBindTexture(GL_TEXTURE_2D, m_textureIds[2]);
> +         functions->glActiveTexture(GL_TEXTURE0); // Finish with 0 as default texture unit
> +         glBindTexture(GL_TEXTURE_2D, m_textureIds[0]);
> ++
> ++#ifdef HW_PLATFORM_IMX6
> ++        QOpenGLContext *glcontext = QOpenGLContext::currentContext();
> ++        static PFNGLTEXDIRECTINVALIDATEVIVPROC glTexDirectInvalidateVIV_LOCAL = 0;
> ++        glTexDirectInvalidateVIV_LOCAL = reinterpret_cast<PFNGLTEXDIRECTINVALIDATEVIVPROC>(glcontext->getProcAddress("glTexDirectInvalidateVIV"));
> ++
> ++        glTexDirectInvalidateVIV_LOCAL(GL_TEXTURE_2D);
> ++#endif
> +     }
> + }
> +
> + void VideoMaterial::bindTexture(int i, const quint8 *data)
> + {
> +     glBindTexture(GL_TEXTURE_2D, m_textureIds[i]);
> ++
> ++#ifdef HW_PLATFORM_IMX6
> ++    QOpenGLContext *glcontext = QOpenGLContext::currentContext();
> ++    static PFNGLTEXDIRECTVIVMAPPROC glTexDirectVIVMap_LOCAL = 0;
> ++    static PFNGLTEXDIRECTINVALIDATEVIVPROC glTexDirectInvalidateVIV_LOCAL = 0;
> ++
> ++    if (glTexDirectVIVMap_LOCAL == 0 || glTexDirectInvalidateVIV_LOCAL == 0) {
> ++        glTexDirectVIVMap_LOCAL = reinterpret_cast<PFNGLTEXDIRECTVIVMAPPROC>(glcontext->getProcAddress("glTexDirectVIVMap"));
> ++        glTexDirectInvalidateVIV_LOCAL = reinterpret_cast<PFNGLTEXDIRECTINVALIDATEVIVPROC>(glcontext->getProcAddress("glTexDirectInvalidateVIV"));
> ++    }
> ++    if (glTexDirectVIVMap_LOCAL == 0 || glTexDirectInvalidateVIV_LOCAL == 0) {
> ++        qWarning() << Q_FUNC_INFO << "couldn't find \"glTexDirectVIVMap\" and/or \"glTexDirectInvalidateVIV\" => do nothing and return";
> ++        return;
> ++    }
> ++
> ++    void *bits = (void*)data;
> ++    GLuint physical = ~0U;
> ++
> ++    glTexDirectVIVMap_LOCAL(
> ++                GL_TEXTURE_2D,
> ++                m_textureWidths[i],
> ++                m_textureHeights[i],
> ++                m_textureFormat,
> ++                &bits,
> ++                &physical);
> ++#else
> +     glTexImage2D(
> +         GL_TEXTURE_2D,
> +         0,
> +@@ -442,9 +520,15 @@ void VideoMaterial::bindTexture(int i, const quint8 *data)
> +         m_textureFormat,
> +         m_textureType,
> +         data + m_textureOffsets[i]);
> ++#endif
> ++
> +     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
> +     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
> +     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
> +     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
> ++
> ++#ifdef HW_PLATFORM_IMX6
> ++    glTexDirectInvalidateVIV_LOCAL(GL_TEXTURE_2D);
> ++#endif
> + }
> +
> +diff --git a/elements/gstqtvideosink/painters/videomaterial.h b/elements/gstqtvideosink/painters/videomaterial.h
> +index 90a6379..6a918e9 100644
> +--- a/elements/gstqtvideosink/painters/videomaterial.h
> ++++ b/elements/gstqtvideosink/painters/videomaterial.h
> +@@ -19,6 +19,11 @@
> + #ifndef VIDEOMATERIAL_H
> + #define VIDEOMATERIAL_H
> +
> ++#ifdef HW_PLATFORM_IMX6
> ++#include <GLES2/gl2.h>
> ++#include <GLES2/gl2ext.h>
> ++#endif
> ++
> + #include "../utils/bufferformat.h"
> + #include <QSize>
> + #include <QMutex>
> +@@ -47,6 +52,9 @@ protected:
> +     void initRgbTextureInfo(GLenum internalFormat, GLuint format,
> +                             GLenum type, const QSize &size);
> +     void initYuv420PTextureInfo(bool uvSwapped, const QSize &size);
> ++#ifdef HW_PLATFORM_IMX6
> ++    void initVivanteTextureInfo(GLuint format, const QSize &size);
> ++#endif
> +     void init(GstVideoColorMatrix colorMatrixType);
> +
> + private:
> +--
> +1.7.9.5
> +
> diff --git a/recipes-qt/qt5/qtgstreamer/0002-Set-playbin-s-flags-as-native-video-audio-in-case-of.patch b/recipes-qt/qt5/qtgstreamer/0002-Set-playbin-s-flags-as-native-video-audio-in-case-of.patch
> new file mode 100644
> index 0000000..1d95727
> --- /dev/null
> +++ b/recipes-qt/qt5/qtgstreamer/0002-Set-playbin-s-flags-as-native-video-audio-in-case-of.patch
> @@ -0,0 +1,60 @@
> +From c580e55d6a3a7bdb549580c9f6f11501fc642711 Mon Sep 17 00:00:00 2001
> +From: Ilya Smelykh <ilya.smelykh@gmail.com>
> +Date: Thu, 31 Jul 2014 22:48:44 +0700
> +Subject: [PATCH] Set playbin's flags as native-video+audio in case of IMX6
> + platform.
> +
> +---
> + examples/qmlplayer2/CMakeLists.txt |  4 ++++
> + examples/qmlplayer2/player.cpp     | 16 +++++++++++++++-
> + 2 files changed, 19 insertions(+), 1 deletion(-)
> +
> +diff --git a/examples/qmlplayer2/CMakeLists.txt b/examples/qmlplayer2/CMakeLists.txt
> +index cbd58ee..abb8b46 100644
> +--- a/examples/qmlplayer2/CMakeLists.txt
> ++++ b/examples/qmlplayer2/CMakeLists.txt
> +@@ -28,3 +28,7 @@ add_executable(qmlplayer2
> + )
> + target_link_libraries(qmlplayer2 ${QTGSTREAMER_QUICK_LIBRARIES})
> + qt4or5_use_modules(qmlplayer2 Core Gui Quick2 Qml)
> ++
> ++if (USE_HW_PLATFORM)
> ++     add_definitions(${QTGSTREAMER_HW_PLATFORM})
> ++endif()
> +\ No newline at end of file
> +diff --git a/examples/qmlplayer2/player.cpp b/examples/qmlplayer2/player.cpp
> +index 9baf3b3..0ced449 100644
> +--- a/examples/qmlplayer2/player.cpp
> ++++ b/examples/qmlplayer2/player.cpp
> +@@ -55,13 +55,27 @@ void Player::stop()
> +     }
> + }
> +
> ++typedef enum {
> ++   GST_PLAY_FLAG_VIDEO         = (1 << 0),
> ++   GST_PLAY_FLAG_AUDIO         = (1 << 1),
> ++   GST_PLAY_FLAG_TEXT          = (1 << 2),
> ++   GST_PLAY_FLAG_VIS           = (1 << 3),
> ++   GST_PLAY_FLAG_SOFT_VOLUME   = (1 << 4),
> ++   GST_PLAY_FLAG_NATIVE_AUDIO  = (1 << 5),
> ++   GST_PLAY_FLAG_NATIVE_VIDEO  = (1 << 6),
> ++   GST_PLAY_FLAG_DOWNLOAD      = (1 << 7),
> ++   GST_PLAY_FLAG_BUFFERING     = (1 << 8)
> ++} GstPlayFlags;
> ++
> + void Player::setUri(const QString & uri)
> + {
> +     if (!m_pipeline) {
> +         m_pipeline = QGst::ElementFactory::make("playbin").dynamicCast<QGst::Pipeline>();
> +         if (m_pipeline) {
> +             m_pipeline->setProperty("video-sink", m_videoSink);
> +-
> ++#ifdef HW_PLATFORM_IMX6
> ++            m_pipeline->setProperty("flags", GST_PLAY_FLAG_NATIVE_VIDEO | GST_PLAY_FLAG_AUDIO);
> ++#endif
> +             //watch the bus for messages
> +             QGst::BusPtr bus = m_pipeline->bus();
> +             bus->addSignalWatch();
> +--
> +1.9.1
> +
> diff --git a/recipes-qt/qt5/qtgstreamer_git.bb b/recipes-qt/qt5/qtgstreamer_git.bb
> new file mode 100644
> index 0000000..27cb26a
> --- /dev/null
> +++ b/recipes-qt/qt5/qtgstreamer_git.bb
> @@ -0,0 +1,44 @@
> +require ${PN}.inc
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +SECTION = "multimedia"
> +
> +SRC_URI = " \
> +    git://anongit.freedesktop.org/gstreamer/qt-gstreamer \
> +    file://0001-Added-i.MX6-zero-copy-rendering-implementation.patch \
> +    file://0002-qtgstreamer-Temporarry-set-native-video-playbin-s-fl.patch \
> +"
> +
> +SRCREV = "2a9664aff4980380afb93720795d326dfc76785f"
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN} += "\
> +    ${libdir}/gstreamer-1.0/* \
> +"
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/gstreamer-1.0/.debug/* \
> +"
> +
> +FILES_${PN}-examples += "\
> +    ${libdir}/gt5/examples/${PN}/* \
> +"
> +
> +inherit cmake_qt5
> +
> +export EXTRA_OECMAKE = "-DQT_VERSION=5 \
> +                        -DHW_PLATFORM=imx6 \
> +                        -DOE_QMAKE_PATH_EXTERNAL_HOST_BINS=${STAGING_DIR_NATIVE}/usr/bin/qt5/ \
> +                        -DUSE_QT_PLUGIN_DIR=OFF \
> +                        -DCMAKE_SKIP_INSTALL_RPATH=YES \
> +                        -DCMAKE_SKIP_RPATH=YES \
> +"
> +
> +EXTRA_OECONF += "--disable-rpath"
> +
> +do_install_append() {
> +#    install ${B}/examples/qmlplayer2/qmlplayer2 ${D}/usr/share/qt5/examples/qt-gstreamer/
> +    install -d ${D}${datadir}/qt5/examples/${P}
> +    install -m 0755 ${B}/examples/qmlplayer2/qmlplayer2 ${D}${datadir}/qt5/examples/${P}
> +}
> \ No newline at end of file


