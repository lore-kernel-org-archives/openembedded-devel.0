Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF9871AE6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:24:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8L2Opgs001190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 19:24:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 20 Sep 2017 19:24:50 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Sep 2017 10:11:32 +0800
Message-ID: <20170921021132.14819-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] opencv: fix CVE-2017-14136
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 02:24:50 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2017-14136 for opencv.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../opencv/opencv/CVE-2017-14136.patch             | 288 +++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.3.bb       |   1 +
 2 files changed, 289 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2017-14136.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2017-14136.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2017-14136.patch
new file mode 100644
index 000000000..7ad50a2d2
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2017-14136.patch
@@ -0,0 +1,288 @@
+Upstream-Status: Backport [https://github.com/opencv/opencv/pull/9448/commits/aacae20]
+
+Backport patch to fix CVE-2017-14136.
+
+Ref: https://github.com/opencv/opencv/issues/9443
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From aacae2065744adb05e858d327198c7bbe7f452b0 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Wed, 23 Aug 2017 15:15:27 +0300
+Subject: [PATCH] imgcodesc: fix code problems with integer overflow / address
+ arithmetic / UB
+
+---
+ modules/imgcodecs/src/grfmt_bmp.cpp      |  8 ++---
+ modules/imgcodecs/src/grfmt_exr.cpp      | 10 +++----
+ modules/imgcodecs/src/grfmt_jpeg.cpp     |  2 +-
+ modules/imgcodecs/src/grfmt_jpeg2000.cpp |  6 ++--
+ modules/imgcodecs/src/grfmt_pam.cpp      |  2 +-
+ modules/imgcodecs/src/grfmt_sunras.cpp   |  6 ++--
+ modules/imgcodecs/src/utils.cpp          | 51 +++++++++++++++++++-------------
+ modules/imgcodecs/src/utils.hpp          |  2 ++
+ 8 files changed, 50 insertions(+), 37 deletions(-)
+
+diff --git a/modules/imgcodecs/src/grfmt_bmp.cpp b/modules/imgcodecs/src/grfmt_bmp.cpp
+index 257f97c2d8b..69768e276a3 100644
+--- a/modules/imgcodecs/src/grfmt_bmp.cpp
++++ b/modules/imgcodecs/src/grfmt_bmp.cpp
+@@ -193,7 +193,7 @@ bool  BmpDecoder::readHeader()
+ bool  BmpDecoder::readData( Mat& img )
+ {
+     uchar* data = img.ptr();
+-    int step = (int)img.step;
++    int step = validateToInt(img.step);
+     bool color = img.channels() > 1;
+     uchar  gray_palette[256] = {0};
+     bool   result = false;
+@@ -206,7 +206,7 @@ bool  BmpDecoder::readData( Mat& img )
+ 
+     if( m_origin == IPL_ORIGIN_BL )
+     {
+-        data += (m_height - 1)*step;
++        data += (m_height - 1)*(size_t)step;
+         step = -step;
+     }
+ 
+@@ -530,7 +530,7 @@ bool  BmpEncoder::write( const Mat& img, const std::vector<int>& )
+     int  bitmapHeaderSize = 40;
+     int  paletteSize = channels > 1 ? 0 : 1024;
+     int  headerSize = 14 /* fileheader */ + bitmapHeaderSize + paletteSize;
+-    int  fileSize = fileStep*height + headerSize;
++    size_t fileSize = (size_t)fileStep*height + headerSize;
+     PaletteEntry palette[256];
+ 
+     if( m_buf )
+@@ -540,7 +540,7 @@ bool  BmpEncoder::write( const Mat& img, const std::vector<int>& )
+     strm.putBytes( fmtSignBmp, (int)strlen(fmtSignBmp) );
+ 
+     // write file header
+-    strm.putDWord( fileSize ); // file size
++    strm.putDWord( validateToInt(fileSize) ); // file size
+     strm.putDWord( 0 );
+     strm.putDWord( headerSize );
+ 
+diff --git a/modules/imgcodecs/src/grfmt_exr.cpp b/modules/imgcodecs/src/grfmt_exr.cpp
+index 0d2ae9fa7d2..78ffe6c7668 100644
+--- a/modules/imgcodecs/src/grfmt_exr.cpp
++++ b/modules/imgcodecs/src/grfmt_exr.cpp
+@@ -195,7 +195,7 @@ bool  ExrDecoder::readData( Mat& img )
+     bool color = img.channels() > 1;
+ 
+     uchar* data = img.ptr();
+-    int step = img.step;
++    size_t step = img.step;
+     bool justcopy = m_native_depth;
+     bool chromatorgb = false;
+     bool rgbtogray = false;
+@@ -203,8 +203,8 @@ bool  ExrDecoder::readData( Mat& img )
+     FrameBuffer frame;
+     int xsample[3] = {1, 1, 1};
+     char *buffer;
+-    int xstep;
+-    int ystep;
++    size_t xstep = 0;
++    size_t ystep = 0;
+ 
+     xstep = m_native_depth ? 4 : 1;
+ 
+@@ -593,7 +593,7 @@ bool  ExrEncoder::write( const Mat& img, const std::vector<int>& )
+     bool issigned = depth == CV_8S || depth == CV_16S || depth == CV_32S;
+     bool isfloat = depth == CV_32F || depth == CV_64F;
+     depth = CV_ELEM_SIZE1(depth)*8;
+-    const int step = img.step;
++    const size_t step = img.step;
+ 
+     Header header( width, height );
+     Imf::PixelType type;
+@@ -623,7 +623,7 @@ bool  ExrEncoder::write( const Mat& img, const std::vector<int>& )
+     FrameBuffer frame;
+ 
+     char *buffer;
+-    int bufferstep;
++    size_t bufferstep;
+     int size;
+     if( type == FLOAT && depth == 32 )
+     {
+diff --git a/modules/imgcodecs/src/grfmt_jpeg.cpp b/modules/imgcodecs/src/grfmt_jpeg.cpp
+index ce942ca1995..caf768d2569 100644
+--- a/modules/imgcodecs/src/grfmt_jpeg.cpp
++++ b/modules/imgcodecs/src/grfmt_jpeg.cpp
+@@ -396,7 +396,7 @@ int my_jpeg_load_dht (struct jpeg_decompress_struct *info, unsigned char *dht,
+ bool  JpegDecoder::readData( Mat& img )
+ {
+     volatile bool result = false;
+-    int step = (int)img.step;
++    size_t step = img.step;
+     bool color = img.channels() > 1;
+ 
+     if( m_state && m_width && m_height )
+diff --git a/modules/imgcodecs/src/grfmt_jpeg2000.cpp b/modules/imgcodecs/src/grfmt_jpeg2000.cpp
+index 950ec21375f..24dfb38bb9d 100644
+--- a/modules/imgcodecs/src/grfmt_jpeg2000.cpp
++++ b/modules/imgcodecs/src/grfmt_jpeg2000.cpp
+@@ -156,7 +156,7 @@ bool  Jpeg2KDecoder::readData( Mat& img )
+     bool result = false;
+     int color = img.channels() > 1;
+     uchar* data = img.ptr();
+-    int step = (int)img.step;
++    size_t step = img.step;
+     jas_stream_t* stream = (jas_stream_t*)m_stream;
+     jas_image_t* image = (jas_image_t*)m_image;
+ 
+@@ -252,9 +252,9 @@ bool  Jpeg2KDecoder::readData( Mat& img )
+                         if( !jas_image_readcmpt( image, cmptlut[i], 0, 0, xend / xstep, yend / ystep, buffer ))
+                         {
+                             if( img.depth() == CV_8U )
+-                                result = readComponent8u( data + i, buffer, step, cmptlut[i], maxval, offset, ncmpts );
++                                result = readComponent8u( data + i, buffer, validateToInt(step), cmptlut[i], maxval, offset, ncmpts );
+                             else
+-                                result = readComponent16u( ((unsigned short *)data) + i, buffer, step / 2, cmptlut[i], maxval, offset, ncmpts );
++                                result = readComponent16u( ((unsigned short *)data) + i, buffer, validateToInt(step / 2), cmptlut[i], maxval, offset, ncmpts );
+                             if( !result )
+                             {
+                                 i = ncmpts;
+diff --git a/modules/imgcodecs/src/grfmt_pam.cpp b/modules/imgcodecs/src/grfmt_pam.cpp
+index 11195dc342c..8eb9e012309 100644
+--- a/modules/imgcodecs/src/grfmt_pam.cpp
++++ b/modules/imgcodecs/src/grfmt_pam.cpp
+@@ -479,7 +479,7 @@ bool  PAMDecoder::readData( Mat& img )
+ {
+     uchar* data = img.ptr();
+     int target_channels = img.channels();
+-    int imp_stride = (int)img.step;
++    size_t imp_stride = img.step;
+     int sample_depth = CV_ELEM_SIZE1(m_type);
+     int src_elems_per_row = m_width*m_channels;
+     int src_stride = src_elems_per_row*sample_depth;
+diff --git a/modules/imgcodecs/src/grfmt_sunras.cpp b/modules/imgcodecs/src/grfmt_sunras.cpp
+index aca9b369318..6d448f94ed3 100644
+--- a/modules/imgcodecs/src/grfmt_sunras.cpp
++++ b/modules/imgcodecs/src/grfmt_sunras.cpp
+@@ -160,7 +160,7 @@ bool  SunRasterDecoder::readData( Mat& img )
+ {
+     int color = img.channels() > 1;
+     uchar* data = img.ptr();
+-    int step = (int)img.step;
++    size_t step = img.step;
+     uchar  gray_palette[256] = {0};
+     bool   result = false;
+     int  src_pitch = ((m_width*m_bpp + 7)/8 + 1) & -2;
+@@ -308,11 +308,11 @@ bool  SunRasterDecoder::readData( Mat& img )
+                         code = m_strm.getByte();
+ 
+                         if( color )
+-                            data = FillUniColor( data, line_end, step, width3,
++                            data = FillUniColor( data, line_end, validateToInt(step), width3,
+                                                  y, m_height, len,
+                                                  m_palette[code] );
+                         else
+-                            data = FillUniGray( data, line_end, step, width3,
++                            data = FillUniGray( data, line_end, validateToInt(step), width3,
+                                                 y, m_height, len,
+                                                 gray_palette[code] );
+                         if( y >= m_height )
+diff --git a/modules/imgcodecs/src/utils.cpp b/modules/imgcodecs/src/utils.cpp
+index 2ee5bafc712..474dae008ca 100644
+--- a/modules/imgcodecs/src/utils.cpp
++++ b/modules/imgcodecs/src/utils.cpp
+@@ -42,6 +42,13 @@
+ #include "precomp.hpp"
+ #include "utils.hpp"
+ 
++int validateToInt(size_t sz)
++{
++    int valueInt = (int)sz;
++    CV_Assert((size_t)valueInt == sz);
++    return valueInt;
++}
++
+ #define  SCALE  14
+ #define  cR  (int)(0.299*(1 << SCALE) + 0.5)
+ #define  cG  (int)(0.587*(1 << SCALE) + 0.5)
+@@ -537,23 +544,25 @@ uchar* FillColorRow1( uchar* data, uchar* indices, int len, PaletteEntry* palett
+ {
+     uchar* end = data + len*3;
+ 
++    const PaletteEntry p0 = palette[0], p1 = palette[1];
++
+     while( (data += 24) < end )
+     {
+         int idx = *indices++;
+-        *((PaletteEntry*)(data - 24)) = palette[(idx & 128) != 0];
+-        *((PaletteEntry*)(data - 21)) = palette[(idx & 64) != 0];
+-        *((PaletteEntry*)(data - 18)) = palette[(idx & 32) != 0];
+-        *((PaletteEntry*)(data - 15)) = palette[(idx & 16) != 0];
+-        *((PaletteEntry*)(data - 12)) = palette[(idx & 8) != 0];
+-        *((PaletteEntry*)(data - 9)) = palette[(idx & 4) != 0];
+-        *((PaletteEntry*)(data - 6)) = palette[(idx & 2) != 0];
+-        *((PaletteEntry*)(data - 3)) = palette[(idx & 1) != 0];
++        *((PaletteEntry*)(data - 24)) = (idx & 128) ? p1 : p0;
++        *((PaletteEntry*)(data - 21)) = (idx & 64) ? p1 : p0;
++        *((PaletteEntry*)(data - 18)) = (idx & 32) ? p1 : p0;
++        *((PaletteEntry*)(data - 15)) = (idx & 16) ? p1 : p0;
++        *((PaletteEntry*)(data - 12)) = (idx & 8) ? p1 : p0;
++        *((PaletteEntry*)(data - 9)) = (idx & 4) ? p1 : p0;
++        *((PaletteEntry*)(data - 6)) = (idx & 2) ? p1 : p0;
++        *((PaletteEntry*)(data - 3)) = (idx & 1) ? p1 : p0;
+     }
+ 
+-    int idx = indices[0] << 24;
++    int idx = indices[0];
+     for( data -= 24; data < end; data += 3, idx += idx )
+     {
+-        PaletteEntry clr = palette[idx < 0];
++        const PaletteEntry clr = (idx & 128) ? p1 : p0;
+         WRITE_PIX( data, clr );
+     }
+ 
+@@ -565,23 +574,25 @@ uchar* FillGrayRow1( uchar* data, uchar* indices, int len, uchar* palette )
+ {
+     uchar* end = data + len;
+ 
++    const uchar p0 = palette[0], p1 = palette[1];
++
+     while( (data += 8) < end )
+     {
+         int idx = *indices++;
+-        *((uchar*)(data - 8)) = palette[(idx & 128) != 0];
+-        *((uchar*)(data - 7)) = palette[(idx & 64) != 0];
+-        *((uchar*)(data - 6)) = palette[(idx & 32) != 0];
+-        *((uchar*)(data - 5)) = palette[(idx & 16) != 0];
+-        *((uchar*)(data - 4)) = palette[(idx & 8) != 0];
+-        *((uchar*)(data - 3)) = palette[(idx & 4) != 0];
+-        *((uchar*)(data - 2)) = palette[(idx & 2) != 0];
+-        *((uchar*)(data - 1)) = palette[(idx & 1) != 0];
++        *((uchar*)(data - 8)) = (idx & 128) ? p1 : p0;
++        *((uchar*)(data - 7)) = (idx & 64) ? p1 : p0;
++        *((uchar*)(data - 6)) = (idx & 32) ? p1 : p0;
++        *((uchar*)(data - 5)) = (idx & 16) ? p1 : p0;
++        *((uchar*)(data - 4)) = (idx & 8) ? p1 : p0;
++        *((uchar*)(data - 3)) = (idx & 4) ? p1 : p0;
++        *((uchar*)(data - 2)) = (idx & 2) ? p1 : p0;
++        *((uchar*)(data - 1)) = (idx & 1) ? p1 : p0;
+     }
+ 
+-    int idx = indices[0] << 24;
++    int idx = indices[0];
+     for( data -= 8; data < end; data++, idx += idx )
+     {
+-        data[0] = palette[idx < 0];
++        data[0] = (idx & 128) ? p1 : p0;
+     }
+ 
+     return data;
+diff --git a/modules/imgcodecs/src/utils.hpp b/modules/imgcodecs/src/utils.hpp
+index cab10609db2..7af4c6174ee 100644
+--- a/modules/imgcodecs/src/utils.hpp
++++ b/modules/imgcodecs/src/utils.hpp
+@@ -42,6 +42,8 @@
+ #ifndef _UTILS_H_
+ #define _UTILS_H_
+ 
++int validateToInt(size_t step);
++
+ struct PaletteEntry
+ {
+     unsigned char b, g, r, a;
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index 25f247662..da078d7fa 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://0002-imgcodecs-refactoring-improve-code-quality.patch \
     file://0003-imgproc-test-add-checks-for-remove-call.patch \
     file://0001-Dont-use-isystem.patch \
+    file://CVE-2017-14136.patch \
 "
 PV = "3.3+git${SRCPV}"
 
-- 
2.14.1


