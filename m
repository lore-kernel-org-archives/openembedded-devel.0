Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 43C576BBE6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 02:14:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78819096"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 10:14:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3B79A4CE1646
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:06:00 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 21 Nov 2019 10:14:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2019 10:14:49 +0800
Message-ID: <20191121021449.8990-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3B79A4CE1646.A7FC8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-pykickstart: upgrade 3.20 -> 3.22
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
X-List-Received-Date: Thu, 21 Nov 2019 02:14:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Refresh the following patch:
 0003-comment-out-sections-shutdown-and-environment-in-gen.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-out-sections-shutdown-and-environment-in-gen.patch | 10 +++++-----
 ...pykickstart_3.20.bb => python3-pykickstart_3.22.bb} |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.20.bb => python3-pykickstart_3.22.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
index 81e351b11..7ab734686 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
@@ -17,7 +17,7 @@ fixup! add comments of shutdown for user
  2 files changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/pykickstart/commands/reboot.py b/pykickstart/commands/reboot.py
-index 2c1b1c0..b3ec717 100644
+index 75a6d916..edfe83ff 100644
 --- a/pykickstart/commands/reboot.py
 +++ b/pykickstart/commands/reboot.py
 @@ -43,6 +43,9 @@ class FC3_Reboot(KickstartCommand):
@@ -31,18 +31,18 @@ index 2c1b1c0..b3ec717 100644
          return retval
  
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index e68174d..efd78a6 100644
+index bc59131b..b2d09d45 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -385,7 +385,7 @@ class Packages(KickstartObject):
+@@ -428,7 +428,7 @@ class Packages(KickstartObject):
  
          if not self.default:
              if self.environment:
 -                pkgs += "@^%s\n" % self.environment
 +                pkgs += "#@^%s\n" % self.environment
  
-             grps = self.groupList
-             grps.sort()
+         grps = self.groupList
+         grps.sort()
 -- 
 2.7.4
 
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.20.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.20.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
index ed10ce958..041abd3e8 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.20.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "487edfded19d5969db0673b200ee4272b7dc6697"
+SRCREV = "674c17b1e231f56a0d8a5ced4a204cdbc4c1edf3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.20.1




