Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 75396617B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 09:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7J9GLcs016265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 02:16:22 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 02:16:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 05:16:16 -0400
Message-ID: <75f70c6c5065c12bc6282665c72e072aa13e31c0.1408438614.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1408438614.git.jackie.huang@windriver.com>
References: <cover.1408438614.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] lmbench: Fix "make html" graph failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Aug 2014 09:16:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The html-list perl script cannot parse the first line of the result
files about the lmbench version.

Additional fixes are to make the result's html pages easier to understand.

Signed-off-by: Lin Yu <lin.yu@windriver.com>
Signed-off-by: Fupan Li <fupan.li@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../lmbench_result_html_report.patch               |   61 ++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    5 +-
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch
new file mode 100644
index 0000000..cda2f0c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch
@@ -0,0 +1,61 @@
+lmbench: Fix "make html" graph failure
+
+The html-list perl script cannot parse the first line of the result
+files about the lmbench version.
+
+Additional fixes are to make the result's html pages easier to understand.
+
+Signed-off-by: Lin Yu <lin.yu@windriver.com>
+Signed-off-by: Fupan Li <fupan.li@windriver.com>
+
+Reworded patch description.
+
+Upstream-status: inappropriate [ configuration ]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/results/Makefile b/results/Makefile
+index 0935376..1ef9a15 100644
+--- a/results/Makefile
++++ b/results/Makefile
+@@ -186,6 +186,7 @@ paper:
+ # scratch makes you want a Ghz machine.
+ html: dirs
+ 	-make clean
++	make ps
+ 	#$(SCRIPTS)bghtml $(BG)
+ 	$(SCRIPTS)html-list $(LIST)
+ 	$(MK) LIST="$(LIST)" summary > HTML/summary.out 2> HTML/summary.errs
+diff --git a/scripts/html-list b/scripts/html-list
+index 9850461..6383115 100755
+--- a/scripts/html-list
++++ b/scripts/html-list
+@@ -14,7 +14,7 @@ open(H, ">HTML/specific.html");
+ print H <<EOF;
+ <title>LMBENCH System Results</title>
+ <h1>LMBENCH System Results</h1>
+-<h2><a href=summary>Summary of results</a></h2>
++<h2><a href=summary.out>Summary of results</a></h2>
+ <hr>
+ EOF
+
+@@ -47,7 +47,7 @@ foreach $os (@os) {
+ 		open(F, $file);
+ 		$_ = <F>;
+ 		close(F);
+-		next unless /lmbench1.[01]/;
++		next unless /lmbench[0-9]+.[01]/;
+ 		chop;
+ 		$title = $_;
+ 		#s/.lmbench1.? results for //;
+@@ -103,10 +103,7 @@ EOF
+ 				    if $i < $#os;
+ 				print S<<EOF;
+ <h4>$title</h4>
+-<a href=../$doc{$what}>Information on this benchmark</a> (Not up to date)
+ <p><IMG SRC="${what}${scale}$N.gif">\n<p>
+-<a href=../lmbench.html>
+-<img align=middle src="../gifs/arrows/b_arrow.gif">LMBENCH table of contents</a>
+ <a href=specific.html>
+ <img align=middle src=\"../gifs/graph.gif\">System results table of contents</a>
+ <p>
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 41db150..d8238ae 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -14,8 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://rename-line-binary.patch \
            file://update-results-script.patch \
            file://obey-ranlib.patch \
-           file://update-config-script.patch \ 
-           file://use-base_libdir-instead-of-hardcoded-lib.patch \ 
+           file://update-config-script.patch \
+           file://use-base_libdir-instead-of-hardcoded-lib.patch \
+           file://lmbench_result_html_report.patch \
 "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
-- 
1.7.9.5


