Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SXacM-0002bH-4h
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 18:10:26 +0200
Received: by bkcjm2 with SMTP id jm2so7581948bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=isV84GKnk5nAJb86tHL5zI/gIv6xAf9nnRuZyGlUisA=;
	b=skZ+Z4KvoE6REBWb4MRbflf5GGuz5Hjb008dZdGvJ/Y2QaCPH6urEv+DhPmDAkUiwA
	gg3Twc7BOWdXmms2ZQ7UkYqlEy74fyXOVdrrV+mGIpAs4A9NQHg76tTWIaV2k9gnNkZw
	SjrEkfTgjDl9W6ZH3FcaX8vY6RiLYrM6D7YThHdJqfArVhJ9JeZitEQNnz4/xdwZZl4Z
	KbubapKlUcJ1F7Wm7t3HsMofxVZvZv2ZPOTzuRB5qjysQPpMoLtd1Dswbhgp0pjiAsno
	f7hirdBValgtBqX9GFraBK45Zj6fU0Kdbo+N1hH1ysXCmduaerq56DZ7LDrI2lR+GWrW
	qwBQ==
Received: by 10.204.10.70 with SMTP id o6mr13923482bko.70.1337875214730;
	Thu, 24 May 2012 09:00:14 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id iq16sm3448705bkc.6.2012.05.24.09.00.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 09:00:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2012 18:00:04 +0200
Message-Id: <1337875204-19068-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1337875204-19068-1-git-send-email-schnitzeltony@googlemail.com>
References: <1337875204-19068-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] task-xfce-base: add xfce4-xkb-plugin
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
X-List-Received-Date: Thu, 24 May 2012 16:10:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-base.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
index d9fcc30..7085c76 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
@@ -27,7 +27,8 @@ RDEPENDS_${PN} = " \
     xfce4-panel-plugin-showdesktop \
     xfce4-panel-plugin-systray \
     xfce4-panel-plugin-tasklist \
-    xfce4-panel-plugin-windowmenu \   
+    xfce4-panel-plugin-windowmenu \
+    xfce4-xkb-plugin \
     xfce4-settings \
     \
     xfce4-notifyd \
-- 
1.7.6.5



