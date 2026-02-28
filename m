Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E022DFEE4FB
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 20:24:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126393.1772310277648251219
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 12:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aF7Q13X8;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so28106335e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 12:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310276; x=1772915076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ct+3prt4u5iXGWe0pj6m38OSTCQkjGpjpIRvfTadbTY=;
        b=aF7Q13X8zwM62SYAvn3xjN8JMNDaXr70XRFjq2NeV50/rATUDNsrbT0MJ7DV+ldzmh
         /vKtSy833J2/mjO303krjPrDkaPLwNRdOrTizfCM6c9qRLWAX/jkK9ZD0uZwjA496r+4
         gcUn3YAOgX+S/Q6Be4JhXiLAykftMT3cV9Lp2id/4+OrzQ67G8ChBvipXnNjrb1MmQ1K
         Hjetoe5jZHRXG9o7NFfIXslfQAjZL4iuv/Q7BdbnfqJbbnXU6bG0k/w4yAt6Uu7tlgDe
         nh1Pl9fjq1KQsMnUupez83p7B81cs4mCqqeAG9Awe9QoBTgq3bhHYhS9uB0qoLUTnguW
         FnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310276; x=1772915076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ct+3prt4u5iXGWe0pj6m38OSTCQkjGpjpIRvfTadbTY=;
        b=TWrkKPiRaFONhlgQ92UGKnTWS2Nw51WYbJQkaf+Y5iv1XEO3HKMjB7IlcG485pbgfd
         sDE8e0jhC6cnOuNpT3ded/oArxVs1wHjPZ2s61z8iZOUlCHxr2fEH1z6rEqcqmJWPFew
         eP9vD/HZkSfcigcn+MWAnuiGJiXTfGbk/UQbCTmjk45ITPgS3didoiCLO17Nujk7KVAa
         WE/vs5dl69W7pdOSanp6Jr9hcPPfG1GSFlEqcYZ76V80RZzfvzCV9lk4r+XOMiac/0Vw
         b8JN66eBcE6pPnQegGu6FD/RWSbP3iWxAl8or7XBzLWTEl497QDtq9uVyGVNMwPSiwGr
         9EBg==
X-Gm-Message-State: AOJu0Yx9cOaTGsPosDXJ5updc49e2xdz6AoKtumdpefXaJnO3Mmt2gUr
	jnNjKobDpvBdslJ0HqUyEkQgargNFy+LZwEUvnSTd2xu/wCbfDV3YUFqo8Z+kw==
X-Gm-Gg: ATEYQzxG9Wqw/nEj/+Q9LM2Yxu7533P6jcXQvebSvMqQisJ+OxcpF2Z5dG48vTYtrnD
	G+GfoTAyajqfHMWRqM8iRtRNs7uoEH38FSyNt9Bh3gYoLQt1RlWH6FhlbQQof6eN2NmfCrqJD4T
	5JQans+bKlkl8ZfUXMt+zoAhjM/ZB/QJzuNNPBeioKsXGFeOMR6i+lwy3+0XlL0AxvIDvBtlO4x
	I7C1nQlT41++wZ6rfkk4ieWjn3k5W7nZIljDJ4oVbC5ycW7/qCl9orTu82LPuP29ynKJ91efH7w
	tJViXW9gEdZ3Qz1ZpUXRuNDjLv6eq42Aogv11fdQi7YIASlJzWg2kmRUBAjWh2d9rDCcuFxM+co
	8Oc3/qykytPy53vpbBr+vdkem2qJLrfxPuWf86ahdPpee9yAH54f4BrVp3gY3RPBqhtI/s0642T
	bGZicr4ykGBJzWj/jxrJ3+
X-Received: by 2002:a05:600c:c058:b0:483:75f1:54f with SMTP id 5b1f17b1804b1-483ca84a962mr99337085e9.31.1772310275837;
        Sat, 28 Feb 2026 12:24:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776b0sm94889995e9.1.2026.02.28.12.24.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:24:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] exiv2: patch CVE-2021-37621
Date: Sat, 28 Feb 2026 21:24:29 +0100
Message-ID: <20260228202429.2424513-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228202429.2424513-1-skandigraun@gmail.com>
References: <20260228202429.2424513-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 20:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124788

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-37621

Backport the patch that is referenced by the NVD advisory.

The regression test contains a binary patch, that couldn't be applied
in the do_patch task. Due to this the test was not backported. It was
however applied manually and executed successfully during the preparation
of this patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-37621-1.patch        |  25 +++
 .../exiv2/exiv2/CVE-2021-37621-2.patch        | 187 ++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   2 +
 3 files changed, 214 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-1.patch
new file mode 100644
index 0000000000..1ca9fd2b0d
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-1.patch
@@ -0,0 +1,25 @@
+From 4fbd3390829f8418e1ec95252c2fd6b851850508 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 13 Jul 2021 22:50:16 +0100
+Subject: [PATCH] dirLength == 0 can cause an infinite loop.
+
+CVE: CVE-2021-37621
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/191cd2690608f19335d82ed2be36c7ce8bdc60b9]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/image.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/image.cpp b/src/image.cpp
+index 2fa41e5..7c2eaa9 100644
+--- a/src/image.cpp
++++ b/src/image.cpp
+@@ -353,6 +353,8 @@ namespace Exiv2 {
+                 throw Error(kerCorruptedMetadata);
+             }
+             uint16_t   dirLength = byteSwap2(dir,0,bSwap);
++            // Prevent infinite loops. (GHSA-m479-7frc-gqqg)
++            enforce(dirLength > 0, kerCorruptedMetadata);
+ 
+             bool tooBig = dirLength > 500;
+             if ( tooBig ) throw Error(kerTiffDirectoryTooLarge);
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-2.patch
new file mode 100644
index 0000000000..a4578aae17
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-2.patch
@@ -0,0 +1,187 @@
+From 2973c3277af6922209a80985eccbd50b48088be6 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 13 Jul 2021 22:53:40 +0100
+Subject: [PATCH] Defensive programming in Image::printIFDStructure
+
+CVE: CVE-2021-37621
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/d9fd4c4272df172ae89c0a9c41341adc75ebba86]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/image.cpp | 82 +++++++++++++++++++++++++++++++--------------------
+ 1 file changed, 50 insertions(+), 32 deletions(-)
+
+diff --git a/src/image.cpp b/src/image.cpp
+index 7c2eaa9..6b1b1d8 100644
+--- a/src/image.cpp
++++ b/src/image.cpp
+@@ -27,6 +27,7 @@
+ #include "image.hpp"
+ #include "image_int.hpp"
+ #include "error.hpp"
++#include "enforce.hpp"
+ #include "futils.hpp"
+ #include "safe_op.hpp"
+ #include "slice.hpp"
+@@ -149,6 +150,19 @@ namespace {
+ // class member definitions
+ namespace Exiv2 {
+ 
++    // BasicIo::read() with error checking
++    static void readOrThrow(BasicIo& iIo, byte* buf, long rcount, ErrorCode err) {
++      const long nread = iIo.read(buf, rcount);
++      enforce(nread == rcount, err);
++      enforce(!iIo.error(), err);
++    }
++
++    // BasicIo::seek() with error checking
++    static void seekOrThrow(BasicIo& iIo, long offset, BasicIo::Position pos, ErrorCode err) {
++      const int r = iIo.seek(offset, pos);
++      enforce(r == 0, err);
++    }
++
+     Image::Image(int              imageType,
+                  uint16_t         supportedMetadata,
+                  BasicIo::AutoPtr io)
+@@ -347,11 +361,8 @@ namespace Exiv2 {
+ 
+         do {
+             // Read top of directory
+-            const int seekSuccess = !io.seek(start,BasicIo::beg);
+-            const long bytesRead = io.read(dir.pData_, 2);
+-            if (!seekSuccess || bytesRead == 0) {
+-                throw Error(kerCorruptedMetadata);
+-            }
++            seekOrThrow(io, start, BasicIo::beg, kerCorruptedMetadata);
++            readOrThrow(io, dir.pData_, 2, kerCorruptedMetadata);
+             uint16_t   dirLength = byteSwap2(dir,0,bSwap);
+             // Prevent infinite loops. (GHSA-m479-7frc-gqqg)
+             enforce(dirLength > 0, kerCorruptedMetadata);
+@@ -378,7 +389,7 @@ namespace Exiv2 {
+                 }
+                 bFirst = false;
+ 
+-                io.read(dir.pData_, 12);
++                readOrThrow(io, dir.pData_, 12, kerCorruptedMetadata);
+                 uint16_t tag    = byteSwap2(dir,0,bSwap);
+                 uint16_t type   = byteSwap2(dir,2,bSwap);
+                 uint32_t count  = byteSwap4(dir,4,bSwap);
+@@ -411,20 +422,27 @@ namespace Exiv2 {
+                 // if ( offset > io.size() ) offset = 0; // Denial of service?
+ 
+                 // #55 and #56 memory allocation crash test/data/POC8
+-                long long allocate = (long long) size*count + pad+20;
+-                if ( allocate > (long long) io.size() ) {
++                const uint64_t allocate64 = static_cast<uint64_t>(size) * count + pad + 20;
++                if ( allocate64 > io.size() ) {
+                     throw Error(kerInvalidMalloc);
+                 }
+-                DataBuf  buf((long)allocate);  // allocate a buffer
++                // Overflow check
++                enforce(allocate64 <= static_cast<uint64_t>(std::numeric_limits<uint32_t>::max()), kerCorruptedMetadata);
++                enforce(allocate64 <= static_cast<uint64_t>(std::numeric_limits<long>::max()), kerCorruptedMetadata);
++                const long allocate = static_cast<long>(allocate64);
++                DataBuf  buf(allocate);  // allocate a buffer
+                 std::memset(buf.pData_, 0, buf.size_);
+                 std::memcpy(buf.pData_,dir.pData_+8,4);  // copy dir[8:11] into buffer (short strings)
+-                const bool bOffsetIsPointer = count*size > 4;
++
++                // We have already checked that this multiplication cannot overflow.
++                const uint32_t count_x_size = count*size;
++                const bool bOffsetIsPointer = count_x_size > 4;
+ 
+                 if ( bOffsetIsPointer ) {         // read into buffer
+-                    size_t   restore = io.tell();  // save
+-                    io.seek(offset,BasicIo::beg);  // position
+-                    io.read(buf.pData_,count*size);// read
+-                    io.seek(restore,BasicIo::beg); // restore
++                    const long restore = io.tell(); // save
++                    seekOrThrow(io, offset, BasicIo::beg, kerCorruptedMetadata); // position
++                    readOrThrow(io, buf.pData_, static_cast<long>(count_x_size), kerCorruptedMetadata); // read
++                    seekOrThrow(io, restore, BasicIo::beg, kerCorruptedMetadata); // restore
+                 }
+ 
+                 if ( bPrint ) {
+@@ -463,10 +481,10 @@ namespace Exiv2 {
+ 
+                     if ( option == kpsRecursive && (tag == 0x8769 /* ExifTag */ || tag == 0x014a/*SubIFDs*/  || type == tiffIfd) ) {
+                         for ( size_t k = 0 ; k < count ; k++ ) {
+-                            size_t   restore = io.tell();
++                            const long restore = io.tell();
+                             uint32_t offset = byteSwap4(buf,k*size,bSwap);
+                             printIFDStructure(io,out,option,offset,bSwap,c,depth);
+-                            io.seek(restore,BasicIo::beg);
++                            seekOrThrow(io, restore, BasicIo::beg, kerCorruptedMetadata);
+                         }
+                     } else if ( option == kpsRecursive && tag == 0x83bb /* IPTCNAA */ ) {
+ 
+@@ -474,38 +492,38 @@ namespace Exiv2 {
+                             throw Error(kerCorruptedMetadata);
+                         }
+ 
+-                        const size_t restore = io.tell();
+-                        io.seek(offset, BasicIo::beg);  // position
++                        const long restore = io.tell();
++                        seekOrThrow(io, offset, BasicIo::beg, kerCorruptedMetadata);  // position
+                         std::vector<byte> bytes(count) ;  // allocate memory
+                         // TODO: once we have C++11 use bytes.data()
+-                        const long read_bytes = io.read(&bytes[0], count);
+-                        io.seek(restore, BasicIo::beg);
++                        readOrThrow(io, &bytes[0], count, kerCorruptedMetadata);
++                        seekOrThrow(io, restore, BasicIo::beg, kerCorruptedMetadata);
+                         // TODO: once we have C++11 use bytes.data()
+-                        IptcData::printStructure(out, makeSliceUntil(&bytes[0], read_bytes), depth);
++                        IptcData::printStructure(out, makeSliceUntil(&bytes[0], count), depth);
+ 
+                     }  else if ( option == kpsRecursive && tag == 0x927c /* MakerNote */ && count > 10) {
+-                        size_t   restore = io.tell();  // save
++                        const long restore = io.tell();  // save
+ 
+                         uint32_t jump= 10           ;
+                         byte     bytes[20]          ;
+                         const char* chars = (const char*) &bytes[0] ;
+-                        io.seek(offset,BasicIo::beg);  // position
+-                        io.read(bytes,jump    )     ;  // read
++                        seekOrThrow(io, offset, BasicIo::beg, kerCorruptedMetadata);  // position
++                        readOrThrow(io, bytes, jump, kerCorruptedMetadata)     ;  // read
+                         bytes[jump]=0               ;
+                         if ( ::strcmp("Nikon",chars) == 0 ) {
+                             // tag is an embedded tiff
+-                            byte* bytes=new byte[count-jump] ;  // allocate memory
+-                            io.read(bytes,count-jump)        ;  // read
+-                            MemIo memIo(bytes,count-jump)    ;  // create a file
++                            const long byteslen = count-jump;
++                            DataBuf bytes(byteslen);  // allocate a buffer
++                            readOrThrow(io, bytes.pData_, byteslen, kerCorruptedMetadata);  // read
++                            MemIo memIo(bytes.pData_, byteslen)    ;  // create a file
+                             printTiffStructure(memIo,out,option,depth);
+-                            delete[] bytes                   ;  // free
+                         } else {
+                             // tag is an IFD
+-                            io.seek(0,BasicIo::beg);  // position
++                            seekOrThrow(io, 0, BasicIo::beg, kerCorruptedMetadata);  // position
+                             printIFDStructure(io,out,option,offset,bSwap,c,depth);
+                         }
+ 
+-                        io.seek(restore,BasicIo::beg); // restore
++                        seekOrThrow(io, restore, BasicIo::beg, kerCorruptedMetadata); // restore
+                     }
+                 }
+ 
+@@ -518,7 +536,7 @@ namespace Exiv2 {
+                 }
+             }
+             if ( start ) {
+-                io.read(dir.pData_, 4);
++                readOrThrow(io, dir.pData_, 4, kerCorruptedMetadata);
+                 start = tooBig ? 0 : byteSwap4(dir,0,bSwap);
+             }
+         } while (start) ;
+@@ -538,7 +556,7 @@ namespace Exiv2 {
+             DataBuf  dir(dirSize);
+ 
+             // read header (we already know for certain that we have a Tiff file)
+-            io.read(dir.pData_,  8);
++            readOrThrow(io, dir.pData_,  8, kerCorruptedMetadata);
+             char c = (char) dir.pData_[0] ;
+             bool bSwap   = ( c == 'M' && isLittleEndianPlatform() )
+                         || ( c == 'I' && isBigEndianPlatform()    )
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 4001f1b639..eecd02d78a 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -28,6 +28,8 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-37619.patch \
            file://CVE-2021-37620-1.patch \
            file://CVE-2021-37620-2.patch \
+           file://CVE-2021-37621-1.patch \
+           file://CVE-2021-37621-2.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

