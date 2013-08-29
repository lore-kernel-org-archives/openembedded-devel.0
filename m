Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id E54C96BCF7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:49 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so341146eak.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=PdkHi6mV6pKoFR9oYZodpWbHUtiTbANrdVi4EXEjS8A=;
	b=lQ2HXxBMkmLCk7CWzNIPhvtF4EyueC84ZgDAW8w0CewN+y/DMNSY7j60gLCxhPYdrr
	gIpXU1mkhqP1zWMVFA3ReRkuR1I4gs/Zz93mBz0iHd1BsbozHq1LVXTjAvW+KdkPaqGy
	+FwzHjRwL+Ibte9NM3DVhKFPSBURJdULvRpEshmovnew6PKDCvPqiWoeteoBCxRlwUv7
	JcpYi5xldULlLzdVWBL3aC1yIMPfUqe0JJmCO8gLujnwA0LjKXjybsekdpxF1fnhdaMW
	+dVZNTCJETaB7TclZ8YBVaIg3WI5YDxMlAQSGv1SkCK3oN4Qs7BS3QvSYz1E43y6o6oX
	WX8w==
X-Received: by 10.15.26.7 with SMTP id m7mr5344194eeu.56.1377791450269;
	Thu, 29 Aug 2013 08:50:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47150949eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:50:54 +0200
Message-Id: <319d3ad320a598275856171a22a38ea0c3d63e07.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 01/66] gvfs: Add PACKAGECONFIG for fuse and disable it by default
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
X-List-Received-Date: Thu, 29 Aug 2013 15:50:50 -0000

* fuse was moved to meta-filesystems, so disable fuse by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index cab0d34..d9a054b 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -1,6 +1,6 @@
 require gvfs.inc
 
-DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
+DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 avahi gconf libgphoto2"
 # optional: obexftp libcdio libimobiledevice 
 
 PR = "${INC_PR}.0"
@@ -26,3 +26,5 @@ PACKAGECONFIG ?= "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'samba',
 
 PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
                         --with-samba-libs=${STAGING_LIBDIR}, --disable-samba, samba"
+# needs meta-filesystems
+PACKAGECONFIG[fuse] = "--enable-fuse, --disable-fuse, fuse"
-- 
1.8.3.2


