Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96BAD77596
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:30:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBM9UQnW028356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 01:30:26 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Dec 2016 01:30:25 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Dec 2016 17:28:08 +0800
Message-ID: <20161222092809.13510-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161222092809.13510-1-kai.kang@windriver.com>
References: <20161222092809.13510-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] ctdb: update SRC_URI
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
X-List-Received-Date: Thu, 22 Dec 2016 09:30:25 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The SRC_URI of ctdb is not right for multilib. Replace var 'PN' with
'BPN' to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
index d58e572..7cea0f6 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
                     "
 
-SRC_URI = "https://ftp.samba.org/pub/${PN}/${BP}.tar.gz \
+SRC_URI = "https://ftp.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://01-support-cross-compile-for-linux-os.patch \
            file://02-link-rep_snprintf-for-ltdbtool.patch \
            file://service-ensure-the-PID-directory-is-created.patch \
-- 
2.10.1


