Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrN-0004PX-MY
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:52:02 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0QK73AUhuHaHAyB4B1e+VqRJb1R8dsYMT5vfeoVfU6A=;
	b=EQZqT/96cLwPpP8R4qKl9oebc/pphhr0KIMHRwBIEOi2jRFw4slwGTPY/xy9wkmGmb
	GGCVuEjhJKx6CZrObKon+5terEyU8uKTgQbXCPJlV5BiXHHDY1lrpAJsU8aQTzthbdEc
	3lTYtX1fbWiUy/POrkOxNQxB571ClzuGLnbvMUmbSCAKyybiD+S6njUz1c3TF+zNLSaj
	WulmXBmH2N0Ei/vW4WQcTU4JYVkPWk0p/sxfskVIFkds2/Z93fsoeYgEywQJBgVm2u6m
	vhH5F2dnhG5n+PyseOYSE0nKSbWzeigRubYeASsly16Q+pwCO+o9bvnXUpk0MOs/G3cV
	laFw==
Received: by 10.14.37.205 with SMTP id y53mr3224446eea.124.1339148493772;
	Fri, 08 Jun 2012 02:41:33 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id s47sm20255621eef.4.2012.06.08.02.41.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:38 +0200
Message-Id: <1339148443-9467-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQma5GeAXmWod4mPWVNL1HrNg+jFTaxWlqAMhhkSyrhqqfXzDUxJHOdI05Kqr1U+pUxGzKPS
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 09/14] python-numpy: Fixed numpy dependencies.
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
X-List-Received-Date: Fri, 08 Jun 2012 09:52:02 -0000

From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>

Numpy was missing a number of dependencies in the .bb file without which it will
not work.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index 36ab622..bae624e 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -24,3 +24,8 @@ do_compile_prepend() {
 
 SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
 SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
+
+RDEPENDS_${PN} = "python-unittest \
+                  python-diffutils \
+                  python-pprint \
+                 "
-- 
1.7.10



