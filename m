Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4652D62062
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2013 13:37:13 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so2761315eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2013 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cywUVSCcNEDDFVKjkmP3Cj1dlWwxVn/lSBAEEjXQs0k=;
	b=bLywSBVqLaz0NONeU7aQegG6afQpOyDzYWwz2VL6esudZ9PsKNGj5WksC6MNg6ZlhV
	1R2J92rz1WztmwfGfoIgJOHDd0xWbhZz3BSwONelg0rSoyVpKA3qvgPPySqTweCPs2j7
	0TbtOGoYRHQLNNQldXlop+T4xGEc2F3UZenoxhCy+vqdEYP/CZgx1P8Loc6RCMDo68mc
	SXDa5eTyZcZKJMGlWWDgsjx4AogMyi1uOpTW9NJaeQlqnfdJAoDMItUp7g9dOte4z+eu
	C/bY06j8KeGWXNNJb4xiyj/jeX6ke2aZxHNZ6t/E4XMs689iRj/wZ8VHkYq0b9vQSuAg
	RRvQ==
X-Received: by 10.14.53.75 with SMTP id f51mr26392693eec.30.1372772232982;
	Tue, 02 Jul 2013 06:37:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm36717979eef.16.2013.07.02.06.37.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 06:37:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2013 15:37:10 +0200
Message-Id: <1372772230-9451-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH] f2fs-tools: add util-linux dependency
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
X-List-Received-Date: Tue, 02 Jul 2013 13:37:14 -0000

---
 meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
index e5b5439..7755a7f 100644
--- a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
+++ b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
@@ -4,6 +4,9 @@ HOMEPAGE = "http://sourceforge.net/projects/f2fs-tools/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=15667d9b3cb737b57471c148b7c50734"
 
+# to provide libuuid
+DEPENDS = "util-linux"
+
 SRCREV = "da59f6146c37e727bb83ae4922ca56d42958e61c"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;protocol=git"
 S = "${WORKDIR}/git"
-- 
1.8.2.1


