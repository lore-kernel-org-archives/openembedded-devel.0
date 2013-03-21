Received: from mail-ia0-f177.google.com ([209.85.210.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UIna7-0002lC-70
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 23:03:31 +0100
Received: by mail-ia0-f177.google.com with SMTP id y25so2953021iay.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=u0h671vT33qtJ9fa1WmtvogP5JyImFqS37XVhhr5wO4=;
	b=DenVhky9liSjF1Q8aQj5DEWWMYLy3S6BMhvmaLTRrVk5pvEpba31Vz29tONiC/GYqV
	MAbwiPjMDJQwcl5iXHGEY8nZiAGOq8BoZNG4PJr+UJWNeU5qICO56JHOG+HXcMEURVVK
	bAG0AiUP476ix+PxbgPcjdTTrdF962UnDCiwVLVfXEOlStZ38mXxKAR7f1fbSK/ojxGV
	jk+IOj5/mpkP2E+LrYTS+kLGSdZzwI7iXTYxlSEe4j7cLaSSOESTZxwo2hl7hWNN4OPp
	uO5kyx/IV3TzixX79Seow784OJqYtqAOt9GM1tPRoBS5xSdOzBU6b4OC5i9vMAm3o2mo
	0iEg==
X-Received: by 10.50.13.208 with SMTP id j16mr3456956igc.73.1363902397827;
	Thu, 21 Mar 2013 14:46:37 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id y5sm2613553igg.7.2013.03.21.14.46.35
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Mar 2013 14:46:36 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Mar 2013 14:46:31 -0700
Message-Id: <1363902391-29945-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
Cc: Christopher Larson <chris_larson@mentor.com>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-networking][danny][PATCH] layer.conf: Use .= for adding to BBPATH and += to BBFILES
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
X-List-Received-Date: Thu, 21 Mar 2013 22:03:35 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Fixes parsing errors which is appearing after this commit to
meta-openembedded

http://cgit.openembedded.org/meta-openembedded/commit/?id=3c21a46020bd0816579648f684c41dbd6333583e

This triggers
exception NameError: name 'base_contains' is not defined
without this change

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/conf/layer.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index f26a172..1ea2bc2 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -1,9 +1,9 @@
 # We have a conf and classes directory, add to BBPATH
-BBPATH := "${BBPATH}:${LAYERDIR}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a packages directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
- ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "networking"
 BBFILE_PATTERN_networking := "^${LAYERDIR}/"
-- 
1.8.2



