Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id B77826B4F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:13 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so1269734eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gUMOTpbduMVDvHOdMAQ5kiuLr3iQKlWASQr+g8aarpc=;
	b=HBdY3/K7lVAjdVCEPcNLRcqmXXJf0InUibP+Euo4a4vqFupKguMGMtXHe/AXQcdjC/
	/6+fyttF9LnBvcuwZmjJL5EOz3JHyubcTzpomud7xelp4/+Kqtwcf4w8752FP2S0ZguT
	RkEZIs2yF/RbSsYi7TVeF3hcskmKVr9vdPhYVxyliYTF7mDBA2LZSKjBhA7fV2eVtuF9
	iTpQ2QkbQqXOFUWQUDVyFkQzu1r8ABWAR2shKmHetdGetpgN/fm2oZ0ZReslpH7ftfwW
	xwpstyiyMbmkdIM/Z4D7kzkPtlmPGoN3rjqB5kOrIw7mgJKA77x2FmZuvL4YWu1ipuTj
	nkxg==
X-Received: by 10.14.107.2 with SMTP id n2mr14063946eeg.122.1375652833847;
	Sun, 04 Aug 2013 14:47:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e1sm17027952eev.8.2013.08.04.14.47.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:36 +0200
Message-Id: <1375652867-10498-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/15] devilspie: add dependency on startup-notification
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:14 -0000

* Package 'libstartup-notification-1.0', required by 'libwnck-1.0', not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
index 9e6ba90..f4fc175 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
                     file://GPL3.txt;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "gtk+ glib-2.0 libwnck lua5.1 virtual/libx11"
+DEPENDS = "gtk+ glib-2.0 libwnck lua5.1 virtual/libx11 startup-notification"
 
 SRC_URI = " \
     http://www.gusnan.se/devilspie2/download/devilspie2_${PV}-src.tar.gz \
-- 
1.8.3.2


