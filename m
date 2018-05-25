Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7426F74ECF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:58:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P7vNVx000567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 00:57:49 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 25 May 2018 00:57:47 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 25 May 2018 15:54:53 +0800
Message-ID: <1527234893-8733-13-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 12/12] rdist: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 25 May 2018 07:58:03 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index cea1f08..0c97960 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -30,6 +30,9 @@ SRC_URI += "file://rdist-6.1.5-linux.patch \
             file://rdist-6.1.5-makefile-add-ldflags.patch \
 "
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/rdist/files/rdist/"
+UPSTREAM_CHECK_REGEX = "/rdist/(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS = "bison-native"
 
 inherit autotools-brokensep
-- 
2.7.4


