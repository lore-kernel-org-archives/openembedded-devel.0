Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A95D75E49
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:46:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24302.1732283203330515689
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 05:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105629bf38=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMAIiX3024037
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 05:46:43 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7xv00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 05:46:42 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 22 Nov 2024 05:46:42 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 22 Nov 2024 05:46:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH] p7zip: fix CVE-2023-52169 and CVE-2023-52168
Date: Fri, 22 Nov 2024 21:46:40 +0800
Message-ID: <20241122134640.2061966-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sD_l7qL2P6Kv1bIYoO5eGk4w0OWuReq2
X-Proofpoint-GUID: sD_l7qL2P6Kv1bIYoO5eGk4w0OWuReq2
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=67408b42 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=rSOwsd83AAAA:8 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=ZeHzwlFx6R48Dl661EMA:9
 a=z6duCZvG03gA:10 a=rfQBsaRwJpcA:10 a=h9rF45_IxnQrhvPb0Vt3:22 a=u88H62rNFFGbxZIp_uAB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_06,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 13:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113999

According to [1][2], Igor Pavlov, the author of 7-Zip, refused to
provide an advisory or any related change log entries. Have to
backport a part of ./CPP/7zip/Archive/NtfsHandler.cpp from upstream
big commit https://github.com/ip7z/7zip/commit/fc662341e6f85da78ada0e443f6116b978f79f22

[1] https://dfir.ru/2024/06/19/vulnerabilities-in-7-zip-and-ntfs3/
[2] https://dfir.ru/wp-content/uploads/2024/07/screenshot-2024-07-03-at-02-13-40-7-zip-_-bugs-_-2402-two-vulnerabilities-in-the-ntfs-handler.png

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-two-buffer-overflow-vulnerabilities.patch | 455 ++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |   1 +
 2 files changed, 456 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch b/meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch
new file mode 100644
index 0000000000..d149c34134
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch
@@ -0,0 +1,455 @@
+From 1f266347b154ed90b8262126f04e8cc8f59fa617 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 22 Nov 2024 21:25:21 +0800
+Subject: [PATCH] Fix two buffer overflow vulnerabilities
+
+According to [1][2], Igor Pavlov, the author of 7-Zip, refused to
+provide an advisory or any related change log entries. We have to
+backport a part of ./CPP/7zip/Archive/NtfsHandler.cpp from upstream
+big commit
+
+Upstream-Status: Backport [https://github.com/ip7z/7zip/commit/fc662341e6f85da78ada0e443f6116b978f79f22]
+
+[1] https://dfir.ru/2024/06/19/vulnerabilities-in-7-zip-and-ntfs3/
+[2] https://dfir.ru/wp-content/uploads/2024/07/screenshot-2024-07-03-at-02-13-40-7-zip-_-bugs-_-2402-two-vulnerabilities-in-the-ntfs-handler.png
+
+CVE: CVE-2023-52169
+CVE: CVE-2023-52168
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CPP/7zip/Archive/NtfsHandler.cpp | 229 ++++++++++++++++++++-----------
+ 1 file changed, 151 insertions(+), 78 deletions(-)
+
+diff --git a/CPP/7zip/Archive/NtfsHandler.cpp b/CPP/7zip/Archive/NtfsHandler.cpp
+index 93e9f88..2701439 100644
+--- a/CPP/7zip/Archive/NtfsHandler.cpp
++++ b/CPP/7zip/Archive/NtfsHandler.cpp
+@@ -71,8 +71,9 @@ struct CHeader
+ {
+   unsigned SectorSizeLog;
+   unsigned ClusterSizeLog;
++  unsigned MftRecordSizeLog;
+   // Byte MediaType;
+-  UInt32 NumHiddenSectors;
++  //UInt32 NumHiddenSectors;
+   UInt64 NumSectors;
+   UInt64 NumClusters;
+   UInt64 MftCluster;
+@@ -111,30 +112,42 @@ bool CHeader::Parse(const Byte *p)
+   if (memcmp(p + 3, "NTFS    ", 8) != 0)
+     return false;
+   {
+-    int t = GetLog(Get16(p + 11));
+-    if (t < 9 || t > 12)
+-      return false;
+-    SectorSizeLog = t;
+-    t = GetLog(p[13]);
+-    if (t < 0)
+-      return false;
+-    sectorsPerClusterLog = t;
+-    ClusterSizeLog = SectorSizeLog + sectorsPerClusterLog;
+-    if (ClusterSizeLog > 30)
+-      return false;
++    {
++      const int t = GetLog(Get16(p + 11));
++      if (t < 9 || t > 12)
++        return false;
++      SectorSizeLog = (unsigned)t;
++    }
++    {
++      const unsigned v = p[13];
++      if (v <= 0x80)
++      {
++        const int t = GetLog(v);
++        if (t < 0)
++          return false;
++        sectorsPerClusterLog = (unsigned)t;
++      }
++      else
++        sectorsPerClusterLog = 0x100 - v;
++      ClusterSizeLog = SectorSizeLog + sectorsPerClusterLog;
++      if (ClusterSizeLog > 30)
++        return false;
++    }
+   }
+ 
+   for (int i = 14; i < 21; i++)
+     if (p[i] != 0)
+       return false;
+ 
++  // F8 : a hard disk
++  // F0 : high-density 3.5-inch floppy disk
+   if (p[21] != 0xF8) // MediaType = Fixed_Disk
+     return false;
+   if (Get16(p + 22) != 0) // NumFatSectors
+     return false;
+-  G16(p + 24, SectorsPerTrack); // 63 usually
+-  G16(p + 26, NumHeads); // 255
+-  G32(p + 28, NumHiddenSectors); // 63 (XP) / 2048 (Vista and win7) / (0 on media that are not partitioned ?)
++  // G16(p + 24, SectorsPerTrack); // 63 usually
++  // G16(p + 26, NumHeads); // 255
++  // G32(p + 28, NumHiddenSectors); // 63 (XP) / 2048 (Vista and win7) / (0 on media that are not partitioned ?)
+   if (Get32(p + 32) != 0) // NumSectors32
+     return false;
+ 
+@@ -156,14 +169,47 @@ bool CHeader::Parse(const Byte *p)
+ 
+   NumClusters = NumSectors >> sectorsPerClusterLog;
+ 
+-  G64(p + 0x30, MftCluster);
++  G64(p + 0x30, MftCluster);   // $MFT.
+   // G64(p + 0x38, Mft2Cluster);
+-  G64(p + 0x48, SerialNumber);
+-  UInt32 numClustersInMftRec;
+-  UInt32 numClustersInIndexBlock;
+-  G32(p + 0x40, numClustersInMftRec); // -10 means 2 ^10 = 1024 bytes.
+-  G32(p + 0x44, numClustersInIndexBlock);
+-  return (numClustersInMftRec < 256 && numClustersInIndexBlock < 256);
++  G64(p + 0x48, SerialNumber); // $MFTMirr
++
++  /*
++    numClusters_per_MftRecord:
++    numClusters_per_IndexBlock:
++    only low byte from 4 bytes is used. Another 3 high bytes are zeros.
++      If the number is positive (number < 0x80),
++          then it represents the number of clusters.
++      If the number is negative (number >= 0x80),
++          then the size of the file record is 2 raised to the absolute value of this number.
++          example: (0xF6 == -10) means 2^10 = 1024 bytes.
++  */
++  {
++    UInt32 numClusters_per_MftRecord;
++    G32(p + 0x40, numClusters_per_MftRecord);
++    if (numClusters_per_MftRecord >= 0x100 || numClusters_per_MftRecord == 0)
++      return false;
++    if (numClusters_per_MftRecord < 0x80)
++    {
++      const int t = GetLog(numClusters_per_MftRecord);
++      if (t < 0)
++        return false;
++      MftRecordSizeLog = (unsigned)t + ClusterSizeLog;
++    }
++    else
++      MftRecordSizeLog = 0x100 - numClusters_per_MftRecord;
++    // what exact MFT record sizes are possible and supported by Windows?
++    // do we need to change this limit here?
++    const unsigned k_MftRecordSizeLog_MAX = 12;
++    if (MftRecordSizeLog > k_MftRecordSizeLog_MAX)
++      return false;
++    if (MftRecordSizeLog < SectorSizeLog)
++      return false;
++  }
++  {
++    UInt32 numClusters_per_IndexBlock;
++    G32(p + 0x44, numClusters_per_IndexBlock);
++    return (numClusters_per_IndexBlock < 0x100);
++  }
+ }
+ 
+ struct CMftRef
+@@ -235,7 +281,7 @@ struct CFileNameAttr
+   bool Parse(const Byte *p, unsigned size);
+ };
+ 
+-static void GetString(const Byte *p, unsigned len, UString2 &res)
++static void GetString(const Byte *p, const unsigned len, UString2 &res)
+ {
+   if (len == 0 && res.IsEmpty())
+     return;
+@@ -266,8 +312,8 @@ bool CFileNameAttr::Parse(const Byte *p, unsigned size)
+   G32(p + 0x38, Attrib);
+   // G16(p + 0x3C, PackedEaSize);
+   NameType = p[0x41];
+-  unsigned len = p[0x40];
+-  if (0x42 + len > size)
++  const unsigned len = p[0x40];
++  if (0x42 + len * 2 > size)
+     return false;
+   if (len != 0)
+     GetString(p + 0x42, len, Name);
+@@ -954,6 +1000,14 @@ struct CDataRef
+ static const UInt32 kMagic_FILE = 0x454C4946;
+ static const UInt32 kMagic_BAAD = 0x44414142;
+ 
++// 22.02: we support some rare case magic values:
++static const UInt32 kMagic_INDX = 0x58444e49;
++static const UInt32 kMagic_HOLE = 0x454c4f48;
++static const UInt32 kMagic_RSTR = 0x52545352;
++static const UInt32 kMagic_RCRD = 0x44524352;
++static const UInt32 kMagic_CHKD = 0x444b4843;
++static const UInt32 kMagic_FFFFFFFF = 0xFFFFFFFF;
++
+ struct CMftRec
+ {
+   UInt32 Magic;
+@@ -1030,6 +1084,26 @@ struct CMftRec
+ 
+   bool Parse(Byte *p, unsigned sectorSizeLog, UInt32 numSectors, UInt32 recNumber, CObjectVector<CAttr> *attrs);
+ 
++  bool Is_Magic_Empty() const
++  {
++    // what exact Magic values are possible for empty and unused records?
++    const UInt32 k_Magic_Unused_MAX = 5; // 22.02
++    return (Magic <= k_Magic_Unused_MAX);
++  }
++  bool Is_Magic_FILE() const { return (Magic == kMagic_FILE); }
++  // bool Is_Magic_BAAD() const { return (Magic == kMagic_BAAD); }
++  bool Is_Magic_CanIgnore() const
++  {
++    return Is_Magic_Empty()
++        || Magic == kMagic_BAAD
++        || Magic == kMagic_INDX
++        || Magic == kMagic_HOLE
++        || Magic == kMagic_RSTR
++        || Magic == kMagic_RCRD
++        || Magic == kMagic_CHKD
++        || Magic == kMagic_FFFFFFFF;
++  }
++
+   bool IsEmpty() const { return (Magic <= 2); }
+   bool IsFILE() const { return (Magic == kMagic_FILE); }
+   bool IsBAAD() const { return (Magic == kMagic_BAAD); }
+@@ -1141,9 +1215,8 @@ bool CMftRec::Parse(Byte *p, unsigned sectorSizeLog, UInt32 numSectors, UInt32 r
+     CObjectVector<CAttr> *attrs)
+ {
+   G32(p, Magic);
+-  if (!IsFILE())
+-    return IsEmpty() || IsBAAD();
+-
++  if (!Is_Magic_FILE())
++    return Is_Magic_CanIgnore();
+   
+   {
+     UInt32 usaOffset;
+@@ -1188,12 +1261,12 @@ bool CMftRec::Parse(Byte *p, unsigned sectorSizeLog, UInt32 numSectors, UInt32 r
+   G16(p + 0x10, SeqNumber);
+   // G16(p + 0x12, LinkCount);
+   // PRF(printf(" L=%d", LinkCount));
+-  UInt32 attrOffs = Get16(p + 0x14);
++  const UInt32 attrOffs = Get16(p + 0x14);
+   G16(p + 0x16, Flags);
+   PRF(printf(" F=%4X", Flags));
+ 
+-  UInt32 bytesInUse = Get32(p + 0x18);
+-  UInt32 bytesAlloc = Get32(p + 0x1C);
++  const UInt32 bytesInUse = Get32(p + 0x18);
++  const UInt32 bytesAlloc = Get32(p + 0x1C);
+   G64(p + 0x20, BaseMftRef.Val);
+   if (BaseMftRef.Val != 0)
+   {
+@@ -1667,68 +1740,57 @@ HRESULT CDatabase::Open()
+  
+   SeekToCluster(Header.MftCluster);
+ 
+-  CMftRec mftRec;
+-  UInt32 numSectorsInRec;
+-
++  // we use ByteBuf for records reading.
++  // so the size of ByteBuf must be >= mftRecordSize
++  const size_t recSize = (size_t)1 << Header.MftRecordSizeLog;
++  const size_t kBufSize = MyMax((size_t)(1 << 15), recSize);
++  ByteBuf.Alloc(kBufSize);
++  RINOK(ReadStream_FALSE(InStream, ByteBuf, recSize))
++  {
++    const UInt32 allocSize = Get32(ByteBuf + 0x1C);
++    if (allocSize != recSize)
++      return S_FALSE;
++  }
++  // MftRecordSizeLog >= SectorSizeLog
++  const UInt32 numSectorsInRec = 1u << (Header.MftRecordSizeLog - Header.SectorSizeLog);
+   CMyComPtr<IInStream> mftStream;
++  CMftRec mftRec;
+   {
+-    UInt32 blockSize = 1 << 12;
+-    ByteBuf.Alloc(blockSize);
+-    RINOK(ReadStream_FALSE(InStream, ByteBuf, blockSize));
+-    
+-    {
+-      UInt32 allocSize = Get32(ByteBuf + 0x1C);
+-      int t = GetLog(allocSize);
+-      if (t < (int)Header.SectorSizeLog)
+-        return S_FALSE;
+-      RecSizeLog = t;
+-      if (RecSizeLog > 15)
+-        return S_FALSE;
+-    }
+-
+-    numSectorsInRec = 1 << (RecSizeLog - Header.SectorSizeLog);
+     if (!mftRec.Parse(ByteBuf, Header.SectorSizeLog, numSectorsInRec, 0, NULL))
+       return S_FALSE;
+-    if (!mftRec.IsFILE())
++    if (!mftRec.Is_Magic_FILE())
+       return S_FALSE;
+     mftRec.ParseDataNames();
+     if (mftRec.DataRefs.IsEmpty())
+       return S_FALSE;
+-    RINOK(mftRec.GetStream(InStream, 0, Header.ClusterSizeLog, Header.NumClusters, &mftStream));
++    RINOK(mftRec.GetStream(InStream, 0, Header.ClusterSizeLog, Header.NumClusters, &mftStream))
+     if (!mftStream)
+       return S_FALSE;
+   }
+ 
+   // CObjectVector<CAttr> SecurityAttrs;
+ 
+-  UInt64 mftSize = mftRec.DataAttrs[0].Size;
++  const UInt64 mftSize = mftRec.DataAttrs[0].Size;
+   if ((mftSize >> 4) > Header.GetPhySize_Clusters())
+     return S_FALSE;
+ 
+-  const size_t kBufSize = (1 << 15);
+-  const size_t recSize = ((size_t)1 << RecSizeLog);
+-  if (kBufSize < recSize)
+-    return S_FALSE;
+-
+   {
+-    const UInt64 numFiles = mftSize >> RecSizeLog;
++    const UInt64 numFiles = mftSize >> Header.MftRecordSizeLog;
+     if (numFiles > (1 << 30))
+       return S_FALSE;
+     if (OpenCallback)
+     {
+       RINOK(OpenCallback->SetTotal(&numFiles, &mftSize));
+     }
+-    
+-    ByteBuf.Alloc(kBufSize);
+     Recs.ClearAndReserve((unsigned)numFiles);
+   }
+-  
++ 
+   for (UInt64 pos64 = 0;;)
+   {
+     if (OpenCallback)
+     {
+       const UInt64 numFiles = Recs.Size();
+-      if ((numFiles & 0x3FF) == 0)
++      if ((numFiles & 0x3FFF) == 0)
+       {
+         RINOK(OpenCallback->SetCompleted(&numFiles, &pos64));
+       }
+@@ -1817,12 +1879,18 @@ HRESULT CDatabase::Open()
+   for (i = 0; i < Recs.Size(); i++)
+   {
+     CMftRec &rec = Recs[i];
++    if (!rec.Is_Magic_FILE())
++      continue;
++
+     if (!rec.BaseMftRef.IsBaseItself())
+     {
+-      UInt64 refIndex = rec.BaseMftRef.GetIndex();
+-      if (refIndex > (UInt32)Recs.Size())
++      const UInt64 refIndex = rec.BaseMftRef.GetIndex();
++      if (refIndex >= Recs.Size())
+         return S_FALSE;
+       CMftRec &refRec = Recs[(unsigned)refIndex];
++      if (!refRec.Is_Magic_FILE())
++        continue;
++
+       bool moveAttrs = (refRec.SeqNumber == rec.BaseMftRef.GetNumber() && refRec.BaseMftRef.IsBaseItself());
+       if (rec.InUse() && refRec.InUse())
+       {
+@@ -1837,12 +1905,17 @@ HRESULT CDatabase::Open()
+   }
+ 
+   for (i = 0; i < Recs.Size(); i++)
+-    Recs[i].ParseDataNames();
++  {
++    CMftRec &rec = Recs[i];
++    if (!rec.Is_Magic_FILE())
++      continue;
++    rec.ParseDataNames();
++  }
+   
+   for (i = 0; i < Recs.Size(); i++)
+   {
+     CMftRec &rec = Recs[i];
+-    if (!rec.IsFILE() || !rec.BaseMftRef.IsBaseItself())
++    if (!rec.Is_Magic_FILE() || !rec.BaseMftRef.IsBaseItself())
+       continue;
+     if (i < kNumSysRecs && !_showSystemFiles)
+       continue;
+@@ -1864,7 +1937,7 @@ HRESULT CDatabase::Open()
+       FOR_VECTOR (di, rec.DataRefs)
+         if (rec.DataAttrs[rec.DataRefs[di].Start].Name.IsEmpty())
+         {
+-          indexOfUnnamedStream = di;
++          indexOfUnnamedStream = (int)di;
+           break;
+         }
+     }
+@@ -1922,14 +1995,14 @@ HRESULT CDatabase::Open()
+           indexOfUnnamedStream);
+       
+       if (rec.MyItemIndex < 0)
+-        rec.MyItemIndex = Items.Size();
+-      item.ParentHost = Items.Add(item);
++        rec.MyItemIndex = (int)Items.Size();
++      item.ParentHost = (int)Items.Add(item);
+       
+       /* we can use that code to reduce the number of alt streams:
+          it will not show how alt streams for hard links. */
+       // if (!isMainName) continue; isMainName = false;
+ 
+-      unsigned numAltStreams = 0;
++      // unsigned numAltStreams = 0;
+ 
+       FOR_VECTOR (di, rec.DataRefs)
+       {
+@@ -1947,9 +2020,9 @@ HRESULT CDatabase::Open()
+             continue;
+         }
+ 
+-        numAltStreams++;
++        // numAltStreams++;
+         ThereAreAltStreams = true;
+-        item.DataIndex = di;
++        item.DataIndex = (int)di;
+         Items.Add(item);
+       }
+     }
+@@ -1964,10 +2037,10 @@ HRESULT CDatabase::Open()
+       if (attr.Name == L"$SDS")
+       {
+         CMyComPtr<IInStream> sdsStream;
+-        RINOK(rec.GetStream(InStream, di, Header.ClusterSizeLog, Header.NumClusters, &sdsStream));
++        RINOK(rec.GetStream(InStream, (int)di, Header.ClusterSizeLog, Header.NumClusters, &sdsStream));
+         if (sdsStream)
+         {
+-          UInt64 size64 = attr.GetSize();
++          const UInt64 size64 = attr.GetSize();
+           if (size64 < (UInt32)1 << 29)
+           {
+             size_t size = (size_t)size64;
+@@ -1997,7 +2070,7 @@ HRESULT CDatabase::Open()
+     const CMftRec &rec = Recs[item.RecIndex];
+     const CFileNameAttr &fn = rec.FileNames[item.NameIndex];
+     const CMftRef &parentDirRef = fn.ParentDirRef;
+-    UInt64 refIndex = parentDirRef.GetIndex();
++    const UInt64 refIndex = parentDirRef.GetIndex();
+     if (refIndex == kRecIndex_RootDir)
+       item.ParentFolder = -1;
+     else
+@@ -2024,17 +2097,17 @@ HRESULT CDatabase::Open()
+   unsigned virtIndex = Items.Size();
+   if (_showSystemFiles)
+   {
+-    _systemFolderIndex = virtIndex++;
++    _systemFolderIndex = (int)(virtIndex++);
+     VirtFolderNames.Add(kVirtualFolder_System);
+   }
+   if (thereAreUnknownFolders_Normal)
+   {
+-    _lostFolderIndex_Normal = virtIndex++;
++    _lostFolderIndex_Normal = (int)(virtIndex++);
+     VirtFolderNames.Add(kVirtualFolder_Lost_Normal);
+   }
+   if (thereAreUnknownFolders_Deleted)
+   {
+-    _lostFolderIndex_Deleted = virtIndex++;
++    _lostFolderIndex_Deleted = (int)(virtIndex++);
+     VirtFolderNames.Add(kVirtualFolder_Lost_Deleted);
+   }
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index e795482eb6..31a12fdb04 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://change_numMethods_from_bool_to_unsigned.patch \
            file://CVE-2018-5996.patch \
            file://CVE-2016-9296.patch \
+           file://0001-Fix-two-buffer-overflow-vulnerabilities.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-- 
2.34.1


