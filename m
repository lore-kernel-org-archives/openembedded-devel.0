Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0ig5-0007NF-7G
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 01:06:25 +0100
Received: by eaal10 with SMTP id l10so870978eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:58:03 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.99.1 as permitted sender) client-ip=10.14.99.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.99.1 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.99.1])
	by 10.14.99.1 with SMTP id w1mr2061567eef.49.1330041483599 (num_hops =
	1); Thu, 23 Feb 2012 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=X46x3ZffY4H+3CdLl3TZlpJk3J+2YC7hO5KUd8p8Y2A=;
	b=C1IsGlEiG5yjP7FgBS7wnyJKhf/OeqpKiHQlQp7GyCOTOYOfXf+VMTqTUc/3pkCMbh
	Zyi7eIgE3FH8q9LAEKv/7+GfHt2pqeKZ5Z+sRUsmb1COQck0HjzczndcJgahyzjlEk60
	6PktjGkEfgKyBp541i18RkIyl4CWWCHn/UXc8=
Received: by 10.14.99.1 with SMTP id w1mr1589813eef.49.1330041483425;
	Thu, 23 Feb 2012 15:58:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm11144325eef.10.2012.02.23.15.58.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 15:58:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 00:57:53 +0100
Message-Id: <280e44ecc1bb5cdb682cf9d369986b6c34bed125.1330041429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330041429.git.Martin.Jansa@gmail.com>
References: <cover.1330041429.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] mysql5: PR bump after including *_config in default SSTATE_SCAN_FILES
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
X-List-Received-Date: Fri, 24 Feb 2012 00:06:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index ae1cf00..44de2a2 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=477ab0a4c8ca64b482b3f2a365d0fdfa"
 
 DEPENDS = "ncurses"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
-- 
1.7.8.4



