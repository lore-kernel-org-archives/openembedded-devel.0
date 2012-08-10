Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szphc-00027D-Rl
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:36 +0200
Received: by weyr6 with SMTP id r6so927334wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yXp2PEhT1ZFU/vLS99ThzGhit16iPTaacvwZUaxMBc4=;
	b=xQC5siDVmjT5tY185v6t3KdyWv7jzERghlvfwuz9ya9XfpADoh9iFyVU03ABC49nQ9
	ayOK0fLgNbHBV8yex9HMWkhRH4vAwiUqk7f9CZw/klPoDuPm9dvH4dAn/fL+X1TIgkk9
	wAMk/oFF7tBslecpNJzhMLWK134Or8AhXVbxGubxK0UAaFGlON92mChOc1mc3uxNg0aT
	8qarrag5LMs9S+0sS2td+wl4WALit0Lbknoqp3hdo/7XYRF/P4oKfcCKFmdw8Tiq4G/a
	AQyICXd46NVHpOC5RoweXwWX824CoR3Yb8ufUhIxTH8AIelZtvTU+Mw5DeBP2PYxVHLY
	SHow==
Received: by 10.180.94.164 with SMTP id dd4mr6306384wib.1.1344606287400;
	Fri, 10 Aug 2012 06:44:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm7823343wib.10.2012.08.10.06.44.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:44:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:03 +0200
Message-Id: <07031e442fc601245935e89211f2c29c8659fb1f.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 08/46] efreet: inherit gettext
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efreet_svn.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index 720703e..503dc52 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,5 +1,7 @@
 require ${BPN}.inc
 
+inherit gettext
+
 SRCREV = "${EFL_SRCREV}"
 PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
-- 
1.7.8.6



