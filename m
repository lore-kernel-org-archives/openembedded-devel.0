Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC55AC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 18:49:07 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.27904.1704472593953621001
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 08:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPFf5Zxo;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: mail2szahir@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ce10b5ee01so500617a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 08:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704472593; x=1705077393; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/10xnH6IhJKIW86FbVZ+0U3G79nV7Ar62SyvOVw2io=;
        b=cPFf5ZxowqAP5pIA75EXv1eH5PJ2c/8odIqPQUtVZe/E3dJ7NZjA/N9hPKC4ll/Hb2
         am3Ov+37ATejHG23yehfYt2j5drkN6unPSAUsL+GrK16CXARgSH3+lacC0XH6RZMc04S
         gaJeCOxxukLJCs7p9CI7LyNrOPASqAVDvJp7oJ4Vl/VIV99pHSzvfPglURZzi/Izw44U
         ASdcir5336pR+PQfMMMi0sM7S8/j7RdBXkAUsXRaqjO+ZLkvRoLfNvikyihrAZDb00J1
         4hcKRRTiHfnqnCTKX0VXye7EvDlLnnXxb3psUUnUVP3cuUwdZ2tEiUT2mN0efLrkbkgf
         iHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704472593; x=1705077393;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/10xnH6IhJKIW86FbVZ+0U3G79nV7Ar62SyvOVw2io=;
        b=elG6NhWy/MpGYXSZYNtGhUaPpoCFp4L4SymR0XuvLAg4Sxmhj2w2Kb3whJjVfkDvQg
         WoUDvj94Xf4RinlN7yFEqN0dCYGqE1m+X+0whBwCEzxPqCopY7EAtfxnr8IfdiiIs6dq
         /kqEFTF+i4YHho++pntTwawxVFgDdzvq0bmtJjdWvErpW27YWGSs3WCBE7ojX16UZe4h
         bL1/BL7Sb7kF1cSHbN2J3AouC/06aMzpaSkwMhU00mnxhWixHmvasw9gP934XSvPSU7b
         /ZFxvCFKY6/bQWA8Hs4fKvQ7rJnzBpb+0XlqtGlNmv7D98NXQY7hR/IoJxrbBWoBThwN
         6PjA==
X-Gm-Message-State: AOJu0YyUHabxFDOLSi+/zW9NPuyjoJwEWYJaTeAnLmazyrnCATf7co8d
	gACHbjFN3ImWfaXaImGkvI7DKObIbr4=
X-Google-Smtp-Source: AGHT+IFIQ5pXLGgpFqwcIYAwfG+o+BEwqmpbK+Ado9/eeo6ruDbNa2iL5fBw3o1y37oB6tbwZASaNA==
X-Received: by 2002:a05:6a20:394f:b0:199:3b59:1dc8 with SMTP id r15-20020a056a20394f00b001993b591dc8mr1290811pzg.18.1704472592962;
        Fri, 05 Jan 2024 08:36:32 -0800 (PST)
Received: from localhost.localdomain ([49.43.249.163])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a0010cd00b006d9c1fb00c3sm1589008pfu.9.2024.01.05.08.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 08:36:32 -0800 (PST)
From: "aszh07" <mail2szahir@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Zahir.Basha@kpit.com
Cc: akash.hadke@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [meta-oe][kirkstone][PATCH] p7zip: fix CVE-2018-5996 & CVE-2016-9296
Date: Fri,  5 Jan 2024 22:02:46 +0530
Message-Id: <20240105163246.22192-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 18:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108052

From: Zahir Hussain <zahir.basha@kpit.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2018-5996
https://nvd.nist.gov/vuln/detail/CVE-2016-9296

Upstream patches:
https://sources.debian.org/data/non-free/p/p7zip-rar/16.02-3/debian/patches/06-CVE-2018-5996.patch
https://snapshot.debian.org/archive/debian-debug/20180205T215659Z/pool/main/p/p7zip/p7zip_16.02%2Bdfsg-6.debian.tar.xz

Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 .../p7zip/files/CVE-2016-9296.patch           |  30 +++
 .../p7zip/files/CVE-2018-5996.patch           | 228 ++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |   2 +
 3 files changed, 260 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
new file mode 100644
index 000000000..42ea716be
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
@@ -0,0 +1,30 @@
+From: Robert Luberda <robert@debian.org>
+Date: Sat, 19 Nov 2016 08:48:08 +0100
+Subject: Fix nullptr dereference (CVE-2016-9296)
+
+Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
+
+CVE: CVE-2016-9296
+
+Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-debug/20180205T215659Z/pool/main/p/p7zip/p7zip_16.02%2Bdfsg-6.debian.tar.xz]
+
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+Signed-off-by: aszh07 <mail2szahir@gmail.com>
+---
+ CPP/7zip/Archive/7z/7zIn.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CPP/7zip/Archive/7z/7zIn.cpp b/CPP/7zip/Archive/7z/7zIn.cpp
+index b0c6b98..7c6dde2 100644
+--- a/CPP/7zip/Archive/7z/7zIn.cpp
++++ b/CPP/7zip/Archive/7z/7zIn.cpp
+@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedStreams(
+       if (CrcCalc(data, unpackSize) != folders.FolderCRCs.Vals[i])
+         ThrowIncorrect();
+   }
+-  HeadersSize += folders.PackPositions[folders.NumPackStreams];
++  if (folders.PackPositions)
++      HeadersSize += folders.PackPositions[folders.NumPackStreams];
+   return S_OK;
+ }
+ 
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
new file mode 100644
index 000000000..6b337b8d2
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
@@ -0,0 +1,228 @@
+From: Robert Luberda <robert@debian.org>
+Date: Sun, 28 Jan 2018 23:47:40 +0100
+Subject: CVE-2018-5996
+
+Hopefully fix Memory Corruptions via RAR PPMd (CVE-2018-5996) by
+applying a few changes from 7Zip 18.00-beta.
+
+Bug-Debian: https://bugs.debian.org/#888314
+
+CVE: CVE-2018-5996
+
+Upstream-Status: Backport [https://sources.debian.org/data/non-free/p/p7zip-rar/16.02-3/debian/patches/06-CVE-2018-5996.patch]
+
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+Signed-off-by: aszh07 <mail2szahir@gmail.com>
+---
+ CPP/7zip/Compress/Rar1Decoder.cpp | 13 +++++++++----
+ CPP/7zip/Compress/Rar1Decoder.h   |  1 +
+ CPP/7zip/Compress/Rar2Decoder.cpp | 10 +++++++++-
+ CPP/7zip/Compress/Rar2Decoder.h   |  1 +
+ CPP/7zip/Compress/Rar3Decoder.cpp | 23 ++++++++++++++++++++---
+ CPP/7zip/Compress/Rar3Decoder.h   |  2 ++
+ 6 files changed, 42 insertions(+), 8 deletions(-)
+
+diff --git a/CPP/7zip/Compress/Rar1Decoder.cpp b/CPP/7zip/Compress/Rar1Decoder.cpp
+index 1aaedcc..68030c7 100644
+--- a/CPP/7zip/Compress/Rar1Decoder.cpp
++++ b/CPP/7zip/Compress/Rar1Decoder.cpp
+@@ -29,7 +29,7 @@ public:
+ };
+ */
+ 
+-CDecoder::CDecoder(): m_IsSolid(false) { }
++CDecoder::CDecoder(): m_IsSolid(false), _errorMode(false) { }
+ 
+ void CDecoder::InitStructures()
+ {
+@@ -406,9 +406,14 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
+   InitData();
+   if (!m_IsSolid)
+   {
++    _errorMode = false;
+     InitStructures();
+     InitHuff();
+   }
++
++  if (_errorMode)
++    return S_FALSE;
++
+   if (m_UnpackSize > 0)
+   {
+     GetFlagsBuf();
+@@ -477,9 +482,9 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
+     const UInt64 *inSize, const UInt64 *outSize, ICompressProgressInfo *progress)
+ {
+   try { return CodeReal(inStream, outStream, inSize, outSize, progress); }
+-  catch(const CInBufferException &e) { return e.ErrorCode; }
+-  catch(const CLzOutWindowException &e) { return e.ErrorCode; }
+-  catch(...) { return S_FALSE; }
++  catch(const CInBufferException &e) { _errorMode = true; return e.ErrorCode; }
++  catch(const CLzOutWindowException &e) { _errorMode = true; return e.ErrorCode; }
++  catch(...) { _errorMode = true; return S_FALSE; }
+ }
+ 
+ STDMETHODIMP CDecoder::SetDecoderProperties2(const Byte *data, UInt32 size)
+diff --git a/CPP/7zip/Compress/Rar1Decoder.h b/CPP/7zip/Compress/Rar1Decoder.h
+index 630f089..01b606b 100644
+--- a/CPP/7zip/Compress/Rar1Decoder.h
++++ b/CPP/7zip/Compress/Rar1Decoder.h
+@@ -39,6 +39,7 @@ public:
+ 
+   Int64 m_UnpackSize;
+   bool m_IsSolid;
++  bool _errorMode;
+ 
+   UInt32 ReadBits(int numBits);
+   HRESULT CopyBlock(UInt32 distance, UInt32 len);
+diff --git a/CPP/7zip/Compress/Rar2Decoder.cpp b/CPP/7zip/Compress/Rar2Decoder.cpp
+index b3f2b4b..0580c8d 100644
+--- a/CPP/7zip/Compress/Rar2Decoder.cpp
++++ b/CPP/7zip/Compress/Rar2Decoder.cpp
+@@ -80,7 +80,8 @@ static const UInt32 kHistorySize = 1 << 20;
+ static const UInt32 kWindowReservSize = (1 << 22) + 256;
+ 
+ CDecoder::CDecoder():
+-  m_IsSolid(false)
++  m_IsSolid(false),
++  m_TablesOK(false)
+ {
+ }
+ 
+@@ -100,6 +101,8 @@ UInt32 CDecoder::ReadBits(unsigned numBits) { return m_InBitStream.ReadBits(numB
+ 
+ bool CDecoder::ReadTables(void)
+ {
++  m_TablesOK = false;
++
+   Byte levelLevels[kLevelTableSize];
+   Byte newLevels[kMaxTableSize];
+   m_AudioMode = (ReadBits(1) == 1);
+@@ -170,6 +173,8 @@ bool CDecoder::ReadTables(void)
+   }
+   
+   memcpy(m_LastLevels, newLevels, kMaxTableSize);
++  m_TablesOK = true;
++
+   return true;
+ }
+ 
+@@ -344,6 +349,9 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
+       return S_FALSE;
+   }
+ 
++  if (!m_TablesOK)
++    return S_FALSE;
++
+   UInt64 startPos = m_OutWindowStream.GetProcessedSize();
+   while (pos < unPackSize)
+   {
+diff --git a/CPP/7zip/Compress/Rar2Decoder.h b/CPP/7zip/Compress/Rar2Decoder.h
+index 3a0535c..0e9005f 100644
+--- a/CPP/7zip/Compress/Rar2Decoder.h
++++ b/CPP/7zip/Compress/Rar2Decoder.h
+@@ -139,6 +139,7 @@ class CDecoder :
+ 
+   UInt64 m_PackSize;
+   bool m_IsSolid;
++  bool m_TablesOK;
+ 
+   void InitStructures();
+   UInt32 ReadBits(unsigned numBits);
+diff --git a/CPP/7zip/Compress/Rar3Decoder.cpp b/CPP/7zip/Compress/Rar3Decoder.cpp
+index 3bf2513..6cb8a6a 100644
+--- a/CPP/7zip/Compress/Rar3Decoder.cpp
++++ b/CPP/7zip/Compress/Rar3Decoder.cpp
+@@ -92,7 +92,8 @@ CDecoder::CDecoder():
+   _writtenFileSize(0),
+   _vmData(0),
+   _vmCode(0),
+-  m_IsSolid(false)
++  m_IsSolid(false),
++  _errorMode(false)
+ {
+   Ppmd7_Construct(&_ppmd);
+ }
+@@ -545,6 +546,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
+     return InitPPM();
+   }
+ 
++  TablesRead = false;
++  TablesOK = false;
++
+   _lzMode = true;
+   PrevAlignBits = 0;
+   PrevAlignCount = 0;
+@@ -606,6 +610,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
+       }
+     }
+   }
++  if (InputEofError())
++    return S_FALSE;
++
+   TablesRead = true;
+ 
+   // original code has check here:
+@@ -623,6 +630,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
+   RIF(m_LenDecoder.Build(&newLevels[kMainTableSize + kDistTableSize + kAlignTableSize]));
+ 
+   memcpy(m_LastLevels, newLevels, kTablesSizesSum);
++
++  TablesOK = true;
++
+   return S_OK;
+ }
+ 
+@@ -824,7 +834,12 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
+     PpmEscChar = 2;
+     PpmError = true;
+     InitFilters();
++    _errorMode = false;
+   }
++
++  if (_errorMode)
++    return S_FALSE;
++
+   if (!m_IsSolid || !TablesRead)
+   {
+     bool keepDecompressing;
+@@ -838,6 +853,8 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
+     bool keepDecompressing;
+     if (_lzMode)
+     {
++      if (!TablesOK)
++        return S_FALSE;
+       RINOK(DecodeLZ(keepDecompressing))
+     }
+     else
+@@ -901,8 +918,8 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
+     _unpackSize = outSize ? *outSize : (UInt64)(Int64)-1;
+     return CodeReal(progress);
+   }
+-  catch(const CInBufferException &e)  { return e.ErrorCode; }
+-  catch(...) { return S_FALSE; }
++  catch(const CInBufferException &e)  { _errorMode = true; return e.ErrorCode; }
++  catch(...) { _errorMode = true; return S_FALSE; }
+   // CNewException is possible here. But probably CNewException is caused
+   // by error in data stream.
+ }
+diff --git a/CPP/7zip/Compress/Rar3Decoder.h b/CPP/7zip/Compress/Rar3Decoder.h
+index c130cec..2f72d7d 100644
+--- a/CPP/7zip/Compress/Rar3Decoder.h
++++ b/CPP/7zip/Compress/Rar3Decoder.h
+@@ -192,6 +192,7 @@ class CDecoder:
+   UInt32 _lastFilter;
+ 
+   bool m_IsSolid;
++  bool _errorMode;
+ 
+   bool _lzMode;
+   bool _unsupportedFilter;
+@@ -200,6 +201,7 @@ class CDecoder:
+   UInt32 PrevAlignCount;
+ 
+   bool TablesRead;
++  bool TablesOK;
+ 
+   CPpmd7 _ppmd;
+   int PpmEscChar;
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 04923116c..e795482eb 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -10,6 +10,8 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
            file://change_numMethods_from_bool_to_unsigned.patch \
+           file://CVE-2018-5996.patch \
+           file://CVE-2016-9296.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-- 
2.17.1


