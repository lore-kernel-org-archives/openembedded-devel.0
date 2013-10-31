Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D33006D3E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:28:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V6SnVR010921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 23:28:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 23:28:48 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:29:43 +0800
Message-ID: <1383200986-18674-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
References: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/5] radvd: fix pkg_postinst
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
X-List-Received-Date: Thu, 31 Oct 2013 06:28:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

`/etc/init.d/populate-volatile.sh update' only needs to run in case
of an on-target installation. And it should have a prerequisite that
the script is executable.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/radvd/radvd.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 89669f7..f314fee 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -38,5 +38,7 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
 
 pkg_postinst_${PN} () {
-    ${sysconfdir}/init.d/populate-volatile.sh update
+    if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
+	/etc/init.d/populate-volatile.sh update
+    fi
 }
-- 
1.7.9.5


