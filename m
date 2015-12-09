Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id EF36C601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 17:41:37 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so273897820wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2015 09:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rWeY88NLilnIUZYhgnbbFQEcRBuEXj8hlYUML1MghmU=;
	b=o4SLqPZynkx/JhHyT4j1j+PecXkNojXXKY5YED57/Fb0vET42SCrJtWAcfWBV+cWI7
	m99zdrmn6NHt2oR6pPt9y8dOlWr9+OR9azhg19NIklOPEjPLQe74e/nUGA/KG2KfqMxI
	q+wlfcYVCJXxukDu2xqAfmYUkqdLazb/ImLjVq+1X/QJnyRCXVG/WIn2+KhkhTcbcjnf
	MbzCDp+E6jzpB00fXS98x3NGg1JHYmdYtpR0rqpsoDXFtFFJ6kLlv0//N4O7TddhK2um
	RKiPk+EOvDBYdo1lKSKUAuipUx9hj6MkngTCt96LYp+JXYvY+pTywDYcjEVwENCFupWU
	jsCA==
X-Received: by 10.194.19.133 with SMTP id f5mr8521151wje.48.1449682897244;
	Wed, 09 Dec 2015 09:41:37 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id h5sm8660241wjz.21.2015.12.09.09.41.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 09:41:35 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2015 10:41:18 -0700
Message-Id: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2][RESEND 1/3] canutils: rdep on iproute2
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
X-List-Received-Date: Wed, 09 Dec 2015 17:41:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

busybox ip fails to configure can interfaces, so we need iproute2 to do so.
See also http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index c220ead..e1508af 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -15,3 +15,6 @@ SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git \
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+# Busybox ip doesn't support can interface configuration, use the real thing
+RDEPENDS_${PN} += "iproute2"
-- 
2.2.1


