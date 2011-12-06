Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrtR-0004Wz-4Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:04:58 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Ea4WBOgj9C3g6mrFKRjhTP1HK5WXKE6KkXUPqCfSDDY=;
	b=VOHElN30suCqHiU9OrJKO/u/XpO8B2geOPtxUZt18dpS/dy5z79gzGXEeeGtfzDAwH
	IJwxWm+JSKipE9sAkqwAi9ETN+7/b6Bov+8B5WsK2DjUaG3jaHNzEpxeyguPW36JBGqT
	QSChNooxUbeE+BIOivY82dR/xCkGYIKhX7enU=
Received: by 10.213.35.140 with SMTP id p12mr2146846ebd.18.1323165491668;
	Tue, 06 Dec 2011 01:58:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 53sm8007548eef.2.2011.12.06.01.58.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:58:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:06 +0100
Message-Id: <e8d66992eabb37d5165e99c91e4d88cb6a893f1b.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 07/16] e.bbclass: remove autopoint, shouldn't be needed anymore
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
X-List-Received-Date: Tue, 06 Dec 2011 10:04:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
index c803399..375f914 100644
--- a/meta-efl/classes/e.bbclass
+++ b/meta-efl/classes/e.bbclass
@@ -7,10 +7,6 @@ do_prepsources () {
 }
 addtask prepsources after do_patch before do_configure
 
-do_configure_prepend() {
-	autopoint || touch config.rpath
-}
-
 do_configure_append() {
 	find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
 }
-- 
1.7.8



