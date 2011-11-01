Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9oM-0008NW-AE
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:35:10 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983585faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4BiMquQCmHKaCNS9ZdIXWlImz4EeGfuIoml8iNaeQjE=;
	b=SCtHxjlvIWo7AUQQlj445Gx5U1BeVtlXlQW+S/SJFWHRX/F2N5+KM1EeFIB+nDKYt2
	a0T7QNIR49IPZJwaJHfVRh8TO1gIF6wyDo0mPgaWcbRxdzgLiRVyT2TzewQYaLeMnB0L
	KMjpeluYm2wage3Jxg9svMD7sQS2t7KHSdkRM=
Received: by 10.223.7.20 with SMTP id b20mr35469916fab.21.1320136146839;
	Tue, 01 Nov 2011 01:29:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k16sm43353302fab.8.2011.11.01.01.29.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:29:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:44 +0100
Message-Id: <887bee6cccc98f75bd54913a2219b3bf683e0eae.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 10/15] elfe: bump SRCREV to fix more deprecated API calls
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
X-List-Received-Date: Tue, 01 Nov 2011 08:35:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elfe_svn.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 151ef7e..13fe014 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -5,4 +5,7 @@ PR = "${INC_PR}.1"
 
 require e-module.inc
 
+SRCREV = "64510" 
+# EFL_SRCREV
+
 DEPENDS += "elementary"
-- 
1.7.7.1



