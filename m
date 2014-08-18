Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD346ACD6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 03:21:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I3LDwb025224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 20:21:13 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 20:21:13 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:21:12 -0400
Message-ID: <1408332072-22801-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] iw: uprev to version 3.15
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
X-List-Received-Date: Mon, 18 Aug 2014 03:21:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- change to use tar.gz since bz2 is no longer provided in upstream
- adjust the patch for new version

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...-iw-version.sh-don-t-use-git-describe-for-versioning.patch | 11 +++++------
 meta-oe/recipes-connectivity/iw/{iw_3.11.bb => iw_3.15.bb}    |  6 +++---
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-connectivity/iw/{iw_3.11.bb => iw_3.15.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
index 97c00cd..e64dd0a 100644
--- a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ b/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -9,18 +9,18 @@ Upstream-Status: Unknown
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- version.sh |   16 +---------------
- 1 files changed, 1 insertions(+), 15 deletions(-)
+ version.sh | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
 
 diff --git a/version.sh b/version.sh
-index 3fb9f6d..e4a56cb 100755
+index 11d124b..5d423c4 100755
 --- a/version.sh
 +++ b/version.sh
 @@ -3,21 +3,7 @@
- VERSION="3.2"
+ VERSION="3.15"
  OUT="$1"
  
--if head=`git rev-parse --verify HEAD 2>/dev/null`; then
+-if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
 -	git update-index --refresh --unmerged > /dev/null
 -	descr=$(git describe)
 -
@@ -41,4 +41,3 @@ index 3fb9f6d..e4a56cb 100755
  echo "const char iw_version[] = \"$v\";" >> "$OUT"
 -- 
 1.7.7.3
-
diff --git a/meta-oe/recipes-connectivity/iw/iw_3.11.bb b/meta-oe/recipes-connectivity/iw/iw_3.15.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/iw/iw_3.11.bb
rename to meta-oe/recipes-connectivity/iw/iw_3.15.bb
index d72a140..7800e90 100644
--- a/meta-oe/recipes-connectivity/iw/iw_3.11.bb
+++ b/meta-oe/recipes-connectivity/iw/iw_3.15.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
 DEPENDS = "libnl pkgconfig"
 
-SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.bz2 \
+SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
 "
 
-SRC_URI[md5sum] = "e633cf7c875c7d8b547abafc0d95f6c4"
-SRC_URI[sha256sum] = "09348d4f7371fad00c07cfb67b9e34f24403cbd9361f9634cfb4dff9cdd40139"
+SRC_URI[md5sum] = "ebb16e6c29b075e3a58b99552583fd79"
+SRC_URI[sha256sum] = "1223ebab68dc337f16ed80c45af37b78f112ea091e919eafe96a4cbd63942081"
 
 EXTRA_OEMAKE = ""
 
-- 
2.0.0


