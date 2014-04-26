Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8035060782
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:53 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id rp16so958663pbb.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vZBjLL0R1os8VBcf6k/lH7M5cuK+OkyKjpSuYdIApCE=;
	b=Pji0RUqbXA0SNGY6clGKTCRVo3RUtVrhF54gA8SLqpueAF0C0fKKGNjfnzT0p63jU5
	QhipWWFbBeswl8nxSwG4Nw76y3C5J16wENkjc/VPnCt3ANUe6BcfqPxLF6vUAwZEnqZQ
	2JHODz8cKQxuONW75tpeaA6zTzkVSe6h/9ss+UU31mSEg0p56w54l1ChpYsnVySJaJLL
	vKdABmn0BrjY7Cgi6HZf/E6kXjXMx1DzwW5AR3l65LQYTcGFPzD6K+HnY0BHYFtiMlAC
	NhNwDq48WT1u8buBw9bvmXLEqLjNsaOb6yU+dAoqWyEmDyiXeIblQELr1Shkea0a7j1N
	VC/Q==
X-Received: by 10.66.166.47 with SMTP id zd15mr15909748pab.0.1398544374389;
	Sat, 26 Apr 2014 13:32:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:38 -0700
Message-Id: <1398544484-27299-15-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 15/21] libgnomekbd: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index 48ec450..d148062 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -12,11 +12,7 @@ SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
 SRC_URI[archive.sha256sum] = "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
 
 do_configure_append() {
-    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
+    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
-
-
-
-
-- 
1.7.10.4


