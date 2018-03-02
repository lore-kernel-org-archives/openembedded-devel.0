Return-Path: <prvs=2599396995=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id A25CA7899B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:32:44 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w22IVT2a021129 for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Mar 2018 12:32:45 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2gb4y2k789-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:32:45 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w22IWiJM028219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Mar 2018 12:32:44 -0600
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 2 Mar 2018 12:32:44 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 2 Mar 2018 12:32:43 -0600
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 2 Mar 2018 12:32:43 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Mar 2018 20:33:46 +0200
Message-ID: <20180302183346.19849-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-02_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=850 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1803020218
Subject: [meta-multimedia][PATCH] sox: backport fix for dynamically linked flac builds
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
X-List-Received-Date: Fri, 02 Mar 2018 18:32:44 -0000
Content-Type: text/plain

The sox project upstream is dead, non-responsive, and various
developers started maintaining their own branches where they do
feature development (eg. adding DSD/DSF format support) and
bug-fixing. They don't have access to the central sox git repo.

So basically the project will eventually get forked (I started a
discussion in this direction). Until then, backport this flac build
fix which was lingering around out of tree for years.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../sox/sox/0001-Update-exported-symbol-list.patch | 34 ++++++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch
new file mode 100644
index 000000000..44c6b19be
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch
@@ -0,0 +1,34 @@
+From b1809d82031aa7c5bcaad58bcb4b59e082e0446e Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 15:40:16 +0000
+Subject: [PATCH] Update exported symbol list
+
+commit 5c58413544 ("Don't export (most) internal libsox symbols")
+breaks dynamic flac builds as flac.c references lsx.error, so add it
+to the list of exceptions.
+
+| .libs/flac.o: In function `decoder_read_callback':
+| /usr/src/debug/sox/14.4.2-r0/sox-14.4.2/src/flac.c:63: undefined reference to `lsx_error'
+
+Upstream-Status: Backport [https://bogomips.org/sox.git ("pu" branch)]
+
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 7cceaafd..a3a04ed1 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -95,7 +95,7 @@ libsox_la_LIBADD += @GOMP_LIBS@
+ 
+ libsox_la_CFLAGS = @WARN_CFLAGS@
+ libsox_la_LDFLAGS = @APP_LDFLAGS@ -version-info @SHLIB_VERSION@ \
+-  -export-symbols-regex '^(sox_.*|lsx_(check_read_params|(close|open)_dllibrary|(debug(_more|_most)?|fail|report|warn)_impl|eof|fail_errno|filelength|find_(enum_(text|value)|file_extension)|getopt(_init)?|lpc10_(create_(de|en)coder_state|(de|en)code)|raw(read|write)|read(_b_buf|buf|chars)|realloc|rewind|seeki|sigfigs3p?|strcasecmp|tell|unreadb|write(b|_b_buf|buf|s)))$$'
++  -export-symbols-regex '^(sox_.*|lsx_(([cm]|re)alloc|check_read_params|(close|open)_dllibrary|(debug(_more|_most)?|fail|report|warn)_impl|eof|error|fail_errno|filelength|find_(enum_(text|value)|file_extension)|flush|getopt(_init)?|id3_read_tag|lpc10_(create_(de|en)coder_state|(de|en)code)|raw(read|write)|read(_b_buf|buf|chars)|rewind|seeki|sigfigs3p?|strcasecmp|strdup|tell|unreadb|write(b|_b_buf|buf|s)))$$'
+ 
+ if HAVE_WIN32_LTDL
+   libsox_la_SOURCES += win32-ltdl.c win32-ltdl.h
+-- 
+2.16.2
+
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index d1ed08a89..21fddd1e1 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -32,6 +32,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
+           file://0001-Update-exported-symbol-list.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
-- 
2.16.2


