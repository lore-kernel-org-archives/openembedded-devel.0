Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 866DE7C042
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:39:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI7dlFs009668
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:39:47 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:39:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:39 +0800
Message-ID: <1bde30eabe10604f23c3c6568dba952ad109aec7.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545037250.git.hongxu.jia@windriver.com>
References: <cover.1545037250.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/8] python-pyparted/python3-pyparted: drop incorrect and redundant PV
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
X-List-Received-Date: Tue, 18 Dec 2018 07:39:46 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb  | 2 --
 meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
index 7d00fd7..32aa378 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
@@ -1,7 +1,5 @@
 require python-pyparted.inc
 
-PV = "3.10.7+git${SRCPV}"
-
 inherit distutils
 
 RDEPENDS_${PN} += "python-stringold python-codecs python-math python-subprocess"
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb
index 4d6f97b..d83901f 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb
@@ -1,7 +1,5 @@
 require python-pyparted.inc
 
-PV = "3.10.7+git${SRCPV}"
-
 inherit distutils3
 
 RDEPENDS_${PN} += "python3-stringold python3-codecs python3-math"
-- 
2.7.4


