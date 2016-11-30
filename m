Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id D90AD71AA7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:12 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 9342BB80910; Wed, 30 Nov 2016 13:04:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:56 +0100
Message-Id: <1480507445-20746-8-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 08/17] samba: remove unused variable DISABLE_STATIC
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:13 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index f2b6447..f232c60 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -85,7 +85,6 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
                  --with-pam --with-pammodulesdir=${base_libdir}/security \
                 "
-DISABLE_STATIC = ""
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-- 
2.7.4


