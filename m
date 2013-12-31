Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3366B602
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:31 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so5456743eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jn0ijfQBlfcpfkkaDDkWgn7X5z/HOMhcTLjFA3lCi8o=;
	b=galyrJm2h8IGXAkeuzN3rrMlCOPT9/KTTO1O6wjg+abLRgFhMEAMrIlA2UUy2z2ZK4
	qXU6W3OWlgH3Ik2OE0mZXnJm0PSPU8tIqHO0LpX6jXkGFd9YP+tSiRBuEW8wzWSEpeTU
	AdYKlNSOWZKPd1jeQGZ2TSLs/aQ5HDg2errMvf4CaXI/6W9gLn+Ar1K89jDcC4O4qECJ
	ONfTSd3D/Y5hqI5pJgtrkYb4A8Bx4qgHi8X5EHTjycRF32LQ8AsNdZqgwTJ5rbW6dFI4
	Q4L2MsQOkcbSuSkFZktsmgFveleUHcPP9NOSOkxE6WBO1rCLNM5OLQIolKYGL/jCZ1iQ
	8lnw==
X-Received: by 10.14.7.2 with SMTP id 2mr58082177eeo.16.1388483371700;
	Tue, 31 Dec 2013 01:49:31 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	h48sm116625337eev.3.2013.12.31.01.49.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:16 +0100
Message-Id: <1388483363-28575-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 04/11] cifs-utils: Add PACKAGECONFIG for cifscreds, cifsupcall
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:33 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* make files in bindir/sbindir a bit more deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index fc7a4d3..92be75e 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -14,6 +14,10 @@ S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
+# when enabled, it creates ${bindir}/cifscreds and --ignore-fail-on-non-empty in do_install_append is needed
+PACKAGECONFIG[cifscreds] = "--enable-cifscreds,--disable-cifscreds,keyutils"
+# when enabled, it creates ${sbindir}/cifs.upcall and --ignore-fail-on-non-empty in do_install_append is needed
+PACKAGECONFIG[cifsupcall] = "--enable-cifsupcall,--disable-cifsupcall,krb5 talloc keyutils"
 
 inherit autotools pkgconfig
 
-- 
1.8.4.3


