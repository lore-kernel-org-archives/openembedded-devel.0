Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8920EEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 04:54:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.540.1689137663825839261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 21:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XWa6g1dm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6557d3b288=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36C4lNHd002642
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 21:54:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=XgO1i
	FKIMmvDnDX0uEI5FokED00LbPWUMxKRMRrJ36w=; b=XWa6g1dmQ4U5JBq2uZMa8
	FUc3gLM4B9yRnyIejWp/4Q9l/QjtisA4btYZ2pjYEG5n87u/H3ZatW3+y3yLsnh/
	U1OcvBf/MmH7wwZmd/s0mCMtmkhNqziyhdDDqxhAmf2L0/ERVpILgctr1R2MoMDe
	zhQSJ+TkGncL652MlkMfOc+f0bEVKe0r8ol2kJWRXC7KVnf1LZi5FpvmPBWY+ep2
	RveSRd1qhNwo/RzQTEG8JOX/BqKM1hjDCGE7jmmx3FKs0lT5Ws6KCuRbCIWy1SBo
	tZWKGNdfEp2Ydk6yZ0RXAHePzeciBYQqgXXzgmsHyV0yZG4GsHBWlSBJUqcGsrAA
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq7afaxrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 21:54:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 21:54:22 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 21:54:22 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] fltk-native: fix libdl link issue
Date: Wed, 12 Jul 2023 12:54:19 +0800
Message-ID: <20230712045419.416921-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MbqZj67p4Mw6aNtSdnFWQWny7TF1QrR8
X-Proofpoint-GUID: MbqZj67p4Mw6aNtSdnFWQWny7TF1QrR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_02,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2305260000 definitions=main-2307120042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103738

From: Kai Kang <kai.kang@windriver.com>

It fails to build fltk-native on Ubuntu 20.04 with glibc 2.31:

| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `fl_dlopen(char const*, char const*)':
| Fl_Native_File_Chooser.cxx:(.text+0x61a): undefined reference to `dlopen'
| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `Fl_GTK_File_Chooser::probe_for_GTK_libs()':
| Fl_Native_File_Chooser.cxx:(.text+0xf92): undefined reference to `dlerror'

The original fix in fltk-native recipe does not work any more because '-ldl'
appears before lib/libfltk.a and causes dlopen() unresolved. The reason why it
doesn't fail on other hosts is that the functions dlopen(), dlerror() etc. have
been moved to libc.so since glibc 2.34 via the commits in glibc:

0c1c3a771e dlfcn: Move dlopen into libc
add8d7ea01 dlfcn: Move dlvsym into libc
6dfc0207eb dlfcn: Move dlinfo into libc
492560a32e dlfcn: Move dladdr1 into libc
6a1ed32789 dlfcn: Move dlmopen into libc
77f876c0e3 dlfcn: Move dlsym into libc
602252b553 dlfcn: Move dladdr into libc
d8cce17d2a dlfcn: Move dlclose into libc

Append 'dl' to fltk link items explictly to fix the error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/fltk/fltk-native.bb   |  5 +--
 .../fltk/fltk/fltk-native-link-libdl.patch    | 42 +++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch

diff --git a/meta-oe/recipes-support/fltk/fltk-native.bb b/meta-oe/recipes-support/fltk/fltk-native.bb
index 8d3992a6e..3e8e2cdf7 100644
--- a/meta-oe/recipes-support/fltk/fltk-native.bb
+++ b/meta-oe/recipes-support/fltk/fltk-native.bb
@@ -2,6 +2,8 @@ require ${BPN}.inc
 
 DEPENDS = "zlib-native jpeg-native libpng-native libxext-native libxft-native"
 
+SRC_URI += "file://fltk-native-link-libdl.patch"
+
 inherit native
 
 EXTRA_OECMAKE += " \
@@ -15,9 +17,6 @@ EXTRA_OECMAKE += " \
     -DOPTION_USE_XCURSOR=OFF \
 "
 
-# lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
-LDFLAGS += "-ldl"
-
 do_install:append() {
     # make sure native fltk-config is not used accidentaly
     rm -f ${D}${bindir}/fltk-config
diff --git a/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch b/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
new file mode 100644
index 000000000..55bbd2439
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
@@ -0,0 +1,42 @@
+It fails to build fltk-native on Ubuntu 20.04 with glibc 2.31:
+
+| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `fl_dlopen(char const*, char const*)':
+| Fl_Native_File_Chooser.cxx:(.text+0x61a): undefined reference to `dlopen'
+| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `Fl_GTK_File_Chooser::probe_for_GTK_libs()':
+| Fl_Native_File_Chooser.cxx:(.text+0xf92): undefined reference to `dlerror'
+
+The original fix in fltk-native recipe does not work any more because '-ldl'
+appears before lib/libfltk.a and causes dlopen() unresolved. The reason why it
+doesn't fail on other hosts is that the functions dlopen(), dlerror() etc. have
+been moved to libc.so since glibc 2.34 via the commits in glibc:
+
+0c1c3a771e dlfcn: Move dlopen into libc
+add8d7ea01 dlfcn: Move dlvsym into libc
+6dfc0207eb dlfcn: Move dlinfo into libc
+492560a32e dlfcn: Move dladdr1 into libc
+6a1ed32789 dlfcn: Move dlmopen into libc
+77f876c0e3 dlfcn: Move dlsym into libc
+602252b553 dlfcn: Move dladdr into libc
+d8cce17d2a dlfcn: Move dlclose into libc
+
+Append 'dl' to fltk link items explictly to fix the error.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index d153b1c..0fe5c11 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -306,7 +306,7 @@ endif (USE_XFT)
+ #######################################################################
+ 
+ FL_ADD_LIBRARY (fltk STATIC "${STATIC_FILES}")
+-target_link_libraries (fltk ${OPTIONAL_LIBS})
++target_link_libraries (fltk ${OPTIONAL_LIBS} dl)
+ 
+ #######################################################################
+ 
-- 
2.34.1


