Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A21266CCB0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:40:28 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1054140eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3UVs3YVyh6jmUdm3o6NxR/GalfE5T6KxFL6g4lICh6Q=;
	b=m0PA0Ebd84dzTNXm8b87TG7apbM8VO1QU5Ddxy0UOkA8k6ZcNOMlltZgDXGp9+/kYn
	oitrc22S4/TsfNUEX9LIvVxm+LbGqX8oQlCzyCzCDD2vMwjftOrG8ySWgaveOrpmMWsI
	PrhI15LBuMIltmuueLTBT/8yZoGk9a0fwnOtjgmt8tXToAqX5TnLqiWCtOjGdzT817VS
	q3HtDX9NmlM7/BlB5u4aYB33NCh/HSWFCLw00/HzXO7JO+waRdCsGyzHTrIdbnKKDSL/
	NUhQ0lpFK4WPH6sozDY7SmbzIXte++WMA2a4gV6cENRe8MetUZ7QJgAtFo4CTjS4pqHl
	gxkA==
X-Received: by 10.15.53.70 with SMTP id q46mr19549888eew.48.1381401629056;
	Thu, 10 Oct 2013 03:40:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm99955441eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 03:40:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 12:40:38 +0200
Message-Id: <1381401639-20130-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-qt5][PATCH 1/2] qtbase_git: restore 0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch in SRC_URI
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
X-List-Received-Date: Thu, 10 Oct 2013 10:40:29 -0000

* commit 105ad2a18e20f2b07d20a1640917e69950c8496b
  Author: Eric B<C3><A9>nard <eric@eukrea.com>
  Date:   Mon Oct 7 22:54:12 2013 +0200
  Subject: qtbase: update to 5.1.1
  removed it from SRC_URI in qtbase.inc, but it's still needed for
  qtbase_git

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 2994d3f..30d5b23 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
+SRC_URI += "file://0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch"
+
 SRCREV = "bd1dc60d6555a901fb3005273d7a86efe470739a"
-- 
1.8.3.2


