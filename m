Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYU-0003jX-6z
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:16 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id 826501B7A3; Wed, 19 Aug 2009 20:25:51 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:39 -0700
Message-Id: <1250738680-20274-8-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-7-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<1250738680-20274-7-git-send-email-clarson@mvista.com>
Subject: [PATCH] bitbake.conf: BUILD_LDFLAGS: use $ORIGIN in the -rpath rather than a full path.
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:20 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 371bf8e..9cb6039 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -447,7 +447,7 @@ export SDK_CXXFLAGS = "${SDK_CFLAGS} -fpermissive"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
-                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
+                        -Wl,-rpath,\\\$\$ORIGIN/${@base_path_relative(d.getVar('STAGING_BINDIR_NATIVE', 1), d.getVar('STAGING_LIBDIR_NATIVE', 1))} -Wl,-O1"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
 export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
-- 
1.6.0



