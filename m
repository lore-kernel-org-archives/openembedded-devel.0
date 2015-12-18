Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1F79731B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 07:31:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBI7VmRT024751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 23:31:49 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 17 Dec 2015 23:31:48 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Dec 2015 15:31:56 +0800
Message-ID: <1450423916-4811-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450423916-4811-1-git-send-email-jackie.huang@windriver.com>
References: <1450423916-4811-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 2/2] openjdk-8: skip the dev-so test
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
X-List-Received-Date: Fri, 18 Dec 2015 07:31:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed:
ERROR: QA Issue: non -dev/-dbg/nativesdk- package contains symlink .so:
openjdk-8 path
'work/core2-64-poky-linux/openjdk-8/72b05-r0/packages-split/openjdk-8/usr/lib/jvm/openjdk-8/jre/lib/amd64/server/libjsig.so'
[dev-so]

The symlink .so is valid so we just skip the test
just like what we does in openjdk-7.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-8_72b05.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb b/recipes-core/openjdk/openjdk-8_72b05.bb
index d962b1f..8aa9f9f 100644
--- a/recipes-core/openjdk/openjdk-8_72b05.bb
+++ b/recipes-core/openjdk/openjdk-8_72b05.bb
@@ -92,6 +92,9 @@ PROVIDES_${PN} = "java2-vm"
 RPROVIDES_${PN} = "java2-runtime"
 PROVIDES_${PN} = "java2-runtime"
 
+# There is a symlink to a .so but this one is valid.
+INSANE_SKIP_${PN} = "dev-so"
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-- 
2.3.5


