Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id A48EE6EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:11:50 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so7364426yks.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=41WcXhjGhvnLA8+EMx+7N+Yvd7MzBro6v6GWbQjVcw8=;
	b=ssqtWvp9Zse6NAOOpaWSHGRBn4G8+pAtlaTg3uVDkIPlmQv/GFmpaxf/DfYSy4AlLr
	5e0jd744mgeOHvpjvQ34MJCuYH6HROlQY+ZoTWtRsVsgPFpL0DuRq37PrTN6FjSZbxK9
	4sVYEyiZeZ0/K6r5/O2t/xmNjQPvMGSJP2ML4yyOiwi2OquzBTORWF3iA9YVOyLj0sMF
	EWRYEvWIMxSDHDD3LIp4BBuY2jh/g9HJQdeXr/CwnIxpe8Cjq/MSwxTZhqAWVeYH5WYr
	n3U8UZlmZdc9oxiTj2U8KK/ARVWWftdRX9n5N76aUhuMbhQRQF3MOsF6lDbxcDZjlIy0
	DFYQ==
X-Received: by 10.236.89.11 with SMTP id b11mr16678099yhf.16.1393521111263;
	Thu, 27 Feb 2014 09:11:51 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id h66sm15484529yhb.7.2014.02.27.09.11.49
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 09:11:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 14:11:29 -0300
Message-Id: <1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 1/2] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Thu, 27 Feb 2014 17:11:50 -0000

This allow for easy installation of needed packages for remote
debugging using QtCreator. The qtdeclarative-plugins package provides
the needed infrastructure to remotely debug QML application.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Giulian Vivan <giulian@ossystems.com.br>
---
 .../packagegroups/packagegroup-qt5-qtcreator-debug.bb     |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
new file mode 100644
index 0000000..cb1518d
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
@@ -0,0 +1,13 @@
+# Copyright (C) 2014 O.S. Systems Software LTDA.
+
+SUMMARY = "Remote debugging tools for QtCreator integration"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = " \
+    gdbserver \
+    openssh \
+    openssh-sftp-server \
+    qtdeclarative-plugins \
+"
-- 
1.7.10.4


