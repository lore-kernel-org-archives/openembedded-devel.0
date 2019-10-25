Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 79DC87ED3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:07:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,227,1569254400"; d="scan'208";a="77462312"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 15:07:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1E2374CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:00:00 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 25 Oct 2019 15:07:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Oct 2019 15:08:08 +0800
Message-ID: <20191025070808.2913-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1E2374CE1508.A7AB6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] autofs: upgrade 5.1.5 -> 5.1.6
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
X-List-Received-Date: Fri, 25 Oct 2019 07:07:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Refresh the following patch:
	autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch          | 2 +-
 .../recipes-daemons/autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb}       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb} (95%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
index 410827b..3928604 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
@@ -20,7 +20,7 @@ index 493b9f1..268d06b 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
- AC_INIT(.autofs-5.1.5)
+ AC_INIT(.autofs-5.1.6)
  
  # for pkg-config macros
 -m4_include([/usr/share/aclocal/pkg.m4])
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
similarity index 95%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
index 9e43549..67d03d6 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
@@ -28,8 +28,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            "
 
 
-SRC_URI[md5sum] = "03b13168ec7bd66a6f2d5f6fea705eee"
-SRC_URI[sha256sum] = "86a8e56ea9d72bb53ff8cdfeefb5cafe983592c6b0178fb99c4a731e59879181"
+SRC_URI[md5sum] = "e6800e0afd6009ecdff148088c564050"
+SRC_URI[sha256sum] = "82094cad44f4e5c4f93eff2789cd66b57d7ab3fa646b7722d97608571001e694"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
 
-- 
2.7.4




