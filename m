Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D09A66C111
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jan 2019 09:33:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0N9XGYd013388
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jan 2019 01:33:16 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 01:33:16 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Wed, 23 Jan 2019 01:33:15 -0800
Message-ID: <20190123093315.104983-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] openldap: improve reproducibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2019 09:33:15 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Rework remove-user-host-pwd-from-version.patch to
fix below buildpath warning:
| WARNING: openldap-2.4.46-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/openldap/2.4.46-r0/packages-split/openldap-bin/usr/bin/ldappasswd in package contained reference to tmpdir [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../openldap/openldap/remove-user-host-pwd-from-version.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
index 4eb389797..ac18f0830 100644
--- a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
+++ b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
@@ -11,7 +11,7 @@ diff -ru openldap-2.4.46.orig/build/mkversion openldap-2.4.46/build/mkversion
 +   DATE=$(date -d@$SOURCE_DATE_EPOCH +' %b %d %Y ')
 +   TIME=$(date -d@$SOURCE_DATE_EPOCH +' %H:%M:%S ')
 +else
-+   WHOWHERE="$USER@$(uname -n):$(pwd)"
++   WHOWHERE="openldap"
 +   DATE='" __DATE__ "'
 +   TIME='" __TIME__ "'
 +fi
-- 
2.17.1


