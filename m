Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShcmP-0000LW-Ez
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 10:30:17 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so295786wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KXadRtDgUeC7yRVEJ3gjButCu4rQtVCFEDXW6kEPNaM=;
	b=xym6MOvZvMTT7mGXrF6LzR7iUiG6t881oabWiWT8B2R1ZiYLJbn9Cqt/sKSXxYUjWP
	fJyfGMTZvvuDG5my/aBMDW3LytN9vDHCt5HI4NsKJ4QzW7iP1utUX+NaSLn8R1EhCbFq
	IAnN/ssC4fxuPYZKq6gknGMfIt8Ch3V0VKD4jCRWYikIid/eNDwMRXOIrxFGdkenhhTJ
	r617SauvYv1iMlswS2DoDR/LgXV2Du4m4qFHeult+p1gBAYGRSQL3x0GX9Jq/Dlr/eVr
	YT0boH4g2K75OUYZOGAH/dvHHVmvnuIjQdwvudKqGyLIeKWzrQxVt2JiKTLO5xY69yTB
	x+ZA==
Received: by 10.216.228.232 with SMTP id f82mr14571130weq.211.1340266774104;
	Thu, 21 Jun 2012 01:19:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gb9sm44568813wib.8.2012.06.21.01.19.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 01:19:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 10:18:49 +0200
Message-Id: <30f95e1922a86245c607249bcc7f9fbde2b10797.1340266416.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/5] libjpeg-turbo: add LEAD_SONAME to fix upgrade to 8d
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
X-List-Received-Date: Thu, 21 Jun 2012 08:30:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 16fb2c7..f061f41 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe
                     file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
 "
 PV = "8d+1.2.1"
+PR = "r1"
 SRCREV = "837"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=https;module=trunk"
 
@@ -29,3 +30,5 @@ INSANE_SKIP_libturbojpeg = "dev-so"
 
 BBCLASSEXTEND = "native"
 DEPENDS_virtclass-native = "nasm-native"
+
+LEAD_SONAME = "libjpeg.so.8"
-- 
1.7.8.6



