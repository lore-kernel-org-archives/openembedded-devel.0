Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2976A74F62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:21:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4U6LGH7001123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 23:21:32 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:21:06 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Wed, 30 May 2018 14:20:53 +0800
Message-ID: <1527661260-29811-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527661260-29811-1-git-send-email-yi.zhao@windriver.com>
References: <1527661260-29811-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 1/8] corosync: add UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Wed, 30 May 2018 06:21:51 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-extended/corosync/corosync_2.4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
index 9673fa3..dc2f01b 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "bf0ede13018aadc8a046183bc593b0e0"
 SRC_URI[sha256sum] = "b1e7e422e8d2f7af8e5315fa329b1dbd1175fff32efaa55e8054584c80a2c597"
 
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
+
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
 
-- 
2.7.4


