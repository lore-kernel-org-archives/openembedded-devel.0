Return-Path: <prvs=1592237712=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id C9C6B784E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 17:12:16 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w1NHB6kQ025193 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 11:12:18 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2ga6qtt8br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 11:12:17 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w1NHCGKF018636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 11:12:16 -0600
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 23 Feb 2018 11:12:16 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 23 Feb 2018 11:12:16 -0600
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 23 Feb 2018 11:12:15 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Feb 2018 19:13:12 +0200
Message-ID: <20180223171312.3619-2-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180223171312.3619-1-adrian.ratiu@ni.com>
References: <20180223171312.3619-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=736 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1802230213
Subject: [meta-multimedia][PATCH 2/2] sox: bump 14.4.0 -> 14.4.2
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
X-List-Received-Date: Fri, 23 Feb 2018 17:12:16 -0000
Content-Type: text/plain

The big feature in the new version is opus codec support.
Make the old vorbis codec optional via packageconfig.
Remove sox-native because it's broken and nothing uses it.
Refresh musl build-fix patch.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 ...ve-the-error-line-and-live-without-file-type-det.patch | 10 +++++-----
 .../sox/{sox_14.4.0.bb => sox_14.4.2.bb}                  | 15 ++++++---------
 2 files changed, 11 insertions(+), 14 deletions(-)
 rename meta-multimedia/recipes-multimedia/sox/{sox_14.4.0.bb => sox_14.4.2.bb} (81%)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
index 605863a22..4f02a66fc 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
+++ b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
@@ -1,4 +1,4 @@
-From c2aed28e3e14329ad0a8c4371fdcce9934013f21 Mon Sep 17 00:00:00 2001
+From d0313be5fb947df399a4db24a5f9244510d2ce87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 16:36:06 -0700
 Subject: [PATCH] remove the #error line and live without file-type detection
@@ -12,17 +12,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/formats.c b/src/formats.c
-index 7e231ca..b13f0d5 100644
+index 724a4cda..f683a922 100644
 --- a/src/formats.c
 +++ b/src/formats.c
-@@ -416,7 +416,6 @@ static void UNUSED rewind_pipe(FILE * fp)
+@@ -422,7 +422,6 @@ static void UNUSED rewind_pipe(FILE * fp)
    /* To fix this #error, either simply remove the #error line and live without
     * file-type detection with pipes, or add support for your compiler in the
-    * lines above.  Test with cat monkey.au | ./sox --info - */
+    * lines above.  Test with cat monkey.wav | ./sox --info - */
 -  #error FIX NEEDED HERE
    #define NO_REWIND_PIPE
    (void)fp;
  #endif
 -- 
-2.13.2
+2.16.2
 
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
similarity index 81%
rename from meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
rename to meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 3eb1856e0..d1ed08a89 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -4,13 +4,11 @@ and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
 SECTION = "audio"
 
-DEPENDS = "libpng ffmpeg libsndfile1 libvorbis"
+DEPENDS = "libpng ffmpeg libsndfile1"
 
 # While this item does not require it, it depends on ffmpeg which does
 LICENSE_FLAGS = "commercial"
 
-PR = "r2"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
                    magic \
 "
@@ -20,6 +18,8 @@ PACKAGECONFIG[wavpack] = "--with-wavpack=dyn,--with-wavpack=no,wavpack,"
 PACKAGECONFIG[flac] = "--with-flac=dyn,--with-flac=no,flac,"
 PACKAGECONFIG[amrwb] = "--with-amrwb=dyn,--with-amrwb=no,opencore-amr,"
 PACKAGECONFIG[amrnb] = "--with-amrnb=dyn,--with-amrnb=no,opencore-amr,"
+PACKAGECONFIG[oggvorbis] = "--with-oggvorbis=dyn,--with-oggvorbis=no,libvorbis"
+PACKAGECONFIG[opus] = "--with-opus=dyn,--with-opus=no,opusfile"
 PACKAGECONFIG[magic] = "--with-magic,--without-magic,file,"
 PACKAGECONFIG[mad] = "--with-mad,--without-mad,libmad,"
 PACKAGECONFIG[id3tag] = "--with-id3tag,--without-id3tag,libid3tag,"
@@ -33,10 +33,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            "
-SRC_URI[md5sum] = "b0c15cff7a4ba0ec17fdc74e6a1f9cf1"
-SRC_URI[sha256sum] = "3ee34b14dd267de378e8a117aae81ec4cae330772342e6a55bbf6520a0a88aa3"
-
-inherit autotools
-
-BBCLASSEXTEND = "native"
+SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
+SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
 
+inherit autotools pkgconfig
-- 
2.16.2


