Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <patda293@student.liu.se>) id 1R1Haa-0007ME-7Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 14:50:48 +0200
Received: by bkbzu17 with SMTP id zu17so148273bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 05:45:46 -0700 (PDT)
Received: by 10.204.135.18 with SMTP id l18mr423755bkt.341.1315399545648;
	Wed, 07 Sep 2011 05:45:45 -0700 (PDT)
Received: from localhost.localdomain ([130.236.124.167])
	by mx.google.com with ESMTPS id d12sm238439bke.9.2011.09.07.05.45.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 05:45:45 -0700 (PDT)
From: =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <patda293@student.liu.se>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 14:45:47 +0200
Message-Id: <1315399547-13969-1-git-send-email-patda293@student.liu.se>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
Subject: [PATCH] ti-dsplink: added patch to allow use of make_3.82
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2011 12:50:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dsplink compiles and  works fine on beagleboard with make 3.82.
I do not own any other board to test with.

Signed-off-by: Patrik Dahlström <patda293@student.liu.se>
---
 .../dsplink_1_65_enable_gnu_make_3.82.patch        |   13 +++++++++++++
 recipes/ti/ti-dsplink_1.65.00.03.bb                |    1 +
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-dsplink/dsplink_1_65_enable_gnu_make_3.82.patch

diff --git a/recipes/ti/ti-dsplink/dsplink_1_65_enable_gnu_make_3.82.patch b/recipes/ti/ti-dsplink/dsplink_1_65_enable_gnu_make_3.82.patch
new file mode 100644
index 0000000..377b2db
--- /dev/null
+++ b/recipes/ti/ti-dsplink/dsplink_1_65_enable_gnu_make_3.82.patch
@@ -0,0 +1,13 @@
+--- a/dsplink/make/start.mk.orig	2011-09-01 15:45:23.000000000 +0200
++++ b/dsplink/make/start.mk	2011-09-01 15:45:40.000000000 +0200
+@@ -41,8 +41,8 @@
+ 
+ 
+ # Check for MAKE version
+-$(if $(filter $(MAKE_VERSION), 3.81 3.81beta1 3.90 3.92),,\
+-$(error This makefile requires one of GNU make version 3.81 3.81beta1 3.90 3.92))
++$(if $(filter $(MAKE_VERSION), 3.81 3.81beta1 3.82 3.90 3.92),,\
++$(error This makefile requires one of GNU make version 3.81 3.81beta1 3.82 3.90 3.92))
+ #   ============================================================================
+ #   Export the directory separator
+ #   ============================================================================
diff --git a/recipes/ti/ti-dsplink_1.65.00.03.bb b/recipes/ti/ti-dsplink_1.65.00.03.bb
index c2ca5d9..7ff272b 100644
--- a/recipes/ti/ti-dsplink_1.65.00.03.bb
+++ b/recipes/ti/ti-dsplink_1.65.00.03.bb
@@ -8,6 +8,7 @@ PV_major = "1_65"
 PV_DL_PATH = "DSPLink/${PV_major}/${PV}/${PV_dot}"
 
 SRC_URI += "file://dsplink-BKL-fix.patch"
+SRC_URI += "file://dsplink_1_65_enable_gnu_make_3.82.patch"
 
 SRC_URI[dsplinktarball.md5sum] = "1bda596b631bd2f517edc70f6be4f2ca"
 SRC_URI[dsplinktarball.sha256sum] = "4b1bda89bd8465b887f5bcdf7b95018bc1d1f8968c0c44f8cbad2a9e1c52bcb7"
-- 
1.7.6



