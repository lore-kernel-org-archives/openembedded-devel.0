Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1Ra8nD-0006eb-6K
	for openembedded-devel@openembedded.org; Mon, 12 Dec 2011 17:31:57 +0100
Received: by qcqw6 with SMTP id w6so3630069qcq.6
	for <openembedded-devel@openembedded.org>;
	Mon, 12 Dec 2011 08:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ELi0h67W97nkDJQ950wqm4zRG46WT3IVCZaA1SdNaZY=;
	b=bB/zisXoysSVfyngzbu/074ydSaUvbanFeqJVAMth/sncB1GiMUC5jVM8XXqp/OgmA
	N3ZuXQt5jwZ2CyNNLsuXkaG33r8lNRyJdQp+kBrOy2xx/MaTdVNlcFQj/bGPvr90PTRz
	ff/rpVSIyeV83PRCEZApnzDXtZbV9IlySHPdE=
Received: by 10.229.231.71 with SMTP id jp7mr4603069qcb.128.1323707098631;
	Mon, 12 Dec 2011 08:24:58 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-240-172-5.ronkva.east.verizon.net. [96.240.172.5])
	by mx.google.com with ESMTPS id eb5sm37323705qab.10.2011.12.12.08.24.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 08:24:58 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Mon, 12 Dec 2011 11:24:42 -0500
Message-Id: <1323707082-9185-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1323707082-9185-1-git-send-email-philip@balister.org>
References: <1323707082-9185-1-git-send-email-philip@balister.org>
Subject: [PATCH 2/2] gvfs : Fix build failure due to introduction of host includes.
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
X-List-Received-Date: Mon, 12 Dec 2011 16:31:57 -0000

Tested with Angstrom on usrp-e1xx.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
index 5a230eb..fd4a089 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
@@ -14,6 +14,7 @@ SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
 SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
 
 EXTRA_OECONF = "--disable-samba \
+                --disable-archive \
                 --with-samba-includes=${STAGING_INCDIR} \
                 --with-samba-libs=${STAGING_LIBDIR} \
                 --with-archive-includes=${STAGING_INCDIR} \
-- 
1.7.3.4



