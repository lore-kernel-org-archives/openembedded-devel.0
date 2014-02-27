Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A67DD6F3A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:22:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1R3MRvv018588
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Feb 2014 19:22:27 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 26 Feb 2014 19:22:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2014 11:22:08 +0800
Message-ID: <6a6629f76443931ad188376c0909bc9fbbe3d4d4.1393470790.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393470790.git.hongxu.jia@windriver.com>
References: <cover.1393470790.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/4][meta-webserver] modphp: upgrade to 5.5.8
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
X-List-Received-Date: Thu, 27 Feb 2014 03:22:30 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb | 7 -------
 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb

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
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.8.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.8.bb
new file mode 100644
index 0000000..04925fb
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.8.bb
@@ -0,0 +1,7 @@
+include modphp5.inc
+
+EXTRA_OECONF += "--disable-opcache"
+
+SRC_URI[md5sum] = "42fe814a3cbbf34b21a2c39f66ee0001"
+SRC_URI[sha256sum] = "6d5f45659d13383fc8429f185cc9da0b30c7bb72dcae9baf568f0511eb7f8b68"
+
-- 
1.8.1.2


