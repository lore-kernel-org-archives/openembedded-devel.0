Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4F3773F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 13:23:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so5452269wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 05:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dE7AuABNUDM/6lYyClWFc9x2EqeC4/2CLm4ivp891bU=;
	b=ENmonWyMfnXNGJ3pgjYHdMSowyK+oAnMhyNSmq0KHIiMSQfcfPmSUWz2X87CbxxzPG
	0hTjtPWbAYRwVAW3svHcxRR7SV722KB8EdMQ1l+TZVkLMT72X/y17Kp4Vm+Npa07nUND
	PQtyphkjMiElDpd5OBrtOxoTVnWrhSdFz4R+fEf8WbChTHWu7sxn/SjGsvPDU4+uzFe5
	cE99Sz4P1Uq9tUs4sdWaO9L0dfmFtX5zg5mv92RsSQpEdEpLHqcebbCeqzXeb+72hkOr
	S+AVyqTJmqMQn9fWxH15dpJRh9b7Tq6mTCty/nMNVe10/JS8vo2+uTz9oPO863R79AVt
	U07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dE7AuABNUDM/6lYyClWFc9x2EqeC4/2CLm4ivp891bU=;
	b=hZV6SB3vy7+sjZLBpTGMbjOcc7jVGT8cbnmrLm+G72EOnhKjJWneNZgvddlI7YoMaG
	haCsNXXFDgbFEEqwfCgoybtqo6KP9N1nAiypsvKq6/s0p9/JCj8uN5e1gg4rzgP9NAmD
	7UB0ejOQLEeRe3FE1DtI+v7E870GdPeuwTuJ4IEI/IqLOBDq2af7EH3tW3kfzz9hbcy6
	TLLoNJt/MVbTkScNEskZn9urYQUN6mvo6Y9ttGdnA66Pz+VN+bts6AKkjkA0pWONMIiM
	q8AHKOBxF1ZHxFOASgXe0hjGdam6/dPnF9IYJQzyE0G1NR8K/R3Ocg3uPmQ1Cf2HoLBF
	0j7g==
X-Gm-Message-State: AIkVDXJRSW8IWfDLb4qOfEpsiAdim/ykNmzvK/bm+NTM2bcjDrR79l/q/+auzKTrDFfZeA==
X-Received: by 10.28.30.207 with SMTP id e198mr3297420wme.74.1481894631279;
	Fri, 16 Dec 2016 05:23:51 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-90-226-171.hsi11.unitymediagroup.de. [109.90.226.171])
	by smtp.googlemail.com with ESMTPSA id
	c202sm4199064wme.1.2016.12.16.05.23.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 05:23:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 14:23:36 +0100
Message-Id: <1481894617-17690-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] audiofile: update to 0.3.6
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
X-List-Received-Date: Fri, 16 Dec 2016 13:23:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License checksum changed by altering address of FSF

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../audiofile/audiofile_0.2.7.bb                   | 15 -----
 .../audiofile/audiofile_0.3.6.bb                   | 22 +++++++
 .../files/0001-fix-negative-shift-constants.patch  | 77 ++++++++++++++++++++++
 .../audiofile/files/0002-fix-build-on-gcc6.patch   | 75 +++++++++++++++++++++
 .../audiofile/files/0003-fix-CVE-2015-7747.patch   | 35 ++++++++++
 5 files changed, 209 insertions(+), 15 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
 create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0003-fix-CVE-2015-7747.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
deleted file mode 100644
index 6188659..0000000
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "The Audio File Library provides a uniform and elegant \
-API for accessing a variety of audio file formats, such as AIFF/AIFF-C, \
-WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
-Research, Amiga IFF/8SVX, and NIST SPHERE."
-HOMEPAGE = "http://www.68k.org/~michael/audiofile/"
-SECTION = "libs"
-LICENSE = "LGPLv2 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI = "${GNOME_MIRROR}/audiofile/0.2/${BP}.tar.gz"
-SRC_URI[md5sum] = "a39be317a7b1971b408805dc5e371862"
-SRC_URI[sha256sum] = "a61c4036c2600a645843f16bec4be166093a9df5f15b02c85291213aa9cf15a2"
-
-inherit autotools lib_package binconfig
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
new file mode 100644
index 0000000..2d67b5a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "The Audio File Library provides a uniform and elegant \
+API for accessing a variety of audio file formats, such as AIFF/AIFF-C, \
+WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
+Research, Amiga IFF/8SVX, and NIST SPHERE."
+HOMEPAGE = "http://www.68k.org/~michael/audiofile/"
+SECTION = "libs"
+LICENSE = "LGPLv2 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = " \
+    ${GNOME_MIRROR}/audiofile/0.3/${BP}.tar.xz \
+    file://0001-fix-negative-shift-constants.patch \
+    file://0002-fix-build-on-gcc6.patch \
+    file://0003-fix-CVE-2015-7747.patch \
+"
+SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
+SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
+
+inherit autotools lib_package binconfig
+
+DEPENDS = "asciidoc-native libogg flac"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
new file mode 100644
index 0000000..ecb3108
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
@@ -0,0 +1,77 @@
+From 99127676dba8f5d607757428bc14a6b7ab52d5ed Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 16 Dec 2016 12:42:06 +0100
+Subject: [PATCH 1/3] fix negative shift constants
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] http://pkgs.fedoraproject.org/cgit/rpms/audiofile.git/tree/audiofile-0.3.6-left-shift-neg.patch
+
+Upstrem-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ libaudiofile/modules/SimpleModule.h | 2 +-
+ test/FloatToInt.cpp                 | 2 +-
+ test/IntToFloat.cpp                 | 2 +-
+ test/Sign.cpp                       | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libaudiofile/modules/SimpleModule.h b/libaudiofile/modules/SimpleModule.h
+index 03c6c69..e4cc138 100644
+--- a/libaudiofile/modules/SimpleModule.h
++++ b/libaudiofile/modules/SimpleModule.h
+@@ -123,7 +123,7 @@ struct signConverter
+ 	typedef typename IntTypes<Format>::UnsignedType UnsignedType;
+ 
+ 	static const int kScaleBits = (Format + 1) * CHAR_BIT - 1;
+-	static const int kMinSignedValue = -1 << kScaleBits;
++	static const int kMinSignedValue = 0-(1U<<kScaleBits);
+ 
+ 	struct signedToUnsigned : public std::unary_function<SignedType, UnsignedType>
+ 	{
+diff --git a/test/FloatToInt.cpp b/test/FloatToInt.cpp
+index 0d179a8..bf491b2 100644
+--- a/test/FloatToInt.cpp
++++ b/test/FloatToInt.cpp
+@@ -115,7 +115,7 @@ TEST_F(FloatToIntTest, Int16)
+ 		EXPECT_EQ(readData[i], expectedData[i]);
+ }
+ 
+-static const int32_t kMinInt24 = -1<<23;
++static const int32_t kMinInt24 = 0-(1U<<23);
+ static const int32_t kMaxInt24 = (1<<23) - 1;
+ 
+ TEST_F(FloatToIntTest, Int24)
+diff --git a/test/IntToFloat.cpp b/test/IntToFloat.cpp
+index b716635..1d91b58 100644
+--- a/test/IntToFloat.cpp
++++ b/test/IntToFloat.cpp
+@@ -117,7 +117,7 @@ TEST_F(IntToFloatTest, Int16)
+ 		EXPECT_EQ(readData[i], expectedData[i]);
+ }
+ 
+-static const int32_t kMinInt24 = -1<<23;
++static const int32_t kMinInt24 = 0-(1U<<23);
+ static const int32_t kMaxInt24 = (1<<23) - 1;
+ 
+ TEST_F(IntToFloatTest, Int24)
+diff --git a/test/Sign.cpp b/test/Sign.cpp
+index 7275399..c339514 100644
+--- a/test/Sign.cpp
++++ b/test/Sign.cpp
+@@ -116,7 +116,7 @@ TEST_F(SignConversionTest, Int16)
+ 		EXPECT_EQ(readData[i], expectedData[i]);
+ }
+ 
+-static const int32_t kMinInt24 = -1<<23;
++static const int32_t kMinInt24 = 0-(1U<<23);
+ static const int32_t kMaxInt24 = (1<<23) - 1;
+ static const uint32_t kMaxUInt24 = (1<<24) - 1;
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
new file mode 100644
index 0000000..2c66cf4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
@@ -0,0 +1,75 @@
+From a74c1e9c583375b9e55c29a36442485089e4b7f9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 16 Dec 2016 12:42:06 +0100
+Subject: [PATCH 2/3] fix build on gcc6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] http://pkgs.fedoraproject.org/cgit/rpms/audiofile.git/tree/audiofile-0.3.6-narrowing.patch
+
+Upstrem-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ test/NeXT.cpp | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/test/NeXT.cpp b/test/NeXT.cpp
+index 7e39850..a37cea1 100644
+--- a/test/NeXT.cpp
++++ b/test/NeXT.cpp
+@@ -37,13 +37,13 @@
+ 
+ #include "TestUtilities.h"
+ 
+-const char kDataUnspecifiedLength[] =
++const signed char kDataUnspecifiedLength[] =
+ {
+ 	'.', 's', 'n', 'd',
+ 	0, 0, 0, 24, // offset of 24 bytes
+-	0xff, 0xff, 0xff, 0xff, // unspecified length
++	-1, -1, -1, -1, // unspecified length
+ 	0, 0, 0, 3, // 16-bit linear
+-	0, 0, 172, 68, // 44100 Hz
++	0, 0, -84, 68, // 44100 Hz (0xAC44)
+ 	0, 0, 0, 1, // 1 channel
+ 	0, 1,
+ 	0, 1,
+@@ -57,13 +57,13 @@ const char kDataUnspecifiedLength[] =
+ 	0, 55
+ };
+ 
+-const char kDataTruncated[] =
++const signed char kDataTruncated[] =
+ {
+ 	'.', 's', 'n', 'd',
+ 	0, 0, 0, 24, // offset of 24 bytes
+ 	0, 0, 0, 20, // length of 20 bytes
+ 	0, 0, 0, 3, // 16-bit linear
+-	0, 0, 172, 68, // 44100 Hz
++	0, 0, -84, 68, // 44100 Hz (0xAC44)
+ 	0, 0, 0, 1, // 1 channel
+ 	0, 1,
+ 	0, 1,
+@@ -152,13 +152,13 @@ TEST(NeXT, Truncated)
+ 	ASSERT_EQ(::unlink(testFileName.c_str()), 0);
+ }
+ 
+-const char kDataZeroChannels[] =
++const signed char kDataZeroChannels[] =
+ {
+ 	'.', 's', 'n', 'd',
+ 	0, 0, 0, 24, // offset of 24 bytes
+ 	0, 0, 0, 2, // 2 bytes
+ 	0, 0, 0, 3, // 16-bit linear
+-	0, 0, 172, 68, // 44100 Hz
++	0, 0, -84, 68, // 44100 Hz (0xAC44)
+ 	0, 0, 0, 0, // 0 channels
+ 	0, 1
+ };
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0003-fix-CVE-2015-7747.patch b/meta-oe/recipes-multimedia/audiofile/files/0003-fix-CVE-2015-7747.patch
new file mode 100644
index 0000000..895e320
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0003-fix-CVE-2015-7747.patch
@@ -0,0 +1,35 @@
+From 746c38105ce4fa1b609995d3386ea6b8b1f2f7bd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 16 Dec 2016 12:50:51 +0100
+Subject: [PATCH 3/3] fix CVE-2015-7747
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] http://pkgs.fedoraproject.org/cgit/rpms/audiofile.git/tree/audiofile-0.3.6-CVE-2015-7747.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ libaudiofile/modules/ModuleState.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libaudiofile/modules/ModuleState.cpp b/libaudiofile/modules/ModuleState.cpp
+index f76c495..0c29d7a 100644
+--- a/libaudiofile/modules/ModuleState.cpp
++++ b/libaudiofile/modules/ModuleState.cpp
+@@ -402,7 +402,7 @@ status ModuleState::arrange(AFfilehandle file, Track *track)
+ 		addModule(new Transform(outfc, in.pcm, out.pcm));
+ 
+ 	if (in.channelCount != out.channelCount)
+-		addModule(new ApplyChannelMatrix(infc, isReading,
++		addModule(new ApplyChannelMatrix(outfc, isReading,
+ 			in.channelCount, out.channelCount,
+ 			in.pcm.minClip, in.pcm.maxClip,
+ 			track->channelMatrix));
+-- 
+2.7.4
+
-- 
2.7.4


