Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTq-0004Av-61
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:58 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so889767yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=85B6E+PQ9pxNopJbSXe+YSreARvGIKJ2ZeP88a4Z6jM=;
	b=GfI1CXylwrakFzTrowR5NuPkfjTSaMOBXzWpjgeUTExtcYKTX5CXsq1FQ1O7XO0W7Z
	CXINB3P4xsPPKkI392l1cT0F3I7dZs7TRXQE2KxJoioMBVoUFdxnOfJS+v7kAkBJUAE4
	MzMOI3CiSRP5b2r+qmboe3clvIK9CssgSVGT4=
Received: by 10.236.75.167 with SMTP id z27mr7862491yhd.53.1323825063851;
	Tue, 13 Dec 2011 17:11:03 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.11.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:11:03 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:35 +0000
Message-Id: <eab7e406f394e54535322a183581c3c1b894e4ac.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 8/8] liblinebreak_1.2.bb: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:59 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../liblinebreak/liblinebreak_1.2.bb               |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
index d64cfd9..2a5efad 100644
--- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
+++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/"
 SECTION = "libs"
 LICENSE = "zlib"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3"
-PRIORITY = "optional"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
 SRC_URI[md5sum] = "d18039259001ccb24b5dd4648c49c5ad"
-- 
1.7.2.5



