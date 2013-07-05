Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id E80666AF53
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:23:52 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so1142850eae.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cywUVSCcNEDDFVKjkmP3Cj1dlWwxVn/lSBAEEjXQs0k=;
	b=mRETAL2yhpD92SwpcQsq33rtf+Wy/cPwKOc5xR8HJzqc9XDH3S/Pl8/v59kJwIgaFE
	/SyFTIu6zqmFWvCUdEQhHlIsZUzwRSwye5hz7IupZ4F5jczNBJuCSIaxN4bH5X9Czq/D
	pk8CsdzK0/0tlyR5tEclTp0OGZMVZyq1eMIZTLH9/sc45jyA76VPmL3CmFSpXhvnRGzt
	ibFFsZjVJ7ZRxrJSe510rEuqHX2d1DggLt6OcBeSc7PoroavWVHCnWUvjAIZIatqxymU
	4A65IlCooeiyH53ZnSS67aUxDZysHjw0OxH3VO9B9zU0qoTsU3dQbZ6RZlp4QHjSAiBY
	1jdg==
X-Received: by 10.15.65.8 with SMTP id p8mr9362764eex.110.1372987433611;
	Thu, 04 Jul 2013 18:23:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm9601563eeb.13.2013.07.04.18.23.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:23:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:45 +0200
Message-Id: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/10] f2fs-tools: add util-linux dependency
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
X-List-Received-Date: Fri, 05 Jul 2013 01:23:53 -0000

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


