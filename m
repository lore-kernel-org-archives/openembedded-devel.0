Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC2C6EFA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 20:41:37 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 131so7356819ykp.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 12:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t60F2EkiUIlSi6We6oGqdTn3DSk0JmMLftPNLjXcyQY=;
	b=BVz789bSMpmjliVshMgm1bF9Y+sTEJwTineejekRKqZuVH2AP5BUSmJhOY23yAGJaH
	L3N43V3WpgMXcxBpDNtD8fYwUkYgu0AetzYc33ejhz4bsAqlOWJca2Pkp4xeIVbYvOCt
	ktCzwn1jOggPGb3DlzPdW+iIrSBAd9bEGIMxjMxsbre+CBSqoHt5yjZv+JM8PhunvDzR
	hsAj9/5A2svZ7GW/8tZxEJ0Lq+Uo68sAD62wlq+/WyLTRws4eEkJEkp+Ldus6CB46FCr
	8C3akAjiODz3U1nJxdxWUsxyD5GGW8GZEKH70zppWuFHRh3N0eIFpf7PLMqSQ421goNz
	rFvg==
X-Received: by 10.236.201.77 with SMTP id a53mr13776635yho.104.1393015297368; 
	Fri, 21 Feb 2014 12:41:37 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id n4sm22057317yhc.13.2014.02.21.12.41.33
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 12:41:36 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2014 17:41:03 -0300
Message-Id: <1393015264-8343-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
References: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 3/4] mallit-plugins-qt5: Don't set OE_QMAKE_PATH_HEADERS
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
X-List-Received-Date: Fri, 21 Feb 2014 20:41:37 -0000

The qmake class now respects the QT_DIR_NAME setting when setting the
headers path, so this change is not needed anymore.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
index 273b3e4..7dc1a73 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -6,11 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
 
 inherit qmake5
 
-# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
-# but
-# actually it is ${includedir}/qt5
-OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
-
 DEPENDS = "maliit-framework-qt5"
 
 RDEPENDS_${PN} += "qtsvg-plugins"
-- 
1.7.10.4


