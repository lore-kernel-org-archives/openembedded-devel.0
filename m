Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnU-0007Yq-Gd
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:23 +0200
Received: by mail-gw0-f47.google.com with SMTP id a11so1560489gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:44 -0700 (PDT)
Received: by 10.100.209.8 with SMTP id h8mr2713214ang.43.1287793004108;
	Fri, 22 Oct 2010 17:16:44 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:43 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:50 -0200
Message-Id: <4cc2296b.0311650a.0c4d.ffffaf64@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/17] Evas: Tweak configure options
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:23 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Enable pthreads, async events and async preload.

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/evas_svn.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/efl1/evas_svn.bb b/recipes/efl1/evas_svn.bb
index 805e64b..a03230a 100644
--- a/recipes/efl1/evas_svn.bb
+++ b/recipes/efl1/evas_svn.bb
@@ -8,8 +8,10 @@ EVAS_CPU_TWEAKS = ""
 EXTRA_OECONF = "\
 		--x-includes=${STAGING_INCDIR}/X11  \
 		--x-libraries=${STAGING_LIBDIR} \
-        --enable-evas-magic-debug \
-        \
+		--enable-evas-magic-debug \
+		--enable-pthreads \
+		--enable-async-events \
+		--enable-async-preload \
 		--enable-fb					\
 		--disable-directfb			\
 		--disable-sdl				\
-- 
1.7.3.1



