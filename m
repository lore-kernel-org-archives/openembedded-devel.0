Return-Path: <cleitonrbueno@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33CE6607AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 22:13:58 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id 6so7030360qgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 14:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6vV8SfBK5zTHEYQELw6sTlxEM9ny86XlFkD2vU9H9yw=;
	b=EeSZZlpLENpgVvgY+HBvXjWLAxHXv4qiKds9E1Cgd2uFJloANTwjoVU/GlIYc8R3sb
	M6ax+gxtIdME8EdRcpv9LNlf0+XEffZKZxn6b0EwOsGXynP5hcNppWiX2aRrGX3OnDtk
	DqinTKkRY2QWHDwJQLNpzTWHmpRQHIDxH8d0A1GR+9rzEEVI5HSq/5HB/JcRieYrDJrH
	u6EnIQNC+Mu6P4Kc28BvBfdhNESUjo7X59rQgUTespz/NYTsh7ZrXirld43e+BmdtIK9
	6i3M2ib2kLgNWM9SErrMkaatjvW1We7V7LTiF0NWSwNCUdt0QaT6u8d3Y9UaJ8gCA8em
	SOiQ==
X-Received: by 10.140.247.67 with SMTP id s64mr54229460qhc.20.1450995238988;
	Thu, 24 Dec 2015 14:13:58 -0800 (PST)
Received: from localhost.localdomain (179-241-189-104.3g.claro.net.br.
	[179.241.189.104]) by smtp.gmail.com with ESMTPSA id
	d13sm20929906qkj.16.2015.12.24.14.13.56
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Dec 2015 14:13:58 -0800 (PST)
From: Cleiton Bueno <cleitonrbueno@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Dec 2015 20:13:46 -0200
Message-Id: <1450995226-16494-1-git-send-email-cleitonrbueno@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Cleiton Bueno <cleitonrbueno@gmail.com>
Subject: [PATCH] Change false to FALSE and 1 to TRUE, FIX qtwebengine compile
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
X-List-Received-Date: Thu, 24 Dec 2015 22:13:59 -0000

Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
---
 src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
index 8a08fe0..32b2a05 100644
--- a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
+++ b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
@@ -120,7 +120,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
   // tell libjpeg where to write the next data
   cinfo->dest->next_output_byte = &(*state->out)[state->image_buffer_used];
   cinfo->dest->free_in_buffer = state->out->size() - state->image_buffer_used;
-  return 1;
+  return TRUE;
 }
 
 // Cleans up the JpegEncoderState to prepare for returning in the final form.
@@ -261,7 +261,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
   cinfo.data_precision = 8;
 
   jpeg_set_defaults(&cinfo);
-  jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
+  jpeg_set_quality(&cinfo, quality, TRUE);  // quality here is 0-100
 
   // set up the destination manager
   jpeg_destination_mgr destmgr;
@@ -273,7 +273,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
   JpegEncoderState state(output);
   cinfo.client_data = &state;
 
-  jpeg_start_compress(&cinfo, 1);
+  jpeg_start_compress(&cinfo, TRUE);
 
   // feed it the rows, doing necessary conversions for the color format
 #ifdef JCS_EXTENSIONS
@@ -359,7 +359,7 @@ void InitSource(j_decompress_ptr cinfo) {
 //   set to a positive value if TRUE is returned. A FALSE return should only
 //   be used when I/O suspension is desired."
 boolean FillInputBuffer(j_decompress_ptr cinfo) {
-  return false;
+  return FALSE;
 }
 
 // Skip data in the buffer. Since we have all the data at once, this operation
@@ -487,8 +487,8 @@ bool JPEGCodec::Decode(const unsigned char* input, size_t input_size,
   cinfo.client_data = &state;
 
   // fill the file metadata into our buffer
-  if (jpeg_read_header(&cinfo, true) != JPEG_HEADER_OK)
-    return false;
+  if (jpeg_read_header(&cinfo, TRUE) != JPEG_HEADER_OK)
+    return FALSE;
 
   // we want to always get RGB data out
   switch (cinfo.jpeg_color_space) {
-- 
1.8.1.2


