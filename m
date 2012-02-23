Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0bBg-0004aY-CG
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:32 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so637175eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.22.65 as permitted sender) client-ip=10.14.22.65; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.22.65 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.22.65])
	by 10.14.22.65 with SMTP id s41mr1219359ees.50.1330012693227 (num_hops
	= 1); Thu, 23 Feb 2012 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=T5eecdbe+XvDh9ZhJbK90yTk9pjYtLqQrSjjt/3dLWM=;
	b=Q1hGSK/lwpcaLFh5G2AQqUGAEpu617C4nOmrbwHbZMPCHfE3ecKJGuM6dj1sQkmK0j
	/P5ekt+zgi5PLktGlEbRRECk5++Q0pqMoXvDXeADAWRGDA55tLiaxPDUFWWfRK5108Ke
	ClTUNsFgdGNF8kuNLsvUUjcXJo6Z8GIelNLQ0=
Received: by 10.14.22.65 with SMTP id s41mr962503ees.50.1330012693011;
	Thu, 23 Feb 2012 07:58:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm6784569eem.0.2012.02.23.07.58.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:58:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:58:00 +0100
Message-Id: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330012507.git.Martin.Jansa@gmail.com>
References: <cover.1330012507.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/7] postgresql: include Makefile.global in SSTATE_SCAN_FILES
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:32 -0000

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



