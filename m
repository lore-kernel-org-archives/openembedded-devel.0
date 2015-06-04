Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6253A734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:10:02 +0000 (UTC)
Received: by pabqy3 with SMTP id qy3so19804664pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rgOX4AM9w5pfpr1VwWG5UVm5eIW3Hi+ihIyzTugG+Ag=;
	b=nNiLGsMo77xlZqUcLEjvwqUzh8FmQN+J5Do3lNBOvA9dFajBlHvyPEQjfNiqVlmW/T
	HObWnomMWxngs5PnOTEQQTLPIVMCRYxd9cx3pt7Xj0Mw7LQNHlnZATXN5G+XQJDjHVzp
	XygoFH2SN3RjEktm3We3VpQy6knPOQgyVj7a6Ms75XGwkEoF5ZslChiktIeGVDsmuBXC
	R0Bh9xyK+45EfHtdgxyyoVpwNbJ27nXsQtYtS+6OixibMpJu9NCfz06WSXe2TXNfEbkt
	1kqsXFaNJ8098tkUvNek1gV9fASHUuqMQcFoPF9TPvZE6KRKYqF2Mgq6hGYpT1tigx1S
	6TTQ==
X-Received: by 10.70.38.170 with SMTP id h10mr54258839pdk.20.1433387404029;
	Wed, 03 Jun 2015 20:10:04 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id k13sm2018242pbq.79.2015.06.03.20.10.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:10:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:09:44 -0700
Message-Id: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/5] elbow: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:10:03 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-efl/recipes-efl/e17/elbow_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-efl/recipes-efl/e17/elbow_git.bb b/meta-efl/recipes-efl/e17/elbow_git.bb
index 16664f9..29881ab 100644
--- a/meta-efl/recipes-efl/e17/elbow_git.bb
+++ b/meta-efl/recipes-efl/e17/elbow_git.bb
@@ -9,6 +9,7 @@ SRCREV = "b41fd0bc9514ff61bb2a50d957efe4155fa3e6a8"
 # webkit-efl isn't available for < armv7a
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_i686 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-- 
1.9.1


