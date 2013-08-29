Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id C05E96BE00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:30 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so341760eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=tihg+Vq6jMg7vgLfvVYVFunYSFsRxIjnqHeVvQvO5Cw=;
	b=aBaiuuL5kVC6DZ5TAt4kJXtPpP4kf++5gO9kwaJ+CW6yayc8RHsHcP0Ron02nMFwMA
	6NGUBmn6JtgdzSvG6voTiRgcSjVfdlfDfgP7ld+zxJEB2083bvaGcaMGQjm53PO8+lTB
	NbMtajOlNSjyAxB2jCzomftFxbJqVGf8+GI74bmzKhsIqtzYXSQeoDGhQd9qNkGmjOOC
	ZRmn9VUwQWTaZjEQTzRNm8ubzWJyfdvEz6/6WEaho8iukxFAqX5wcx4kbXYi1zQgJnxp
	m73U4y9XY1jtCBFRixZe0egCJ60XVEwVxGg7s9YIhBq3r8GEqPvt6jOy24nACMT3IB6g
	49zA==
X-Received: by 10.15.94.201 with SMTP id bb49mr5419849eeb.23.1377791491244;
	Thu, 29 Aug 2013 08:51:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm47162356eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:24 +0200
Message-Id: <e3a350dfb02fa668c469c0722571019115d4591c.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 31/66] gvfs: Add PACKAGECONFIG for archive, obexftp, cdda
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index d9a054b..d637399 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -28,3 +28,6 @@ PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
                         --with-samba-libs=${STAGING_LIBDIR}, --disable-samba, samba"
 # needs meta-filesystems
 PACKAGECONFIG[fuse] = "--enable-fuse, --disable-fuse, fuse"
+PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
+PACKAGECONFIG[obexftp] = "--enable-obexftp, --disable-obexftp, bluez4 expat"
+PACKAGECONFIG[cdda] = "--enable-cdda, --disable-cdda, libcdio"
-- 
1.8.3.2


