Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 871906103F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:17:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83685043"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:17:05 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2210B50A9976
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:07:24 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:17:03 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:17:04 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 07:24:14 -0800
Message-ID: <1582298655-25895-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582298655-25895-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582298655-25895-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2210B50A9976.AE364
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] kpatch: upgrade 0.8.0 -> 0.9.0
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
X-List-Received-Date: Fri, 21 Feb 2020 08:17:05 -0000
Content-Type: text/plain

refresh the following patch:
0002-kpatch-build-allow-overriding-of-distro-name.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0002-kpatch-build-allow-overriding-of-distro-name.patch | 6 +++---
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb                 | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
index 603a1475a..0cc368413 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
+++ b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
@@ -48,10 +48,10 @@ index 39933fc..c0258a2 100755
  	--skip-cleanup)
  		echo "Skipping cleanup"
  		SKIPCLEANUP=1
-@@ -571,7 +576,7 @@ fi
+@@ -613,7 +613,7 @@ fi
  # Don't check external file.
- # shellcheck disable=SC1091
- source /etc/os-release
+ # shellcheck disable=SC1090
+ [[ -f "$RELEASE_FILE" ]] && source "$RELEASE_FILE"
 -DISTRO="$ID"
 +DISTRO="${DISTRO:-${ID}}"
  if [[ "$DISTRO" = fedora ]] || [[ "$DISTRO" = rhel ]] || [[ "$DISTRO" = ol ]] || [[ "$DISTRO" = centos ]]; then
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
index 6326a2538..59dbc936f 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -2,9 +2,9 @@ require kpatch.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "2a29bc7dea9a7da12705c7b50315eee1acdd9156"
+SRCREV = "fd8209aa00525f3e6092eaccbc34f7ce13c4ebc9"
 
-PV = "0.8.0"
+PV = "0.9.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




