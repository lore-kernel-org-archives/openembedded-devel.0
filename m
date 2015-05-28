Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7C10375669
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 20:22:35 +0000 (UTC)
Received: by labko7 with SMTP id ko7so37241086lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZYialg0zIjh0myRGXCeW9nnnG3ISvAWpybYbXrxb4kk=;
	b=XpJ5qZPHXodH8pGQhiOn5NA5oDU5M/I8CQRvbSLzjXu9XrwfY/z6yKFAQgwh9lkyHJ
	P+Mv8OteLbBlKTSsWupWBpFTalipQhGWR/zyP9MhEDs2owhA+vKJOqn6TJZzYuw4+XOG
	DUAAaUNyRyMZwRSAhJOZGfCii8InZAN9BuY4CFDADe+2Et7G7xu1+ijIypLFL4TFq+I8
	2h8wHR8D8IRFFBc/PRZc5pvYK851XB0u4P47YhPUWuigQPmY6Y0kevdiHogQjCB5V6X5
	fZeg1NAFBvmZgxKVcIjveqN3t1Srwiu7xw06AtOj6iC2cwtZX8ueyiS4+pYnCGIZPxo4
	4McA==
X-Received: by 10.112.168.165 with SMTP id zx5mr4486062lbb.111.1432844555245; 
	Thu, 28 May 2015 13:22:35 -0700 (PDT)
Received: from angmar.lumag.rup.mentorg.com
	(ppp89-110-9-6.pppoe.avangarddsl.ru. [89.110.9.6])
	by mx.google.com with ESMTPSA id q1sm817389lah.27.2015.05.28.13.22.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 May 2015 13:22:34 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 23:22:21 +0300
Message-Id: <1432844543-4452-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432844543-4452-1-git-send-email-dbaryshkov@gmail.com>
References: <1432844543-4452-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie][PATCH 2/4] opie-init: fix warning about nonexistant ${S} directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 May 2015 20:22:35 -0000

Point ${S} to ${WORKDIR} to fix the warning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-init/opie-init.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-opie/opie-init/opie-init.inc b/recipes-opie/opie-init/opie-init.inc
index 99ebbe0..844cc14 100644
--- a/recipes-opie/opie-init/opie-init.inc
+++ b/recipes-opie/opie-init/opie-init.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 #APPNAME = "qpe"
 
-#S = "${WORKDIR}/launcher"
+S = "${WORKDIR}"
 
 inherit palmtop-defs update-rc.d
 
-- 
2.1.4


