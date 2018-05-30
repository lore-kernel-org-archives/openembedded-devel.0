Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9163074F04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:38:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U6cjTZ006570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:38:45 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:38:44 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 14:38:08 +0800
Message-ID: <1527662290-31549-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527662290-31549-1-git-send-email-yi.zhao@windriver.com>
References: <1527662290-31549-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 2/4] python3-blivet: add UPSTREAM_CHECK_GITTAGREGEX
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
X-List-Received-Date: Wed, 30 May 2018 06:38:44 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
index 46dc32d..045e0f4 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
@@ -26,6 +26,8 @@ SRC_URI = "git://github.com/rhinstaller/blivet;branch=2.2-devel \
            file://0014-invoking-dd-with-infinite-timeout.patch \
 "
 
+UPSTREAM_CHECK_GITTAGREGEX = "blivet-(?P<pver>\d+(\.\d+)+)$"
+
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-- 
2.7.4


