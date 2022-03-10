Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186DBC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 20:53:05 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.2037.1646945583973981637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 12:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KDSWShAb;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id h2so2133469pfh.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 12:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNEF3+Ks3BugHd8+f1VII6v3Uwpyg2s9mZOdSIEZ/c8=;
        b=KDSWShAbYMNHXpD+lTWhHPNyGcK1+65uvqmb/OPxS8aGt061zGaPjsFtMqUj2iTpSf
         EyPKgZWs590gGpGLe16MN1GB5jKdBzAI43VZ3RlKpHskIFsgi+rYNH7jgo+Jw1SQ6KeE
         uqTRknov4aHUZQeyVgIU+F2X2eLs1T9n72vQ1kFTSN5LXwaskZQep2Hpq1bw1wusP83S
         OSEEylJppwiyOamTh7lvSQclsuqhUgjxhioA4DCFsrv+leblDgE1Nr2NdVfx1Gd++xu9
         tD5Eo6ETEXPy6vHEc5CyT6vH78XP4UVuhKsuMVn2d8l4i1Pqk83udGlWn12Vpg8yLauX
         Ydew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNEF3+Ks3BugHd8+f1VII6v3Uwpyg2s9mZOdSIEZ/c8=;
        b=ZfPqce+vsK28252jgdL2Imv0EUuVeQjzB8/rBX/IuncVp62SZj3LZYBTRi3fPybKX5
         N3hDm8LuS8mgWF2l92AY1WyX50idI7Q+WeBb5SZkUNXMbWx3JHxSrDsGtxQlwfHbd9oN
         HACKTWAlwrxVvLzvfmI/Qqryd7OtXuo1pulosyJXsXSVc0QWONRmjaeaW8Eyvw+KAWtB
         pueR517Fyouec+1cUc6sK2Pr/35mAnvlmz/v8GACBAX+xqw/HRJaFtvajKvEJ72f0uM6
         +PikTnkoZx4SMp08gOCe0jwy/PO8LhqczwVASASLywZATfJRZ6Kz3H6wNi+BMzeLRR6l
         marQ==
X-Gm-Message-State: AOAM533WFyN5y9mSRoWVF+bhRAo5aWOKYScjLTfbHMv/l4v5wrBfsuNS
	j4HWbNZ64C2/6VUgQDOnHGLi0hQBzpA=
X-Google-Smtp-Source: 
 ABdhPJxR2eZLDMUVA2fL2qjBESUjrn3YFEcKtJMHeHyhl9l8b5hLhjL06wK831EzU4GYLU4AMHOW1A==
X-Received: by 2002:a65:6255:0:b0:364:4513:67bf with SMTP id
 q21-20020a656255000000b00364451367bfmr5706311pgv.64.1646945583186;
        Thu, 10 Mar 2022 12:53:03 -0800 (PST)
Received: from keaua.gch02.lax.wayport.net ([208.36.66.70])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a63e00b000000b0037341d979b8sm6543687pgh.94.2022.03.10.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 12:53:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.vom>
Subject: [meta-oe][dunfell][PATCH] p7zip: refresh patches
Date: Thu, 10 Mar 2022 12:53:01 -0800
Message-Id: <20220310205301.8239-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 20:53:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95943

From: Armin Kuster <akuster808@gmail.vom>

Signed-off-by: Armin Kuster <akuster808@gmail.vom>
---
 .../p7zip/files/CVE-2018-5996.patch           | 72 +++++++++----------
 ...nge_numMethods_from_bool_to_unsigned.patch | 14 ++--
 2 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
index 0de39e78bd..b6deb5d3a7 100644
--- a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
@@ -20,10 +20,10 @@ Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
  CPP/7zip/Compress/Rar3Decoder.h   |  2 ++
  6 files changed, 42 insertions(+), 8 deletions(-)
 
-diff --git a/CPP/7zip/Compress/Rar1Decoder.cpp b/CPP/7zip/Compress/Rar1Decoder.cpp
-index 1aaedcc..68030c7 100644
---- a/CPP/7zip/Compress/Rar1Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar1Decoder.cpp
+Index: p7zip_16.02/CPP/7zip/Compress/Rar1Decoder.cpp
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Compress/Rar1Decoder.cpp
++++ p7zip_16.02/CPP/7zip/Compress/Rar1Decoder.cpp
 @@ -29,7 +29,7 @@ public:
  };
  */
@@ -33,7 +33,7 @@ index 1aaedcc..68030c7 100644
  
  void CDecoder::InitStructures()
  {
-@@ -406,9 +406,14 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
+@@ -406,9 +406,14 @@ HRESULT CDecoder::CodeReal(ISequentialIn
    InitData();
    if (!m_IsSolid)
    {
@@ -48,7 +48,7 @@ index 1aaedcc..68030c7 100644
    if (m_UnpackSize > 0)
    {
      GetFlagsBuf();
-@@ -477,9 +482,9 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
+@@ -477,9 +482,9 @@ STDMETHODIMP CDecoder::Code(ISequentialI
      const UInt64 *inSize, const UInt64 *outSize, ICompressProgressInfo *progress)
  {
    try { return CodeReal(inStream, outStream, inSize, outSize, progress); }
@@ -61,10 +61,10 @@ index 1aaedcc..68030c7 100644
  }
  
  STDMETHODIMP CDecoder::SetDecoderProperties2(const Byte *data, UInt32 size)
-diff --git a/CPP/7zip/Compress/Rar1Decoder.h b/CPP/7zip/Compress/Rar1Decoder.h
-index 630f089..01b606b 100644
---- a/CPP/7zip/Compress/Rar1Decoder.h
-+++ b/CPP/7zip/Compress/Rar1Decoder.h
+Index: p7zip_16.02/CPP/7zip/Compress/Rar1Decoder.h
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Compress/Rar1Decoder.h
++++ p7zip_16.02/CPP/7zip/Compress/Rar1Decoder.h
 @@ -39,6 +39,7 @@ public:
  
    Int64 m_UnpackSize;
@@ -73,11 +73,11 @@ index 630f089..01b606b 100644
  
    UInt32 ReadBits(int numBits);
    HRESULT CopyBlock(UInt32 distance, UInt32 len);
-diff --git a/CPP/7zip/Compress/Rar2Decoder.cpp b/CPP/7zip/Compress/Rar2Decoder.cpp
-index b3f2b4b..0580c8d 100644
---- a/CPP/7zip/Compress/Rar2Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar2Decoder.cpp
-@@ -80,7 +80,8 @@ static const UInt32 kHistorySize = 1 << 20;
+Index: p7zip_16.02/CPP/7zip/Compress/Rar2Decoder.cpp
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Compress/Rar2Decoder.cpp
++++ p7zip_16.02/CPP/7zip/Compress/Rar2Decoder.cpp
+@@ -80,7 +80,8 @@ static const UInt32 kHistorySize = 1 <<
  static const UInt32 kWindowReservSize = (1 << 22) + 256;
  
  CDecoder::CDecoder():
@@ -87,7 +87,7 @@ index b3f2b4b..0580c8d 100644
  {
  }
  
-@@ -100,6 +101,8 @@ UInt32 CDecoder::ReadBits(unsigned numBits) { return m_InBitStream.ReadBits(numB
+@@ -100,6 +101,8 @@ UInt32 CDecoder::ReadBits(unsigned numBi
  
  bool CDecoder::ReadTables(void)
  {
@@ -105,7 +105,7 @@ index b3f2b4b..0580c8d 100644
    return true;
  }
  
-@@ -344,6 +349,9 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
+@@ -344,6 +349,9 @@ HRESULT CDecoder::CodeReal(ISequentialIn
        return S_FALSE;
    }
  
@@ -115,10 +115,10 @@ index b3f2b4b..0580c8d 100644
    UInt64 startPos = m_OutWindowStream.GetProcessedSize();
    while (pos < unPackSize)
    {
-diff --git a/CPP/7zip/Compress/Rar2Decoder.h b/CPP/7zip/Compress/Rar2Decoder.h
-index 3a0535c..0e9005f 100644
---- a/CPP/7zip/Compress/Rar2Decoder.h
-+++ b/CPP/7zip/Compress/Rar2Decoder.h
+Index: p7zip_16.02/CPP/7zip/Compress/Rar2Decoder.h
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Compress/Rar2Decoder.h
++++ p7zip_16.02/CPP/7zip/Compress/Rar2Decoder.h
 @@ -139,6 +139,7 @@ class CDecoder :
  
    UInt64 m_PackSize;
@@ -127,10 +127,10 @@ index 3a0535c..0e9005f 100644
  
    void InitStructures();
    UInt32 ReadBits(unsigned numBits);
-diff --git a/CPP/7zip/Compress/Rar3Decoder.cpp b/CPP/7zip/Compress/Rar3Decoder.cpp
-index 3bf2513..6cb8a6a 100644
---- a/CPP/7zip/Compress/Rar3Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar3Decoder.cpp
+Index: p7zip_16.02/CPP/7zip/Compress/Rar3Decoder.cpp
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Compress/Rar3Decoder.cpp
++++ p7zip_16.02/CPP/7zip/Compress/Rar3Decoder.cpp
 @@ -92,7 +92,8 @@ CDecoder::CDecoder():
    _writtenFileSize(0),
    _vmData(0),
@@ -141,7 +141,7 @@ index 3bf2513..6cb8a6a 100644
  {
    Ppmd7_Construct(&_ppmd);
  }
-@@ -545,6 +546,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
+@@ -545,6 +546,9 @@ HRESULT CDecoder::ReadTables(bool &keepD
      return InitPPM();
    }
  
@@ -151,7 +151,7 @@ index 3bf2513..6cb8a6a 100644
    _lzMode = true;
    PrevAlignBits = 0;
    PrevAlignCount = 0;
-@@ -606,6 +610,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
+@@ -606,6 +610,9 @@ HRESULT CDecoder::ReadTables(bool &keepD
        }
      }
    }
@@ -161,7 +161,7 @@ index 3bf2513..6cb8a6a 100644
    TablesRead = true;
  
    // original code has check here:
-@@ -623,6 +630,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
+@@ -623,6 +630,9 @@ HRESULT CDecoder::ReadTables(bool &keepD
    RIF(m_LenDecoder.Build(&newLevels[kMainTableSize + kDistTableSize + kAlignTableSize]));
  
    memcpy(m_LastLevels, newLevels, kTablesSizesSum);
@@ -171,7 +171,7 @@ index 3bf2513..6cb8a6a 100644
    return S_OK;
  }
  
-@@ -824,7 +834,12 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
+@@ -824,7 +834,12 @@ HRESULT CDecoder::CodeReal(ICompressProg
      PpmEscChar = 2;
      PpmError = true;
      InitFilters();
@@ -184,7 +184,7 @@ index 3bf2513..6cb8a6a 100644
    if (!m_IsSolid || !TablesRead)
    {
      bool keepDecompressing;
-@@ -838,6 +853,8 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
+@@ -838,6 +853,8 @@ HRESULT CDecoder::CodeReal(ICompressProg
      bool keepDecompressing;
      if (_lzMode)
      {
@@ -193,7 +193,7 @@ index 3bf2513..6cb8a6a 100644
        RINOK(DecodeLZ(keepDecompressing))
      }
      else
-@@ -901,8 +918,8 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
+@@ -901,8 +918,8 @@ STDMETHODIMP CDecoder::Code(ISequentialI
      _unpackSize = outSize ? *outSize : (UInt64)(Int64)-1;
      return CodeReal(progress);
    }
@@ -204,10 +204,10 @@ index 3bf2513..6cb8a6a 100644
    // CNewException is possible here. But probably CNewException is caused
    // by error in data stream.
  }
-diff --git a/CPP/7zip/Compress/Rar3Decoder.h b/CPP/7zip/Compress/Rar3Decoder.h
-index c130cec..2f72d7d 100644
---- a/CPP/7zip/Compress/Rar3Decoder.h
-+++ b/CPP/7zip/Compress/Rar3Decoder.h
+Index: p7zip_16.02/CPP/7zip/Compress/Rar3Decoder.h
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Compress/Rar3Decoder.h
++++ p7zip_16.02/CPP/7zip/Compress/Rar3Decoder.h
 @@ -192,6 +192,7 @@ class CDecoder:
    UInt32 _lastFilter;
  
@@ -223,4 +223,4 @@ index c130cec..2f72d7d 100644
 +  bool TablesOK;
  
    CPpmd7 _ppmd;
-   int PpmEscChar;
\ No newline at end of file
+   int PpmEscChar;
diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
index edde525933..dcde83e8a4 100644
--- a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
+++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
@@ -12,14 +12,16 @@ use unsigned instead of bool
 Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
 
 Upstream-Status: Pending
---- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402701 +0000
-+++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604125 +0000
-@@ -298,7 +298,7 @@
-
+Index: p7zip_16.02/CPP/7zip/Archive/Wim/WimHandler.cpp
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Archive/Wim/WimHandler.cpp
++++ p7zip_16.02/CPP/7zip/Archive/Wim/WimHandler.cpp
+@@ -298,7 +298,7 @@ STDMETHODIMP CHandler::GetArchivePropert
+ 
        AString res;
-
+ 
 -      bool numMethods = 0;
 +      unsigned numMethods = 0;
        for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
        {
-         if (methodMask & ((UInt32)1 << i
+         if (methodMask & ((UInt32)1 << i))
-- 
2.25.1


