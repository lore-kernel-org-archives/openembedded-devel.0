Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C99C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 09:44:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65758.1782985466514165560
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2026 02:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VDHP07hZ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Vpf4tIsV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KfNO4115963
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Jul 2026 09:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7TCEV3TaTEF7hc/T/X2qrh0C/PlumyRJjRd
	6/jjnU0Y=; b=VDHP07hZ7LTUbkExtnp0FX5XYxhrYOyHSGj+nCRQhpqlxB0Za8G
	RWR9vgFcWKBVt74VukHeieyfvdxsCtFN66QC5/pCydrZ05qJcjgytaV2gS0vgy37
	ucBP0EuaFpXQwVfqMejPlpwMwUfMmQVi0otb4VPj+j1/1RxIeoIk6/NEm93tqxwO
	R+aawbS5dfqlX6p48023qF5DgGZOZwH1MRR+WkNx2lc9jSoAhySY33KPahB+kVgj
	Sd6B5GS0BKzyUKpXLpOfEc+kBjegVLCdzq495mvR+1wQs84OcaE1Y93fq19Xz5n+
	XJXK62bYILot1DGIBOZaikLpbmHaA1DR71w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9402y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 09:44:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2609986a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 02:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985465; x=1783590265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TCEV3TaTEF7hc/T/X2qrh0C/PlumyRJjRd6/jjnU0Y=;
        b=Vpf4tIsVMoDsNa8fU6rs+LgwqYfKGj//YvjLqGm2VrZ8ktQ4CsvAIniaaxQn6agQLB
         BHJSZvzta7SaIXIWzm3cJFCU9IcGv2fjyqJ5Dii2s1584G4aKR2XQ3gYHRjwQJbIxua6
         nNI8fsjm+ZTyAFDTv22hBlC4OAYANECaxOtPQzwSrEDAztRGQl7LRwVdC1WZIKbRxLMX
         fG+ubVSdxQ6Oj9KSDQ22cRG0gKZngvQkHCP4HC2ex2oiIPlt+6plpOZ597IRxfZr4xtQ
         iJq7QnDAAEJAdmf779WUGs/FdCJJzkZGd+YjEUVld0QLqLl9WVjMGnyEw5psn1/KUut4
         79yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985465; x=1783590265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TCEV3TaTEF7hc/T/X2qrh0C/PlumyRJjRd6/jjnU0Y=;
        b=JqkpUlmU2Mo3meLudlau5UFVJN8NdpfU7Qa3n3mZjEjtH28CMEGZ+dWpcCId4AEVxE
         0Nsa+IOAffHM36XNRAsL+sfErUJpbWkX2JuZT1HUwEx7B6NAse6f0OOHZ4sqwxe7tMWc
         SCTB24obKuy9DiTWHofy9KaU1ktodiVIWUckXrszmfx1lLgzKdzCHGXpsOL6ywZXi9yZ
         60Lc2jTZ0mAHHsl0rGvyWUmyS14RdzB2dxoHZVR/SH6KZYYsQHQX7MhyT51ir7NTcC7/
         nfXNZIDCAvVz9wvENw7Gl9Nrzq1VOIqeWSTboF6PbFwidBmTIMlI8y0HV2CF8l5+cHr2
         i98g==
X-Gm-Message-State: AOJu0Yxo+IcohVu+VlzauvAKsIkNktted30OiurXdVnWxlzg8+Rm/q4Z
	l6T/mkHcNJCeI1f/O5KzBLZBRUi05JREN2JCYU1uBh4U0VwtVmWvkSNM0Xr2zd+fT5HNAQGcu5u
	v70PrZwx3t0Bemw//BURvJcxDfg/tpPGXvMV5fiIOJ3MZAef25uUNM7+UrUROvPvY5QnjuGt9dC
	0DlKSWzpNAEOxky52vtSs=
X-Gm-Gg: AfdE7cnhrXtPVFgEouGtF/xkC79BcdgYKovhZU3Za1qa+xjAFaCJufYLuuwlEz7MWGS
	7N2ZoKgbyar/3nJgc2YdoIfha6bDgSumJuM7In3Zx37m6BSMKFhDoVUjmkcdspaCZtMDaKNrAfn
	wmELa98+xS78d/5WfOwPNQcgAcs0o/m14Uk+eBzmZJKunIFSuijnSsBsNKcxvk7ZR+ljQDEVZF+
	1tugTluyqKY1QWDi62pv0/hrzUuWzuEGBk399O1DZjRWQsq5UMOFSzPwt4+i3QR9jlO3zH8cnlJ
	UZvGwQ68cpyoJtofjise3+XQYdinqOY73bM+FFIot9ZpyzRbHt00B3EH7KFNzVoJXLnep4Fat/G
	O5ndAtYmsfdSiQKkXt/88+bZ+66WvhQDKnCJUMwfTTQ==
X-Received: by 2002:a05:6a21:a48:b0:3bf:a38b:e8ca with SMTP id adf61e73a8af0-3bfed4e5ae3mr6999757637.59.1782985465208;
        Thu, 02 Jul 2026 02:44:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:a48:b0:3bf:a38b:e8ca with SMTP id adf61e73a8af0-3bfed4e5ae3mr6999707637.59.1782985464637;
        Thu, 02 Jul 2026 02:44:24 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f1595e912sm4031920eec.31.2026.07.02.02.44.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:44:24 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-python] python3-matplotlib: fix build
Date: Thu,  2 Jul 2026 15:14:19 +0530
Message-ID: <20260702094420.3122055-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfXxLUT003507mT
 ZAtFBMuAITxcfDA+Fv+I5hFOSmwXQUtEQ5kAqbHP9F1RSbn6DSaBXKL0WG+3/3obcAeVZ+gBDWx
 K4iUW6eOs8RWWx6bi3d84+6vyqegj1+gD9jm6KiQOcD4JcOt3i0b4umS4QqGBxWP2U6OwoyBKYg
 fqiwkCHuPa+2EmWwwpWJbcJ8Bh+BmKvFjut8ntdZXIrqpguXMEHeNAOhRMu7fIdEh8h8DcL4lpj
 8tR+pcRLBQo8r4NbVFTxVaR1WkHMFv/TJzS8oQ+CcfWNQfjbA+mjzoOox6QP5AmkCii0N+zVm+6
 1Ditz7DC39B8AGctwNWTeSatSz/CaGK9/xYLFd/r4oDuv6nc7Vuw41zzri9QeWzQFIb+2Wm6ObD
 l+E2LaluH5vgF8gXKWtXwV+MBKUeDRdTBgrCKxd4QrPtPDEi4uw9Rmg5pZWKflorwZc826oz2+r
 LyBjbFi6iOK7q0t9VwA==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4632fa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=FP58Ms26AAAA:8
 a=V9X70VPUAAAA:8 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=U9DnLW47cOQeEA4KZOIA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=KRF1Z9heMrU3hmHpx6Fa:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: LIui8RkMHZT4bgeaH_dy16Evnu15r-ZD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX4QNTHZQRvIht
 eqrDtZVXLQ1EaX4za/5SE6YzOczbNUsLYg7GUTV3NF3pFSnFbOmNQyMebm7fAvADlr/uFAIBQFR
 fBNxKw9IL4pEnRZvQtMZmkX5Ar5buNs=
X-Proofpoint-GUID: LIui8RkMHZT4bgeaH_dy16Evnu15r-ZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127998

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Changes in oe-core commit a0151ab56cf3 (setuptools3: clean the build
directory in configure) cause the build directory to be cleared during
configure step. To avoid the downloaded sources from getting cleaned,
pre-fetch them to a separate downloads/ directory and patch source to
look there.

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../matplotlib-disable-download.patch         | 34 +++++++++++++++++--
 .../python/python3-matplotlib_3.7.2.bb        |  4 +--
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
index aea8f62ea7..461f2d9d06 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
@@ -8,8 +8,11 @@ Update patch to fit on 3.7.2.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 
+Update to look for downloads in downloads/ directoory instead of build.
+Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
+
 diff --git a/setup.py b/setup.py
-index 0bea13fa6f..f39d8fc871 100644
+index 0bea13f..f39d8fc 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -327,13 +327,7 @@ setup(  # Finally, pass this all along to setuptools to do the heavy lifting.
@@ -28,7 +31,7 @@ index 0bea13fa6f..f39d8fc871 100644
          ':python_version<"3.10"': [
              "importlib-resources>=3.2.0",
 diff --git a/setupext.py b/setupext.py
-index a898d642d6..474172ff8f 100644
+index a898d64..9a4bb85 100644
 --- a/setupext.py
 +++ b/setupext.py
 @@ -66,40 +66,7 @@ def get_from_cache_or_download(url, sha):
@@ -73,3 +76,30 @@ index a898d642d6..474172ff8f 100644
  
  
  def get_and_extract_tarball(urls, sha, dirname):
+@@ -117,7 +84,7 @@ def get_and_extract_tarball(urls, sha, dirname):
+     dirname : path-like
+         Directory where the tarball is extracted.
+     """
+-    toplevel = Path("build", dirname)
++    toplevel = Path("downloads", dirname)
+     if not toplevel.exists():  # Download it or load it from cache.
+         try:
+             import certifi  # noqa
+@@ -677,7 +644,7 @@ class FreeType(SetupPackage):
+             else:
+                 msbuild_platform = 'Win32'
+             base_path = Path(
+-                f"build/freetype-{LOCAL_FREETYPE_VERSION}/builds/windows"
++                f"downloads/freetype-{LOCAL_FREETYPE_VERSION}/builds/windows"
+             )
+             vc = 'vc2010'
+             sln_path = base_path / vc / "freetype.sln"
+@@ -775,7 +742,7 @@ class Qhull(SetupPackage):
+         shutil.copyfile(toplevel / "COPYING.txt", "LICENSE/LICENSE_QHULL")
+ 
+         for ext in self._extensions_to_update:
+-            qhull_path = Path(f'build/qhull-{LOCAL_QHULL_VERSION}/src')
++            qhull_path = Path(f'downloads/qhull-{LOCAL_QHULL_VERSION}/src')
+             ext.include_dirs.insert(0, str(qhull_path))
+             ext.sources.extend(
+                 map(str, sorted(qhull_path.glob('libqhull_r/*.c'))))
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
index 72c369100a..991352e1e7 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
@@ -32,11 +32,11 @@ SRC_URI += "file://matplotlib-disable-download.patch \
 "
 
 # This python module requires a full copy of freetype-2.6.1
-SRC_URI += "https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=freetype;subdir=matplotlib-${PV}/build"
+SRC_URI += "https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=freetype;subdir=matplotlib-${PV}/downloads"
 SRC_URI[freetype.sha256sum] = "0a3c7dfbda6da1e8fce29232e8e96d987ababbbf71ebc8c75659e4132c367014"
 
 # This python module requires a full copy of 'qhull-2020'
-SRC_URI += "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz;name=qhull;subdir=matplotlib-${PV}/build"
+SRC_URI += "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz;name=qhull;subdir=matplotlib-${PV}/downloads"
 SRC_URI[qhull.sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
 
 # LTO with clang needs lld
-- 
2.54.0


