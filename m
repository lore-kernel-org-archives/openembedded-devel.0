Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@erafx.com>) id 1PEOq3-0007gk-BJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 17:08:29 +0100
Received: by qwd6 with SMTP id 6so2544857qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 09:07:31 -0700 (PDT)
Received: by 10.224.212.133 with SMTP id gs5mr1359469qab.172.1288973251877;
	Fri, 05 Nov 2010 09:07:31 -0700 (PDT)
Received: from localhost.localdomain ([24.165.208.114])
	by mx.google.com with ESMTPS id t35sm1474584qco.18.2010.11.05.09.07.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 09:07:30 -0700 (PDT)
From: Bob Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Nov 2010 12:06:21 -0400
Message-Id: <1288973181-2946-1-git-send-email-robert@erafx.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: robert@erafx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Bob Foerster <robert@erafx.com>
Subject: [PATCH] postgresql-8.1.8 : fix configure on x86
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
X-List-Received-Date: Fri, 05 Nov 2010 16:08:30 -0000

Without this patch, postgres fails on configure:
| checking alignment of int... configure: error: cannot compute alignment of int, 77
NOTE: package postgresql-8.1.8-r4: task do_configure: Failed

Similar fix for arm was in 5fa3d153.

Signed-off-by: Bob Foerster <robert@erafx.com>
---
 site/ix86-common |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/site/ix86-common b/site/ix86-common
index 5323c7a..8a4a4c3 100644
--- a/site/ix86-common
+++ b/site/ix86-common
@@ -202,6 +202,13 @@ rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
 rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
 rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
 
+# postgresql
+pgac_cv_alignof_short=2
+pgac_cv_alignof_int=4
+pgac_cv_alignof_long=4
+pgac_cv_alignof_long_long_int=8
+pgac_cv_alignof_double=8
+
 # samba
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
 
-- 
1.7.0.4



