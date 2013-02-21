Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U8QuX-0001jh-Hp
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 08:49:45 +0100
Received: by mail-pb0-f45.google.com with SMTP id ro8so3376573pbb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 23:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=p9dgaSAP0PJgevnLgUoJrjW1sJM+hWBO4pY/6yKhnBs=;
	b=JivfUjSBYVL+Oyq8452vQcDo+2Q2TZUQWSyORX08Ei28yAcB9xrCzlkK9Lqgp2CvWF
	6JUB37UcusYjYbqA1Yxv9Q+cXZ2JRHElgYRxgUoAWbDIsG5KmCEN+a0hwNvRkn8qoQ+i
	vGku59n6oOpZHTwNKPe6RYCd8mzE3gmrQOKBWKk3M+6IRuzXnhYXs58V1dSb46fbyRCs
	qa0jrCHjhFZfd2th0zAqMW3K01w1yb4QTHeaOb0S8xAnvA/sPQ6dYi3SoaZnUnXUYxq8
	Se+hTS+t5iDhp/Chkje9Bd2AY1DNfP5VLoVnChvCXUPbmuR4kg+TmoNCZbjcujo4NLZZ
	pPkg==
X-Received: by 10.68.226.97 with SMTP id rr1mr5360580pbc.146.1361432013007;
	Wed, 20 Feb 2013 23:33:33 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	bi2sm114089782pab.18.2013.02.20.23.33.32
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 23:33:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 23:33:21 -0800
Message-Id: <1361432001-14607-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1361432001-14607-1-git-send-email-raj.khem@gmail.com>
References: <1361432001-14607-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-kde][PATCH 2/2] angstrom-kde-active-image.bb: Fix typo in IMAGE_BASENAME
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
X-List-Received-Date: Thu, 21 Feb 2013 07:49:46 -0000

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



