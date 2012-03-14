Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7uUx-0004Lv-Ub
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 21:08:39 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so2113842wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ShzmsyONVsON6XUR7ymdBTqAQYklNPiRrkx4KGsk8PA=;
	b=pTZ1OF0lLRy5H0E7FwMrHLLBbzWYVu/qotYe/yKqFP1XnHfjZTiAOnuj2txrdCraXl
	rMdzH7VvhOZZun1Y4qTn7zMRAR64fUgJH6IXbRi2Dm/O6QOUmy26F0kTGQlCtDeOnfDI
	xN5ovzvQY55a1Tt8wfOtpgkLyKqHyXZkCv+2B2PsIif8ANGFOciYWxRico2gIXlSWsPJ
	NUwPN+8mrrXNcrh6LBTqsy0EdBndiPg1dC8TR6z9a5JSG2Y6p6VDV65KR54h1VIOxxcM
	jES0W7dfdg15pRH+FOAbAdImYtxUMZHmIB1rZRpb15WmFtLTNarrFptBR+hyh6ppG87v
	MPLw==
Received: by 10.180.88.67 with SMTP id be3mr9267116wib.20.1331755196618;
	Wed, 14 Mar 2012 12:59:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d7sm20408576wiz.6.2012.03.14.12.59.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 12:59:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 20:59:20 +0100
Message-Id: <cc56cdd96ad79f74cc7d3b3d0f71d0983abf4d64.1331754944.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
References: <7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331754944.git.Martin.Jansa@gmail.com>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/5] eina: fix QA warning about unpackaged dir
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
X-List-Received-Date: Wed, 14 Mar 2012 20:08:40 -0000

* WARNING: For recipe eina, the following files/directories were installed but not shipped in any package:
  WARNING:   /usr/bin

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eina.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eina.inc b/meta-efl/recipes-efl/efl/eina.inc
index c512530..c3ecf58 100644
--- a/meta-efl/recipes-efl/efl/eina.inc
+++ b/meta-efl/recipes-efl/efl/eina.inc
@@ -13,3 +13,7 @@ AUTO_LIBNAME_PKGS = ""
 RREPLACES_${PN} = "libeina-ver-pre-svn-00-0 libeina-ver-pre-svn-01-0"
 
 FILES_${PN} += "${libdir}/eina"
+
+do_install_append() {
+  rmdir ${D}${bindir}
+}
-- 
1.7.8.5



