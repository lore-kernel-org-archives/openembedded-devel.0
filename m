Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 36A1170C8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:24:50 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so9789398wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=YyUHZlgEWMElKr/l2nJUFwV9cvgBix80WiL+dHMEljk=;
	b=aHRPKVsWAkXs51Q+Aak50tU4WOAdZqqkobWIvIwPAhkgBXgT0kwQFj0VTfonO5h4D0
	5Lrs9CcscOeu3QFhBLdJm+epX+0APXj1rFfRm9TX2UWkUGmYrF3bqCyqAr33vqjQn81g
	CBbDldG0qY3SZrwXvonNy8uHTCd6SJOaoEfumGhHzg8yCeQ5dk+WsQgLNfglGphE6JVn
	797GVJ+Hx/7Jj2z+gdoTgPUGyAo+bFnpHpKY/8Kp41rvCzs5elKBBJLJqQXjKs6wMXM9
	Bz20/oyiO11EDOUBbamtor1AT7YBOJFS/gVTJ9OCbXR/p7LBJ0PyXhK7KE3oYillv3qS
	USng==
X-Received: by 10.194.189.230 with SMTP id gl6mr4865917wjc.118.1407846291753; 
	Tue, 12 Aug 2014 05:24:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm8963117wjb.18.2014.08.12.05.24.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:24:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:25:14 +0200
Message-Id: <2ba7f3dcaf3cd3c155917342cc4b4e48c6632d43.1407846175.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [daisy][PATCH 4/5] irssi: add --with-ncurses option
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
X-List-Received-Date: Tue, 12 Aug 2014 12:24:53 -0000

* otherwise do_configure tries to find ncurses.h on host and
  disables ncurses support when not found, then build fails because
  of missing -lcurses when using terminfo-core.o:
  | terminfo-core.o: In function `_set_bg':
  | /OE/irssi/0.8.15+0.8.16-rc1-r0/irssi-0.8.16-rc1/src/fe-text/terminfo-core.c:343:
    undefined reference to `tputs'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
index 7880a06..1e27a2b 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
@@ -17,5 +17,6 @@ S = "${WORKDIR}/irssi-${REALPV}"
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-ssl"
-
+EXTRA_OECONF = "--enable-ssl \
+    --with-ncurses=${STAGING_EXECPREFIXDIR} \
+"
-- 
2.0.4


