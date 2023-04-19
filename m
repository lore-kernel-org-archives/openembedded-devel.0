Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D00C77B7C
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 14:02:20 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.38663.1681912936767138648
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Apr 2023 07:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hOpHFuOR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20230419140213133ae1f0d2f21ebe85-6ucaqr@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20230419140213133ae1f0d2f21ebe85
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 19 Apr 2023 16:02:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=G76q5tr/mGOYfKGR4cJWuJ1YloXlFNZ7EteSsHiJXWg=;
 b=hOpHFuOR6uP3o2YsKl8Xl9yc5SSAj8U0CSjNrNHPMvmzuH9Ml8+KQ1H0iddJHNP0VjNZdn
 /iuO/lijJMg6g0TCG5/S6vOj9CEu1iTgd7Sfg0rBUsBBl0vqpokE+zc0PMe52ia8PQFqSrjp
 I/Uf9f2It2YXON4OAd2pcKMZ48/8g=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>,
	Virendra Thakur <virendra.thakur@kpit.com>,
	Armin Kuster <akuster808@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][mickledore][langdale][kirkstone][PATCH 1/2] p7zip: fix for CVE-2018-5996
Date: Wed, 19 Apr 2023 16:01:08 +0200
Message-Id: <20230419140109.58115-2-peter.marko@siemens.com>
In-Reply-To: <20230419140109.58115-1-peter.marko@siemens.com>
References: <20230419140109.58115-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 14:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102137

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2018-5996

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../p7zip/files/CVE-2018-5996.patch           | 227 ++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |   1 +
 2 files changed, 228 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
new file mode 100644
index 000000000..47868c982
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
@@ -0,0 +1,227 @@
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
+
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 04923116c..88cb13488 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
            file://change_numMethods_from_bool_to_unsigned.patch \
+           file://CVE-2018-5996.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-- 
2.30.2


