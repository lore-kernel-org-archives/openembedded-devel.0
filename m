Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6o-0005cR-0Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:50:22 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xRxiW8gWrz6BOT8r72LTX6GBXj3QFM2t6n1LB9UUd7A=;
	b=fyW8njK3yHS4i5JhXW3UbvwQkyy8WkkGD/+RSatlk4BbA7REPIqCTLdaLQ/epH7ByF
	Al2JyqksxiaiRImDezE4HchoILo99cRMCtGGQWZoXfWuKG4uDz5VwLjCPF7YNFY/p+F3
	lbFTJGZq/mO18Pd/y1jVlygFTWboXmQ3KenROLjdh4kp8AfKVHEAxgzM+5ubuM5+PlvE
	ubOgdT2g7g9tgHgmInClSMGp+7SQQ3vXQtLKdPH7rOsr7cWn0IigvhU2/cLHUxJoE1B2
	8pokYQzIpr5FeBhBH01Ku17HmY5pbI88KjbQ8LOP1PRcxrPbWmrBXNtO3yzRlF331d3Q
	Ka7A==
Received: by 10.14.207.6 with SMTP id m6mr18768643eeo.10.1354048570652;
	Tue, 27 Nov 2012 12:36:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm42847332eeo.8.2012.11.27.12.36.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:36:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:56 +0100
Message-Id: <86d342fd1b8aae3d5e4f839ee97bf6fb9b20bab5.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 19/21] e-wm: add setxkbmap to RDEPENDS
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
X-List-Received-Date: Tue, 27 Nov 2012 20:55:34 -0000

* called from xkb map E17 module
Jan 02 02:58:42 gjama xinit[418]: SET XKB RUN: setxkbmap  -model 'default'
Jan 02 02:58:42 gjama xinit[418]: SET XKB RUN: setxkbmap  -model 'default'
Jan 02 02:58:43 gjama xinit[418]: /bin/sh: setxkbmap: command not found
Jan 02 02:58:43 gjama xinit[418]: /bin/sh: setxkbmap: command not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 3faa387..d5f92bb 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r8"
+PR = "r9"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -58,6 +58,7 @@ do_install_append() {
 RDEPENDS_${PN} += "\
   shared-mime-info \
   mime-support \
+  setxkbmap \
   edje-utils \
   ${PN}-utils \
   dbus-x11 \
-- 
1.8.0



