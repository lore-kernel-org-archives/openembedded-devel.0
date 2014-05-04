Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 148D260173
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 19:01:59 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id mc6so207096lab.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 12:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+58pM+eO1wd7Ta5NF3xf8PUriFVB/0GdntUpSipdXCY=;
	b=lkD96anf4pjqXAvjbqUQNbEovdc6urNWidjnieEdffQcwr2H9gfwu/QC6l1JrI9sgb
	TaMi2ras+ptPXBN/gBragBzLQNEamA4wrYjP8DcASFuYP2hsp6h770XuNxmg/6NvLq4X
	MO8DkRxH8ygfLY3QIndhulbRkhXPSTe93eNh0t8bcQLiJp2qCeQVEMUGEG1xp1CWjcyn
	ZCeJwfAD544yH6TSbvUe3yXYpKdH2HavAP/9hSIFdjK6MrcaLiKr/KsJJARIjjmT0Mip
	400LFFFhuKg3INTawsvHyEYTabM/42afCUrEMKsfBW+0jxnKycyRBJnhZxSXZsX4cAHo
	aYzg==
X-Received: by 10.112.118.20 with SMTP id ki20mr2489041lbb.45.1399230120216;
	Sun, 04 May 2014 12:02:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g6sm5882855laa.10.2014.05.04.12.01.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 12:01:58 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 May 2014 21:02:13 +0200
Message-Id: <1399230136-12456-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][WIP][PATCH 1/4] maliit-framework: add dependency on libxcomposite
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
X-List-Received-Date: Sun, 04 May 2014 19:02:09 -0000

* otherwise fails in do_compile with:
  | mimremotewindow.cpp:27:39: fatal error: X11/extensions/Xcomposite.h: No such file or directory
  |  #include <X11/extensions/Xcomposite.h>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/maliit/maliit-framework_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 6a4e155..f98512d 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
 inherit autotools-brokensep qt4x11 gtk-immodules-cache
 
+DEPENDS = "libxcomposite"
 
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
-- 
1.9.1


