Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 515E3731AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:22:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7O9MSlg023860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:22:28 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:22:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:06:52 +0800
Message-ID: <78f89a5f45eadcc5e4f58c1af43fd0cc3020729d.1472027350.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1472027350.git.jackie.huang@windriver.com>
References: <cover.1472027350.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 04/16] mtr: control ipv6 support based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 24 Aug 2016 09:22:27 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for ipv6 and control it based
on DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/mtr/mtr_0.86.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/mtr/mtr_0.86.bb b/meta-networking/recipes-support/mtr/mtr_0.86.bb
index 7b73791..1d8a2cf 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.86.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.86.bb
@@ -17,3 +17,5 @@ inherit autotools
 
 EXTRA_OECONF = "--without-gtk"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.8.3


