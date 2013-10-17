Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 60B916CD0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:45:16 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:45:14 +0200
Message-Id: <1382010314-6720-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382009891-6444-1-git-send-email-obi@opendreambox.org>
References: <1382009891-6444-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH v2 1/2] autofs: pass systemd directory to configure
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
X-List-Received-Date: Thu, 17 Oct 2013 11:45:17 -0000

Otherwise, configure will try to auto-detect using host paths.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 0c66ebc..905be40 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -85,6 +85,7 @@ EXTRA_OECONF += "--disable-mount-locking \
 "
 CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
                         ac_cv_path_RPCGEN=rpcgen \
+                        systemddir=${systemd_unitdir}/system \
 "
 
 do_configure_prepend () {
-- 
1.8.1.2


