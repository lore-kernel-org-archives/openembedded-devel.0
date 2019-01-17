Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id D832B7C1EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:26:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 923225C21AB;
	Thu, 17 Jan 2019 17:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547742395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Bl/rHnVIB8elAVUt9oB9BiddwvDpW0RBB7Y1q73zUtg=;
	b=TpZysedF3bX6FtqrELrdsNo90f6MGx6tuetBw32yndqe+l4+VeY+7jrA9T5N1tyBY+bUa5
	fi6FoOBmDbJ6+OGYQ+4NpUlJrxRz3hBrPYn6nr+woLFlRx/IVjRamPwU8mE/ypb5qWNrcC
	evdDmHYzVtRhp/elWxWsqK0tZt0NN8o=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:28 +0100
Message-Id: <20190117162629.47677-4-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190117162629.47677-1-stefan@agner.ch>
References: <20190117162629.47677-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 4/5] packagegroup-meta-oe: add polkit depending on distro feature
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
X-List-Received-Date: Thu, 17 Jan 2019 16:26:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Add polkit and related packages depending on whether polkit is
enabled in DISTRO_FEATURES.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 62f1c7759..1ec649355 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -136,8 +136,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     libpwquality libqb libuio \
     lockfile-progs logwatch lprng mailx md5deep \
     mozjs mraa nana nicstat \
-    p7zip p8platform libfile-fnmatch-perl polkit \
-    polkit-group-rule-datetime polkit-group-rule-network \
+    p7zip p8platform libfile-fnmatch-perl \
     rarpd redis rrdtool libfastjson librelp rsyslog sanlock \
     sblim-cmpi-devel sblim-sfc-common sblim-sfcc \
     scsirastools sgpio smartmontools snappy can-isotp \
@@ -148,6 +147,8 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "bluez", "collectd", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit polkit-group-rule-datetime ", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-network ", "", d)} \
     ${@bb.utils.contains("BBPATH", "meta-python", "openlmi-tools", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
-- 
2.13.6


