Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 835DC60169
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 19:39:28 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id u10so3384563lbd.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=8ndhV9pRjIyHnX//acB1AxS7/t3M+MXrOJ/jvGAvY5c=;
	b=lofGarOReKFih43bWf8nGVg/WxVZVUNIWQus6FHz0AqEY4U6ijaNU2qvHZgSrQeVPZ
	iA0IwDNOwitzETJHkVQhohoAC6gn7ZWWj9fbTYQ2ci+h+W9/XnRx3CzzgzuaE7QxaehG
	NQ3RAEhveNX4jn3vCcBBbs/zUTp2WxuTyI3oyqMAVi1AE5FgL1n9BySeEg+weRLb6hjY
	nuoO3EFEcAEqRZfmvJp8N3bnFEZeUgtZp8+CcTSo7qX/f6EXKFP84Rj1De95WKxVPq+/
	jUtIc59KWPOJ0DNaXDkk83Jt0V8DXTzHMjWgQu03vyI3XyLi96hjU+d2iTzVYMLvbem6
	B8fQ==
X-Received: by 10.152.5.133 with SMTP id s5mr23324126las.78.1408304369418;
	Sun, 17 Aug 2014 12:39:29 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id c3sm2023570lab.15.2014.08.17.12.39.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Aug 2014 12:39:28 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Aug 2014 21:37:30 +0200
Message-Id: <1408304250-8629-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [meta-musl][PATCH] README.md: Fix typo in command-line example
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
X-List-Received-Date: Sun, 17 Aug 2014 19:39:31 -0000

Chosen C library is set with TCLIBC, not LIBC.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 7db8c8d..6c74799 100644
--- a/README.md
+++ b/README.md
@@ -28,7 +28,7 @@ BBLAYERS ?= " \
 Below we build for qemuarm machine as an example
 
 ```shell
-$ MACHINE=qemuarm LIBC=musl bitbake core-image-minimal
+$ MACHINE=qemuarm TCLIBC=musl bitbake core-image-minimal
 ```
 # Running
 
-- 
1.9.3


