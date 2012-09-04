Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91iB-0004XX-Ua
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:35:11 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4917933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=szaPAtaOYEDzLgjdxDCay94cGZhsNXp7tXkLqJip60w=;
	b=HXIaSy4errBB8f7oxL4lDleJjC98blmjyriYkP6uH3QIqGvDPzDl/IuC6kdWgyaCEE
	hQakQIWhZpp7tF+fOeqSI3mNiOnQzT/YkAh4PBn24/YoI/0DHkyIcmbS2rZBbnYN5uIC
	xqr73GQbNRLXfNSh/yjncVF5rkWVW7iYeqDmxCmAW05ZYzqtoG6D9fwFDHH3382xJlrT
	bpKUj0u8Vql158ZfHFOgmo/+1ZrpoYWNv0kdiqah5XcxsyozOLiunnrHwNTwLlnNsT16
	JVRXzPGiVJe4v/2BBOiAGjoZsoks/1NoA+BfB5SxklMJ5n5Aguwr6dcgUn6e53DIs4r8
	yXGg==
Received: by 10.180.8.40 with SMTP id o8mr33429937wia.9.1346797371733;
	Tue, 04 Sep 2012 15:22:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm40131446wib.3.2012.09.04.15.22.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:22:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:17 +0200
Message-Id: <493a755b870c27ce301a21ace0760ee855ddf885.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 05/10] task-x11-illume: update default ECONFIG
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
X-List-Received-Date: Tue, 04 Sep 2012 22:35:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/tasks/task-x11-illume.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
index 20cf2b8..eb628b7 100644
--- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
+++ b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
@@ -3,15 +3,13 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${TOPDIR}/meta-openembedded/meta-efl/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r2"
-
-# WORK IN PROGRESS
+PR = "r3"
 
 inherit task allarch
 
 # Default theme and config
 ETHEME ?= "e-wm-theme-default"
-ECONFIG ?= "e-wm-config-illume2"
+ECONFIG ?= "e-wm-config-mobile"
 
 RDEPENDS_${PN} = "\
   task-x11-server \
-- 
1.7.12



