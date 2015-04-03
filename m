Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2A973C3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 03:12:43 +0000 (UTC)
Received: by igcau2 with SMTP id au2so59168524igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2015 20:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c0bohA9NSlkJUUchpn6bgXO3e+FmN4SAxPYaAJkbvag=;
	b=UwU/UG3mkiSoMQWK0GRu+lHCdnydGQWZgEa58acQ49xohJepMWvpjeq+T6Ef5aAY1X
	byinf9VHhA9WwfH+WUUmV0eybrQnJZbo9I8co2ihjpfb7uoY8n+GIv1D8bm3EHX178bx
	6EjB2qNB0MCRE6HEh4vWH2TYBBEjLEAU0lcHFLboLL1vJyYyyqGwnj9aPdIVjbZHh3/k
	oGmVOGBOFwovlrg8E+tYKUzatpCqaoWnWeHypCm3VKzHJM+YCfeWGjINJSfdb9bKn36w
	y9mUXQcSibSUX79zauoZ/2kf+OJ69cydvbR9MEqHuRpjBaNFn6Pp2HBLZ3rYDf8UrP4g
	VseQ==
X-Received: by 10.42.89.200 with SMTP id h8mr1248322icm.48.1428030764494;
	Thu, 02 Apr 2015 20:12:44 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id s10sm639707igr.2.2015.04.02.20.12.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Apr 2015 20:12:43 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2015 20:12:33 -0700
Message-Id: <1428030753-11974-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] log4c: disable binconfig file
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
X-List-Received-Date: Fri, 03 Apr 2015 03:12:44 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index ea75757..3286b08 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -12,4 +12,6 @@ SRC_URI[sha256sum] = "5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eade
 PACKAGECONFIG ??= "expat"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
 
-inherit autotools
+BINCONFIG = "${bindir}/log4c-config"
+
+inherit autotools binconfig-disabled
-- 
1.9.1


