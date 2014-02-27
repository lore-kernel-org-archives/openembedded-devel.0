Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D4F5E6F353
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 19:01:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Feb 2014 11:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,556,1389772800"; d="scan'208";a="489424566"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.24])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2014 11:00:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 19:00:34 +0000
Message-Id: <fbc00728140b302a70704741feda2d99eab51de0.1393527452.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393527452.git.paul.eggleton@linux.intel.com>
References: <cover.1393527452.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393527452.git.paul.eggleton@linux.intel.com>
References: <cover.1393527452.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v3 2/3] modphp: upgrade to 5.5.9
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
X-List-Received-Date: Thu, 27 Feb 2014 19:01:33 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc     | 1 -
 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb | 7 -------
 meta-webserver/recipes-php/modphp/modphp_5.5.9.bb | 7 +++++++
 3 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.9.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 314cb91..aa213e3 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -22,7 +22,6 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
                 --with-pic \
                 --enable-maintainer-zts \
                 --without-mysql \
-                --enable-force-cgi-redirect \
                 --disable-cgi \
                 --disable-cli \
                 --disable-pdo \
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
deleted file mode 100644
index 3c23242..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include modphp5.inc
-
-EXTRA_OECONF += "--disable-opcache"
-
-SRC_URI[md5sum] = "caf7f4d86514a568fb3c8021b096a9f0"
-SRC_URI[sha256sum] = "e72aaf1fa96eac0bff127bfc74c174d1de50cd3f66d7e0e1ee919674ab463bb7"
-
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.9.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.9.bb
new file mode 100644
index 0000000..4243ece
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.9.bb
@@ -0,0 +1,7 @@
+include modphp5.inc
+
+EXTRA_OECONF += "--disable-opcache"
+
+SRC_URI[md5sum] = "c4a348a07b52f6e177d8fdc75fe507b1"
+SRC_URI[sha256sum] = "9d1dea5195e2bcd928416130a6e19173d02bd36fb76c382522bf145c458fbed3"
+
-- 
1.8.5.3


