Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1UImCh-00051T-DJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 21:35:16 +0100
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2LKIKu4006936;
	Thu, 21 Mar 2013 13:18:21 -0700 (PDT)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org, marcin.juszkiewicz@linaro.org
Date: Thu, 21 Mar 2013 16:18:18 -0400
Message-Id: <1363897098-26498-2-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <1363897098-26498-1-git-send-email-joe.macdonald@windriver.com>
References: <1363897098-26498-1-git-send-email-joe.macdonald@windriver.com>
Subject: [meta-networking][PATCH] cyrus-sasl2: clean up rpath QA errors
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
X-List-Received-Date: Thu, 21 Mar 2013 20:35:17 -0000

Cleaning QA errors from commit 770b14191143fd89fa18daa4048af1f618debdee

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 44336f0..7b3e674 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -11,7 +11,8 @@ inherit autotools pkgconfig
 EXTRA_OECONF += "--with-dblib=berkeley \
                  --with-bdb-libdir=${STAGING_LIBDIR} \
                  --with-bdb-incdir=${STAGING_INCDIR} \
-                 --without-pam --without-opie --without-des"
+                 --without-pam --without-opie --without-des \
+		 andrew_cv_runpath_switch=none"
 
 do_configure_prepend () {
     rm -f acinclude.m4 config/libtool.m4
-- 
1.8.2



