Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmsEo-0002rY-82
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 21:33:37 +0100
Received: by mail-ea0-f169.google.com with SMTP id a12so2599458eaa.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 12:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=CWk4O7Hc97C9oEWrjim97UCspRcEDny1lzEvNkhq0pU=;
	b=ipH3PZumuICmwjNJXSQS0s+/N1BdPt/6M+zuUxzl2snXuN+L3AJP/YtHmTelPTc0UZ
	w5xEmqrKDGP8u19Z5BXC/ey6w2W5JU6TXglO+/eEihHRufai3I93yhBwDRw4eAQb94Mc
	TqUR1pjUxmDnXK1qBQTnDbuuRYO/dpoXuQ+P/63n85AO5yxKB/7lccBrOoJVPtyI0QAN
	zjYmvHJKXOgQCx4fMGw9Zu0NXq+swodbz6KpNsMlcxsSJo3FyIBz6YYswaFfEqROZXUs
	o20KwPDrVRAyfnnuogbM+ml1vV0KHxDyOGI+Gw5U1KoMl9aiC/m+iWsPc0VQ2YdqsXSL
	Wh+A==
X-Received: by 10.14.203.2 with SMTP id e2mr50043836eeo.20.1356293925427;
	Sun, 23 Dec 2012 12:18:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b49sm36895085eem.16.2012.12.23.12.18.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 12:18:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 21:18:39 +0100
Message-Id: <c0cc8c325b1bc9f0010d37a282a11d3bf74f5d69.1356293852.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356293852.git.Martin.Jansa@gmail.com>
References: <cover.1356293852.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 31/33] f2fs-tools: change SRC_URI to use git repo on kernel.org
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
X-List-Received-Date: Sun, 23 Dec 2012 20:33:37 -0000

* sf does not provide tarballs anymore:
  The f2fs-tools is no longer maintained through sf.net.
  Instead, please access the following url.
  http://git.kernel.org/?p=linux/kernel/git/jaegeuk/f2fs-tools.git;a=summary

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
index cce9af1..292a88a 100644
--- a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
+++ b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "http://sourceforge.net/projects/f2fs-tools/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=15667d9b3cb737b57471c148b7c50734"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/f2fs-tools/f2fs-tools-${PV}.tar.gz"
-SRC_URI[md5sum] = "cf3608ea7475c8f9a03159d7f22e4d07"
-SRC_URI[sha256sum] = "afd774b80f73721f2c4300c0b4780a24b705b8328df229f3ae37315c8bfbff1d"
+SRCREV = "da59f6146c37e727bb83ae4922ca56d42958e61c"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;protocol=git"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
1.8.0.2



