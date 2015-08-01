Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7D672765A6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Aug 2015 16:24:16 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so69903917wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Aug 2015 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UqTj2motOjFW/5pGXEZRvKf1nkC7PmUZjMrneJCwjBs=;
	b=aLvN1vGPKwcUvDWMPHLCOVLq1AJBxuyUhroM8sMfieA9N+e7ftwAYczbNt0YMbCIOG
	9rVxS8+zp5Xp8VNIxQjD+zDbf8FIW8QSydNaLeP9xGQucHHRNkyS7qTn+qaQnIQiPHWj
	gXjhM4DbgK0lzqOl6laElaPwILejOrNkHdluQyH1z9sflwE14jZIMkmMb2MdWSOhHp5Y
	MModVKgbSNlivETqcj9Bxwwz4Jr474KdzJfX8NkN8/31a40Bd25ZuQnK4R2jZOl+6oFZ
	xqx8WA0WEIzKr3E3oP9nvjcvTz6wX4LM0DXrTm54c7WSh4gRRUDMJ2W3NDKLcQGOiqJu
	vhVQ==
X-Received: by 10.180.189.17 with SMTP id ge17mr17393095wic.90.1438446256234; 
	Sat, 01 Aug 2015 09:24:16 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	pn6sm13172340wjb.36.2015.08.01.09.24.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Aug 2015 09:24:15 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Aug 2015 18:23:19 +0200
Message-Id: <1438446199-20081-2-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1438446199-20081-1-git-send-email-max.oss.09@gmail.com>
References: <1438446199-20081-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-gnome][PATCH 2/2] gvfs: add packageconfig for libgphoto2
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
X-List-Received-Date: Sat, 01 Aug 2015 16:24:18 -0000

default to compile with libgphoto2, thus no change to old behaviour.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index 131c849..7ed1bb5 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -1,6 +1,6 @@
 require gvfs.inc
 
-DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 avahi gconf libgphoto2 intltool-native"
+DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 avahi gconf intltool-native"
 # optional: obexftp libcdio libimobiledevice 
 
 PR = "${INC_PR}.0"
@@ -22,8 +22,9 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
 RDEPENDS_${PN} = "gvfs-gdu-volume-monitor"
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
 
-PACKAGECONFIG ?= "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'samba', d)}"
+PACKAGECONFIG ?= "libgphoto2 ${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'samba', d)}"
 
+PACKAGECONFIG[libgphoto2] = "--enable-gphoto2, --disable-gphoto2, libgphoto2"
 PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
                         --with-samba-libs=${STAGING_LIBDIR}, --disable-samba, samba"
 # needs meta-filesystems
-- 
1.9.3


