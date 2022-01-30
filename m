Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AF0C433F5
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 11:35:41 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.17823.1643542541081723036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 03:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bdmyPU+w;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so15378568pjj.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 03:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=O+1xVS4sohuIpI9lufZ+mB0ql5gDYrwBD1aAwV84JEA=;
        b=bdmyPU+wI1yFp0sm5xNKSvDtkgLjDV+vS0pPq1UqDLjY64O11biHBpA0HUeMhXe2nz
         kx9LVLm3A46lpnPlo+Q9umJfCzfuIN+lb0TjiTxwJ5qqs61IVwMnYZ+/qTrRe3DXScv9
         EU25T8g3HZqRgoDx5vms51FKUISqREIvy4y8W8bM1UBfi07LrvdyBVWFIfcVyoc4nfGJ
         DE7gBSLI37r2NImPVtK7/Sr1a/3oi4nYs4fn7H1VfYELIUr/jvl0z5nr8JSPyrZxpNPe
         9W5uDgMsLJvdMNS6v7boXKkRrO1rocZY0CTmgIDnhMw8sKLObYClh1AIxUdZkrK8QxSZ
         +fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=O+1xVS4sohuIpI9lufZ+mB0ql5gDYrwBD1aAwV84JEA=;
        b=M1b6AlZQIAY0WuX88oUuxRNdVeyCrfc0FU4I8rGIow0bFMuy2yE/HSC1VKb64pzn/a
         UO97FT+6U7YTmogM71DwyF2zSQZYFpIos/t1Y1YOtQCrddm0Tp6nrxxGg4AcZN7NE4OV
         CVA6jAH8T/0Z3MsMsXlDMCXTxNCI3Mw/M28Jelcxc8gFlZgzyMrEMkHt3TvUU0FbsLVw
         SyLq5ti6srcX8218EzaHgAxN0DCMxZeic3WOlfyIKc4V3nOEjj0YBh58ZjJM3chG1P1f
         RszqCaPWgkQlU/inEBmnlVnScoR22ADW/naqLvHHW4pNDdYzJHZmj4pEyJ4d6gyfU/PK
         vyhg==
X-Gm-Message-State: AOAM532ZMpGDxZ26+1qVD0Nrnjt1R4nvnHL5ITJcaMCboE1YpqW+nbpb
	mfwmIAu9Fl750/eMac+HCY2bNS6WoM8YKg==
X-Google-Smtp-Source: 
 ABdhPJz7hu1azPyHFrdsW0fBKOevAuIOUdfIvD8By9GNWOuj4eJOG2zueH1bDCcYCwntphOttbhxUg==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr19025992pjb.211.1643542540362;
        Sun, 30 Jan 2022 03:35:40 -0800 (PST)
Received: from localhost.localdomain ([182.70.13.181])
        by smtp.gmail.com with ESMTPSA id
 x17sm14098810pfu.135.2022.01.30.03.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 03:35:40 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Virendra Thakur <virendrak@kpit.com>,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH] p7zip: fix for CVE-2018-5996
Date: Sun, 30 Jan 2022 17:05:00 +0530
Message-Id: <20220130113500.5536-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jan 2022 11:35:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95176

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2018-5996

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 .../p7zip/files/CVE-2018-5996.patch           | 226 ++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
new file mode 100644
index 000000000..0de39e78b
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
@@ -0,0 +1,226 @@
+From: Robert Luberda <robert@debian.org>
+Date: Sun, 28 Jan 2018 23:47:40 +0100
+Subject: CVE-2018-5996
+
+Hopefully fix Memory Corruptions via RAR PPMd (CVE-2018-5996) by
+applying a few changes from 7Zip 18.00-beta.
+
+Bug-Debian: https://bugs.debian.org/#888314
+
+Upstream-Status: Backport [https://sources.debian.org/data/non-free/p/p7zip-rar/16.02-3/debian/patches/06-CVE-2018-5996.patch]
+CVE: CVE-2018-5996
+
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
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
\ No newline at end of file
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 13479a90f..ebe32f1a0 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://do_not_override_compiler_and_do_not_strip.patch \
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
+           file://CVE-2018-5996.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-- 
2.17.1


