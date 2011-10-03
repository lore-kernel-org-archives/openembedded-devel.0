Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifz-0005A2-5u
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:25 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IleINibcFEM5b8uLMvE4PqO14kIj3gS/wMkdEy2qPBM=;
	b=dOJ9rbvZxTAjGEQEVpbnDuJpQC2TteHG4zsReZLS64DTEaC8IH0Ly5iEQxJuV2ebuh
	eFzFYXOBhCUldTS2QXibdr7h4t4sKWdRXhMf5LMq6Wi7IJBsqR7eJrGlBU/46zC9IntZ
	5mdAXuTu11dOsOsnfF7uEGplOO2rvDnUNk37Y=
Received: by 10.204.155.140 with SMTP id s12mr2780289bkw.397.1317648593165;
	Mon, 03 Oct 2011 06:29:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm13229803bkd.6.2011.10.03.06.29.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:17 +0200
Message-Id: <680054e27081e4a2f8046af3706f6204d5f04828.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 19/25] e-wm: include /usr/lib/enlightenment/modules/wizard/favorites/.order in FILES+${PN}
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 55c9874..a4fb5b4 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -100,6 +100,7 @@ FILES_${PN} = "\
   ${libdir}/enlightenment/utils/* \
   ${libdir}/enlightenment/modules/*/*.* \
   ${libdir}/enlightenment/modules/*/*/* \
+  ${libdir}/enlightenment/modules/*/*/.order \
   ${libdir}/enlightenment/*plugins/*/*/* \
   ${libdir}/enlightenment/preload/e_precache.so \
   ${datadir}/enlightenment/data/icons \
-- 
1.7.7



