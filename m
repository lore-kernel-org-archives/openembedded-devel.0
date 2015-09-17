Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 711FE76DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:43 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so97096499wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=h9/r34FgTio+/c8Yx/NryFJ+O0q7NuhEDq14JrhpVmo=;
	b=u31gagcqGJ8VuSL9R8E++aGkcasWKRLPTwnLO5Av11vmqX2uv65iN2dVRzUizgaWYF
	07Ip87EkQuVatsESL6GpYvOJCETZb6sfyUvfWd7MxPAN7n/lx70BX3vhS5oSuEpnlsUv
	VfildtvwPsAPr8/jMdnpXekQDperEM+iTextrEKfqVQTG1Klu7jjJwUYkBEGFoYW+lqT
	Xad7zkCXDMWUxedwziIP4WraGj/fob+IYG1wuhtA3L6DyEh354PWiWdJuDfAJOthYyHs
	ylkyK6KOpVpnVW+Q92Ai15jbIbWKBw+/uvW3e+wqf1rzyTljESqxdhzOUpEhA6+pEFSB
	t43Q==
X-Received: by 10.194.24.196 with SMTP id w4mr57194163wjf.137.1442450503191;
	Wed, 16 Sep 2015 17:41:43 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:13 +0200
Message-Id: <1442450491-14912-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/19] gvfs: remove invalid PACKAGECONFIG[cdda]
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enabling cdda requires libcdio-paranoia not libcdio. libcdio-paranoia is not
found in layer list so disable cdda.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index 7ed1bb5..2404fac 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -1,13 +1,13 @@
 require gvfs.inc
 
 DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 avahi gconf intltool-native"
-# optional: obexftp libcdio libimobiledevice 
+# optional: obexftp libcdio-paranoia libimobiledevice
 
 PR = "${INC_PR}.0"
 
 # in case of gnome-disk-utility was alresdy built: avoid double files
 # afc is enabled when it detects libimobiledevice
-EXTRA_OECONF += "--disable-gdu --disable-afc"
+EXTRA_OECONF += "--disable-gdu --disable-afc --disable-cdda"
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
 
@@ -31,4 +31,3 @@ PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
 PACKAGECONFIG[fuse] = "--enable-fuse, --disable-fuse, fuse"
 PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
 PACKAGECONFIG[obexftp] = "--enable-obexftp, --disable-obexftp, bluez4 expat"
-PACKAGECONFIG[cdda] = "--enable-cdda, --disable-cdda, libcdio"
-- 
2.1.0


