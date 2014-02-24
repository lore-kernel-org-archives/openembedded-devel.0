Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 85FDE6E835
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 20:28:24 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so5967354yho.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eUKoT4CM9hZHa0QNTd4xENmtPyW5/EXIFnft9momuDU=;
	b=0ZlyAvHeO/Uu6gLygPoS5mEnRgAnb5jvrSGGpaRPpnaI9nPxaLfIwttrxNYkyw4ZYv
	HyQf+vpx/lEiIIwQfklUh2b3wtQ2mFyxc0IH5lQYG52A7URrebblsnBW1kQNetXvdxEJ
	RlVnlpmlm+yVbD/HTusZhq5KrwpGlDWlreqQVYK6flH+/rrDNp2d1FdCww+D80JXLDsM
	bgQBKP8ew4OkchpvCxM7vbbq6WtHKKEWzBJGZCZ0b2/aflLYVbfw78Rp+/dfOK1XZV+j
	jw7H7Mj5pxWFoMKwepuf/ukpdQH+YX9q8wiWBJTF0LzRT/KKipIRv69h3Ke3sM3Y41OM
	qB+g==
X-Received: by 10.236.159.65 with SMTP id r41mr1257525yhk.20.1393273706049;
	Mon, 24 Feb 2014 12:28:26 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f78sm945753yhp.12.2014.02.24.12.28.24
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 12:28:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2014 17:28:15 -0300
Message-Id: <1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Mon, 24 Feb 2014 20:28:25 -0000

This allow for easy installation of needed packages for remote
debugging using QtCreator.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../packagegroups/packagegroup-qt5-qtcreator-debug.bb      |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
new file mode 100644
index 0000000..4cfbea9
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
@@ -0,0 +1,12 @@
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
+"
-- 
1.7.10.4


