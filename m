Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 964DA6D2FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 04:46:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9O4kqh1002049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Oct 2013 21:46:52 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 23 Oct 2013 21:46:51 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2013 12:47:39 +0800
Message-ID: <1382590059-20109-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH] autofs: fix do_install failure and remove unused /var/run directory
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
X-List-Received-Date: Thu, 24 Oct 2013 04:46:52 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If ${D}/run doesn't exist, the following statement will have non-zero
exit code, which leads to do_install failure.
     test -d ${D}/run && rmdir ${D}/run

Modify it to use the if statement to make the do_install task succeed
no matter ${D}/run exists or not.

Also, this patch removes the unused /var/run directory. Leaving that
directory there will result in /run directory created before splitting
package, which in turn lead to 'installed-vs-shipped' QA error or QA
warning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-daemons/autofs/autofs_5.0.7.bb         |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index f8df0ef..c4eea31 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -96,7 +96,12 @@ do_configure_prepend () {
 }
 
 do_install_append () {
-    test -d ${D}/run && rmdir ${D}/run
+    if [ -d ${D}/run ]; then
+	rmdir ${D}/run
+    fi
+    if [ -d ${D}${localstatedir}/run ]; then
+	rmdir ${D}${localstatedir}/run
+    fi
 }
 
 INSANE_SKIP_${PN} = "dev-so"
-- 
1.7.9.5


