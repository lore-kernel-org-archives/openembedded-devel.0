Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi4m-0002oS-EZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:38 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KnksNsyjAN7AaKAPYwRl0QXROidfML4EQZx9tUwcS5Y=;
	b=ecPGMAMQonOQGRa9P3MaxM31DftOKJvzkPo3waig24Q/wDdrehMVs4xRe4z3kDFSsC
	rFhZHzbIjX2Z4ReFiOe2amwB+WWz4Rsj7UmCRqDN4VkcbeT8tASIz4eQdFbbQJn4x7eN
	WN6WolA6IVsXdRKFlYg/CNgtCsEWAsxDtqSBds+yybmNtdl2a2d07d2jIgydVA0Rj5I6
	1PJXGoxSIKjk6tEmmjRK2IEVm3mcuMNvwnTtB4EUf1EDbxTS3B6gT9XYX2Kyd8I3pZRf
	L3nw4ubjVff4knk8Z0niWL1bdYaSU9MLKBumjR3Uf7j8SvNWIDmr36PcSWhYuQKS7Y02
	nAmg==
Received: by 10.14.213.134 with SMTP id a6mr42733602eep.45.1354586596865;
	Mon, 03 Dec 2012 18:03:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r1sm2416724eeo.2.2012.12.03.18.03.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:03:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:59 +0100
Message-Id: <26392eb1909fa61e75a1beb22f850b0452999864.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 26/58] libeweather: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/libeweather_svn.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recipes-efl/efl/libeweather_svn.bb
index c498278..934efa1 100644
--- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeweather_svn.bb
@@ -1,5 +1,8 @@
 DESCRIPTION = "EFL-based weather widget library"
-LICENSE = "LGPL"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
+                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
+
 DEPENDS = "ecore edje"
 PV = "0.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.8.0



