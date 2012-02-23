Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0aA7-0002oz-8X
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 16:00:51 +0100
Received: by eaal10 with SMTP id l10so593372eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.53.74 as permitted sender) client-ip=10.14.53.74; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.53.74 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.53.74])
	by 10.14.53.74 with SMTP id f50mr1140970eec.5.1330008750101 (num_hops =
	1); Thu, 23 Feb 2012 06:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=T5eecdbe+XvDh9ZhJbK90yTk9pjYtLqQrSjjt/3dLWM=;
	b=wc8g4R3eDCUq7nM/fw6pgOn7ppgWIaT/veR5uqd+m6IYFuqHz3a7wy0vAN27aWZwdt
	fWI4aXN3VvK7KXOFktnKSoti87dBjB6anplUvxmV2KJE89CFoIac28fUyOmuLMwPpIjr
	7BXsTux773Yo+M2KPjSNdpZlhZMiz+vB/0wm0=
Received: by 10.14.53.74 with SMTP id f50mr893695eec.5.1330008750000;
	Thu, 23 Feb 2012 06:52:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm6173331eei.3.2012.02.23.06.52.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 06:52:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 15:52:21 +0100
Message-Id: <1330008741-22543-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH 3/7] postgresql: include Makefile.global in SSTATE_SCAN_FILES
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
X-List-Received-Date: Thu, 23 Feb 2012 15:00:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 53c38df..ab6aea4 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "PostgreSQL is a powerful, open source relational database system.
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
 DEPENDS = "zlib readline tzcode-native"
-INC_PR = "r5"
+INC_PR = "r6"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -23,6 +23,8 @@ do_compile_append() {
          cp /usr/sbin/zic ${S}/src/timezone/
 }
 
+SSTATE_SCAN_FILES += "Makefile.global"
+
 PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
              libecpg-compat-dbg libecpg-compat \
              libecpg-dbg libecpg libecpg-dev \
-- 
1.7.8.4



