Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpmS-0005XQ-S5
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:01:36 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1223439wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jhtFGcn8NgRjJggbjUHpEtHkwwdy32gItv1G3BWR1QI=;
	b=cXy/V9XCcskkAFc6h1n7pRACAet6j9qvu0yO1aqKf5qTu39DV2Vwl4yLjc29Esg859
	EcD+G9r5VwlZjVMZztE6Zw3O5QHe/JznolpZRZffCSawS2MVlD4mE8jeWhVPg8i48Rlj
	Mdmfek1gtn0nvKa64acNaGOiMadIGdDkPX8H3S/6NkUgN9TDKq4zlmg03ABdCS0qlYvs
	eOLnNJQrk5cNIwfgRhiOgslNpAOF5qSIycyfPQ5jZMNftT28Z0zGoujOdevTHg6TAwci
	k2MSin571Cicw2i/p/nOvyS+5jv+KVkrDZ1JSCrRMAz8uTfzOxCKr06eMUH3m7uSIegq
	0s1Q==
Received: by 10.180.19.169 with SMTP id g9mr6224442wie.9.1344606589340;
	Fri, 10 Aug 2012 06:49:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm7842281wib.8.2012.08.10.06.49.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:49:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:41 +0200
Message-Id: <2b18f1c8659ca8850b64995e40e5eb4dfe32b81a.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 46/46] efl-from-svn-recipes: update P_Vs, now all svn recipes have 1.6.99+svn
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
X-List-Received-Date: Fri, 10 Aug 2012 14:01:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/distro/include/efl-from-svn-recipes.inc   |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index 38c2dd3..b703b41 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -1,6 +1,4 @@
-EFL_PREFERRED_VERSION ?= "1.2.1+svn%"
-EFL_PREFERRED_VERSION_1.0 ?= "1.0.1+svn%"
-EFL_PREFERRED_VERSION_EET ?= "1.6.1+svn%"
+EFL_PREFERRED_VERSION ?= "1.6.99+svn%"
 
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
@@ -18,16 +16,16 @@ PREFERRED_VERSION_eina-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_embryo ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_embryo-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_evas ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_evas-generic-loaders ?= "1.2.0+svn%"
+PREFERRED_VERSION_evas-generic-loaders ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_evas-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_expedite ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_expedite-native ?= "${EFL_PREFERRED_VERSION}"
 
-PREFERRED_VERSION_eet ?= "${EFL_PREFERRED_VERSION_EET}"
-PREFERRED_VERSION_eet-native ?= "${EFL_PREFERRED_VERSION_EET}"
+PREFERRED_VERSION_eet ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_eet-native ?= "${EFL_PREFERRED_VERSION}"
 
-PREFERRED_VERSION_eio ?= "${EFL_PREFERRED_VERSION_1.0}"
-PREFERRED_VERSION_eio-native ?= "${EFL_PREFERRED_VERSION_1.0}"
-PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION_1.0}"
-PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION_1.0}"
-PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION_1.0}"
+PREFERRED_VERSION_eio ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_eio-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION}"
-- 
1.7.8.6



