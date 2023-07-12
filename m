Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F48EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:54:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1259.1689141235616897298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DzvtcgB0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6557d3b288=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36C5RNLd016106
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 22:53:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=5rB6p
	WsMyTF1O8afuq85DsezIp7dbfFm9JwA3I6NJS8=; b=DzvtcgB0FinYdWxFn5f4k
	3wAOk2OVyG5mWq7MKBss/T4beo1I7z4NCMBA4ZRTbzPaIzYznUSeSw9OEwgB47SX
	d8XtiL95UXqgddcKlAgwZTxUgOqU+CHTeG1RZInzFflo6pmKiwb9Q28hW3uyIqO5
	/Alg7OVW1OWBDzaH9FoIluAC7qlqTRvuYxsUQrlsH77BAPJsIgni0YY9sxX1QCg5
	CUmv3oINs1CnVKHCjxEOh2f1eLmlqQFHrvyTvoH5NGo6VoELTdUUHDhZasEsmHqf
	IJjt551Y0v558SWvnQNeVwfL79rE/3KagTosdOv4m7flZ5zHD9TSTfi+4p9qu3zL
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq32yk4y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 22:53:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 22:53:54 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 22:53:54 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] fltk-native: fix libdl link issue
Date: Wed, 12 Jul 2023 13:53:50 +0800
Message-ID: <20230712055350.420470-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9hN4-80zDpMBtMhFEhtPmd8OM4kAQthi
X-Proofpoint-ORIG-GUID: 9hN4-80zDpMBtMhFEhtPmd8OM4kAQthi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_02,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307120051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103825

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
v2:
* add Upstream-Status

 meta-oe/recipes-support/fltk/fltk-native.bb   |  5 +--
 .../fltk/fltk/fltk-native-link-libdl.patch    | 44 +++++++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)
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
index 000000000..e140ce216
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Inappropriate [cross build specific]
+
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


