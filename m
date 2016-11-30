Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6B871ABC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:20 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 72512B80910; Wed, 30 Nov 2016 13:04:07 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:04:05 +0100
Message-Id: <1480507445-20746-17-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 17/17] Revert "samba: blacklist, fails to build with new binutils-2.27"
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:20 -0000

This reverts commit 80b2d4de0ee2a5e6a3302a527e3fcfd2b99c3e37.

Disable cluster support, which causes the error.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 8c5f6d8..564b61e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -81,7 +81,7 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-system-mitkrb5 \
                  --without-ad-dc \
                  ${@base_conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
-                 --with-cluster-support \
+                 --without-cluster-support \
                  --with-profiling-data \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
                  --with-pam --with-pammodulesdir=${base_libdir}/security \
-- 
2.7.4


