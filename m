Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 9077961F16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 09:17:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,879,1392159600"; d="scan'208";a="51542558"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 21 May 2014 11:17:40 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Wed, 21 May 2014 11:17:39 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 21 May 2014 11:17:39 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 May 2014 11:17:44 +0200
Message-ID: <1400663865-4304-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] mesa-glut: fix S!=B failure
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
X-List-Received-Date: Wed, 21 May 2014 09:17:49 -0000
Content-Type: text/plain

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
index 7006b41..f23621d 100644
--- a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
+++ b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
@@ -9,6 +9,6 @@ PV = "8.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu"
-- 
1.8.1.2


