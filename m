Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 59A0B78279
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id s66so17001279pfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a/vznGPSdpDAq2k8IjbAO+2+/hCY14rz9EUKUryxTOM=;
	b=O5JcPbMKYUor5fVQUjM4UktRfOGk1aSBXXhJfVfIXsnFtL9tSqf5NyQIVpvZ01Debu
	pMAUGb9F1utXmBnEvdgZ2fQXvEkTF51gmckGOgro3ZV4a5pl5lXMnankyU6jI07B6FGY
	wQwC++Yq8mpHzzfZ8ZNSZiEmhDt326rqRHlbTa2lTC/EVueSnX/4Bj7sgCJ7SkuNBbwC
	JkitoDClqeMhZgoXEyejuJROGHiLmcFuwFcmDPBJX4C97JEJLSytETTmeX8EFccnBrGV
	sTz3P9XPJLBbdavJ/A9UZY7aQmYd4U4swL1+UZtNCAgClFKhQTrFDyFZWhfq/CdFTJHd
	965g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a/vznGPSdpDAq2k8IjbAO+2+/hCY14rz9EUKUryxTOM=;
	b=jmbtHB6AWo9zPd2cfgdjojk3zgZqMIw4pktq9kTqpfbwqKiUgTxMJuM82bLMIWt32K
	pUG7eWvCbpMC2YJazlDVj4ubpfo3pMSN+ZNkpmp1nNYl39GRCYiZZqThZp/5oZrK8YD6
	y8tse3qUvBVaEGT+M4E46qGEaPlRsIp94GyN34pwLkEMCva5sJOVe9rZA7s6ycE9CTmT
	NcmSvU3CmeBMVEq7yBY5vGa5G3tVHrtIOnin6DuHK+3MbC8Y+eq2H+7VM4l7LlOv3kTa
	fQK2mYnZTzMGuAiE4P7fQ+VAabPrq7H8FI6xBnH5yz030ggrzY7sRoDB80VZHjcp8sgv
	gG3Q==
X-Gm-Message-State: AKS2vOyC3JFzQZOW4k8QwwK3n/mCEW9OMrtp40VEMV7T3gkN9D4dUX1W
	wAjf0C7CljvxvIHA
X-Received: by 10.99.185.28 with SMTP id z28mr21384509pge.123.1498827627377;
	Fri, 30 Jun 2017 06:00:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:51 -0700
Message-Id: <20170630125957.3342-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/17] assimp: Upgrade to 3.3.1 release
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:27 -0000

License years changed see
https://github.com/assimp/assimp/commit/189340a99f335cc28cae7c39eaee434322a54548

Fix build on big-endian architectures
Use Assimp namespace to fix build for big-endian architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Fix-build-on-big-endian-architectures.patch | 29 ++++++++++++++++++++++
 .../assimp/{assimp_3.1.1.bb => assimp_3.3.1.bb}    | 10 +++++---
 2 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
 rename meta-oe/recipes-graphics/assimp/{assimp_3.1.1.bb => assimp_3.3.1.bb} (50%)

diff --git a/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch b/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
new file mode 100644
index 000000000..c94bb3d58
--- /dev/null
+++ b/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
@@ -0,0 +1,29 @@
+From 614475dcac1cee4d63b764282c578672bc060321 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Jun 2017 14:23:00 -0700
+Subject: [PATCH] Fix build on big-endian architectures
+
+see
+https://github.com/assimp/assimp/pull/986
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ code/glTFAsset.inl | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/code/glTFAsset.inl b/code/glTFAsset.inl
+index d52c825c..470246c9 100644
+--- a/code/glTFAsset.inl
++++ b/code/glTFAsset.inl
+@@ -40,6 +40,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+ #include "StringUtils.h"
+ 
++using namespace Assimp;
++
+ namespace glTF {
+ 
+ namespace {
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
similarity index 50%
rename from meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
rename to meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
index 4da3dc213..064683a65 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
@@ -3,13 +3,15 @@ DESCRIPTION = "Open Asset Import Library is a portable Open Source library to im
 HOMEPAGE = "http://www.assimp.org/"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bc4231a2268da8fc55525ad119638a87"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4cd8c0aedc7a0623476669377d7eeda8"
 
 DEPENDS = "boost virtual/libgl"
 
-SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}-3.1/${BPN}-${PV}_no_test_models.zip"
-SRC_URI[md5sum] = "ccd4788204509da58a3a53c7aeda7a8b"
-SRC_URI[sha256sum] = "da9827876f10a8b447270368753392cfd502e70a2e9d1361554e5dfcb1fede9e"
+SRCREV = "a8673d4828df5107186f49e5e4efa5316b727482"
+SRC_URI = "git://github.com/assimp/assimp \
+           file://0001-Fix-build-on-big-endian-architectures.patch \
+           "
+S = "${WORKDIR}/git"
 
 inherit cmake
 
-- 
2.13.2


