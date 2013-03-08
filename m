Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UDrty-0003DG-8f
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 08:39:40 +0100
Received: by mail-pb0-f50.google.com with SMTP id up1so991531pbc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 23:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=p9dgaSAP0PJgevnLgUoJrjW1sJM+hWBO4pY/6yKhnBs=;
	b=tZPbQ5PuMWUNf6iIxWv6MYasvgjbxQGyzmptFM2x9bw8hCbdo4vpdIXfvqZ/s1BD60
	3tKoymFFC7Np9HbIS0mtrlq2Rscqdv9TFFw866OKQp7oI+ntYPzM3KO9NEl1g2ukizc6
	EU2mVahynhiRD+6+jReamIeTB+2coxfHmqPcKFEqTPki2bw5x1md9tgcvULjgVdhfPat
	ATBQoMddAIwvfsvuUQLKpZG+VIxfPSDlyvtXdR3xN12JAlCqmWHPO7TgKoLWbb4QSJA9
	dAIyG70PNL4C5iDaru7tgEPHV0XIQS6I724ZjfwuXUqcp4Z2CkNALM2284wg2AVmWJvo
	+qFw==
X-Received: by 10.68.217.202 with SMTP id pa10mr1911845pbc.11.1362727382074;
	Thu, 07 Mar 2013 23:23:02 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qd8sm4610792pbc.29.2013.03.07.23.23.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 23:23:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 23:22:35 -0800
Message-Id: <1362727355-12872-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-kde][PATCH] angstrom-kde-active-image.bb: Fix typo in IMAGE_BASENAME
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 07:39:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-images/angstrom-kde-active-image.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-images/angstrom-kde-active-image.bb b/recipes-images/angstrom-kde-active-image.bb
index 10fb819..8743231 100644
--- a/recipes-images/angstrom-kde-active-image.bb
+++ b/recipes-images/angstrom-kde-active-image.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 
 include recipes-images/angstrom/systemd-image.bb
 
-export IMAGE_BASENAME = "ansgstrom-kde-active-image"
+export IMAGE_BASENAME = "angstrom-kde-active-image"
 
 IMAGE_FEATURES += "package-management"
 IMAGE_INSTALL += "\
-- 
1.7.9.5



