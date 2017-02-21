Return-Path: <chong.yi.chai@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A70D672F14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:27:12 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 16:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; d="scan'208";a="60586346"
Received: from chongyic-ilbpg1.png.intel.com ([10.88.227.83])
	by orsmga004.jf.intel.com with ESMTP; 20 Feb 2017 16:27:13 -0800
From: chong.yi.chai@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 08:26:04 +0800
Message-Id: <1487636765-15631-3-git-send-email-chong.yi.chai@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
References: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
MIME-Version: 1.0
Subject: [meta-networking][morty][PATCH 2/3] libtevent: fix SRC_URI - http has gone
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
X-List-Received-Date: Tue, 21 Feb 2017 00:27:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit 3a3e443864d67931abbb3798e116e63367af1a87)
Signed-off-by: Chai, Chong Yi <chong.yi.chai@intel.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
index 9f4e235..7125893 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv3+"
 DEPENDS += "libtalloc"
 RDEPENDS_python-tevent = "python"
 
-SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
+SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
            file://tevent-Add-configure-options-for-packages.patch \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
-- 
1.9.1


