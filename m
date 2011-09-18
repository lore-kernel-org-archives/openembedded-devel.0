Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYH-0003rO-4N
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:49 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592243fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JDsEbgPVJeYKzlrljxE9IqlK0nbzAHxSbJSZyfyJnTE=;
	b=vO8TojeLtducf6M3cDgPdp/2qhv+M03rKuUPNRD1bJrDN87BPvWfQh+LA3J9hO0enB
	eHHRRwHMw2PpDd6o+Dv19ClKWcl5vz10SFOVUhR0eBOz5uqJgE0X7vdvHEoO1AHtl/c5
	ScJk8dNvtFvz3JDZqp2B1Zn8OmOckgzpgO4ak=
Received: by 10.223.37.81 with SMTP id w17mr3000989fad.91.1316345016559;
	Sun, 18 Sep 2011 04:23:36 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:06 +0400
Message-Id: <1316344999-26642-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 04/17] opie-taskbar: launcher also uses opiepim2 library, add it to LIBS
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:49 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opie-taskbar/opie-taskbar/server-pro-git.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-opie/opie-taskbar/opie-taskbar/server-pro-git.patch b/recipes-opie/opie-taskbar/opie-taskbar/server-pro-git.patch
index fc9b34d..82c4a50 100644
--- a/recipes-opie/opie-taskbar/opie-taskbar/server-pro-git.patch
+++ b/recipes-opie/opie-taskbar/opie-taskbar/server-pro-git.patch
@@ -63,7 +63,7 @@
 +DEPENDPATH  += mediummount
  
 -LIBS        += -lqpe -lopiecore2 -lopieui2 -lopiesecurity2 -lqrsync -lsysfs -lcrypt -lm
-+LIBS         = -lqpe -lopiecore2 -lopieui2 -lopiesecurity2 -lqrsync -lsysfs -lcrypt -lm
++LIBS         = -lqpe -lopiecore2 -lopieui2 -lopiesecurity2 -lopiepim2 -lqrsync -lsysfs -lcrypt -lm
  TARGET       = qpe
  
  ## not ready for use yet
-- 
1.7.2.5



